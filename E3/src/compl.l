%option noyywrap yylineno
%{
#include "token.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin;
extern FILE *yyout;
%}

WHITESPACE [ \t\r\n]
DIGIT [0-9]
LETTER [a-zA-Z]
ID [a-zA-Z][a-zA-Z0-9_]*
NUMBER {DIGIT}+
CHAR_LITERAL '\''(?:[^\\'\n\0]|\\[n0\\'])'\''
STRING_LITERAL \"([^\\\"\n]|\\[nt0])*\" 

%%

{WHITESPACE} ; 

"//".* ;

"if"            { return IF; }  
"else"          { return ELSE; }
"for"           { return FOR; }
"while"         { return WHILE; }
"return"        { return RETURN; }
"print"         { return PRINT; }

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MULT; }
"/"             { return DIV; }
"%"             { return MOD; }
"!"             { return NOT; }
"<"             { return LT; }
">"             { return GT; }
"<="            { return LEQ; }
">="            { return GEQ; }
"!="            { return NEQ; }
"=="            { return EQ; }
"&&"            { return AND; }
"||"            { return OR; }
"="             { return ASSIGN; }
":"             { return COLON; }
";"             { return SEMI; }
","             { return COMMA; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"["             { return LBRACK; }
"]"             { return RBRACK; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"\\"            { return BSLASH; }

{ID} {
    if (strcmp(yytext, "array") == 0 || 
        strcmp(yytext, "boolean") == 0 || 
        strcmp(yytext, "char") == 0 || 
        strcmp(yytext, "false") == 0 || 
        strcmp(yytext, "true") == 0 || 
        strcmp(yytext, "void") == 0) {
        return KEY; // Se houver necessidade de usar KEY para palavras-chave específicas.
    }
    return ID;
}

{NUMBER} { return NUM; }
{CHAR_LITERAL} { return CHAR; }
{STRING_LITERAL} { return STR; }

"''" { return ERROR; }
"'" { return ERROR; }

. { return ERROR; }

%%

int main(int argc, char **argv)
{
    token_t token;
    extern FILE *yyin;
    extern FILE *yyout;

    if (argc > 2) {
        if(!(yyin = fopen(argv[1], "r"))) {
            fprintf(stderr,"erro na abertura do arquivo de entrada %s\n",argv[1]);
            return (1);
        }
        if(!(yyout = fopen(argv[2], "w"))) {
            fprintf(stderr,"erro na criacao do arquivo de saida %s\n",argv[2]);
            return (1);
        }
    }
    else {
        fprintf(stderr,"erro no número de argumentos de entrada\n");
        return (1);
    }
    while ((token = yylex())) {
        switch (token) {
            case ERROR:
                fprintf(yyout, "(%d,ERROR,\"%s\")\n", yylineno, yytext);
                break;
            case NUM:
                fprintf(yyout, "(%d,NUM,\"%s\")\n", yylineno, yytext);
                break;
            case ID:
                fprintf(yyout, "(%d,ID,\"%s\")\n", yylineno, yytext);
                break;
            case CHAR:
                fprintf(yyout, "(%d,CHAR,\"%s\")\n", yylineno, yytext);
                break;
            case STR:
                fprintf(yyout, "(%d,STR,\"%s\")\n", yylineno, yytext);
                break;
            case IF:
                fprintf(yyout, "(%d,IF,\"%s\")\n", yylineno, yytext);
                break;
            // Adicione mais casos conforme necessário
            default:
                fprintf(yyout, "(%d,%d,\"%s\")\n", yylineno, token, yytext);
                break;
        }
    }
    fclose(yyout);
}

void yyerror(char *s) {
   fprintf(stderr, "%s\n", s);
}
