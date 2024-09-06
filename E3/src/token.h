/* token.h */

typedef enum {
    ID = 256,
    NUM,
    IF,    // Palavra-chave "if"
    ELSE,  // Palavra-chave "else"
    FOR,   // Palavra-chave "for"
    WHILE, // Palavra-chave "while"
    RETURN,// Palavra-chave "return"
    PRINT, // Palavra-chave "print"
    CHAR,  // Literal de caractere
    STR,   // Literal de string
    LEQ,   // Menor ou igual
    GEQ,   // Maior ou igual
    NEQ,   // Diferente
    EQ,    // Igual
    AND,   // E lógico
    OR,    // Ou lógico
    PLUS,  // "+"
    MINUS, // "-"
    MULT,  // "*"
    DIV,   // "/"
    MOD,   // "%"
    NOT,   // "!"
    LT,    // "<"
    GT,    // ">"
    ASSIGN, // "="
    COLON, // ":"
    SEMI,  // ";"
    COMMA, // ","
    LPAREN, // "("
    RPAREN, // ")"
    LBRACK, // "["
    RBRACK, // "]"
    LBRACE, // "{"
    RBRACE, // "}"
    BSLASH, // "\"
    CHAR_LITERAL, // Literal de caractere
    STRING_LITERAL, // Literal de string
    ERROR
} token_t;
