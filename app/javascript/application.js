// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import "jquery/src/jquery"
import 'bootstrap/js/dist/dropdown'
import 'bootstrap/js/dist/collapse'



Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).ready(function() { $(".dropdown-toggle").dropdown(); })
import * as bootstrap from "bootstrap"
