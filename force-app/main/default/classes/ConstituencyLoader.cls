public class ConstituencyLoader {
    
       
    @Auraenabled
     public static void executeme(){
           Integer recordsProcessed = 0;
   		Set<String> uniqueIds = new Set<String>();
        List<India_Election_2019__c> kb=[SELECT Id,Constituency_ID__c,Constituency_Name__c ,Constituency_No__c,Constituency_Type__c,State_Name__c,State_Code__c FROM India_Election_2019__c WHERE Party__c!=null AND Party_ID__c!=null]; 
       
     
         
         for (India_Election_2019__c p :kb) {
            if(p!=null){    uniqueIds.add(p.Constituency_ID__c);}

         }
        map<string,India_Election_2019__c> varmap=new map<string,India_Election_2019__c>();
         for (string varid :uniqueIds) {
            if(varid!=null){    
                India_Election_2019__c varrec=[SELECT Id,Constituency_ID__c,Constituency_Name__c ,Constituency_No__c,Constituency_Type__c,State_Name__c,State_Code__c FROM India_Election_2019__c WHERE Constituency_ID__c=:varid LIMIT 1 ];
                varmap.put(varid, varrec);}
         }
         
         list<Constituency__c> ilist=new list<Constituency__c>();
          for (string varid2 :varmap.keyset()) {
              Constituency__c varc= new Constituency__c();
            if(varid2!=null){    
                varc.Name=varmap.get(varid2).Constituency_Name__c;
                varc.Constituency_ID__c=varmap.get(varid2).Constituency_ID__c;
                varc.Constituency_No__c=varmap.get(varid2).Constituency_No__c;
                varc.Constituency_Type__c=varmap.get(varid2).Constituency_Type__c;
                varc.State_Code__c=varmap.get(varid2).State_Code__c;
                varc.State_Name__c=varmap.get(varid2).State_Name__c;         
        	 }
         	ilist.add(varc);
          }
			system.debug(ilist);
         system.debug('testme'+ilist.size());
         insert ilist;
     }
}