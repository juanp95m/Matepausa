# Teoría del Backtracking - Paralelismos

El **Backtracking** (Vuelta Atrás) es un mecanismo para explorar sistemáticamente un montón de posibles "decisiones". Cuando tomas una secuencia de decisiones y ves que no funciona, "das un paso atrás" deshaciendo el último movimiento y pruebas con otra opción.

A nivel de código en C (y en los ejercicios de nivel 2 y rank 3 de la escuela), habitualmente todos comparten fases muy estructuradas:

## Las 5 Fases Estándar del Backtracking

### 1. La Condición de Parada (Caso Base)
Si no tenemos condición de parada, la recursividad sería infinita.
* **Permutations:** `if (pos == size)` -> Rellenados los mismos huecos que hay letras.
* **N_Queens:** `if (col == size)` -> Hemos puesto reinas en todas las columnas requeridas.
* **Powerset:** `if (ixn == size)` -> Hemos valorado todos y cada uno de los números del array inicial (cogiendolos o no).
* **RIP:** `if (deleted == remove)` -> Hemos "arrancado" la cantidad de paréntesis mal puestos que nos dijeron usando validation.

Cuando llegamos aquí, valoramos: "¿Es la solución actual correcta o válida?", si lo es se imprime, y en cualquier caso hacemos `return ;` para **volver atrás**.

### 2. El Iterador / Explorador (Tomar la decisión)
Siempre necesitamos explorar opciones, habitualmente a través de opciones posibles o índices de un elemento.
* **Permutations:** `while(i < size)` Prueba a poner absolutamente cualquier carácter en la posición actual prestando atención al array `used`.
* **N_Queens:** `while(current < size)` Prueba todas las filas (current) posibles dentro de la columna actual.
* **Powerset:** Opción Binaria Estática. (No hay `while`). La decisión se ramifica en dos recursiones idénticas: La primera ignorando al número actual y la segunda asimilando el número en nuestro buffer.
* **RIP:** `while(str[pos])` Recorre todos los caracteres y, si son eliminables, trata de borrarlo temporalmente a ver qué pasaría.

### 3. Marcado (Avance de Estado)
Modificamos nuestras variables locales o arrays para dejar rastros de la pequeña decisión tomada.
* **Permutations:** `used[i] = 1; result[pos] = str[i];`
* **N_Queens:** `table[col] = current;`
* **Powerset:** `buffer[ixc] = nums[ixn];`
* **RIP:** `str[pos] = ' ';`

### 4. La Recursión (Búsqueda en Profundidad / DFS)
Una vez hecho el cambio de arriba, "hacemos lo mismo para el nivel/paso siguiente".
* **Permutations:** `permu(..., pos + 1 ...)` -> Pasamos al hueco `pos + 1`.
* **N_Queens:** `n_queen(..., col + 1 ...)` -> Pasamos a revisar la columna siguiente.
* **Powerset:** `powerset(ixn + 1, ...)` -> Pasamos a estudiar el indice numérico siguiente.
* **RIP:** `rip(..., pos + 1, deleted + 1)` -> Pasamos a estudiar el carácter siguiente diciendo que ya hemos restado un error.

### 5. Desmarcar (El auténtico Backtrack - "Volver a dejar limpio")
Si la recursión de arriba devuelve algo y el bucle sigue bajando, significa que esa "elección de rama de árbol" ya ha sido completamente explorada hasta el fondo o fue un fallo. ¡Necesitamos deshacer nuestro movimiento antes de probar con el siguiente elemento del bucle!
* **Permutations:** `used[i] = 0;` (La desmarcamos para que en la próxima iteración pueda usarse de otra forma).
* **N_Queens:** (Implícito) Al no tener un array `used`, al hacer `current++`, sobreescribiremos amigablemente sobre `table[intento=nuevo_current]` en el próximo nivel.
* **Powerset:** (Implícito) Al devolver de forma recursiva, la escritura en array recede por índices.
* **RIP:** `str[pos] = tmp;` (Devolvemos el `)` o `(` sacado de la basura temporal donde guardamos la variable para que el string vuelva a estar íntegro para otra prueba posterior).

---

## Esquema Visual Comparado de Árbol

La raíz del árbol es siempre un nivel `0`.
- En **Permutations** avanzas abriendo tantas ramas como letras esten libres (`size - pos`).
- En **N-Queens** abres tantas ramas como celdas por columna no estén atacadas por cruces previos en `validation()`.
- En **Powerset** siempre, siempre abres 2 ramas: "Tomar o no tomar"
- En **RIP** abres una rama por cada "supuesto eliminado posible". Moverlo de uno en uno o saltárselo. 

Entender un backtracking implica saber aislar y diferenciar cada una de esas 5 Fases Estándar en tu código C. ¡Suerte estructurándolo mentalmente!