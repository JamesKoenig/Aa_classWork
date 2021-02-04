range = function(start, end) {
    if(start === end){
        return []
    };
    let temp = range(start,end-1);
    temp.push(end - 1);
    return temp;
};

// console.log(range(1,5));
sumRec = function(arr) {
    if (arr.length === 0){
        return 0;
    };
    let num = arr[0];
    return sumRec(arr.slice(1,arr.length)) + num;
};

// console.log(sumRec([1,2,3,4]));

exponent = function(base, exp) {
    if (exp === 0) {
        return 1
    };
    let num = exponent(base, exp-1);
    return base * num;
};

// console.log(exponent(2,4));

exponent2 = function(base, exp) {
    if (exp === 0) {
        return 1;
    };
    if (exp === 1) {
       return base;
    };
    if (exp % 2 ===0){
        let temp = exponent2(base, exp/2);
        return temp * temp;
    }
    else {
        let temp = exponent2(base, (exp-1)/2);
        return temp * temp * base;
    };
};

// console.log(exponent2(2,5));

fibonacci = function(n){
    if(n === 0){
        return [0];
    };
    if(n === 1){
        return [1];
    };
    if(n===2){
        return [1,1];
    };
    let arr = fibonacci(n-1);
    arr.push(arr[arr.length-1] + arr[arr.length-2]);
    return arr;
};

// console.log(fibonacci(8));

deepDup = function(arr) {

    if(!(arr instanceof Array)){
        return arr;
    };

    return arr.map(el => { 
        return deepDup(el);
    });
    // if(arr.length === 0){
    //     return [];
    // };
    // if (arr.length === 1){
    //     if (arr[0] instanceof Array){
    //         return deepDup(arr[0]);
    //     }else{
    //         return arr[0];
    //     };
    // }else{
    //     return deepDup(arr[0]) + deepDup(arr.slice[1, arr.length]);
    // };
    
};

console.log(deepDup([[1,2], 3, 'a', ['b', 'c']]));