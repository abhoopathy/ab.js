// Generated by CoffeeScript 1.6.3
(function() {
  var ab, _getProp, _register;

  ab = {};

  ab.set = function(options, registerKey) {
    var opt, rand, storedKey, sum, _i, _j, _len, _len1;
    storedKey = _getProp(registerKey);
    for (_i = 0, _len = options.length; _i < _len; _i++) {
      opt = options[_i];
      if ((storedKey === opt.register) || ((opt.register == null) && storedKey === opt.value)) {
        return opt.value;
      }
    }
    rand = Math.floor((Math.random() * 100) + 1);
    sum = 0;
    for (_j = 0, _len1 = options.length; _j < _len1; _j++) {
      opt = options[_j];
      sum = sum + opt.share;
      if (rand <= sum) {
        if (registerKey != null) {
          _register(opt, registerKey);
        }
        return opt.value;
      }
    }
  };

  _register = function(opt, key) {
    var regObj, _ref;
    if (ab.register == null) {
      return;
    }
    regObj = {};
    regObj[key] = (_ref = opt.register) != null ? _ref : opt.value;
    return ab.register(regObj);
  };

  _getProp = function(property) {
    if (!ab.getProp) {
      return false;
    }
    return ab.getProp(property);
  };

  if (typeof define === "function" && define.amd) {
    define("ab", [], function() {
      return ab;
    });
  }

  if ((typeof module !== "undefined" && module !== null ? module.exports : void 0) != null) {
    module.exports = ab;
  }

}).call(this);
