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
        return KEY; // Se precisar usar KEY para palavras-chave específicas.
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
