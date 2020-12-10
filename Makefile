lex:
	java -jar antlr-4.9-complete.jar Newton.g4
	javac -classpath .:antlr-4.9-complete.jar MainLex.java
	java -classpath .:antlr-4.9-complete.jar MainLex test10.new > lexer-result-table
	cat lexer-result-table

clean:
	rm *.class
