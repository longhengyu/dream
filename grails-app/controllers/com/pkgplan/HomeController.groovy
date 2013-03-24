package com.pkgplan

class HomeController {

    def userService

    def index() {
        if(request.xhr) {
            render(view: "_body")
            return
        }
    }

    def manual() {

    }

    def contact() {

    }

    def home() {
        if (!userService.isUserLonggedIn()) {
            redirect(action: "index")
        }

    }
}
