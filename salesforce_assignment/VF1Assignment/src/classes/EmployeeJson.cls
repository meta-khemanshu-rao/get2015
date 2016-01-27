public with sharing class EmployeeJson {

	public String jsonString {get;set;}

	//Constructor
	public EmployeeJson()
	{
		jsonString = prepareData();

	}
	//Temp Method to prepare the Data
	private String prepareData()
	{
		List<Employee> employeeList = new List<Employee>();
        Employee emp1 = new Employee();
		Employee emp2 = new Employee();
		Employee emp3 = new Employee();
		emp1.FirstName = 'Ankit';
        emp1.LastName = 'Saxena';
        emp1.EmpId = 'E15/045';
        emp1.Designation = 'Developer';
        emp2.FirstName = 'Nikhil';
        emp2.LastName = 'Tinkar';
        emp2.EmpId = 'E15/046';
        emp2.Designation = 'Senior Developer';
        emp3.FirstName = 'Rajesh';
        emp3.LastName = 'Malhotra';
        emp3.EmpId = 'E11/012';
        emp3.Designation = 'Team Lead';
        employeeList.add(emp1);
        employeeList.add(emp2);
        employeeList.add(emp3);
		return JSON.serialize(employeeList);
	}
	
    public class Employee
    {
        public String FirstName{get;set;}
        public String LastName{get;set;}
        public String EmpId{get;set;}
        Public String Designation{get;set;}
    }
}