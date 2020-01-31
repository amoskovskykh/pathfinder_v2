#include "libmx.h"

char **mx_strsplit(const char *s, char c) {
   if (s == NULL) 
      return NULL;
   int n = mx_count_words(s, c);
   char **arr = (char ** ) malloc((n + 1) * sizeof(char *));
   int m = 0;
   
   for (int i = 0; s[i]; i++)
      if (s[i] != c) {
         int j;
         for (j = 1; (s[i + j] != c) && s[i + j]; j++);
         arr[m] = mx_strnew(j);
         mx_strncpy(arr[m], &s[i], j);
         arr[m][j] = '\0'; 
         m++;
         i += j - 1 ;
      }
   arr[n] = NULL;
   return arr;
}
