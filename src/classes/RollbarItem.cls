public class RollbarItem {

    public String fileName { get; private set; }
    public String className { get; private set; }
    public String methodName { get; private set; }
    public Integer lineNumber { get; private set; }
    public String exceptionClass { get; private set; }
    public String errorMessage { get; private set; }
    public String stackTrace { get; private set; }
    public List<Object> args { get; private set; }
    public Map<String, Object> kwargs { get; private set; }

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
        this.kwargs = new Map<String, Object>();
    }

    public RollbarItem(String fileName, String className, String methodName,
            Integer lineNumber, String exceptionClass, String message, String trace, Map<String, Object> kwargs) {
        this.fileName = fileName;
        this.className = className;
        this.methodName = methodName;
        this.lineNumber = lineNumber;
        this.exceptionClass = exceptionClass;
        this.errorMessage = message;
        this.stackTrace = trace;
        this.kwargs = kwargs;
        this.args = new List<Object>();
    }

    public Map<String, object> buildRollbarItemMessage(String key, String env) {
        return new Map<String, Object>{
                'payload' => new Map<String, Object>{
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
                                                                'varargspec' => args,
                                                                'keywordspec' => kwargs
                                                        }
                                                },
                                                'exception' => new Map<String, Object>{
                                                        'class' => exceptionClass,
                                                        'message' => errorMessage,
                                                        'description' => stackTrace
                                                }
                                        }
                                }
                        }
                }
        };
    }

}