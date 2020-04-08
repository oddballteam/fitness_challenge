require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import "../css/application";

require("flatpickr/dist/flatpickr.css");

import { Application } from "stimulus";
import Flatpickr from "stimulus-flatpickr";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const controllers = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(controllers));

application.register("flatpickr", Flatpickr);
