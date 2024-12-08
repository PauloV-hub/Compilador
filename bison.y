%{
#include <stdio.h>
extern FILE *yyin;
extern int yylex();
extern int yyparse();
void yyerror(char *);
%}
/* lista de tokens -- o bison ira gerar o tipo enum com essa lista */
%token MAIS
%token MENOS
%token MENOR
%token MAIOR
%token PORCENTO
%token LPAR
%token RPAR
%token PEV
%token MAISMAIS
%token LCHAVES
%token RCHAVES
%token ELSE
%token FOR
%token LETRA
%token NUM
%token ID
%token ATRIB
%token DIV
%token IF
%%

atrib : ID ATRIB expr PEV ;

expr : expr MAIS termo | termo ;

termo : termo DIV fator | fator ;

fator : ID | NUM | LPAR expr RPAR ;


%%

int main(int argc, char *argv[]) {
    yyin = fopen("programa.c", "r");
    yyparse();
    fclose(yyin);
    return 0;
}
void yyerror(char *s) { fprintf(stderr, "ERRO: %s\n", s); }
