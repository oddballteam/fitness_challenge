import { Controller } from "stimulus";

import Flatpickr from "stimulus-flatpickr";

// import { definitionsFromContext } from "stimulus/webpack-helpers";
// const application = Application.start();
// const context = require.context("../controllers", true, /\.js$/);
// application.load(definitionsFromContext(context));

// Manually register Flatpickr as a stimulus controller
application.register("flatpickr", Flatpickr);
