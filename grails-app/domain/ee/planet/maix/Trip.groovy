package ee.planet.maix

class Trip {
	static hasMany=[routes:Route]
	String name
	static transients=[
		"distance",
		"duration",
		"fuelConsumption",
		"fuelCost"
	]

	def getDistance(){
		routes.collect{it.distance}.sum()
	}
	def getDuration(){
		routes.collect{it.duration}.sum()
	}

	def getFuelConsumption(){
		routes.collect{
			it.transportation?.travelMode=="DRIVING"?
					it.transportation?.fuelConsumption/100*(it.distance/1000):0
		}.sum()
	}
	def getFuelCost(){
		def fc=getFuelConsumption()
		(fc)?fc*1.275:0
	}
	static mapping = {
		//routes lazy: false
	}
	String toString(){
		name
	}
}

