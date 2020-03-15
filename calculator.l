%{
    #include <stdio.h>
    #include <stdlib.h>
    int op = 0;
    float a, b;
%}

word [A-Za-z]|([A-Za-z]*)
dig [0-9]+|([0-9]*)"."([0-9]+)
add "+"
sub "-"
mul "*"
div "/"
ln \n

%%
{word} {printf("Word\n"); a = 0;}
{dig} {printf("Number\n"); cal();}
{add} {printf("Add\n");op=1;}
{sub} {printf("Misux\n");op=2;}
{mul} {printf("Multiply\n");op=3;}
{div} {printf("Divide\n");op=4;}
{ln} {printf("Answer = :%.2f\n------------\n",a);}
%%

cal() {
    if(op==0)
        a=atof(yytext);
    else {
        b=atof(yytext);
        switch(op) {
            case 1:a=a+b;
                break;
            case 2:a=a-b;
                break;
            case 3:a=a*b;
                break;
            case 4:a=a/b;
                break;
        }
    op=0;
    }
}

int yywrap(void) {
    return 1;
}
int main() {
    yylex();
    return 0;
}

