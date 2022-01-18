import { LightningElement, track } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import saveContact from '@salesforce/apex/CreateRec.saveContact';


export default class contactForm extends LightningElement {
@track Phone;
@track Name;
@track Email;
@track contactInfo = [];


    Place(){
        
        this.contactInfo[0] = this.Name;
        this.contactInfo[1] = this.Phone;
        this.contactInfo[2] = this.Email;
        console.log(this.contactInfo[0]);
        console.log(this.contactInfo[1]);
        console.log(this.contactInfo[2]);
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
        saveContact({newContact: this.contactInfo})
        .then(result => {
            this.contactInfo = [];
            window.console.log('result ===> '+result);
            // Show success messsage
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success!!',
                message: 'Contacts Created Successfully!!',
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