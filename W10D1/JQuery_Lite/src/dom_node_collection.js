export class DOMNodeCollection {
  constructor(htmlElems) {
    this.htmlElems = htmlElems || [];
  }

  html(string) {
    if(string === undefined) {
      return this.htmlElems[0];
    } else {
      this.htmlElems.map( ele => {
        ele.innerHTML = string;
      });
    }
  }

  empty() { 
    this.htmlElems.map( ele => {
      ele.outerHTML = ""
    });
  }

  append(arg) {
    switch(typeof arg) {
      case "string":
        this.htmlElems.map( ele => { 
          ele.innerHTML = ele.innerHTML.concat(arg);
        });
        break;
      case "object":
        if(arg instanceof DOMNodeCollection) {
          
          break;
        } else if(arg instanceof HTMLElement) {

          break;
        }
      default:
        throw Error(`whoops: ${arg}`);
    }
  }
}