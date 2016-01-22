trigger ClassMyCountWhenStudentOperation on Student__c (before insert,before update,before delete,after undelete) {
   if(Trigger.isUpdate)
   {
       for(Student__c studentNew : Trigger.new)
       {
           Student__c studentOld = Trigger.oldMap.get(studentNew.Id);
           if(studentOld.Class__c != studentNew.Class__c)
           {
              Class__c clsNew = [SELECT Id,MyCount__c FROM Class__c WHERE Id =:studentNew.Class__c ] ;
              clsNew.MyCount__c = clsNew.MyCount__c +1;
              update clsNew;
              Class__c clsOld = [SELECT Id,MyCount__c FROM Class__c WHERE Id =:studentOld.Class__c ] ;
              clsOld.MyCount__c = clsOld.MyCount__c - 1;
               update clsOld;
           }
       }
   }
   if(Trigger.isInsert)
   {
       for(Student__c studentNew :Trigger.new)
       {
           Class__c clsNew = [SELECT Id,MyCount__c FROM Class__c WHERE Id =:studentNew.Class__c ] ;
           clsNew.MyCount__c = clsNew.MyCount__c +1;
           update clsNew;
       }
   }
   
       if(Trigger.isDelete)
       {
          for(Student__c studentOld :Trigger.old)
          {
            Class__c clsOld = [SELECT Id,MyCount__c FROM Class__c WHERE Id =:studentOld.Class__c ] ;
            clsOld.MyCount__c = clsOld.MyCount__c - 1;
            update clsOld;
          } 
       }
       
      if(Trigger.isUndelete)
           {
                  for(Student__c studentOld :Trigger.old)
                  {
                    Class__c clsOld = [SELECT Id,MyCount__c FROM Class__c WHERE Id =:studentOld.Class__c ] ;
                    clsOld.MyCount__c = clsOld.MyCount__c +1;
                    update clsOld;
                  } 
       }
  
}