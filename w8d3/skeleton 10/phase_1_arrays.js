Array.prototype.uniq = function() {
    // let array be empty
    // iterate from index 0 to end
    // array.includes(ele)
    let uniqArray = [];

    for (let i = 0; i < this.length; i++) {
        let el = this[i];
        if (!uniqArray.includes(el)) {
            uniqArray.push(el);
        }
    }
    return uniqArray;
};

console.log([1,2,2,3,3,3].uniq());

Array.prototype.twoSum = function() {
    let pairs = [];

    for (let i = 0; i< this.length; i++) {
        let el = this[i];
        if (this.includes(el * -1) && (this.indexOf(el * -1) > this.indexOf(el))) {
            pairs.push([this.indexOf(el), this.indexOf(el * -1)]);
        }
    }

    return pairs;
};

console.log([2, -2, 11, 15].twoSum());

Array.prototype.transpose = function() {
    const transposed = [];

    for (let i = 0; i < this[0].length; i++) {
        transposed.push([]);
        for (let j = 0; j < this.length; j++) {
            transposed[i].push(0);
        }
    }


    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this[i].length; j++) {
            transposed[j][i] = this[i][j];
        }
    }

    return transposed;
};

console.log([[0,1,2],[3,4,5],[6,7,8]].transpose());
// console.log(([[1,2,3], ["a","b","c"]]).transpose());
