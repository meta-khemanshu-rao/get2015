@isTest
public class TestWorkingDays 
{
	@isTest
    static void testGetWorkingDays()
    {
        Test.startTest();
        Integer ActualWorkingDays = 10;
        Date startDate = Date.newInstance(2016,1,18);
        Date endDate = Date.newInstance(2016,1,30);
        Integer expectedWorkingDays = WorkingDays.getWorkingDays(startDate, endDate);
        Test.stopTest();
        System.assertEquals(expectedWorkingDays, ActualWorkingDays);
    }
    
    @isTest
    static void testGetWorkingDaysEqualZero()
    {
        Test.startTest();
        Integer ActualWorkingDays = 0;
        Date startDate = Date.newInstance(2016,2,7);
        Date endDate = Date.newInstance(2016,2,7);
        Integer expectedWorkingDays = WorkingDays.getWorkingDays(startDate, endDate);
        Test.stopTest();
        System.assertEquals(expectedWorkingDays, ActualWorkingDays);
    }
    
    @isTest
    static void testGetWorkingDaysWithEndDateInWeek()
    {
        Test.startTest();
        Integer ActualWorkingDays = 9;
        Date startDate = Date.newInstance(2016,1,18);
        Date endDate = Date.newInstance(2016,1,28);
        Integer expectedWorkingDays = WorkingDays.getWorkingDays(startDate, endDate);
        Test.stopTest();
        System.assertEquals(expectedWorkingDays, ActualWorkingDays);
    }
}