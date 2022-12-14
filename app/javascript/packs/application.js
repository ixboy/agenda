require("@popperjs/core")

import 'bootstrap-icons/font/bootstrap-icons.css'
import 'bootstrap';
import "channels"
import "jquery"
import '../stylesheets/application'

import * as ActiveStorage from "@rails/activestorage"

// Import the specific modules you may need (Modal, Alert, etc)
import { Popover, Tooltip } from "bootstrap"

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// The stylesheet location we created earlier
require("../stylesheets/application.scss")

// If you're using Turbolinks
document.addEventListener("turbolinks:load", () => {    
    // Both of these are from the Bootstrap 5 docs
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new Tooltip(tooltipTriggerEl)
    })

    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
        return new Popover(popoverTriggerEl)
    })
})
