public with sharing class TriggerClasses {
    
    public static void OpportunityCheck(List<Opportunity> NewOpportunities) {
        
        for(Opportunity tempOpportunity : NewOpportunities) {
            if(!MatchesFormat(tempOpportunity)) {
                continue;
            }
            else {
                tempOpportunity.name += ' was selected!';
            }
        }
    }

    public static void OpportunityContract(List<Opportunity> NewOpp) {
        Account[] usr = [SELECT ID, Name FROM Account WHERE Name = 'Corsair'];
        if(usr.size() > 0){
            for(Opportunity tempOpportunity : NewOpp) {
                Contract c = new Contract(
                Name = usr[0].Name,
                AccountId = usr[0].Id,
                ContractTerm = 12,
                StartDate = tempOpportunity.CloseDate,
                Status = 'Draft');
                insert c;
            }
        }
    }

    private static Boolean MatchesFormat(Opportunity Oppcheck) {
        String name = Oppcheck.name;
        return name.IndexOf('Opp ') == 0;
    }
}
