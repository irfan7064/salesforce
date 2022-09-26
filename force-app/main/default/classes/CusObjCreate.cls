public class CusObjCreate {

    public  void createconstituencyobject(){
        MetadataService.MetadataPort metadataservice = new MetadataService.MetadataPort();
	metadataservice .SessionHeader = new MetadataService.SessionHeader_element();
	metadataservice .SessionHeader.sessionId = UserInfo.getSessionId();
        List<MetadataService.Metadata> fields = new List<MetadataService.Metadata>();
	MetadataService.CustomObject customobject = new MetadataService.CustomObject();
	customobject.fullName = 'Constituency_Candidate__c';
	customobject.label = 'Constituency Candidate';
	customobject.pluralLabel = 'Constituency Candidates';
        fields.add(customobject);
	metadataservice.createMetadata(fields);
    }

    public  void createconstituencyfields(){    
         MetadataService.MetadataPort metadataservice = new MetadataService.MetadataPort();
		metadataservice .SessionHeader = new MetadataService.SessionHeader_element();
		metadataservice .SessionHeader.sessionId = UserInfo.getSessionId();
		List<MetadataService.Metadata> fields = new List<MetadataService.Metadata>();
        MetadataService.CustomField customField = new MetadataService.CustomField();
		customField.fullName = 'Constituency_Candidate__c.State_Name__c';
		customField.label = 'State Name';
		customField.defaultvalue = '';
		customField.type_x = 'Text';
		fields.add(customField);
		metadataservice.createMetadata(fields);
    }
    
    
}