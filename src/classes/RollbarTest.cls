@IsTest
private class RollbarTest {
    static testMethod void shouldCalloutToRollbar() {
        RollbarItem testItem = new RollbarItem(
                'fileName', 'className', 'methodName', 1,
                'message', 'trace',
                new List<Object>{
                        1
                }
        );

        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockEbthHttpRequest(200, 'Ok', '{}'));
        Integer currentLimit = Limits.getCallouts();
        Rollbar.submitItem(testItem, 'Rollbar_Test');
        System.assertEquals((currentLimit + 1), Limits.getCallouts());
        Test.stopTest();
    }
}