//print the character,ch , in the first line. Then print s in next line. In the last line print the sentence sn .
#include <stdio.h>
#include <string.h>
int main() 
{
    char ch, s[50], sen[500];
    
    scanf("%c\n",&ch);
    scanf("%s\n",s);
    scanf("\n");
    scanf("%[^\n]%*c",sen);
    printf("%c\n%s\n%s",ch,s,sen);
}
