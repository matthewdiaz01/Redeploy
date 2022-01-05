
trigger OpportunityTrigger on Opportunity (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    

    switch on trigger.operationType {
        when BEFORE_INSERT { 
            TriggerClasses.OpportunityCheck(trigger.new);
        }
        when BEFORE_UPDATE {
            
        }
        when BEFORE_DELETE { 

        }
        when AFTER_INSERT { 
            TriggerClasses.OpportunityContract(trigger.new);
        }
        when AFTER_UPDATE { 
            // Can use trigger.old here
        }
        when AFTER_DELETE { 
            // Can use trigger.old here
        }
        when AFTER_UNDELETE {
            
        }
    }
    
}