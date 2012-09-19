modules = {
	core {
		dependsOn 'jquery'	
		dependsOn 'jquery-ui'
	}
   
	map {
		dependsOn 'jquery'
		dependsOn 'jquery-ui'
		resource url: '/js/ui/jquery.ui.map.js'
		resource url: '/js/ui/jquery.ui.map.extensions.js'
		resource url: '/js/ui/jquery.ui.map.services.js'
		resource url: '/js/ui/jquery.ui.map.directions.js'
	}
	mapContr{
		dependsOn 'map'
		resource url: '/js/map.js'
		resource url: '/js/mapHUD.js'
		resource url: '/js/ui/jquery.tmpl.js'
	}
	
	forms {
		dependsOn 'jquery'
		dependsOn 'jquery-ui'
	}
}