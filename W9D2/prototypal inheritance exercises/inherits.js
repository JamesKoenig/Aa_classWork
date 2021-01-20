// Function.prototype.inherits = function(parentClass){
//     const constructor = this.prototype.constructor;
//     function Surrogate(){}
//     Surrogate.prototype = parentClass.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = constructor;
// }

Function.prototype.inherits = function(parentClass) {
    this.prototype = Object.create(parentClass.prototype);
    this.prototype.constructor = this;
} 

function MovingObject() { }

function Ship() { }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);