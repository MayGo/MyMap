function deleteMarker(markerId) {
    if (markerId) {

	// $.jGrowl($('#modal').gmap('findMarker','id',
	// markerId).getClickable());
	$('#map_canvas').gmap('findMarker', 'id', markerId, false,
		function(marker, isFound) {
		    if (isFound)
			marker.setMap(null);
		});
	
	// $.MyMapConf.markers[markerId].setMap(null)
    } else {
	$.jGrowl("No marker ID");
    }
}

$(function() {
    $("#tripList").accordion();
    $("#search_btn").button({
	text : false,
	icons : {
	    primary : "ui-icon-search"
	}
    }).click(function() {

    });

    $("#addMarker_btn").button().click(function(event) {
	var $target = $(event.target);
	if ($.MyMapConf.addMarkers)
	    $.MyMapConf.addMarkers = false;
	else
	    $.MyMapConf.addMarkers = true;
    });
   
    $("#createNewTrip").button().click(function(event) {
	var $target = $(event.target);
	jQuery.mapHud.openTripDialog();
    });
    
    /*
     * MAP
     */

    var mapID = $.MyMapConf.mapID;
    var modalID = $.MyMapConf.modalID;
    var country = "Estonia"
    var mapOptions = {
	zoom : 10,
	mapTypeId : google.maps.MapTypeId.ROADMAP,
	center : new google.maps.LatLng(41.06000, 28.98700)
    };

    $(mapID).gmap(mapOptions).bind('init', function(event, map) {
	$(mapID).append($("#addMarker_btn"));

	$.getJSON($.MyMapConf.markerJSONurl, function(data) {
	    $.each(data, function(i, m) {
		var markerImage = null;
		if (m.image != '')
		    markerImage = new google.maps.MarkerImage(m.image);
		var mrkr = $(mapID).gmap('addMarker', {
		    'position' : new google.maps.LatLng(m.lat, m.lng),
		    'id' : "" + m.id,
		    'title' : m.name,
		    'icon' : markerImage,
		    'bounds' : true
		}).click(function(el) {
		    if ($.MyMapConf.addRouteToTripId) {
			jQuery.route.addMarkerToRoute($(this).get(0), false, $.MyMapConf.addRouteToTripId);
		    } else {
			map.panTo($(this).get(0).getPosition());
			openMarkerDialog($(this).get(0));
		    }

		});

		// $.MyMapConf.markers[m.id] = mrkr;

	    });
	    $.getJSON($.MyMapConf.tripJSONurl, function(data) {	
		    jQuery.mapHud.showTrips(data);
	    });
	});

	$(map).click(function(event) {
	    if ($.MyMapConf.addMarkers)
		addMarker(event.latLng, true);
	});

    });

    $(mapID).gmap('autocomplete', 'search_address', function(ui) {
	addMarker(ui.item.position, false);
	// ui.item.position <-- selected position (google.maps.LatLng)
    });

    function addMarker(latLng, loadWindow) {

	$(mapID).gmap('addMarker', {
	    'position' : latLng,
	    'draggable' : true,
	    'bounds' : false
	}, function(map, marker) {
	    map.panTo(marker.getPosition());
	    map.setZoom(10);
	    if (loadWindow == true) {
		// $('#dialog').append($("#markerDialog").html());
		$(modalID).load($.MyMapConf.markerFormUrl, function() {
		    $(modalID).dialog({
			width : 400
		    });
		    findLocation(marker.getPosition(), marker);
		});
	    }

	}).dragend(function(event) {
	    var self = this;
	    findLocation(event.latLng, this);
	}).click(function(event) {

	    var map = $(modalID).get('map')
	    // map.panTo($(this).get(0).getPosition());
	    openMarkerDialog($(this).get(0));
	})
    }
    function findLocation(location, marker) {

	$(mapID).gmap('search', {
	    'location' : location
	}, function(results, status) {
	    if (status === 'OK') {
		marker.setTitle(results[0].formatted_address);
		$('#lat').val(location.lat());
		$('#lng').val(location.lng());
	    }
	});
    }

    function openMarkerDialog(marker) {
	var url = $.MyMapConf.markerFormUrl
	if (marker.id)
	    url += "&id=" + marker.id
	$(modalID).load(url, function() {
	    $(modalID).dialog({
		width : 400
	    });
	    if (!marker.id)
		findLocation(marker.getPosition(), marker);
	});
    }

});