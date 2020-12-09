import java.io.FileInputStream;
import java.io.IOException;
import java.io.StringReader;
import java.io.FileReader;

import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.Vocabulary;
import org.antlr.v4.runtime.ANTLRInputStream;

public class Main {

    static String rjust(String str, int minLength)
    {
        String result = str;
        for (int i = str.length(); i < minLength; ++i) {
            result = result + " ";
        }
        return result;
    }

    @SuppressWarnings("deprecation")
    public static void main(String[] args) {
        try {
            NewtonLexer lexer = new NewtonLexer(new ANTLRInputStream(new FileReader("test10.new")));
            Token t;
            Vocabulary v = lexer.getVocabulary();
            System.out.printf("\n\tToken\tType\tDisplayName\tLine\n");
            do {
                t = lexer.nextToken();
                if (t.getType() != -1) {
                    System.out.printf("\t%s\t%d\t%s\t%d\n",
                                      t.getText(),
                                      t.getType(),
                                      rjust(v.getDisplayName(t.getType()), 8),
                                      t.getLine());
                }
            } while (t.getType() != -1);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
