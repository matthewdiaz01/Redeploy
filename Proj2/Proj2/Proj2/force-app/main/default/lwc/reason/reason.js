import { LightningElement,track } from 'lwc';

export default class reason extends LightningElement {
    
value = 'inProgress';

get options() {
     return [ 
        { 
        label: 'Incorrect Order Size', value: 'Incorrect Order Size' }, 
        { label: 'Damaged Product', value: 'Damaged Product' }, 
        { label: 'Contact Us', value: 'Contact Us' }, 
        { label: 'Create an account', value: 'Create an account' }, ];
        } 
         
handleChange(event) {
    this.value = event.detail.value;
    const pass = this.value;
    const valueChangeEvent = new CustomEvent("valuechange", 
        { detail: {pass} });
    this.dispatchEvent(valueChangeEvent);
    } 
}