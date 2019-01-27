from antlr4 import *
from MiniJavaLexer import MiniJavaLexer
from MiniJavaListener import MiniJavaListener
from MiniJavaParser import MiniJavaParser
import sys

class MiniJavaPrintListener(MiniJavaListener):

    def enter(self, ctx):

        print(ctx.MainClass())

def main():
    lexer = MiniJavaLexer(StdinStream())
    stream = CommonTokenStream(lexer)
    parser = MiniJavaParser(stream)
    tree = parser.Goal()
    printer = HelloPrintListener()
    walker = ParseTreeWalker()
    walker.walk(printer, tree)
    
if __name__ == '__main__':

    main()
