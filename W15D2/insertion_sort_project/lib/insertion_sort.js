//decided to go without subfunctions this time, for whatever reason
function insertionSort(arr) {
  for(let idx = 0; idx < arr.length; idx++) {
    for(let jdx = idx; jdx > 0 && arr[jdx] < arr[jdx-1]; jdx--) {
      //swap the elements
      let holder = arr[jdx-1];
      arr[jdx-1] = arr[jdx];
      arr[jdx] = holder;
    }
  }
}

module.exports = {
    insertionSort
};
