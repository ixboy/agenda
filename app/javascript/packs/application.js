import 'bootstrap';
import "channels"
import "jquery"

import * as ActiveStorage from "@rails/activestorage"

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
