#include <stdio.h>
#include <string.h>

void
vulnerable(char *input)
{
    char buf[10];
    strcpy(buf, input);
    printf("You wrote: %s\n", buf);
}

int
main(int argc, char **argv)
{
    if (argc > 1) {
        vulnerable(argv[1]);
    }
    return 0;
}
