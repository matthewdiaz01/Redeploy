@isTest
public with sharing class TriggerClassesTest {
     
    @testSetup
    public static void SetupTests() {
        List<Opportunity> OpportunitesToInsert = new List<Opportunity>();
        for(Integer num = 0; num < 151; num++) {
            OpportunitesToInsert.add(new Opportunity(name = 'Test Opportunity ' + num, StageName = 'Prospecting', CloseDate = Date.today()));
        }
        
        Insert OpportunitesToInsert;
    }
    
    @isTest
    public static void Test_OpportunityCheck() {
        Test.startTest();
        List<Opportunity> someOpportunities = CreateOpportunities(16);
        TriggerClasses.OpportunityCheck(someOpportunities);
        Integer numValid = 0;
        for(Opportunity currOpp : someOpportunities) {
            if ((currOpp.name.Contains('was selected!')) && (currOpp.StageName != Null) && (currOpp.CloseDate !=Null)) {
                numValid++;
            }
        }
        
        System.assertNotEquals(0, numValid,'Error: Test_OpportunityCheck found no valid records');
        
        Test.stopTest();
    }

    @isTest
    public static void Test_OpportunityContract(){
        Test.startTest();
        List<Opportunity> someOpp = CreateOpportunities(1);
        TriggerClasses.OpportunityContract(someOpp);
        Integer numValid = 0;
        List<Contract> found = [SELECT id, Status, ContractTerm FROM Contract WHERE Name =: ''];
        for( Contract testCon : found){
            if ((testCon.ContractTerm == 12) && (testCon.Status.Contains('Draft')) && (testCon.StartDate != Null)) {
                numValid++;
        }
        System.assertNotEquals(0,numValid, 'Error: Test_OpportunityContract found no inserted records');
        }
    }

    public static void InsertOpp(Integer numOpportunites) {
        List<Opportunity> toInsert = new List<Opportunity>();
        
        for(Integer num = 0; num < numOpportunites; num++) {
            toInsert.add(new Opportunity(name = 'Test Opportunity ' + num, StageName = 'Prospecting', CloseDate = Date.today()));
        }
        
        Insert toInsert;
    }
    
    // This also enables us to create data without having to insert it
    public static List<Opportunity> CreateOpportunities(Integer numOpportunites) {
        List<Opportunity> toReturn = new List<Opportunity>();
        
        for(Integer num = 0; num < numOpportunites; num++) {
            toReturn.add(new Opportunity(name = 'was selected!' + num, StageName = 'Prospecting', CloseDate = Date.today()));
        }
        return toReturn;
    }

}
