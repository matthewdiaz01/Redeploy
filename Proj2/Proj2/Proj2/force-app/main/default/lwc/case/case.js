import { LightningElement, track, api } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import saveCC from '@salesforce/apex/CreateRec.saveCC';

export default class Case extends LightningElement {
@track Phone;
@track Name;
@track Email;
@track contactInfo = [];
@api Reason;

    Place(){
        this.contactInfo[0] = this.Name;
        this.contactInfo[1] = this.Phone;
        this.contactInfo[2] = this.Email;
        this.contactInfo[3] = this.Reason;
        console.log(this.contactInfo[0]);
        console.log(this.contactInfo[1]);
        console.log(this.contactInfo[2]);
        console.log(this.contactInfo[3]);
    }

    NameChange(event){
        this.Name = event.target.value;
    }

    PhoneChange(event){
        this.Phone = event.target.value;
    }
    EmailChange(event){
        this.Email = event.target.value;
    }

    handleSave() {
        saveCC({newContact: this.contactInfo})
        .then(result => {
            this.contactInfo = [];
            window.console.log('result ===> '+result);
            // Show success messsage
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success!!',
                message: 'Contact and Case Created Successfully!!',
                variant: 'success'
            }),
            );
        })
        .catch(error => {
            this.error = error.message;
            console.log(JSON.stringify(error));
       
        });
    }

    handle(){
        this.Place();
        this.handleSave();
    }

}