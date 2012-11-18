package com.pkgplan.dream

import org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib
import org.codehaus.groovy.runtime.InvokerHelper

class DreamTagLib extends ApplicationTagLib{
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
}
