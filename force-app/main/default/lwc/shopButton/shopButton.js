/* eslint-disable no-alert */
import { LightningElement, wire, track } from 'lwc';

// Importing Apex Class method
import saveOpp from '@salesforce/apex/ExampleController.saveOpportunityRecord';

// importing to show toast notifictions
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import getInfo from '@salesforce/apex/ExampleController.getInfo';

import Id from '@salesforce/schema/User.Id';

import Name from '@salesforce/schema/User.Name';

export default class shopButton extends LightningElement {
    a = new Date;
    clickedButtonLabel;
    @track error;
    @track oppRecord = {
            Name : '',
            Id : '',
            Stage : '',
            CloseDate : '',
        };
   @track userIDname = [];
        @wire(getInfo, { userId: Id, Name }) 
     // eslint-disable-next-line no-unused-vars
    userData({ error, data }) {
        var i = 0;
    if ( data ) {
        for ( i; i < data.length; i++ ) {
            this.userIDname.push( data[ i ] );
            this.oppRecord.Name = this.userIDname[i].FirstName + ' ' + this.userIDname[i].LastName;
            this.oppRecord.Id = this.userIDname[i].Id;
            this.oppRecord.Stage = 'Prospecting';
            this.userIDname[0] =this.oppRecord.Name;
            this.userIDname[1] =this.oppRecord.Id;
            this.userIDname[2] =this.oppRecord.Stage;
            console.log(this.userIDname[0]);
            console.log(this.userIDname[1]);
            console.log(this.userIDname[2]);
            console.log(this.userIDname.length);
        }
    }
}

    handleClick(){
        this.handleSave();
    }

    handleSave() {
        saveOpp({UserInfo: this.userIDname})
        .then(result => {
            this.oppRecord = {};
            window.console.log('result ===> '+result);
            // Show success messsage
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success!!',
                message: 'Opportunity Created Successfully!!',
                variant: 'success'
            }),
            );
        })
        .catch(error => {
            this.error = error.message;
            console.log(JSON.stringify(error));
       
        });
    }
}