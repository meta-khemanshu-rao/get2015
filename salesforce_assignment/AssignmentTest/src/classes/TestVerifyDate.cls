@isTEst
public class TestVerifyDate {
    @isTest Static void testCheckDates() {
        Date date1 = Date.newInstance(2015, 4, 21);
		Date date2 = Date.newInstance(2015, 4, 28);
        Date actualDate = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, actualDate);
    }
    
    @isTest Static void testCheckDatesNegative() {
        Date date1 = Date.newInstance(2015, 4, 21);
		Date date2 = Date.newInstance(2015, 4, 12);
        Date actualDate = VerifyDate.CheckDates(date1, date2);
        date1 = Date.newInstance(2015, 4, 30);
        System.assertEquals(date1, actualDate);
    }
    
    @isTest Static void testDateWithin30Days() {
        Date date1 = Date.newInstance(2015, 4, 21);
		Date date2 = Date.newInstance(2015, 4, 28);
        Boolean actualResult = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(true, actualResult);
    }
    
    @isTest Static void testDateWithin30DaysNegative() {
        Date date1 = Date.newInstance(2015, 4, 21);
		Date date2 = Date.newInstance(2015, 4, 12);
        Boolean actualResult = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(false, actualResult);
    }
    
    @isTest Static void testDateWithin30DaysNegativeDate2() {
        Date date1 = Date.newInstance(2015, 4, 21);
		Date date2 = Date.newInstance(2015, 5, 28);
        Boolean actualResult = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(false, actualResult);
    }
    
    @isTest Static void testSetEndOfMonthDate() {
        Date date1 = Date.newInstance(2015, 4, 21);
        Date lastDay = VerifyDate.SetEndOfMonthDate(date1);
        Date actualDate = Date.newInstance(2015, 4, 30);
        System.assertEquals(lastDay, actualDate);
    }
}