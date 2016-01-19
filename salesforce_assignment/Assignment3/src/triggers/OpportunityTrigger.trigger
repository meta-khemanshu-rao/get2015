trigger OpportunityTrigger on Opportunity (before update,after insert) {

    List<Opportunity> opportunityList =Trigger.new;
    
    OpportunityController.populateInOpportunity(opportunityList);
}