trigger NotAllowTeacherToHindi on Contact (before insert,before update) {
    for(Contact cnt:Trigger.new)
    {
        if(cnt.Subjects__c.Contains('Hindi'))
        {
            cnt.addError('Hindi teachers are not allowed');
        }
    }
}