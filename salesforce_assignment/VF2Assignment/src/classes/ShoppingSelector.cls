public class ShoppingSelector {

    public static List<PurchaseOrderLineItem__c> searchItems (Id orderId)
    {
        List<PurchaseOrderLineItem__c> item = [select ID,ProductCode__c,Name,Price__c,Quantity__c,TotalPrice__c from PurchaseOrderLineItem__c where PurchaseOrder__c =: orderId];
        return item;
    }
    
    public static List <product2> populateProduct (String SelectedCategory)
    {
        List<product2> products = [select Id,ProductCode,Name,Price__c,category__c from product2 where category__c =:SelectedCategory];
        return products;
    }
    
    public static List<PurchaseOrderLineItem__c> searchProductToRemove(String idOfProductToRemove)
    {
        List<PurchaseOrderLineItem__c> product = [select ID,name from PurchaseOrderLineItem__c where ID =:idOfProductToRemove Limit 1];
        return product;
    }
    
    public static List<product2> searchProductToAdd(String idOfProductToAdd)
    {
        List<product2> product = [select ID,name,Price__c,ProductCode from product2 where ID =:idOfProductToAdd Limit 1];
        return product;
    }
    
    public static List<PurchaseOrderLineItem__c> selectItemListFromPurchaseOrderLineItem(Product2 getProduct, Id orderId)
    {
        List<PurchaseOrderLineItem__c> listItems = [select ID,name,Quantity__c,Price__c,TotalPrice__c from PurchaseOrderLineItem__c where Product__r.id =:getProduct.id and purchaseOrder__c =:orderId Limit 1];
        return listItems;
    }
}