public class StudentClass {
    Public Static List<Student__c> getAllStudentINClass(Id classId) {
        List<Student__c> allStudentInClass = new List<Student__c>();
        allStudentInClass = [Select id ,Name from Student__c where class__r.ID = :classId];
        return allStudentInClass;
    }
    
    Public Static Map<Id, Set<Student__C>> getAllClassWithStudents() {
        Map<Id, Set<Student__C>> classWithStudentMap = new Map<Id, Set<Student__C>>();
        List<Class__c> classWithStudentList = new List<Class__c>([SELECT Id, (SELECT Name FROM Student_In_Class__r) FROM Class__c]);
        for(Class__c Class1 : classWithStudentList) {
            classWithStudentMap.put(Class1.Id, new Set<Student__c>(Class1.Student_In_Class__r));
        }
        return classWithStudentMap;
    }
}