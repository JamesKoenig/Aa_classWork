console.log("hi")

// #1
class Clock {
    constructor() {
        // 1. Create a Date object.
        this.date = new Date() //.toLocaleTimeString("en-US").split(/:| /)
        // 2. Store the hours, minutes, and seconds.
        this.hours = this.date.getHours()
        this.minutes = this.date.getMinutes()
        this.seconds = this.date.getSeconds()
        // 3. Call printTime.
        this.printTime(this.hours, this.minutes, this.seconds)
        // 4. Schedule the tick at 1 second intervals.
        setInterval(this._tick.bind(this),1000)
    }

    printTime(hours, minutes, seconds) {
        // Format the time in HH:MM:SS

        // Use console.log to print it.
        console.log(`${hours}:${minutes}:${seconds}`)
    }
    
    _tick() {
        // console.log(this)
        // 1. Increment the time by one second.
        this._incrementSeconds();
        // 2. Call printTime.
        this.printTime(this.hours, this.minutes, this.seconds)
    }
    
    _incrementSeconds() {
        this.seconds++;
        if (this.seconds === 60) {
            this.minute = 0;
            this._incrementMinutes();
        }
    }
    
    _incrementMinutes() {
        this.minute++;
        if (this.minute === 60) {
            this.minute = 0;
            this._incrementHours();
        }
    }
    
    _incrementHours() {
        this.hours++;
        if (this.hours === 24) {
            this.hours = 0;
        }
    }
}

// const clock = new Clock();

const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});


//#2
function addNumbers(sum, numLeft, completionCallback) {
  
  if (numLeft > 0) {
    reader.question("What is your number?", function (answer) {
      let num = parseInt(answer);
      sum += num;
      console.log(`Partial sum ${sum}!`);
      addNumbers(sum, numLeft - 1, completionCallback)
    });
  } else {
    completionCallback(sum)
  }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));


// #3 ABSURD BUBBLE SORT
// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question(
    `is ${el1} greater than ${el2}?`, function(answer){
      if (answer === "yes") {
        callback(true)
      } else if (answer === "no") {
        callback(false)
      }
    }
  );
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  if (i == arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps)
  } else {
    askIfGreaterThan(arr[i], arr[i+1], function (isGreater) {
      if (isGreater) {
        let temp  = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    }); 
  }
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    }else{
      sortCompletionCallback(arr);
    }
  }
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);

}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});