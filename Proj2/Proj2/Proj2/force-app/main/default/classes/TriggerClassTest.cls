@isTest
public with sharing class TriggerClassTest {

    public static List<Contact> CreateContacts(Integer numContacts) {
        List<Contact> toReturn = new List<Contact>();
        
        for(Integer num = 0; num < numContacts; num++) {
            toReturn.add(new Contact(LastName = 'Matthew Diaz',Phone  = '5555555555', Email = 'test@gmail.com', Description = 'For Testing'));
        }
        return toReturn;
    }
    
    @isTest
    public static void Test_RelatedCase(){
        Test.startTest();
        List<Contact> someCon = CreateContacts(1);
        TriggerClass.RelatedCase(someCon);
        Integer numValid = 0;
        List<Case> found = [SELECT Reason, ContactId, Status, Origin FROM Case WHERE Reason =: 'For Testing'];
        for(Case testCase : found){
            if ((testCase.Origin == 'Web') && (testCase.Status == 'New') && (testCase.Reason == 'For Testing')) {
                numValid++;
        }
        System.assertNotEquals(0,numValid, 'Error: Test_RelatedCase found no inserted records');
        }
    }
    
}
