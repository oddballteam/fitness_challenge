// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
Rails.start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import "../css/application";
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const controllers = require.context("./controllers", true, /\.js$/);

application.load(definitionsFromContext(controllers));
