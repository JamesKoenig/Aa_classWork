Function.prototype.myBind = function(newContext) {
  this.apply(newContext);
}