"use strict";

exports.mkdirpImpl = require("mkdirp");

exports.unsafeMkEff = function (f) {
  return f;
};

exports.handleCallbackImpl = function (left, right, f) {
  return function (err, value) {
    if (err) {
      f(left(err))();
    } else {
      f(right(value))();
    }
  };
};
