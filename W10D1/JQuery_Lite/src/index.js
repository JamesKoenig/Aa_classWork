const { DOMNodeCollection } = require("./dom_node_collection");

function $l(arg) {
  if(typeof arg === "string") {
    return Array.from(_selector(arg));
  } else if(arg instanceof HTMLElement) {
    return new DOMNodeCollection([arg]);
  }
}

function _selector(string) {
  return document.querySelectorAll(string);
}

window.$l = $l;