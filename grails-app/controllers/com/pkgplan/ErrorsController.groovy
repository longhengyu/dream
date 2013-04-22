package com.pkgplan

class ErrorsController {
    def serverError = {
        render(view:'/error/serverError')
    }

    def notFound = {
        render(view:'/error/notFound')
    }
}