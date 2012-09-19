package ee.planet.maix
/*
 * Võiks vastada otse Google.Markerile
 */
class Marker {
	String lat
	String lng
	String name
	Icon image
	String position
	static transients=['position']
    static constraints = {
		image(nullable:true)
    }
	String getPosition(){
		return "$lat,$lng"
	}
	String toString(){
		name
	}
}
