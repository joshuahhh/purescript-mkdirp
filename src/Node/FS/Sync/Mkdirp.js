"use strict";

import { sync as mkdirpSync } from "mkdirp";

export const mkdirp =
  function (dir) {
    return function () {
      mkdirpSync(dir);
    };
  };
