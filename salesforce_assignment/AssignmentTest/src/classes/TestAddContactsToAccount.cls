@isTest
public class TestAddContactsToAccount 
{
    @TestSetup
    static Void testSetup()
    {
        List<Contact> contactList = new List<Contact>();
        Account acct = new Account();
        acct.Name = 'Test Account';
        String id = Database.insert(acct).getId();
        for(Integer i = 0; i<5; i++)
        {
            Contact contact = new Contact();
            contact.LastName = 'Lasttestname' + i;
            contact.AccountId = id;
            contactList.add(contact);
        }
        insert contactList;
    }
    
    @isTest
    static void testCheckContactInAccount()
    {
        Test.startTest();
        Contact contact = new Contact();
        contact = [select id from Contact where LastName =: 'Lasttestname0'];
        AddContactsToAccount.CheckContactInAccount(contact.Id);
        Account account = new Account();
        account = [select Name,id,ContactIDs__c from Account where Name =: 'Test Account' limit 1];
        Test.stopTest();
        String expectedContactIds = account.ContactIDs__c;
       	System.assertEquals(95, expectedContactIds.length());
    }
}