#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int hamming_convert(char *str1, char *str2);

int main(void) {
    char *str1 = NULL;
    char *str2 = NULL;
    size_t len1 = 0;
    size_t len2 = 0;

    printf("Enter String 1:\n");
    getline(&str1, &len1, stdin);

    printf("Enter String 2:\n");
    getline(&str2, &len2, stdin);

    // remove newline characters
    str1[strcspn(str1, "\n")] = '\0';
    str2[strcspn(str2, "\n")] = '\0';

    int result = hamming_convert(str1, str2);
    printf("The Hamming Distance Between the Two Strings Are: %d\n", result);

    free(str1);
    free(str2);

    return 0;
}