global class EmailServiceToSaveContact  implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.Inboundenvelope envelope) {
        
        Contact[] contacts = new Contact[0];
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        try {
            for (Messaging.Inboundemail.TextAttachment tAttachment : email.textAttachments) {
                String xmlDocumentString = tAttachment.body;
                Dom.Document domDoc = new Dom.Document();
                domDoc.load(xmlDocumentString);
                Dom.XMLNode address = domDoc.getRootElement();
                for(Dom.XmlNode childElement: address.getChildElements())
                {
                    Contact contact = new Contact();
                    contact.FirstName = childElement.getChildElement('fname', null).getText();
                    contact.LastName = childElement.getChildElement('lname', null).getText();
                    contact.MailingCity = childElement.getChildElement('mailingcity', null).getText();
                    contact.MailingState = childElement.getChildElement('mailingstate', null).getText();
                    contact.MailingCountry = childElement.getChildElement('mailingcountry', null).getText();
                    contacts.add(contact);
                }
            }
            insert contacts;
            result.success = true;
            result.message = 'Contact is inserted';
        } catch (Exception e) {
            result.success = false;
            result.message = 'Oops, I failed.';
        }
        return result;
    }
}