/**
 * @description       : 
 * @author            : Kaushal Gautam
 * @group             : 
 * @last modified on  : 04-06-2022
 * @last modified by  : Kaushal Gautam
**/
@RestResource(urlMapping='/Account/*')
global with sharing class NewWebService {

    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1)
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];

    }
  
    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return result;
    }
  
  @HttpPost
    global static String doPost(String name,
        String phone, String website) {
        Account account = new Account();
        account.Name = name;
        account.phone = phone;
        account.website = website;
        insert account;
        return account.Id;
    }
}