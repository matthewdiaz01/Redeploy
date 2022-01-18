public with sharing class CreateRec {
    
    @AuraEnabled
    public static void saveContact(List<String> newContact){
        try{
            Contact userCon = new Contact(
                LastName = newContact[0],
                Phone = newContact[1],
                Email = newContact[2]);
            insert userCon;
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

    @AuraEnabled
    public static void saveCC(List<String> newContact){
        try{
            Contact userCon = new Contact(
                LastName = newContact[0],
                Phone = newContact[1],
                Email = newContact[2],
                Description = newContact[3]);
            insert userCon;
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }
}
