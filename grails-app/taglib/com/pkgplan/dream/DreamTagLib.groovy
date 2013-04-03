package com.pkgplan.dream

import org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib


class DreamTagLib extends ApplicationTagLib{
    static returnObjectForTags = ['createLink', 'resource', 'createLinkTo', 'cookie', 'header', 'img', 'join', 'meta', 'set', 'gravatar']
    Closure resource = { attrs ->
        if (grailsApplication.config.dream.resourceRoot && attrs.dir) {
            // load the resource file from a static server.
            return "${grailsApplication.config.dream.resourceRoot}${attrs.dir}/${attrs.file}"
        }
        if (!attrs.pluginContextPath && pageScope.pluginContextPath) {
            attrs.pluginContextPath = pageScope.pluginContextPath
        }
        // Use resources plugin if present, but only if file is specified - resources require files
        // But users often need to link to a folder just using dir
        return ((hasResourceProcessor && attrs.file) ? r.resource(attrs) : linkGenerator.resource(attrs))
    }

    Closure gravatar = { attrs ->
        def email = attrs.email
        def defimg = ""
        def gravatar_id = email?.toLowerCase().encodeAsMD5()
        return "<img src=\"https://secure.gravatar.com/avatar/${gravatar_id}\"/>"
    }
}
