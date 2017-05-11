@IsTest
private class QueueRollbarItemSubmitTest {

    static testMethod void shouldSuccessfullyCalloutToRollbar() {
        RollbarItem testItem = new RollbarItem(
                'fileName', 'className', 'methodName', 1,
                'exceptionClass', 'message', 'trace',
                new List<Object>{
                        1
                }
        );
        QueueableContext qc;
        QueueRollbarItemSubmit q = new QueueRollbarItemSubmit(testItem, 'Rollbar_Test');

        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockEbthHttpRequest(200, 'Ok', '{}'));
        Integer currentLimit = Limits.getCallouts();
        q.execute(qc);
        System.assertEquals((currentLimit + 1), Limits.getCallouts());
        Test.stopTest();
    }
}