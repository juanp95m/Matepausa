#  filter_modular_solved_chosen

```c

# include <string.h>
# include <stdlib.h>
# include <unistd.h>
# include <stdio.h>

int ft_strncmp(char *str1, char *str2, int n)
{
	int i = 0;
	while ((str1[i] && str2[i]) && i < n)
	{
		if (str1[i] != str2[i])
			return (1);
		i++;
	}
	return (0);
}

int	get_stdin(char *buffer)
{
	int i = 0;
	int b;
	while ((b = read(0, &buffer[i], 1)) > 0)
		i++;
	if (b < 0)
	{
		perror("Error");
		return (1);
	}
	buffer[i] = 0;
	return (0);
}

void filter(char *str, char *replace)
{
	int len = strlen(replace);
	int i = 0;

	while (str[i])
	{
		if (ft_strncmp(&str[i], replace, len) == 0)
		{
			for (int j = 0; j < len; j++)
				write(1, "*", 1);
			i += len;
		}
		else
		{
			write(1, &str[i], 1);
			i++;
		}
	}
}

int main(int argc, char **argv)
{
	char buf[10000];

	if (argc != 2 || argv[1] == NULL)
		return (1);
	if (get_stdin(buf))
		return (1);
	filter(buf, argv[1]);
	return (0);
}
```

#  brokengnl_fixed_solved_v3_chosen

```c


#ifndef BUFFER_SIZE // 
# define BUFFER_SIZE 10 // 
#endif //

// borrado de "get_next_line.h"
#include <stdlib.h>
#include <unistd.h>

char	*ft_strchr(char *s, int c)
{
	int	i = 0;
	while (s[i] && s[i] != c)
		i++; // incluir dentro del while && s[i] "exista"
	if (s[i] == c)
		return (s + i);
	else return (NULL);
}

void	*ft_memcpy(void *dest, const void *src, int n)
{
	while (n-- > 0) // cambiar el --n por n--
		((char *)dest)[n] = ((char *)src)[n]; // cambiarar los n -1 por solo n
	return (dest);
}

int	ft_strlen(char *s)
{
	int	i = 0;
	while (s && s[i])
		i++; // añadir dentro del while && s "exista"
	return (i);
}

int	str_append_mem(char **s1, char *s2, int size2)
{
	int	size1 = ft_strlen(*s1);
	char	*tmp = malloc(size2 + size1 + 1);
	if (!tmp) return (0);
	ft_memcpy(tmp, *s1, size1);
	ft_memcpy(tmp + size1, s2, size2);
	tmp[size1 + size2] = 0;
	free(*s1);
	*s1 = tmp;
	return (1);
}

int	str_append_str(char **s1, char *s2)
{
	return (str_append_mem(s1, s2, ft_strlen(s2)));
}

void	*ft_memmove(void *dest, const void *src, int n)
{
	((char *)dest)[n] = '\0'; //
	ft_memcpy(dest, src, n); //
	return (dest); //
}

char	*get_next_line(int fd)
{
	static char	b[BUFFER_SIZE + 1] = "";
	char		*ret = NULL;
	char		*tmp = ft_strchr(b, '\n');

	while (!tmp)
	{
		if (!str_append_str(&ret, b))
			return (NULL);
		int read_ret = read(fd, b, BUFFER_SIZE);
		if (read_ret == -1)
			return (NULL);
		b[read_ret] = 0;
		if (read_ret == 0) //
		{
			if (*ret) //
				return (ret); //
			free(ret); //
			return (NULL); //
		}
		tmp = ft_strchr(b, '\n'); //
	}
	if (!str_append_mem(&ret, b, tmp - b + 1))
	{
		free(ret);
		return (NULL);
	}
	ft_memmove(b, tmp + 1, ft_strlen(tmp + 1)); //
	return (ret);
}

// main
#include <fcntl.h>
#include <stdio.h>

int	main(int argc, char **argv)
{
	char *line;
	int fd = open(argv[1], O_RDONLY);
	(void)argc;
	
	while((line = get_next_line(fd)) != NULL)
	{
		printf("%s", line);
		free(line);
	}
	close(fd);
	return (0);
}
```

#  mini_n_queens_chosen

```c

#include <stdio.h>
#include <stdlib.h>

int n, t[100];

int ok(int r, int c)
{
	for (int i = 0; i < c; i++)
		if (t[i] == r || t[i]-i == r-c || t[i]+i == r+c)
			return (0);
	return (1);
}

void solve(int c)
{
	if (c == n)
	{
		for (int i = 0; i < n; i++)
			printf("%d%s", t[i], i == n-1 ? "" : " ");
		printf("\n");
	}
	for (int r = 0; r < n; r++)
		if (ok(r, c))
		{
			t[c] = r;
			solve(c + 1);
		}
}

int main(int ac, char **av)
{
	if (ac != 2)
		return 1;
	n = atoi(av[1]);
	solve(0);
	return (0);
}
```

