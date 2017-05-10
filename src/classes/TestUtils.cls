@IsTest
public class TestUtils {

    public static String ebthMetadataName { get; set; }
    public static Boolean skipEbthCallout { get; set; }
    public static Boolean enableIsRunningTest = true;

    public static Opportunity getLastOpportunity(Id id) {
        return [
                SELECT Id, EBTH_Contract_Id__c, EBTH_Contract_Number__c, Primary_Seller__r.EBTH_Seller_Id__c
                FROM Opportunity
                WHERE Id = :id
                LIMIT 1
        ];
    }

    public static Opportunity getLastOpportunity() {
        return [
                SELECT Id, EBTH_Contract_Id__c, EBTH_Contract_Number__c, Primary_Seller__r.EBTH_Seller_Id__c
                FROM Opportunity
                LIMIT 1
        ];
    }

    public static Boolean isRunningTest() {
        return (Test.isRunningTest() && enableIsRunningTest);
    }
}