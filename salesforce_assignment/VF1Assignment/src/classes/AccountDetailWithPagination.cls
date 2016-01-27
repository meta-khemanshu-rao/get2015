public class AccountDetailWithPagination {  
    public Integer noOfRecords{get;set;}
    public Integer size{get;set;}
    public string billingCityString{get;set;}
    public string billingStateString{get;set;}
    public string billingCountryString{get;set;}
    public ApexPages.StandardSetController setCon{ get;set;}
    Public List<Account> getAccounts(){
        if(setCon == null)
        {
            return null;
        }
        List<Account> accList = new List<Account>();
        for(Account a : (List<Account>)setCon.getRecords())
            accList.add(a);
        return accList;
    }
  
    public void search(){
        size=10;
        if(string.isBlank(billingCityString) && string.isBlank(billingStateString) && string.isBlank(billingCountryString)){
            String queryString = 'SELECT id,name,billingcity,billingCountry,billingState FROM Account limit 100';
            setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
            setCon.setPageSize(size);
            noOfRecords = setCon.getResultSize();
        }
        else{
            String queryString = ('SELECT id,name,billingcity,billingCountry,billingState FROM Account WHERE billingcity LIKE \'%'+billingCityString+'%\'  AND (billingcountry = Null OR billingcountry  LIKE  \'%'+billingCountryString+'%\') AND (billingstate=null OR billingstate LIKE  \'%'+billingStateString+'%\') Limit 100');
            
            setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString)); 
            setCon.setPageSize(size);
            noOfRecords = setCon.getResultSize();
        }
    }
    
    public Boolean hasNext {
        get {
            return setCon.getHasNext();
        }
        set;
    }
    public Boolean hasPrevious {
        get {
            return setCon.getHasPrevious();
        }
        set;
    }
    
    public Integer pageNumber {
        get {
            return setCon.getPageNumber();
        }
        set;
    }
    
    public void first() {
        setCon.first();
    }
    
    public void last() {
        setCon.last();
    }
    
    public void previous() {
        setCon.previous();
    }
    
    public void next() {
        setCon.next();
    }
    
}