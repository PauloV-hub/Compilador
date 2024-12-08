%{
#include <stdio.h>
#include "bison.tab.h" 

%}

/* coloque esta opcao para o flex ler apenas um arquivo */
%option noyywrap

%%
"else" { return ELSE; }
"for" { return FOR; }
"if" { return IF; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[0-9]+ { return NUM; }

"+" { return MAIS; }
"-" { return MENOS; }
"=" { return ATRIB; }
"<" { return MENOR; }
">" { return MAIOR; }
"%" { return PORCENTO; }
"(" { return LPAR; }
")" { return RPAR; }
";" { return PEV; }
"/" { return DIV; }
"++" { return MAISMAIS; }
"{" { return LCHAVES; }
"}" { return RCHAVES; }
" " {}
"\n" {}
[0-9]+[a-zA-Z_]+ { fprintf(stderr, "Erro léxico: Identificador inválido'%s'\n", yytext);}
. { fprintf(stderr, "Erro léxico: Caractere inválido encontrado '%s'\n", yytext); }

%%

extern FILE *yyin;

