function swap(array, idx1, idx2) {
  let holder = array[idx1];
  array[idx1] = array[idx2];
  array[idx2] = holder;
  return array;
}

function bubbleSort(array) {
  let sorted = false;
  while(!sorted) {
    sorted = true;
    for(let idx = 0; sorted && idx < array.length -1; idx++) {
      if(array[idx] > array[idx+1]) {
        swap(array,idx,idx+1);
        sorted = false;
      }
    }
  }
}


module.exports = {
    bubbleSort,
    swap
};
