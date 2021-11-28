import '@lwc/synthetic-shadow';
import { createElement } from 'lwc';
import MyApp from 'my/app';
import panel from 'c/lightCarousel';
import dDown from 'c/dropDown';
import accM from 'c/accordionMenu';

const app = createElement('my-app', { is: MyApp });
const lightCarouselapp = createElement('c-lightcarousel', { is: panel });
const down = createElement('c-dropDown', { is: dDown });
const aMenu = createElement('c-accordionMenu', { is: accM });
// eslint-disable-next-line @lwc/lwc/no-document-query
document.querySelector('#main').appendChild(app);
// eslint-disable-next-line @lwc/lwc/no-document-query
document.querySelector('#main').appendChild(lightCarouselapp);
// eslint-disable-next-line @lwc/lwc/no-document-query
document.querySelector('#main-top-right').appendChild(down);
// eslint-disable-next-line @lwc/lwc/no-document-query
document.querySelector('#main-top-left').appendChild(aMenu);
// eslint-disable-next-line @lwc/lwc/no-document-query