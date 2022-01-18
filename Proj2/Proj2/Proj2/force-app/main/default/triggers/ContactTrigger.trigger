trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    

    switch on trigger.operationType {
        when BEFORE_INSERT { 
        }
        when BEFORE_UPDATE {
            
        }
        when BEFORE_DELETE { 

        }
        when AFTER_INSERT { 
            TriggerClass.RelatedCase(trigger.new);
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