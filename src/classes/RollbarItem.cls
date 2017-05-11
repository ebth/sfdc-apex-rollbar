public class RollbarItem {

    private String fileName;
    private String className;
    private String methodName;
    private Integer lineNumber;
    private String exceptionClass;
    private String errorMessage;
    private String stackTrace;
    private List<Object> args;

    public RollbarItem(String fileName, String className, String methodName,
            Integer lineNumber, String exceptionClass, String message, String trace, List<Object> args) {
        this.fileName = fileName;
        this.className = className;
        this.methodName = methodName;
        this.lineNumber = lineNumber;
        this.exceptionClass = exceptionClass;
        this.errorMessage = message;
        this.stackTrace = trace;
        this.args = args;
    }

    public Map<String, object> buildRollbarItemMessage(String key, String env) {
        return new Map<String, Object>{
                'access_token' => key,
                'data' => new Map<String, Object>{
                        'environment' => env,
                        'body' => new Map<String, Object>{
                                'trace' => new Map<String, Object>{
                                        'frames' => new List<Map<String, Object>>{
                                                new Map<String, Object>{
                                                        'filename' => fileName,
                                                        'class_name' => className,
                                                        'method' => methodName,
                                                        'lineno' => lineNumber,
                                                        'varargspec' => args
                                                }
                                        }
                                },
                                'exception' => new Map<String, Object>{
                                        'class' => exceptionClass,
                                        'message' => errorMessage,
                                        'description' => stackTrace
                                }
                        }

                }
        };
    }

}