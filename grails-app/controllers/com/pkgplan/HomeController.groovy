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

	// receive a message and send mail
    def contact() {
		if (!request.post) {
			return
		}
		if (!params.email) {
			flash.error = message(code: 'contact.error.message.null.email')
			return
		}
		if (!params.subject) {
			flash.error = message(code: 'contact.error.message.null.subject')
			return
		}
		if (!params.content) {
			flash.error = message(code: 'contact.error.message.null.content')
			return
		}
		render view: "/home/contact", model: [emailSent: true]
    }

    def home() {
        if (!userService.isUserLonggedIn()) {
            redirect(action: "index")
        }

    }
}
