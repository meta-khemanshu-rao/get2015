public class SendEmailOnStatusChange 
{
    public static void sendEmailWhenStatusChange(Loan__c loan) {
        System.debug(loan);
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('Your loan status has been changed!'); 
        email.setReplyTo(loan.Manager_Email__c);
        String htmlEmailBody = 'Hi ' + loan.Applicant_Name__c+ ',<br><br><p>Your loan status has been changed to ' + loan.Loan_Status__c + '<br><br>Thanks& Regards<br>' + loan.Manager__c + '</p>';
        email.setHtmlBody(htmlEmailBody);
        email.setToAddresses(new String[]{loan.Applicant_Email__c});
        System.debug(email);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }
}