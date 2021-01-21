
const Util = {
  inherits(ChildClass,ParentClass) {
    function Surrogate() {}
    Surrogate.prototype              = ParentClass.prototype;
    ChildClass.prototype             = new Surrogate();
    ChildClass.prototype.constructor = ChildClass;
  }
};

module.exports = Util;