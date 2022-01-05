@isTest
public with sharing class ExampleControllerTest {
    
    @isTest
    public static void Test_fetchProducts()
    {
        Test.startTest();
        List<Product2> results = ExampleController.fetchProducts();
        Integer numValid = 0;
        for(Product2 iterate : results){
            if ((iterate.Name != Null) && (iterate.Family != Null) && (iterate.Id !=Null)) {
                numValid++;
            }
        }
        System.assertNotEquals(0, numValid,'Error: Test_fetchProducts found no valid records');
    }

    @isTest
    public static void Test_SaveOpportunityRecord()
    {
        Test.startTest();
        List<String> Info = new List<String>{'Matthew Diaz','0055f000006LcibAAC', 'Prospecting'};
        ExampleController.saveOpportunityRecord(Info);
        Integer numValid = 0;
        List<Opportunity> results = [SELECT Name, OwnerId, StageName, CloseDate From Opportunity WHERE OwnerId =: '0055f000006LcibAAC'];
        for( Opportunity iterate : results){
            if ((iterate.Name == Info[0]) && (iterate.OwnerId == Info[1]) && (iterate.StageName == Info[2]) && (iterate.CloseDate != Null)) {
                numValid++;
            }
        }
        System.assertNotEquals(0, numValid,'Error: Test_getInfo found no valid records');
    }

    @isTest
    public static void Test_getInfo()
    {
        Test.startTest();
        List<User> results = ExampleController.getInfo();
        Integer numValid = 0;
        for(User iterate : results){
            if ((iterate.FirstName != Null) && (iterate.LastName != Null) && (iterate.Id !=Null)) {
                numValid++;
            }
        }
        System.assertNotEquals(0, numValid,'Error: Test_getInfo found no valid records');
    }

}
