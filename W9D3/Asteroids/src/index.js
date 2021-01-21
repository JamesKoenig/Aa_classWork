const MovingObject = require('./moving_object');
const Util         = 

// console.log("loaded successfully!");
// console.log(MovingObject);

document.addEventListener("DOMContentLoaded",function(e) {
  let canvas = document.getElementById('game-canvas');
  canvas.height = window.innerHeight;
  canvas.width  = window.innerWidth;
  foo = new MovingObject({pos : [50,50], vel: [1,1], radius: 50, color: 'blue'});
  foo.draw(document.getElementById('game-canvas').getContext('2d'));
  setInterval(function() {
                console.log(foo);
                foo.move();
                foo.draw(document.getElementById('game-canvas').getContext('2d'));
             }, 
             25);
});
