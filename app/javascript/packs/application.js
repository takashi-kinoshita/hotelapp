import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "bootstrap";
import $ from "jquery";
global.$ = jQuery;

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// Import Bootstrap and related files
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min.js";
import "./bootstrap_custom.scss";
