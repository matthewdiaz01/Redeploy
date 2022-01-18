public with sharing class TriggerClass {

    public static void RelatedCase(List<Contact> newContacts){
        for(Contact tempcontact : newContacts) {
            Case c = new Case(
            Reason = tempcontact.Description,
            ContactId = tempcontact.Id,
            Status = 'New',
            Origin = 'Web');
            if (c.Reason != Null){
            insert c;
            }
        }
    }
}
