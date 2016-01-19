public class OpportunityController {

    public static void populateInOpportunity(List<Opportunity> oppList) {
     
        for(SObject opp:oppList){
            if(opp instanceof Opportunity) {
                Opportunity opportunity=(Opportunity)opp;
                if(opportunity.BillToContact__c != null && opportunity.Manager__c == null)
                {
                    opportunity.Manager__c =opportunity.AccountId;
                }
            }
            
        }
     
    }
}