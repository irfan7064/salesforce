import { LightningElement ,track} from 'lwc';

import getAllStages from '@salesforce/apex/ElectionPartyLoader.getexecuteme';
import getAllStages2 from '@salesforce/apex/ElectionPartyLoader.getexecutefordups';

export default class Partyloader extends LightningElement {

    opps;
    errorMsg;
    textValue = 'Done, Parties Inserted sucessfully';
    @track showText = false;
    allStages(){
        getAllStages()
        .then(result =>{
            this.opps = result;
        })
        .catch(error =>{
            this.errorMsg = error;
        }) ,
        getAllStages2()
         .then(result =>{
             this.opps = result;
         })
         .catch(error =>{
             this.errorMsg = error;
         })

         this.showText = true;
    }

}