public class ElectionPartyLoader{

        
   
    @AuraEnabled
    public static void getexecuteme(){
     Integer recordsProcessed = 0;
    Set<String> uniqueNames = new Set<String>();
    // list<Account> clist=new list<Account>();
        List<India_Election_2019__c> kb=[SELECT Id,Party_ID__c ,Party__c FROM India_Election_2019__c WHERE Party__c!=null AND Party_ID__c!=null]; 
       
         map<string, India_Election_2019__c> nmap=new map<String,India_Election_2019__c>();
         for (India_Election_2019__c p :kb) {
            if(p!=null){
               uniqueNames.add(p.Party_ID__c);
           	   nmap.put(p.Party_ID__c,p);  
            }
			
         }
        list<Account> clist=new list<Account>();
         for(string p:uniqueNames){
             //EPWrapper eps=new EPWrapper();
             Account eps=new Account();
             if(p!=null){
                 eps.Party_ID__c=p; 
            
                 eps.Name=nmap.get(p).Party__c;
                 clist.add(eps);
                   recordsProcessed = recordsProcessed + 1;  
             }}
        try {insert clist;}catch(Exception e){system.debug('didnt happen');}           
        
        // insert clist2;        
        
      }
    @AuraEnabled
    public static void getexecutefordups(){
     Set<String> remainingNoIds = new Set<String>();
     List<India_Election_2019__c> varduplist=new List<India_Election_2019__c>();
   	 varduplist=[SELECT Id,Party_ID__c ,Party__c FROM India_Election_2019__c WHERE Party__c!=null AND Party_ID__c=null];
        
        for (India_Election_2019__c p :varduplist) {
            if(p!=null){
               remainingNoIds.add(p.Party__c);
           	}
		}
        
        List<string> listofNoIds =new List<string>();
        listofNoIds.addAll(remainingNoIds);
        List<Account> listofNoIdstoInsert =new List<Account>();
        for(string vars:listofNoIds){
            
            Account v=new Account();
            v.Name=vars;
            listofNoIdstoInsert.add(v);
        }   

    		
    try {insert listofNoIdstoInsert;}catch(Exception e){system.debug('didnt happen');}           
    }
    
}