%{
#include <string>
#include <limits.h>

/* Get our custom yyFlexScanner subclass */
#include "scanner.hpp"
#include "tokens.hpp"
#undef  YY_DECL
#define YY_DECL int drewno_mars::Scanner::yylex( drewno_mars::Parser::semantic_type * const lval )

/* define yyterminate as this instead of NULL */
#define yyterminate() return( TokenKind::END )

/* Exclude unistd.h for Visual Studio compatability. */
#define YY_NO_UNISTD_H

/* typedef to make the reference to token kinds shorter */
using TokenKind = drewno_mars::Parser::token;

%}

%option debug
%option nodefault
%option yyclass="drewno_mars::Scanner"
%option noyywrap
%option c++

DIGIT [0-9]

%%
%{          /** Code executed at the beginning of yylex **/
            yylval = lval;
%}

"+"		{
		// Keep track of the "kind" of token we matched. In this case,
		// it's a CROSS (aka the plus symbol). The full list of token
		// kinds is declared around line 197 of grammar.hh. The testing
		// functionScanner::outputTokens also indicates what each token
		// represents (declared in scanner.cpp line 9)
		int tokenKind = TokenKind::CROSS;

		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);

		//Instatiate a token. There are 5 classes of tokens defined based on
		// - a literal string (StringLitToken)
		// - a literal integer (IntLitToken)
		// - a literal short (ShortLitToken)
		// - an identifier (IDToken)
		// - a base Token (any other type)
		// The token object is a handy place to keep information about the
		// token (i.e. token metadata) such as the line and column on which
		// the token character started (which can be used later in debug
		// messages, etc).
		Token * token = new Token(pos, tokenKind);

		//Assign the token to a instance variable of the scanner.
		// (When Flex processes a .l file in C++ mode, it creates
		// a class called Scanner, which is a subclass of yyFlexScanner)
		// By assigning a value to this field, we put the token
		// metadata in a place where scanner's client program can find it.
		this->yylval->lexeme = token;

		//Since we consumed 1 character, increase the column number by 1
		colNum++;

		//Let the scanner's client program know that a PLUS token
		// has been matched
		return tokenKind;
		}

"-" {
		//Essentially the same thing as CROSS, but without the verbose
		// comments so it doesn't look so scary.
		int tokenKind = TokenKind::DASH;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

"=" {
		int tokenKind = TokenKind::ASSIGN;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

":" {
		int tokenKind = TokenKind::COLON;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

"," {
		int tokenKind = TokenKind::COMMA;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

"==" {
		int tokenKind = TokenKind::EQUALS;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+2);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 2;
		return tokenKind;
		}

">" {
		int tokenKind = TokenKind::GREATER;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

">=" {
		int tokenKind = TokenKind::GREATEREQ;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+2);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 2;
		return tokenKind;
		}

"{" {
		int tokenKind = TokenKind::LCURLY;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

"<" {
		int tokenKind = TokenKind::LESS;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

"<=" {
		int tokenKind = TokenKind::LESSEQ;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+2);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 2;
		return tokenKind;
		}

"(" {
		int tokenKind = TokenKind::LPAREN;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

"!" {
		int tokenKind = TokenKind::NOT;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

"!=" {
		int tokenKind = TokenKind::NOTEQUALS;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+2);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 2;
		return tokenKind;
		}

"--" {
		int tokenKind = TokenKind::POSTDEC;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+2);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 2;
		return tokenKind;
		}

"++" {
		int tokenKind = TokenKind::POSTINC;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+2);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 2;
		return tokenKind;
		}

"}" {
		int tokenKind = TokenKind::RCURLY;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

")" {
		int tokenKind = TokenKind::RPAREN;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

";" {
		int tokenKind = TokenKind::SEMICOL;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

"--" {
		int tokenKind = TokenKind::POSTDEC;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+2);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 2;
		return tokenKind;
		}

"/" {
		int tokenKind = TokenKind::SLASH;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

"*" {
		int tokenKind = TokenKind::STAR;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum++;
		return tokenKind;
		}

"and" {
		int tokenKind = TokenKind::AND;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+3);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 3;
		return tokenKind;
		}

"24Kmagic" {
		int tokenKind = TokenKind::MAGIC;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+strlen(yytext));
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += strlen(yytext);
		return tokenKind;
		}

"bool" {
		int tokenKind = TokenKind::BOOL;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+4);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 4;
		return tokenKind;
		}

"else" {
		int tokenKind = TokenKind::ELSE;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+4);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 4;
		return tokenKind;
		}

"false" {
		int tokenKind = TokenKind::FALSE;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+5);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 5;
		return tokenKind;
		}

"if" {
		int tokenKind = TokenKind::IF;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+2);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 2;
		return tokenKind;
		}

"int" {
		int tokenKind = TokenKind::INT;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+3);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 3;
		return tokenKind;
		}

