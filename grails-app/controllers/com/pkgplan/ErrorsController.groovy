package com.pkgplan

class ErrorsController {
    def serverError = {
        render(view:'/error/reen_server_error')
    }

    def notFound = {
        render(view:'/error/reen_not_found')
    }
}