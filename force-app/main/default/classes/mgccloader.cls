public class mgccloader {
        
  
     public static void executeme(list<Constituency_Candidate__c> klist){
         
         try{
             insert klist;
         system.debug('irfan its done '+klist.size());
         }catch(Exception e){
           system.debug('irfan its not done '+e.getmessage());  
         }
     
     
     }

}