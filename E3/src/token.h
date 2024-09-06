/* token.h */

typedef enum {
    ID = 256,
    NUM,
    IF,    // Adicione palavras-chave como IF, ELSE, etc.
    ELSE,
    FOR,
    WHILE,
    RETURN,
    PRINT,
    CHAR,
    STR,
    LEQ,   // "less or equal"
    GEQ,   // "greater or equal"
    NEQ,   // "not equal"
    EQ,    // "equal"
    AND,   // "and"
    OR,    // "or"
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
    CHAR_LITERAL, // 'c'
    STRING_LITERAL, // "string"
    ERROR
} token_t;
