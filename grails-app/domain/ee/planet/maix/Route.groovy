package ee.planet.maix

class Route {
	Marker origin
	Marker destination
	int duration
	String durationText
	int distance
	String distanceText
	Transportation transportation
	boolean enabled=true

	//travelMode google.maps.DirectionsTravelMode.DRIVING
	String name
	static hasMany=[trips:Trip]
	static belongsTo=Trip

	static constraints={
		duration(nullable:true)
		durationText(nullable:true,blank:true)
		distance(nullable:true)
		distanceText(nullable:true,blank:true)
		origin(unique: ['destination'])
		transportation(nullable:true)
	}
	static mapping = {
//		origin lazy: false
//		destination lazy: false
	}
	String toString(){
		"$origin - $destination"
	}
}
