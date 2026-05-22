function project_md --description "Resume un proyecto en un único archivo Markdown con bloques de código"
    # Añadimos 'x/exclude=' para capturar las extensiones a ignorar
    argparse 'h/help' 'o/output=' 'e/ext=+' 'a/all' 'x/exclude=+' -- $argv
    or return 1

    if set -q _flag_help
        echo "Uso: project_md [RUTA_PROYECTO]"
        echo ""
        echo "Opciones:"
        echo "  -h, --help       Muestra esta ayuda"
        echo "  -o, --output     Archivo de salida (Por defecto: project_summary.md)"
        echo "  -e, --ext        Extensiones a incluir (ej: -e js -e py)."
        echo "  -a, --all        Incluye cualquier archivo que sea texto plano (ignora extensiones, descarta binarios)"
        echo "  -x, --exclude    Extensiones a excluir en el modo --all (ej: -x lock -x map)"
        return 0
    end

    set -l target_dir "."
    if set -q argv[1]
        set target_dir $argv[1]
    end

    set -l output_file "project_summary.md"
    if set -q _flag_output
        set output_file $_flag_output
    end

    # Inicializar/limpiar el archivo de salida
    echo "# Resumen del Proyecto: "(basename (realpath $target_dir)) > $output_file
    echo "Generado el: "(date "+%Y-%m-%d %H:%M:%S") >> $output_file
    echo "" >> $output_file
    echo "## Estructura de Archivos Incluidos" >> $output_file
    echo "```" >> $output_file

    set -l files

    # --- MODO A: Capturar TODOS los archivos de texto ---
    if set -q _flag_all
        # Buscamos todos los archivos saltándonos carpetas basura habituales
        set -l all_candidates (find $target_dir -type f \( -name "node_modules" -o -name ".git" -o -name "venv" -o -name "__pycache__" -o -name "dist" -o -name "build" -o -name ".next" \) -prune -o -type f -print)
        
        for file in $all_candidates
            # Evitamos que el propio archivo de salida se muerda la cola
            if test (basename $file) = $output_file
                continue
            end

            # Extraer la extensión del archivo para verificar exclusiones
            set -l file_ext ""
            if string match -qr '\.([^.]+)$' $file
                set file_ext (string match -r '\.([^.]+)$' $file)[2]
            end

            # Si el usuario usó --exclude y la extensión está en esa lista, nos saltamos el archivo
            if set -q _flag_exclude; and contains $file_ext $_flag_exclude
                continue
            end

            # El comando 'file --mime' nos dice si contiene "text/"
            if file --mime $file | string match -q "*text/*"
                set -a files $file
            end
        end

    # --- MODO B: Filtrar por extensiones (Comportamiento clásico) ---
    else
        set -l extensions
        if set -q _flag_ext
            set extensions $_flag_ext
        else
            set extensions js ts jsx tsx py rs go c cpp h cs php html css sh fish md json
        end

        set -l find_args
        for ext in $extensions
            if set -q find_args[1]
                set find_args $find_args -o -name "*.$ext"
            else
                set find_args -name "*.$ext"
            end
        end

        set files (find $target_dir -type f \( -name "node_modules" -o -name ".git" -o -name "venv" -o -name "__pycache__" -o -name "dist" -o -name "build" -o -name ".next" \) -prune -o \( $find_args \) -print)
    end

    # Escribir la lista de archivos detectados en el Markdown
    for file in $files
        echo "  - $file" >> $output_file
    end
    echo "```" >> $output_file
    echo "" >> $output_file

    # Volcar el contenido de cada archivo en bloques de código
    echo "## Contenido de los Archivos" >> $output_file
    echo "" >> $output_file

    for file in $files
        set -l file_ext ""
        if string match -qr '\.([^.]+)$' $file
            set file_ext (string match -r '\.([^.]+)$' $file)[2]
        end
        
        echo "### Archivo: \`$file\`" >> $output_file
        echo "\`\`\`$file_ext" >> $output_file
        cat $file >> $output_file
        echo "" >> $output_file
        echo "\`\`\`" >> $output_file
        echo "" >> $output_file
    end

    echo "¡Listo! Resumen guardado en: $output_file"
end