import { LightningElement, wire, track } from 'lwc';
import fetchProducts from '@salesforce/apex/ExampleController.fetchProducts';

const columns = [ 
    { label: 'Name', fieldName: 'Name' }, 
    { label: 'Family', fieldName: 'Family' }, 
];

export default class Example extends LightningElement {

    @track productswithFamily;
    @track productswithoutFamily;
    @track columns = columns;

    @wire(fetchProducts)
    // eslint-disable-next-line no-unused-vars
    accountData({ error, data }) {
            var tempProductswithFamily = [];
            var tempProductswithoutFamily = [];
            var i = 0
        if ( data ) {
           
            

            for ( i; i < data.length; i++ ) {

                if ( data[ i ].Family )
                tempProductswithFamily.push( data[ i ] );
                else
                tempProductswithoutFamily.push( data[ i ] );

            }

            this.productswithoutFamily = tempProductswithoutFamily;
            this.productswithFamily = tempProductswithFamily;
            console.log( JSON.stringify( this.productswithFamily ) );
            console.log( JSON.stringify( this.productswithoutFamily ) );

        }
   
   
    }

}