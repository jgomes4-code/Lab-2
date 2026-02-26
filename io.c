#include <stdio.h>
#include <string.h>

extern int hamming_convert(char *str1, char *str2);

static void strip_newline(char *s) {
    s[strcspn(s, "\n")] = '\0';
}

int main(void) {
    char str1[256];
    char str2[256];

    printf("Enter String 1:\n");
    if (!fgets(str1, sizeof str1, stdin)) return 1;
    strip_newline(str1);

    printf("Enter String 2:\n");
    if (!fgets(str2, sizeof str2, stdin)) return 1;
    strip_newline(str2);

    int result = hamming_convert(str1, str2);
    printf("The Hamming Distance Between the Two Strings Are: %d\n", result);

    return 0;
}