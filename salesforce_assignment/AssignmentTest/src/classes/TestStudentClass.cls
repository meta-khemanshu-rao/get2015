@isTest
Private class TestStudentClass {
    @TestSetup
    static void testSetup() {
        Class__c cls = new Class__c();
        cls.Name__c = '5thClass';
        cls.MaxSize__c = 10;
        String id1 = Database.insert(cls).getId();
        List<Student__C> stdList = new List<Student__c>() ;
        for(integer i =0 ;i< 5; i++) {
            Student__C st = new Student__C();
            st.Name = i + 'Test class5';
            st.LastName__c = 'Test class5'+ i;
            st.Class__c =id1;
            stdList.add(st);
        }
        insert stdList;
    }
    @isTest
    static  void testGetClassStudents() 
    {
        Test.startTest();
        Class__C cls = [Select id ,(Select Id from Student_In_Class__r ) from Class__c where Name__c = '5thClass'];
        List<Student__C>  stdLIst = StudentClass.getAllStudentINClass(cls.Id);
        Test.stopTest();
        System.assertEquals(cls.Student_In_Class__r.size(), stdList.size());        
    }
    
    @isTest
    static  void testGetClassStudentsClassNull() 
    {
        Test.startTest();
        List<Student__C>  stdLIst = StudentClass.getAllStudentINClass(null);
        Test.stopTest();
        System.assertEquals(0, stdList.size());        
    }
    
    @isTest
    static void testGetAllClassWithStudents()
    {
        Test.startTest();
        List<Class__c> classWithStudentList = new List<Class__c>([SELECT Id,Name, (SELECT Id FROM Student_In_Class__r) from Class__c where Name__c = '5thClass']);
        Map<Class__c, Set<Student__c>> classWithStudentMap = new Map<Class__C, Set<Student__c>>();
        for(Class__c Class1 : classWithStudentList) {
            classWithStudentMap.put(Class1, new Set<Student__c>(Class1.Student_In_Class__r));
        }
        Map<Class__c, Set<Student__c>> classWithStudentTestMap = new Map<Class__C, Set<Student__c>>();
        classWithStudentTestMap = StudentClass.getAllClassWithStudents();
        Test.stopTest();
        System.assertEquals(classWithStudentMap, classWithStudentTestMap);
    }
    
}