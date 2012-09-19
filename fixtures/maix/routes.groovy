import ee.planet.maix.*
include "maix/markers"
include "maix/cars"
fixture {
  a(Route,duration:5209,durationText:"1 tund 27 minutit",transportation:car1,distance:92874,distanceText:"92,9 km",origin:kodu, destination:haapsalu, name:"Kodu-Haapsalu trip")
  b(Route,duration:3591,durationText:"1 tund 0 minutit",transportation:car1,distance:59918,distanceText:"59,9 km",origin:haapsalu, destination:vigala, name:"Haapsalu-Vigala trip")
  haapsaluRoute1(Route,duration:3591,durationText:"1 tund 0 minutit",transportation:human1,distance:59918,distanceText:"0 km",origin:haapsalu, destination:haapsaluWalk1, name:"walk 1")
  haapsaluRoute2(Route,duration:3591,durationText:"1 tund 0 minutit",transportation:human1,distance:59918,distanceText:"0 km",origin:haapsaluWalk1, destination:haapsaluWalk2, name:"walk 2")
  haapsaluRoute3(Route,duration:3591,durationText:"1 tund 0 minutit",transportation:human1,distance:59918,distanceText:"0 km",origin:haapsaluWalk2, destination:haapsalu, name:"walk 2")
  c(Route,duration:5057,durationText:"1 tund 24 minutit",transportation:car1,distance:89892,distanceText:"89,9 km",origin:vigala, destination:kodu, name:"Vigala-Kodu trip")
  d(Route,duration:2563,durationText:"43 min",transportation:car1,distance:36626,distanceText:"36,6 km",origin:suvaline1, destination:suvaline2, name:"Suvaline1 -Suvaline2, lihtsalt äge")
  
}