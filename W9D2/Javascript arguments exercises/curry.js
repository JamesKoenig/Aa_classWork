Function.prototype.curry = function(numArgs) {
  let that = this;
  let numbers = [];
  function _curriedFn(arg) {
    numbers.push(arg);
    if(numbers.length === numArgs) {
      console.log(that);
      console.log(numbers);
      //return that.apply(that,numbers);
      return that(...numbers);
    } else {
      return _curriedFn;
    }
  }
  return _curriedFn;
}

console.log(console.log.curry(2)("a")("b"));