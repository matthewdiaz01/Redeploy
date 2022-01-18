@isTest
public with sharing class CreateRecTest {

    @isTest
    public static void Test_SaveContact()
    {
        Test.startTest();
        List<String> Info = new List<String>{'Matthew Diaz','5555555555', 'test@gmail.com'};
        CreateRec.saveContact(Info);
        Integer numValid = 0;
        List<Contact> results = [SELECT Name, Email, Phone From Contact WHERE Phone =: '5555555555'];
        for( Contact iterate : results){
            if ((iterate.Name == Info[0]) && (iterate.Phone == Info[1]) && (iterate.Email == Info[2])) {
                numValid++;
            }
        }
        System.assertNotEquals(0, numValid,'Error: Test_getInfo found no valid records');
    }


    @isTest
    public static void Test_SaveCC()
    {
        Test.startTest();
        List<String> Info = new List<String>{'Matthew Diaz','5555555555', 'test@gmail.com', 'For Testing'};
        CreateRec.saveCC(Info);
        Integer numValid = 0;
        List<Contact> results = [SELECT Name, Email, Phone, Description From Contact WHERE Phone =: '5555555555'];
        for( Contact iterate : results){
            if ((iterate.Name == Info[0]) && (iterate.Phone == Info[1]) && (iterate.Email == Info[2]) && (iterate.Description != Null)) {
                numValid++;
            }
        }
        System.assertNotEquals(0, numValid,'Error: Test_getInfo found no valid records');
    }
}

