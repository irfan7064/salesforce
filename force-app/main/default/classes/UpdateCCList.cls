public class UpdateCCList {
    
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
    public void executeme(){
        List<Constituency__c> cclist=[SELECT Id,Name,Constituency_ID__c,Constituency_No__c FROM Constituency__c ];
        set<String> varset=new set<String>();
        
        for(Constituency__c varm:cols){
       			 varmapc.put(varm.Id,varm);
   		 }
        
        for (Constituency__c p :cclist){
            if(p!=null){varset.add(p.Name);}
        }
        system.debug(varset);
        // List<Constituency_Candidate__c> varlist=new  List<Constituency_Candidate__c>();
        list<Constituency_Candidate__c> ilist=new list<Constituency_Candidate__c>();
        for(string varl:varset){
            integer x;
            String varsetId=sendconstituencyid(varl);
            
           List<Constituency_Candidate__c>  varlist=[SELECT Id,Constituency_Name__c,Candidate__c,Votes__c,ccref__c FROM Constituency_Candidate__c WHERE Constituency_Name__c=:varsetId ORDER BY Votes__c DESC NULLS LAST];
           system.debug('check1'+varlist.size());
            for(x=0;x<varlist.size();x++){
               
                try{
                if(varlist[x+1]!=null){
                  varlist[x].Margin__c=varlist[x].Votes__c-varlist[x+1].Votes__c; 
                  varlist[x].Margin_Percentage__c=(varlist[x].Margin__c/varlist[x+1].ccref__c)*100; 
                   //system.debug(varlist[x]);
                    ilist.add(varlist[x]);
                }}
                catch(Exception e){system.debug('exception'+e.getMessage());
                                varlist[x].Margin__c=0; 
                  				varlist[x].Margin_Percentage__c=0; 
                                  ilist.add(varlist[x]); 
                                  }
            }
             
          
        }
        system.debug(ilist);
        system.debug(ilist.size());  
       update ilist;
    }

}