import { LightningElement ,track} from 'lwc';
import getAllStages from '@salesforce/apex/ConstituencyLoader.executeme';
//import getAllStages2 from '@salesforce/apex/ElectionPartyLoader.getexecutefordups';

export default class constituencyloader extends LightningElement {

    opps;
    errorMsg;
    textValue = 'Done, Constituencies Inserted sucessfully';
    @track showText = false;
    allStages(){
        getAllStages()
        .then(result =>{
            this.opps = result;
        })
        .catch(error =>{
            this.errorMsg = error;
        }) 
        this.showText = true;

    }

}