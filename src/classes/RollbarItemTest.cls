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
        Map<String, Object> payload = (Map<String, Object>) testMap.get('payload');
        System.assertEquals('foo', payload.get('access_token'));
    }

    static testMethod void shouldSetEnvironment() {
        Map<String, Object> testMap = testItem.buildRollbarItemMessage('foo', 'bar');
        Map<String, Object> data = (Map<String, Object>) ((Map<String, Object>) testMap.get('payload')).get('data');
        System.assertEquals('bar', data.get('environment'));
    }
}