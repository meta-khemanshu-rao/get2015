public class StudentSiteController {
    
    public static List<Student__c> stdList{ get; private set;}
    
    public static Student__c stdDetail{ get; set;}
    
    public StudentSiteController (){
    }
    public static  List<SelectOption> selectList { get{
        stdList = new List<Student__c> ([SELECT Id,Name FROM Student__c]);
        selectList = new List<SelectOption> ();
        for(Student__c std : stdList) {
            selectList.add(new SelectOption(std.Id,std.Name));
        }
        return selectList;
    } set;}
    
    @RemoteAction
    public static Student__c getStudent( Id selectedId ){
        stdDetail = [SELECT Id , Name ,First_Name__c , LastName__c , age__c, Class__c ,DOB__c FROM Student__c WHERE Id =:selectedId] ;
        system.debug(stdDetail);
        return stdDetail ;
        
    }
    
}