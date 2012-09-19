
import org.codehaus.groovy.grails.commons.GrailsApplication
import ee.planet.maix.*
class BootStrap {
	def fixtureLoader
	def iconService
	GrailsApplication grailsApplication
    def init = { servletContext ->
		def baseFolder = grailsApplication.mainContext.getResource("/").getFile().toString()
		def imagesFolder = baseFolder + '/images/markers_test'
		if(!Icon.get(0))iconService.createIconObjectsFromFolder(imagesFolder)
		fixtureLoader.load("maix/trips")
		
    }
    def destroy = {
    }
}
