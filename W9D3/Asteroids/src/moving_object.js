function MovingObject(opts) {
  this.pos    = opts.pos;
  this.vel    = opts.vel;
  this.radius = opts.radius;
  this.color  = opts.color;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0],
          this.pos[1],
          this.radius,
          0,
          2*Math.PI);
  ctx.fillStyle = this.color;
  ctx.fill();
}

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
}

module.exports = MovingObject;