public class CCLoaderFinal {
    
    
     public Integer recordsProcessed = 0;
   		Set<String> uniqueNames = new Set<String>();
    	map<string,Constituency__c> varmapc=new map<string,Constituency__c>();
		List<Constituency__c> cols=[SELECT ID,Name FROM Constituency__c];
    
    
    public String sendconstituencyid(string k){
        String ky;
        for(String key : varmapc.keySet()){
  			if(varmapc.get(key).Name == k){
   		 	ky=key;
  			}
		}
        return ky;
    }
    
    map<string,Contact> varmapcon=new map<string,Contact>();
    public String sendcontactid(string k){
        String ky;
        for(String key : varmapcon.keySet()){
  			if(varmapcon.get(key).Name == k){
   		 	ky=key;
  			}
		}
        return ky;
    }
    
     public void executeme(){
         Set<String> categories = new Set<String>{'A%','B%','C%'};
        List<India_Election_2019__c> kb=[SELECT Id,Constituency_Name__c ,Position__c,Candidate__c,Votes__c,Total_Electors__c,Party_ID__c,Party__c FROM India_Election_2019__c Where Constituency_Name__c LIKE :categories ]; 
       
         list<Constituency_Candidate__c> ilist=new list<Constituency_Candidate__c>();
         //[SELECT ID FROM Constituency__c]
         for(Constituency__c varm:cols){
       			 varmapc.put(varm.Id,varm);
   		 }
         
         //[SELECT ID FROM Contact]
         for(Contact varm:[SELECT ID,Name FROM Contact]){
       			 varmapcon.put(varm.Id,varm);
   		 }
         
         for (India_Election_2019__c p :kb) {
             Constituency_Candidate__c varcc= new Constituency_Candidate__c();
            if(p!=null){ 
                
            		varcc.Candidate__c=sendcontactid(p.Candidate__c);
                   Id coid=sendconstituencyid(p.Constituency_Name__c);                                                  
                    varcc.Constituency_Name__c= coid;
                   // varcc.party__c=p.Party__c;
                    varcc.Position__c=p.Position__c;
                    varcc.Total_Electors__c=p.Total_Electors__c;
                    varcc.Votes__c=p.Votes__c;    
                ilist.add(varcc);
            }
         }
			system.debug(ilist);
         system.debug('testme'+ilist.size());
         insert ilist;
     }

}