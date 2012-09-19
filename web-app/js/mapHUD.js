jQuery.mapHud = {
    showTrips : function(data) {
	var trips = data;

	$("#tripList").empty();

	$("#tripTmpl").tmpl(trips).appendTo("#tripList").find("div").fadeIn(
		4000).end()

	.find(".edit_route").button({
	    text : false,
	    icons : {
		primary : "ui-icon-wrench"
	    }
	}).click(function() {
	    jQuery.mapHud.openRouteDialog($(this).tmplItem().data);
	}).end()
	.find(".tripHeader").click(function() {
	    var tripId=$(this).tmplItem().data.id;
	    var appendToEl=$(this).parent().parent().find(".routes")
	    if(appendToEl.html()!=""){
		jQuery.route.removeTripRoutes(tripId)
		 $(appendToEl).empty(tripId);
	    }else{
		jQuery.route.getRoutesByTripId(tripId,appendToEl,jQuery.mapHud.showRoutes);
	    }
	    
	}).end()
	
	.find(".edit_trip").button({
	    text : false,
	    icons : {
		primary : "ui-icon-wrench"
	    }
	}).click(function(event) {
	    jQuery.mapHud.openTripDialog($(this).tmplItem().data);
	}).end()

	.find(".new_route").button().click(function() {
	    $.route.emptySelectedMarkers(event.target, $(this).tmplItem().data.id);
	});

	$("#routesList").fadeIn("medium")
	
	// {{tmpl($item.data.routes) "#routeTmpl"}}
    },
    showRoutes : function(appendToEl,data) {
	var routes=data
	
	$("#routeTmpl").tmpl(routes).appendTo($(appendToEl))

	.find(".edit_route").button({
	    text : false,
	    icons : {
		primary : "ui-icon-wrench"
	    }
	}).click(function() {
	    jQuery.mapHud.openRouteDialog($(this).tmplItem().data);
	}).end()

	.find(".disable_route").button({
	    text : false,
	    icons : {
		primary : "ui-icon-minus"
	    }
	}).click(function() {
		  $.route.toggleRoute($(this).tmplItem().data, $(this).tmplItem().data.enabled)
		if($(this).tmplItem().data.enabled==true)$(this).tmplItem().data.enabled=false
		else $(this).tmplItem().data.enabled=true
	  
	}).end()


	// $(appendToEl).parent().parent().find(".routes").fadeIn("medium")
    },
    openTripDialog : function(data) {
	var url = $.MyMapConf.tripFormUrl
	if (data && data.id)
	    url += "&id=" + data.id
	jQuery.modal.openDialog(url);
    },
    openRouteDialog : function(data) {
	var url = $.MyMapConf.routeFormUrl
	if (data.id)
	    url += "&id=" + data.id
	$($.MyMapConf.modalID).load(url, function() {
	    $($.MyMapConf.modalID).dialog({
		width : 500
	    });
	    var routeInfo = jQuery.route.getRouteInfo(data);
	    $("#distance").val(routeInfo.distance);
	    $("#duration").val(routeInfo.duration);
	    $("#distanceText").val(routeInfo.distanceText);
	    $("#durationText").val(routeInfo.durationText);
	});
    }
}

jQuery.modal = {
    onSuccess : function(msg, modalID) {
	$(modalID).dialog('close');
	$.jGrowl(msg);
    },

    onFailure : function(msg) {
	$.jGrowl('Something FAILED!: ' + msg);
    },
    openDialog : function(url) {
	$($.MyMapConf.modalID).load(url, function() {
	    $($.MyMapConf.modalID).dialog({
		width : 400
	    });
	});
    }
}

