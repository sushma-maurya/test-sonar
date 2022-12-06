public with sharing class myclass {
    public myclass() {

    }

     public static void FetchContactbyIndustry(){
   //Step 1 : Fetch All The Account Record Associated with Industry B/F/I
  Set<Id>myAccID = New Set<Id>(); //for stroing Account Id
  List<Account>lstAccount = [Select Id,Name,Industry 
                                       From Account
                                       WHERE Industry IN ('Banking','Finance','Insurance')]; 

  system.debug('MY ACCOUNT ARE :  '+lstAccount.Size());
      if(lstAccount.Size() > 0){ // !lstAccount.IsEmpty()

          for(Account acc : lstAccount){

              myAccID.Add(acc.Id);        
          }
         system.debug('My Account ID  ' +myAccID); 
      }
    //Step 2 :Fetch All the Contact for the Account present in my "lstAccount"     

      if(myAccID.Size() > 0) {


       List<Contact> lstContact = [Select Id,FirstName,LastName,Email,Phone,AccountId
                                           From Contact 
                                           Where AccountId IN : myAccID];

          system.debug('MY CONTACT LIST  ' +lstContact);
          system.debug('MY CONTACT SIZE ' +lstContact.Size());

          if(!lstContact.isEmpty()){

              for(Contact con: lstContact){

                  system.debug('My COntacts is ' +con);
              }
          }
      }


  }
}
