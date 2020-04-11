%{
    #include <stdio.h>
%}

%%
c {printf("1\n");}
ac+b* {printf("2\n");}
cc {printf("3\n");}
ab* {printf("4\n");}
a {printf("5\n");}
ac*b+ {printf("6\n");}
%%

int yywrap(void) {
    return 1;
}
int main() {
    yylex();
    return 0;
}