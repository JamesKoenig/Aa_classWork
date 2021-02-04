Array.prototype.bubbleSort = function(){
        // let sorted = false;
    let temp = 0;
    
    for(let i = 0; i < this.length; i++){
        for (let j = 0; j < this.length - i - 1; j++){
            if (this[j] > this[j+1]){
                // sorted = true;
                temp = this[j]
                this[j] = this[j+1]
                this[j+1] = temp
            };
        }
        
    };
    return this;
};

// console.log([5,4,3,2,1].bubbleSort());

String.prototype.subStrings = function() {
    let substring = [];
    for(let i=0; i < this.length; i++){
        for(let j=i+1; j <= this.length; j++){
            substring.push(this.slice(i,j));
        };
    };
    return substring;
};

console.log("abcd".subStrings());