#  mini_permutations_chosen

```c

#include <stdio.h>
#include <string.h>

void swap(char *s1, char *s2)  
{
	char tmp = *s1;
	*s1 = *s2;
	*s2 = tmp;
}

void sort(char *str)
{
	int i = 0;
	while (str[i])
	{
		int j = i + 1;
		while (str[j])
		{
			if (str[i] > str[j])
				swap(&str[i], &str[j]);
			j++;
		}
		i++;
	}
}

void perm(char *s, char *res, int *u, int p, int n) {
	if (p == n)
	{
		res[n] = 0;
		puts(res);
		return;
	}
	for (int i = 0; i < n; i++) {
		if (!u[i])
		{
			u[i] = 1; 
			res[p] = s[i];
			perm(s, res, u, p + 1, n);
			u[i] = 0;
		}
	}
}

int main(int ac, char **av) {
	if (ac != 2)
		return 1;
	int n = strlen(av[1]);
	int u[100] = {0};
	char res[100];
	sort(av[1]);
	perm(av[1], res, u, 0, n);
	return (0);
}
```

#  mini_powerset_chosen

```c

#include <stdio.h>
#include <stdlib.h>

int n, *nums, buf[100], target;

void power(int i, int pos, int sum)
{
	if (i == n) {
		if (sum == target) {
			for (int k = 0; k < pos; k++) 
				printf("%d%s", buf[k], k == pos - 1 ? "" : " ");
			printf("\n");
		}
		return;
	}
	// Opción 1: No incluir nums[i]
	power(i + 1, pos, sum);
	// Opción 2: Incluir nums[i]
	buf[pos] = nums[i];
	power(i + 1, pos + 1, sum + nums[i]);
}

int main(int ac, char **av)
{
	n = ac - 2;
	if (ac < 3 || !(nums = malloc(sizeof(int) * n)))
		return (1);
	target = atoi(av[1]);
	for (int i = 0; i < n; i++)
		nums[i] = atoi(av[i + 2]);
	power(0, 0, 0);
	free(nums);
	return (0);
}
```

#  mini_rip_chosen

```c

#include <stdio.h>

int check(char *s) {
	int o = 0, c = 0;
	for (int i = 0; s[i]; i++)
	{
		if (s[i] == '(')
			o++;
		else if (s[i] == ')')
			(o > 0) ? o-- : c++;
	}
	return o + c;
}

void rip(char *s, int to_rm, int idx) {
	if (to_rm == 0 && !check(s))
	{
		puts(s);
		return;
	}
	for (int i = idx; s[i]; i++)
	{
		if (s[i] != '(' && s[i] != ')')
			continue;
		char tmp = s[i];
		s[i] = ' '; // "Borramos" temporalmente
		rip(s, to_rm - 1, i + 1);
		s[i] = tmp; // Backtrack
	}
}

int main(int ac, char **av)
{
	if (ac != 2)
		return(1);
	rip(av[1], check(av[1]), 0);
	return(0);
}
```

#  ft_popen_mod_chosen

```c


#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>

void close_fds(int fd[2])
{
	close(fd[0]);
	close(fd[1]);
}

int ft_popen(const char *file, char *const argv[], char type)
{
	int fd[2];
	pid_t pid;
	if(!file || !argv || (type != 'r' && type != 'w'))
		return(-1);
	if(pipe(fd)== -1)
		return(-1);
	pid = fork();
	if(pid == -1)
	{
		close_fds(fd);
		return(-1);
	}
	if(pid == 0)
	{
		int fd_to_dup = (type == 'r') ? fd[1] : fd[0];
		int std_target = (type == 'r') ? STDOUT_FILENO : STDIN_FILENO;
		if(dup2(fd_to_dup, std_target) == -1)
			exit(1);
		close_fds(fd);
		execvp(file, argv);
		exit(1);
	}
	close((type == 'r') ? fd[1] : fd[0]);
	return((type == 'r') ? fd[0] : fd[1]);
}
```

#  picoshell_v5_solved_chosen

