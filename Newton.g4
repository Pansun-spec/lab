grammar Newton;

program : PROGRAM IDENTIFIER SEMICOLON block DOT ;

block : (var_declarations | function)* compound_statement DOT ;

function : FUNCTION IDENTIFIER LBRACKET parameters RBRACKET COLON result_type SEMICOLON block ;

parameters : (var_declaration (SEMICOLON var_declaration)*)? ;

var_declarations : VAR var_declaration (SEMICOLON var_declaration)* SEMICOLON ;

var_declaration : identifier_list COLON type ;

identifier_list : IDENTIFIER (COMMA IDENTIFIER)* ;

compound_statement : BEGIN statement (SEMICOLON statement)* END ;

statement: assignment_statement | for_statement | if_statement | function_statement | compound_statement ;

if_statement : IF expression THEN statement (ELSE statement)? ;

assignment_statement : variable ASSIGN expression ;

function_statement : IDENTIFIER LBRACKET identifier_list RBRACKET ;

for_statement : FOR variable ASSIGN expression TO expression DO statement ;

empty_statement : ;

expression : arithmetic_expression (bool_relation expression)? ;

arithmetic_expression : term ((PLUS | MINUS | AND | OR) arithmetic_expression)? ;

term : multiplier ((MULT | DIV) term)? ;

multiplier : (PLUS | MINUS)? (variable | unsigned_constant | NOT multiplier | LBRACKET expression RBRACKET) ;

result_type : type;

type : simple_type | array_type ;

array_type : ARRAY SQLBRACKET UNSIGNED_INT_VALUE DBLDOT UNSIGNED_INT_VALUE SQRBRACKET OF type;

unsigned_constant : UNSIGNED_INT_VALUE | STRING_VALUE | UNSIGNED_FLOAT_VALUE | BOOL_VALUE ;

variable : IDENTIFIER ;

fragment A : ('a' | 'A') ;
fragment B : ('b' | 'B') ;
fragment C : ('c' | 'C') ;
fragment D : ('d' | 'D') ;
fragment E : ('e' | 'E') ;
fragment F : ('f' | 'F') ;
fragment G : ('g' | 'G') ;
fragment H : ('h' | 'H') ;
fragment I : ('i' | 'I') ;
fragment J : ('j' | 'J') ;
fragment K : ('k' | 'K') ;
fragment L : ('l' | 'L') ;
fragment M : ('m' | 'M') ;
fragment N : ('n' | 'N') ;
fragment O : ('o' | 'O') ;
fragment P : ('p' | 'P') ;
fragment Q : ('q' | 'Q') ;
fragment R : ('r' | 'R') ;
fragment S : ('s' | 'S') ;
fragment T : ('t' | 'T') ;
fragment U : ('u' | 'U') ;
fragment V : ('v' | 'V') ;
fragment W : ('w' | 'W') ;
fragment X : ('x' | 'X') ;
fragment Y : ('y' | 'Y') ;
fragment Z : ('z' | 'Z') ;

fragment LETTER : 'a' .. 'z' | 'A' .. 'Z' ;
fragment NUMBER : '0' .. '9' ;
fragment UNDERLINE : '_';

LBRACKET : '(' ;
RBRACKET : ')' ;
SQLBRACKET : '[' ;
SQRBRACKET : ']' ;

IDENTIFIER : LETTER (LETTER | NUMBER | UNDERLINE)* ;

INT_VALUE : (PLUS | MINUS)? UNSIGNED_INT_VALUE ;
UNSIGNED_INT_VALUE : (NUMBER)+ ;

FLOAT_VALUE : (PLUS | MINUS)? UNSIGNED_FLOAT_VALUE ;
UNSIGNED_FLOAT_VALUE : INT_VALUE DOT (INT_VALUE)? ;

TRUE_VALUE : T R U E ;
FALSE_VALUE : F A L S E ;

BOOL_VALUE : TRUE_VALUE | FALSE_VALUE ;

//QUOTE : '\'' ;
//QUOTES : '\'\'' ;
//STRING_VALUE : QUOTE (QUOTES | ~ (QUOTE))* QUOTE ;
STRING_VALUE : '\'' ('\'\'' | ~ ('\''))* '\'' ;


SEMICOLON       :       ';'     ;
COLON           :       ':'     ;
DOT             :       '.'     ;
DBLDOT          :       '..'    ;
COMMA           :       ','     ;

SPACE : [ \t\r\n] -> skip ;

VAR     :       V A R           ;

ARRAY   :       A R R A Y       ;
OF      :       O F             ;

IF      :       I F             ;
THEN    :       T H E N         ;
ELSE    :       E L S E         ;

FOR     :       F O R           ;
TO      :       T O             ;
DO      :       D O             ;

BEGIN   :       B E G I N       ;
END     :       E N D           ;

AND     :       A N D           ;
OR      :       O R             ;
NOT     :       N O T           ;

bool_operator : AND | OR | NOT ;

TYPE_STRING     :       S T R I N G     ;
TYPE_BOOLEAN    :       B O O L E A N   ;
TYPE_INTEGER    :       I N T E G E R   ;
TYPE_FLOAT      :       F L O A T       ;

simple_type : TYPE_STRING | TYPE_BOOLEAN | TYPE_FLOAT | TYPE_INTEGER ;

ASSIGN          :       ':='            ;

EQ      :       '='     ;
NEQ     :       '!='    ;
LESS    :       '<'     ;
LEQ     :       '<='    ;
GREATER :       '>'     ;
GEQ     :       '>='    ;

bool_relation : EQ | NEQ | LESS | LEQ | GREATER | GEQ ;

PLUS    :       '+'     ;
MINUS   :       '-'     ;
MULT    :       '*'     ;
DIV     :       '/'     ;

arithmetic_operator : PLUS | MINUS | MULT | DIV ;

PROGRAM         :       P R O G R A M           ;
FUNCTION        :       F U N C T I O N         ;
