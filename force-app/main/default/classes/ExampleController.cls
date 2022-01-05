public with sharing class ExampleController {
    @AuraEnabled(cacheable=true)
    public static List < Product2 > fetchProducts() {
        return [ SELECT Id, Name, Family FROM Product2 ORDER BY Family]; 
    }
   
    @AuraEnabled
    public static void saveOpportunityRecord(List<String> UserInfo){
        try{
            Opportunity userOpp = new Opportunity(
                Name = UserInfo[0],
                OwnerId = UserInfo[1],
                StageName = UserInfo[2],
                CloseDate = Date.today()
                );
            insert userOpp;
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<User> getInfo(){
        return [SELECT ID, FirstName,LastName FROM User WHERE ID = :UserInfo.getUserId()];
        }

}
