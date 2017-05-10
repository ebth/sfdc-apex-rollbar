public class Rollbar {

    public static void submitItem(RollbarItem item, String project) {
        String itemMessage = setRollbarMessage(item, project);
        RollbarApiConnectionService srv = new RollbarApiConnectionService();
        HttpResponse resp = srv.postItem(itemMessage);
    }

    private static String setRollbarMessage(RollbarItem item, String project) {
        Rollbar_API_Setting__mdt apiSetting = [SELECT ApiKey__c FROM Rollbar_API_Setting__mdt WHERE DeveloperName = :project LIMIT 1];
        String organizationEnviroment;
        if ([SELECT IsSandbox FROM Organization].IsSandbox) {
            organizationEnviroment = 'staging';
        } else {
            organizationEnviroment = 'production';
        }
        Map<String, Object> messageMap = item.buildRollbarItemMessage(apiSetting.ApiKey__c, organizationEnviroment);
        return JSON.serialize(messageMap);
    }
}