jQuery.route = {
    getRoutesByTripId : function(tripId,appendToEl, onComplete) { 
	if(!tripId){
		    alert("No trip id");
		    return 
	}
	$.getJSON($.MyMapConf.routeJSONurl + "?trip.id=" + tripId, function(data) {
	    $.each(data, function(i, m) {
		jQuery.route.findAndAddMarkerToRoute(m.origin.id, tripId, m.travelMode);
		jQuery.route.findAndAddMarkerToRoute(m.destination.id, tripId, m.travelMode);
	    });
	    onComplete(appendToEl,data)
	});
    },
    getRouteInfo : function(data) {
	var id = jQuery.route.getDisplayDirectionsId(data);
	var routes = $($.MyMapConf.mapID).gmap('getDirectionRoutes', id);

	var distance = 0;
	var duration = 0;
	var distanceText = "";
	var durationText = "";
	for (r in routes) {
	    var legs = routes[r].legs;

	    for (l in legs) {
		distance += legs[l].distance.value
		duration += legs[l].duration.value
		distanceText = legs[l].distance.text
		durationText = legs[l].duration.text
	    }

	}
	return {
	    distance : distance,
	    distanceText : distanceText,
	    duration : duration,
	    durationText : durationText
	}
    },
    getDisplayDirectionsId : function(route) {
	if (route && route.origin.id && route.destination.id) {
	    return route.origin.id + "_" + route.destination.id;
	} else {
	    alert("No ids");
	    return null;
	}
    },
    displayRoute : function(route) {
	var id = this.getDisplayDirectionsId(route)
	var travelMode="google.maps.DirectionsTravelMode."+route.travelMode;
	$($.MyMapConf.mapID).gmap('displayDirections', {
	    'origin' : route.origin.getPosition(),
	    'destination' : route.destination.getPosition(),
	    'travelMode' : eval(travelMode)
	}, {
	    'suppressMarkers' : true,
	    'draggable' : true,
	    'panel' : document.getElementById('directions')
	}, function(result, status) {
	    // alert(result.routes[0].legs[0].distance.value);
	    if (status === 'OK') {
		$('#results').show();
	    } else {
		$('#results').hide();
	    }
	}, id);
    },
    saveRoute : function(route) {
	var url = $.MyMapConf.routeSaveUrl;
	var id=$.MyMapConf.addRouteToTripId;
	if(!id){
	    alert("no trip id to assign")
	}
	if (route) {
	    jQuery.ajax({
		type : 'POST',
		data : {
		    "origin.id" : route.origin.id,
		    "destination.id" : route.destination.id,
		    name : route.name,
		    "tripId":id
		},
		url : url,
		success : function(data, textStatus) {
		    jQuery.modal.onSuccess(data, '#modal');
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		    jQuery.modal.onFailure(data);
		}
	    });
	} else {
	    alert("Error in saveRoute. No ids");
	}
    },
   removeTripRoutes : function(tripId) {
	var arr = $.MyMapConf.routes;
	if (arr.length >= 1) {
	    for ( var i = 0, item; item = arr[i]; i++) {
		var route = arr[i];
		//alert(r.trip +"=="+ tripId)
		if (route.trip == tripId)
		    this.removeTripRoutesByRoute(route);
	    }
	}
	return null
    },
    addToSavedRoutes : function(route) {
	var arr = $.MyMapConf.routes;
	var hasRoute = false;
	if (arr.length >= 1) {
	    for ( var i = 0, item; item = arr[i]; i++) {
		var r = arr[i];

		if (route.origin.id == r.origin.id
			&& route.destination.id == r.destination.id)
		    hasRoute = true;
	    }
	}
	if (!hasRoute)
	    $.MyMapConf.routes.push(route)

	return hasRoute
    },
    findAndAddMarkerToRoute : function(markerId, tripId, travelMode) {
	$($.MyMapConf.mapID).gmap('findMarker', 'id', markerId + "", false,
		function(marker, isFound) {
		    if (isFound)
			jQuery.route.addMarkerToRoute(marker, true, tripId, travelMode);

		});
    },
    addMarkerToRoute : function(marker, isSaved, tripId, travelMode) {
	var mA
	var mB
	var arr = $.MyMapConf.routeMarkers;
	if (jQuery.inArray(marker, arr) < 0)
	    arr.push(marker);
	// if (arr.length == 0)
	// $($.MyMapConf.activeRouteDomItem).text($.MyMapConf.texts["route.select.first"]);
	if (arr.length == 1) {
	    mA = arr[0];
	    $($.MyMapConf.activeRouteDomItem).text(
		    $.MyMapConf.texts["route.select.second"]);
	}
	if (arr.length == 2) {
	    mA = arr[0];
	    mB = arr[1];
	}

	if (mA && mB) {
	    var route = {
		origin : mA,
		destination : mB,
		name : "somename",
		trip:tripId,
		travelMode:travelMode
	    }
	    var hasRoute=jQuery.route.addToSavedRoutes(route);
	    if (!isSaved && !hasRoute)
		jQuery.route.saveRoute(route)

	    jQuery.route.displayRoute(route);
	    $.MyMapConf.addRouteToTripId = null;
	    $.MyMapConf.routeMarkers = [];
	    $($.MyMapConf.activeRouteDomItem).text(
		    $.MyMapConf.texts["route.select.new"]);
	}
    },
    removeTripRoutesByRoute : function(route) {
	var id = this.getDisplayDirectionsId(route);
	$($.MyMapConf.mapID).gmap('removeDirectionsRenderer', id);
    },
   
    toggleRoute : function(route, enabled) {
	var id = this.getDisplayDirectionsId(route);
	$($.MyMapConf.mapID).gmap('toggleDirectionsRenderer', id, enabled);
    },
   
    emptySelectedMarkers : function(domItem, id) {
	if(!id){
	    alert("No trip id to assign");
	    return;
	}
	$.MyMapConf.activeRouteDomItem = domItem;
	$($.MyMapConf.activeRouteDomItem).text($.MyMapConf.texts["route.select.first"])
	$.MyMapConf.addRouteToTripId = id;
	$.MyMapConf.routeMarkers = []
    }

}
