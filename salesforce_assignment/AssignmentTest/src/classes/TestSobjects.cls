@isTest
public class TestSobjects 
{
    @isTest
    static void testGetOrganizationSobjects()
    {
        Test.startTest();
        List<Schema.SObjectType> sObjectList = new List<Schema.SObjectType>();
        sObjectList = Sobjects.getOrganizationSobjects();
        Integer expected = 356;
        Test.stopTest();
        System.assertEquals(expected, sObjectList.size());
    }
}