"give" {
		int tokenKind = TokenKind::GIVE;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+4);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 4;
		return tokenKind;
		}

"take" {
		int tokenKind = TokenKind::TAKE;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+4);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 4;
		return tokenKind;
		}

"or" {
		int tokenKind = TokenKind::OR;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+2);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 2;
		return tokenKind;
		}

"perfect" {
		int tokenKind = TokenKind::PERFECT;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+strlen(yytext));
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += strlen(yytext);
		return tokenKind;
		}

"return" {
		int tokenKind = TokenKind::RETURN;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+strlen(yytext));
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += strlen(yytext);
		return tokenKind;
		}

"class" {
		int tokenKind = TokenKind::CLASS;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+5);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 5;
		return tokenKind;
		}

"too hot" {
		int tokenKind = TokenKind::FALSE;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+strlen(yytext));
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += strlen(yytext);
		return tokenKind;
		}

"true" {
		int tokenKind = TokenKind::TRUE;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+4);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 4;
		return tokenKind;
		}

"today I don't feel like doing any work" {
		int tokenKind = TokenKind::EXIT;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+strlen(yytext));
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += strlen(yytext);
		return tokenKind;
		}

"void" {
		int tokenKind = TokenKind::VOID;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+4);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 4;
		return tokenKind;
		}

"while" {
		int tokenKind = TokenKind::WHILE;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+5);
		this->yylval->lexeme = new Token(pos, tokenKind);
		colNum += 5;
		return tokenKind;
		}

[a-zA-Z_][a-zA-Z0-9_]* {
        Position * pos = new Position(
        	lineNum, colNum, lineNum, colNum+strlen(yytext));
        yylval->lexeme = new IDToken(pos, yytext);

        colNum += strlen(yytext);
        return TokenKind::ID;
        }

\"(\\[nt"\\]|[^\n"\\])*\" {
        //string literals
        Position * pos = new Position(
            lineNum, colNum, lineNum, colNum+strlen(yytext));
        yylval->lexeme = new StrToken(pos, yytext);

        colNum += strlen(yytext);
        return TokenKind::STRINGLITERAL;
        }

\"(\\[^nt"\\]|\\[nt"\\]|[^\n"\\])*\" {
        //bad escape sequence in string literal
        std::string msg = "String literal with bad escape sequence detected";
        Position * pos = new Position(
        	lineNum, colNum, lineNum, colNum+strlen(yytext));
        Report::fatal(pos,msg);
        colNum += strlen(yytext);
        }

\"(\\[nt"\\]|[^\n"\\])* {
        //unterminated string literal
        std::string msg = "Unterminated string literal detected";
        Position * pos = new Position(
        	lineNum, colNum, lineNum, colNum+strlen(yytext));
        Report::fatal(pos,msg);
        colNum += strlen(yytext);
        }

\"(\\[^nt"\\]|\\[nt"\\]|[^\n"\\])* {
        //bad escape sequence in unterminated string literal
        std::string msg = "Unterminated string literal with bad escape sequence detected";
        Position * pos = new Position(
        	lineNum, colNum, lineNum, colNum+strlen(yytext));
        Report::fatal(pos,msg);
        colNum += strlen(yytext);
        }


"//".* {
        //Comment, do Nothing
        colNum += strlen(yytext);
        }

{DIGIT}+	{
        //check for overflow
		double doubleVal = std::stod(yytext);
		if(doubleVal > INT_MAX) {
		    std::string msg = "Integer literal overflow";
            Position * pos = new Position(
            	lineNum, colNum, lineNum, colNum+strlen(yytext));
            yylval->lexeme = new IntLitToken(pos, 0);

            Report::fatal(pos,msg);
            colNum += strlen(yytext);

            return TokenKind::INTLITERAL;
		}
		else {
            int intVal = atoi(yytext);


            //Note that the IntLitToken does not take a TokenKind argument
            // since it's implicitly known that the token represents an
            // INTLITERAL
            Position * pos = new Position(
                lineNum, colNum, lineNum, colNum+strlen(yytext));
            yylval->lexeme = new IntLitToken(pos, intVal);

            colNum += strlen(yytext);

            //As before, alert the client program that an INTLITERAL
            // token was matched
            return TokenKind::INTLITERAL;
        }
	}

" " {
        //don't need to print just increase column by 1
		colNum++;
		}

\n		{
		//Update the line number, reset the columnNumber
		lineNum++;
		colNum = 1;
		}

\r\n		{
		//Update the line number, reset the columnNumber
		lineNum++;
		colNum = 1;
		}

\t		{
		//Add tab to the columnNumber
		colNum += 4;
		}


.   {
		std::string msg = "Illegal character ";
		msg += yytext;
		Position * pos = new Position(
			lineNum, colNum, lineNum, colNum+1);
		Report::fatal(pos,msg);
		colNum += strlen(yytext);
    }
%%
