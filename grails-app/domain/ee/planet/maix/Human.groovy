package ee.planet.maix

class Human extends Transportation{

	def travelMode="WALKING"
	static constraints = {
	}
	String toString(){
		travelMode+":"+name
	}
}
