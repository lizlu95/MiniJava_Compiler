package typechecker;

import ast.Expression;
import ast.Type;

import java.util.List;


/**
 * A centralized interface to record errors.
 *
 * @author kdvolder
 */
public class ErrorReport {

    private ErrorMessage firstError = null;

    public ErrorReport() {
    }

    /**
     * Add an error to the ErrorReport.
     * <p>
     * In this implementation the msg is simply printed to System.out. Also, the first message
     * is saved, so it can be verified by unit tests.
     */
    void report(ErrorMessage msg) {
        if (firstError == null)
            firstError = msg;
        System.out.println(msg);
    }

    /**
     * To allow processing all of the input (so that as many errors as possible can be
     * reported) and raising an error only in the end
     * this method is provided. You should call this method when you are done reporting
     * errors.
     * <p>
     * This method will raise an Exception if the error report contains some errors,
     * otherwise the method will return normally.
     * <p>
     *
     * @throws TypeCheckerException
     */
    public void close() throws TypeCheckerException {
        if (firstError != null)
            throw new TypeCheckerException(firstError);
    }

    public void duplicateDefinition(String name) {
        report(ErrorMessage.duplicateDefinition(name));
    }

    public void undefinedId(String name) {
        report(ErrorMessage.undefinedId(name));
    }

    public void wrongNumberOfArguments(int expected, int actual) {
        report(ErrorMessage.wrongNumberOfArguments(expected, actual));
    }

    public void typeError(Expression exp, Type expected, Type actual) {
        report(ErrorMessage.typeError(exp, expected, actual));
    }

    public void typeError(Expression exp, List<Type> expected, Type actual) {
        report(ErrorMessage.typeError(exp, expected, actual));
    }
}
