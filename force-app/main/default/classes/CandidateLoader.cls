public class CandidateLoader {


    @AuraEnabled
     public static void executeme(){
        
              Integer recordsProcessed = 0;
    Set<String> uniqueNames = new Set<String>();
         
        List<India_Election_2019__c> varlistOfCandidates=[SELECT Id,Party_ID__c ,Party__c ,Candidate__c	FROM India_Election_2019__c ]; 
       
         for (India_Election_2019__c p :varlistOfCandidates) {
            if(p!=null){
               uniqueNames.add(p.Candidate__c);
           	   
            }
         }
        
         List<contact> varLisToInsert= new  List<contact>();
        
          for (string k :uniqueNames) {
              if(k!=null){
                  String s = k;
                 // integer firstSpace = k.indexOf(' '); // detect the first space character
				  String firstName;
                  String lastName;
                      if(s.trim().length()> 0 && s.Contains(' ')!= false ) {
                     firstName = s.Substring(0,s.indexOf(' '));  // get everything upto the first space character
				     lastName = s.Substring(s.indexOf(' '),s.length()); // get everything after the first space
                      }else{
                        firstName ='';  
				        lastName = s;   
                      }
                  
                  
                  
                  contact varc=new contact();
         		   varc.FirstName=firstName;
				   varc.LastName=lastName;		
              	   varLisToInsert.add(varc);
                  
              }
        }
        
		system.debug(varLisToInsert);
        insert varLisToInsert;
    }
}