```c

#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <stdio.h>

void redirect(int oldfd, int newfd)
{
	if (oldfd != -1)
	{
		if (dup2(oldfd, newfd) == -1)
			exit(1);
		close(oldfd);
	}
}

void child_process(char **cmd, int is_last, int fd[2], int last_fd)
{
	redirect(last_fd, STDIN_FILENO);
	if (!is_last)
	{
		close(fd[0]);
		redirect(fd[1], STDOUT_FILENO);
	}
	execvp(cmd[0], cmd);
	exit(1);
}

int wait_all()
{
	int status, exit_code = 0;
	while (wait(&status) > 0)
	{
		if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
			exit_code = 1;
	}
	return (exit_code);
}

int picoshell(char **cmds[])
{
	int fd[2], last_fd = -1;
	
	for (int i = 0; cmds[i]; i++)
	{
		int is_last = (cmds[i + 1] == NULL);
		if (!is_last && pipe(fd) == -1)
			return (1);
		pid_t pid = fork();
		if (pid == -1)
			return (1);
		if (pid == 0)
			child_process(cmds[i], is_last, fd, last_fd);
		if (last_fd != -1)
			close(last_fd);
		if (!is_last)
		{
			close(fd[1]);
			last_fd = fd[0];
		}
	}
	return (wait_all());
}
```

#  vbc_alicia_mod_chosen

```c

#include <stdio.h>
#include <stdlib.h> //cambiar malloc.h por stdlib.h
#include <ctype.h>

typedef struct node { //no changes
	enum {
		ADD,
		MULTI,
		VAL
	}   type;
	int val;
	struct node *l;
	struct node *r;
}	node;

node	*new_node(node n) //no changes
{
	node *ret = calloc(1, sizeof(n));
	if (!ret)
		return (NULL);
	*ret = n;
	return (ret);
}

void    destroy_tree(node *n) //no changes
{
	if (!n)
		return ;
	if (n->type != VAL)
	{
		destroy_tree(n->l);
		destroy_tree(n->r);
	}
	free(n);
}

void    unexpected(char c)
{
	if (c)
		printf("Unexpected token '%c'\n", c);
	else
		printf("Unexpected end of input\n"); //swap in the message file for input
}

int accept(char **s, char c)
{
	if (**s == c) //add == c
	{
		(*s)++;
		return (1);
	}
	return (0);
}

int expect(char **s, char c)
{
	if (accept(s, c))
		return (1);
	unexpected(**s);
	return (0);
}

node	*add(char **s); //add this function
node	*multi(char **s); //add this function
node	*val(char **s); //add this function

node *destroy(node *n) //add this function
{
	destroy_tree(n);
	return (NULL);
}

node *create_node(int type, node *ret, node *right, char **s) //add this function
{
	if (type == VAL)
		return (new_node((node){.type = VAL, .val = **s - '0'}));
	else if (type == ADD)
		return (new_node((node){.type = ADD, .l = ret, .r = right}));
	else if (type == MULTI)
		return (new_node((node){.type = MULTI, .l = ret, .r = right}));
	return (NULL);
}

node	*add(char **s) //add this function
{
	node	*ret = multi(s);
	node	*right;
	
	while (ret && accept(s, '+'))
	{
		if (!(right = multi(s)))
			return(destroy(ret));
		if (!(ret = create_node(ADD, ret, right, s)))
			return(destroy(right));
	}
	return (ret);
}

node	*multi(char **s) //add this function
{
	node	*ret = val(s);
	node	*right;
	
	while (ret && accept(s, '*'))
	{
		if (!(right = val(s)))
			return(destroy(ret));
		if (!(ret = create_node(MULTI, ret, right, s)))
			return(destroy(right));
	}
	return (ret);
}

node	*val(char **s) //add this function
{
	node	*ret;
	
	if (isdigit(**s))
	{
		ret = create_node(VAL, NULL, NULL, s);
		(*s)++;
		return (ret);
	}
	if (accept(s, '('))
	{
		ret = add(s);
		if (!ret || !expect(s, ')'))
			return(destroy(ret));
		return (ret);
	}
	unexpected(**s);
	return (NULL);
}

node    *parse_expr(char *s)
{
	node	*ret = add(&s); //add this line

	if (ret && *s) //add ret &&
	{
		unexpected(*s); //add this line
		return(destroy(ret));
	}
	return (ret);
}

int eval_tree(node *tree)
{
	switch (tree->type)
	{
		case ADD:
			return (eval_tree(tree->l) + eval_tree(tree->r));
		case MULTI:
			return (eval_tree(tree->l) * eval_tree(tree->r));
		case VAL:
			return (tree->val);
	}
	return (0); //add this line
}

int main(int argc, char **argv)
{
	if (argc != 2)
		return (1);
	node *tree = parse_expr(argv[1]);
	if (!tree)
		return (1);
	printf("%d\n", eval_tree(tree));
	destroy_tree(tree);
	return (0); //add this line
}
```

