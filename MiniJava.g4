grammar MiniJava;
Goal:	MainClass ( ClassDeclaration )* EOF;
MainClass:	"class" Identifier "{" "public" "static" "void" "main" "(" "String" "[" "]" Identifier ")" "{" Statement "}" "}";
ClassDeclaration:	"class" Identifier ( "extends" Identifier )? "{" ( VarDeclaration )* ( MethodDeclaration )* "}";
VarDeclaration:	Type Identifier ";"
MethodDeclaration:	"public" Type Identifier "(" ( Type Identifier ( "," Type Identifier )* )? ")" "{" ( VarDeclaration )* ( Statement )* "return" Expression ";" "}";
Type:	"int" "[" "]"
Type
	|	"boolean"
Type
	|	"int"

	|	Identifier
	;
Statement:	"{" ( Statement )* "}"
	|	"if" "(" Expression ")" Statement "else" Statement
	|	"while" "(" Expression ")" Statement
	|	"System.out.println" "(" Expression ")" ";"
	|	Identifier "=" Expression ";"
	|	Identifier "[" Expression "]" "=" Expression ";"
	;
Expression:	Expression ( "&&" | "<" | "+" | "-" | "*" ) Expression
	|	Expression "[" Expression "]"

	|	Expression "." "length"
	|	Expression "." Identifier "(" ( Expression ( "," Expression )* )? ")"
	|	[0-9]+
	|	"true"
	|	"false"
	|	Identifier
	|	"this"
	|	"new" "int" "[" Expression "]"
	|	"new" Identifier "(" ")"
	|	"!" Expression
	|	"(" Expression ")"
	;
Identifier:	{[a-zA-Z]}({[a-zA-Z]}|{[0-9]})*;    
