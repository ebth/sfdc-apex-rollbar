@IsTest
private class RollbarItemTest {

    private static RollbarItem testItem;

    static {
        testItem = new RollbarItem(
                'fileName',
                'className',
                'methodName',
                1,
                'exceptionClass',
                'message',
                'trace',
                new List<Object>{
                        1
                }
        );
    }

    static testMethod void shouldSetApiKey() {
        Map<String, Object> testMap = testItem.buildRollbarItemMessage('foo', 'bar');
        System.assertEquals('foo', testMap.get('access_token'));
    }

    static testMethod void shouldSetEnvironment() {
        Map<String, Object> testMap = testItem.buildRollbarItemMessage('foo', 'bar');
        System.assertEquals('bar', ((Map<String, Object>) testMap.get('data')).get('environment'));
    }
}