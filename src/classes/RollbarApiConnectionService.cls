public class RollbarApiConnectionService {

    private HttpRequest req;
    private String urlString;
    private Http caller;

    public RollbarApiConnectionService() {
        this.urlString = 'https://api.rollbar.com/api/1/';
        this.req = new HttpRequest();
        this.req.setHeader('Content-Type', 'application/json');
        this.caller = new Http();
    }

    public HttpResponse postItem(String messageBody) {
        req.setEndpoint(urlString + 'item');
        req.setMethod('POST');
        req.setBody(messageBody);
        HttpResponse resp = caller.send(req);
        return resp;
    }
}