package com.pkgplan

class HomeController {

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
}
