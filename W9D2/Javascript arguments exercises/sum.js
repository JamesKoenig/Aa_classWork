function sum(...args) {
  return args.reduce(function(acc,ele) {
    return acc+ele;
  });
}

function sumArguments() {
  let acc = 0;
  for(i=0; i < arguments.length; i++) {
    acc += arguments[i];
  }
  return acc;
}

console.log(sum(1,2,3,4));
console.log(sumArguments(1,2,3,4));