public class ShoppingController {
    
    public  List <product2> products { get; set; }
    
    public  Id orderId {get;set;}
    
    public String idOfProductToAdd {get;set;}
    
    public String idOfProductToRemove {get;set;}
    
    public String SelectedCategory { get; set; }
    
    public List<PurchaseOrderLineItem__c> items {
        get
        {
            List<PurchaseOrderLineItem__c> item = ShoppingService.searchItems(orderId);
        	return item;
        }
        set;}
    
    public List<SelectOption> Category
    {
        get
        {
            List<SelectOption> options = new List<SelectOption>();
            Schema.DescribeFieldResult fieldResult = product2.category__c .getDescribe();
            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            
            for( Schema.PicklistEntry f : ple)
                options.add(new SelectOption(f.getLabel(), f.getValue()));
            
            return options;
        }
    }
    
    public ShoppingController(ApexPages.StandardController controller)
    { 
        orderId = System.currentPageReference().getParameters().get('id');
    }
    
    public  void populateProduct()
    {
        products = ShoppingService.populateProduct(SelectedCategory);
        system.debug(products);
    }
    
    public void RemoveFromCart()
    {
        List <PurchaseOrderLineItem__c> product = ShoppingService.searchProductToRemove(idOfProductToRemove);
        PurchaseOrderLineItem__c getProduct;
        if(product.size()>0)
        {
            getProduct=product.get(0);
        }
        delete getProduct;
    }
    
    public void AddToCart()
    { 
        List<PurchaseOrderLineItem__c> ListItems; 
        
        List<product2> product = ShoppingService.searchProductToAdd(idOfProductToAdd);
        
        Product2 getProduct;
        PurchaseOrderLineItem__c PurchaseOrder;
        
        if(product.size()>0)
        {
            getProduct=product.get(0);
        }
        ListItems = ShoppingService.selectItemListFromPurchaseOrderLineItem(getProduct, orderId);
        
        if(ListItems.size()>0)
        {				
            PurchaseOrder=ListItems.get(0);
            PurchaseOrder.Quantity__c+=1;
            update PurchaseOrder;
        }    
        else
        {
            PurchaseOrder =new PurchaseOrderLineItem__c(name=getProduct.name,price__c=getProduct.Price__c,ProductCode__c=getproduct.ProductCode,Quantity__c = 1,Product__c=getProduct.id,PurchaseOrder__c = orderId);
            insert PurchaseOrder;
        }
    }
    
}