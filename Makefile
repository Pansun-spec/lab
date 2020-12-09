all:
	java -jar antlr-4.9-complete.jar Newton.g4
	javac -classpath .:antlr-4.9-complete.jar Main.java
	java -classpath .:antlr-4.9-complete.jar Main > lexer-result-table
