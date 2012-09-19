package ee.planet.maix

class IconService {


	String getFilenameWithoutExtension(String filename) {
	
		return filename?.replaceFirst(~/\.[^\.]+$/, '')
	}

	def createIconObjectsFromFolder(imagesFolder) {
		Map fileParams=[:]
		new File(imagesFolder).eachFileMatch(~/.*?\.png/) {
			fileParams['name']= getFilenameWithoutExtension(it.name)
			fileParams['uri']= it.name
			findOrCreate(fileParams)
		}
	}

	Icon findOrCreate(Map params){
		def icon=Icon.findByUri(params.uri)
		if(!icon){
			icon=new Icon(name:params.name, uri:params.uri)
			if(icon.save(flush:true)){
				log.info "Created icon:"+icon+"With params:"+params
			}
		}
		return icon
	}
}
