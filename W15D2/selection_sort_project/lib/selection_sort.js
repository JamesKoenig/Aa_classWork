function swap(arr, index1, index2) {
  let holder = arr[index1];
  arr[index1] = arr[index2];
  arr[index2] = holder;
}

function findMinIndex(arr, offset = 0) {
  let minIndex = offset;

  for(let idx = offset+1; idx < arr.length; idx++) {
    if(arr[minIndex] > arr[idx])
      minIndex = idx;
  }

  return minIndex;
}

function selectionSort(arr) {
  for(let idx = 0; idx < arr.length; idx++) {
    swap(arr,idx,findMinIndex(arr,idx));
  }
}

module.exports = {
    selectionSort,
    swap
};
