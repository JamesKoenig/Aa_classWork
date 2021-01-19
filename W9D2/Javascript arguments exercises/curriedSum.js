function curriedSum(numArgs) {
  let numbers = [];
  function _curriedSum(num) {
    numbers.push(num);
    if(numbers.length === numArgs) {
      return numbers.reduce( (acc,ele) => acc+ele);
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56

function unCurriedSum(...args) {
  const sum = curriedSum(args.length);
  return args.reduce( (_,ele) => { return sum(ele); }, sum);
}

function uncurry(curriedFunction,...args) {
  return args.reduce( (_,ele) => { 
    return curriedFunction(ele);
  }, sum);
}

console.log(unCurriedSum(5,30,20,1));