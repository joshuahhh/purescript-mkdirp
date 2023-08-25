"use strict";

import mkdirp from "mkdirp";

export const mkdirpImpl = mkdirp;

export const unsafeMkEff = function (f) {
  return f;
};

export const handleCallbackImpl = function (left, right, f) {
  return function (err, value) {
    if (err) {
      f(left(err))();
    } else {
      f(right(value))();
    }
  };
};
