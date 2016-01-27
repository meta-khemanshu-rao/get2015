trigger NotAllowInsertStudent on Student__c (before insert) {
    List<Class__c> stdClass = [SELECT ID,MaxSize__c,NumberOfStudents__c FROM Class__c];
    
    if(Trigger.isBefore && Trigger.isInsert)
    {  
        List<Student__c> studentList=new List<Student__c>(Trigger.newMap.values());
        for(Student__c std : studentList)
        {  for(Class__c Classes:stdClass)
        {   
            if(Classes.id==std.class__c && Classes.MaxSize__c <= Classes.NumberOfStudents__c )
            {
                std.addError('No more seat  available in the class');
            }
        }
        }
    }
}
