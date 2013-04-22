class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/"(controller:'home',action:'index')
        "500"(controller: "errors", action:"serverError")
        "404"(controller: "errors", action:"notFound")

        "/secure/chapSec/$serviceKey/$hostname"(
            controller: 'secure',
            action:'chapSec'
        )

    }
}
