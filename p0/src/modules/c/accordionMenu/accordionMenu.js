import { LightningElement } from 'lwc';

export default class DropDown extends LightningElement {
    btnlabel = "Hide";
    DA = true;
    DD = true;
    handleclick(){
        this.DA = !this.DA;
    }

    BFD(){
        this.dd = !this.DD;
        this.DD = (this.DD ? alert("Black Friday has already passed") : console.log("True")) // eslint-disable-line no-alert
    }
}