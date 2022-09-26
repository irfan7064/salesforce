import { LightningElement ,track} from 'lwc';
import getAllStages from '@salesforce/apex/AllCCsLoader.iloader';
import getAllStagesk from '@salesforce/apex/AllCCsLoader.iloader2';
import getAllStages3 from '@salesforce/apex/AllCCsLoader.iloader3';
import getAllStages4 from '@salesforce/apex/AllCCsLoader.iloader4';
import getAllStages5 from '@salesforce/apex/AllCCsLoader.iloader5';

export default class allccsloader extends LightningElement {

    
    opps2;
    errorMsg2;
    textValue2 = 'Done, Candidate Constituencies margin updated sucessfully';
    @track showText2 = false;

    opps;
    errorMsg;
    textValue = 'Done, Candidate Constituencies Inserted sucessfully';

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
    allStagesk(){
        getAllStagesk()
        .then(result =>{
            this.opps2 = result;
        })
        .catch(error =>{
            this.errorMsg2 = error;
        }) 
        this.showText2 = true;

    }

//LOADING
    opps3 ;
    errorMsg3;
    textValue3 = 'Done, Candidate Constituencies Inserted sucessfully';

    @track showText3 = false;
    allStages2(){
        getAllStages3()
        .then(result =>{
            this.opps3 = result;
        })
        .catch(error =>{
            this.errorMsg3 = error;
        }) 
        this.showText3 = true;

    }
    
    opps4;
    errorMsg4;
    textValue4 = 'Done, Candidate Constituencies Inserted sucessfully';

    @track showText4  = false;
    allStages3(){
        getAllStages4()
        .then(result =>{
            this.opps4 = result;
        })
        .catch(error =>{
            this.errorMsg4 = error;
        }) 
        this.showText4 = true;

    }
    opps5;
    errorMsg5;
    textValue5 = 'Done, Candidate Constituencies Inserted sucessfully';

    @track showText5  = false;
    allStages4(){
        getAllStages5()
        .then(result =>{
            this.opps5 = result;
        })
        .catch(error =>{
            this.errorMsg5 = error;
        }) 
        this.showText5 = true;

    }

}