trigger NotAllowInsertStudent on Student__c (before insert) {
  for(Student__c std : Trigger.new)
   {
       Class__c stdClass = [SELECT MaxSize__c, NumberOfStudents__c FROM Class__c WHERE Id=:std.Class__c LIMIT 1];
       System.debug(stdClass.MaxSize__c);
       System.debug(stdClass.NumberOfStudents__c);
       if(stdClass.MaxSize__c <= stdClass.NumberOfStudents__c)
       {
           std.addError('No more seat in selected class');
       }
   }
}