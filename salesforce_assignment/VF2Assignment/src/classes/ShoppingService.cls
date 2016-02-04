public class ShoppingService {

    public static List<PurchaseOrderLineItem__c> searchItems (Id orderId)
    {
        return ShoppingSelector.searchItems(orderId);
    }
    
    public static List<product2> populateProduct (String SelectedCategory)
    {
        return ShoppingSelector.populateProduct(SelectedCategory);
    }
    
    public static List<PurchaseOrderLineItem__c> searchProductToRemove(String idOfProductToRemove)
    {
        return ShoppingSelector.searchProductToRemove(idOfProductToRemove);
    }
    
    public static List<product2> searchProductToAdd(String idOfProductToAdd)
    {
        return ShoppingSelector.searchProductToAdd(idOfProductToAdd);
    }
    
    public static List<PurchaseOrderLineItem__c> selectItemListFromPurchaseOrderLineItem(Product2 getProduct, Id orderId)
    {
        return ShoppingSelector.selectItemListFromPurchaseOrderLineItem(getProduct, orderId);
    }
}