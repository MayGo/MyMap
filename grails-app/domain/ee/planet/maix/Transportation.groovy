package ee.planet.maix

class Transportation {
	String name
	def travelMode="DRIVING"
    static constraints = {
    }
	String toString(){
		travelMode+":"+name
	}
}
