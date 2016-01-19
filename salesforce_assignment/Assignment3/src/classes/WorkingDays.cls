public class WorkingDays {
   
        //array of seven boolean indicating working days, Monday is index 0
       private static final List<Boolean> isWorkingDay;
       //count of the number of working days in the array
       private static final Integer workingDaysInWeek;
       static {
           //my real implementation uses the Salesforce BusinessHours Object to populate this array
           isWorkingDay = new List<Boolean> { true, true, true, true, true, false, false };
           //You will have real problems if this number does not match the number of true flags in the array
           workingDaysInWeek = 5;
       }
       
       private static final Date monday = Date.newInstance(1900, 1, 1);
       private static Integer getDayOfWeek(Date value) {
           return Math.mod(monday.daysBetween(value), 7);
       }
   
   
   public static Integer getWorkingDays(Date startDate, Date endDate) {
       Integer difference = startDate.daysBetween(endDate);
		Integer totalWorkingDay=0;      
       
        if(difference == 0) {
                   //If the 2 dates are the same day check if the day is a working day or not
                   return isWorkingDay[getDayOfWeek(startDate)] ? 1 : 0;
         }
         difference++;

         Integer startDay = getDayOfWeek(startDate);

       
         if(startDay < workingDaysInWeek )
          totalWorkingDay= workingDaysInWeek - startDay;

       
       difference -= 7-startDay;

        Integer endDay = getDayOfWeek(endDate);

        if(endDay < workingDaysInWeek )
          totalWorkingDay+=endDay +1;
         else
             totalWorkingDay+=workingDaysInWeek;
       

          difference -= endDay +1;

       totalWorkingDay += (difference/7)*workingDaysInWeek;
       
       return totalWorkingDay;
       
   }

}