%{
    #include <stdio.h>
%}

%%
\n {printf("1\n");}
A {printf("2\n");}
a {printf("3\n");}
d {printf("4\n");}
[b-d]* {printf("5\n");}
abc {printf("6\n");}
[A-C]* {printf("7\n");}
[a-c]* {printf("8\n");}
[^a-c]+d[^A-C]+ {printf("9\n");}
%%

int yywrap(void) {
    return 1;
}
int main() {
    yylex();
    return 0;
}