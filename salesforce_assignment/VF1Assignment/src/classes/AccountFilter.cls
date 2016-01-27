public class AccountFilter {
   public string billingCityString{get;set;}
   public string billingStateString{get;set;}
   public string billingCountryString{get;set;}

   public List<Account> createAccountList{get;set;}

   public void FilterAccountList(){
       createAccountList= new list<Account>();
       if(string.isBlank(billingCityString) && string.isBlank(billingStateString) && string.isBlank(billingCountryString)) 
       {
           createAccountList= Database.query('SELECT id,name,billingcity,billingCountry,billingState FROM Account limit 100');
   	   }    
       else 
       {
            createAccountList= Database.query('SELECT id,name,billingcity,billingCountry,billingState FROM Account WHERE billingcity LIKE \'%'+billingCityString+'%\'  AND (billingcountry = Null OR billingcountry  LIKE  \'%'+billingCountryString+'%\') AND (billingstate=null OR billingstate LIKE  \'%'+billingStateString+'%\') Limit 100');
       }
   }
}