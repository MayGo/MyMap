<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false"></script>
<r:require modules="mapContr" />

<r:layoutResources />
<r:script>


$.MyMapConf = { 
 	modalID : "#modal",
	 mapID :'#map_canvas',
    markerFormUrl : "${createLink(controller: 'marker', action:'create', params:['modal':'modal'])}",
    markerShowUrl : "${createLink(controller: 'marker', action:'show', params:['modal':'modal'])}",  
    markerJSONurl : "${createLink(controller: 'marker', action:'markerListJSON')}",
    routeJSONurl : "${createLink(controller: 'route', action:'listJSON')}",
    routeSaveUrl : "${createLink(controller: 'route', action:'saveAJAX')}",
    routeFormUrl : "${createLink(controller: 'route', action:'create', params:['modal':'modal'])}",
    tripFormUrl : "${createLink(controller: 'trip', action:'create', params:['modal':'modal'])}",
    tripJSONurl : "${createLink(controller: 'trip', action:'listJSON')}",
    markers:{},
    routeMarkers:[],
    routes:[],
    addMarkers : false,
    addRouteToTripId:null,
    texts:{
    	"route.select.first":"${message(code: 'route.select.first')}",
    	"route.select.second":"${message(code: 'route.select.second')}",
    	"route.select.new":"${message(code: 'route.select.new')}"
    	},
    activeRouteDomItem:null
}; 

</r:script>
</head>
<body>
	<r:layoutResources />
	<script id="tripTmpl" type="text/x-jquery-tmpl">
<div class="trip">
			<div class=" ui-widget-header ui-corner-all ui-helper-clearfix">
			<div class="ui-dialog-title tripHeader" >{{= name}} ({{= count}})</div>
			<button class="edit_trip">${message(code: 'trip.edit')}</button><button class="new_route">${message(code: 'route.select.new')}</button></div>
			<div class="routes"></div>
</div>
	</script>
	<script id="routeTmpl" type="text/x-jquery-tmpl">
	<div class="route">
		<div class="routeText">
		<span>A:{{= origin.name}} - B:{{= destination.name}}</span>
		<strong>({{= name}})</strong>
		</div>
		<button class="edit_route">${message(code: 'route.edit')}</button>
		<button class="disable_route">${message(code: 'route.disable')}</button>
		<br/>
	</div>
	</script>
	<div class="item gradient ui-corner-all shadow-all">
		<!-- results will ony show if there is a result to show -->
		<div id="results" style="display: none;">
			<!-- the directions will be loaded in the directions div -->
			<div id="directions"></div>
		</div>

		<div id="map_canvas"></div>

		<div id="trip_canvas">
			<div id="tripList"></div>
			<button id="createNewTrip">${message(code: 'trip.create')}</button>
		</div>
		<div id="search_canvas">
			<form action="#" method="post" onsubmit="return false;">
				<fieldset>
					<input type="text" id="search_address" name="search" class="" /> <input
						type="checkbox" id="addMarker_btn" /><label for="addMarker_btn"
						class="addMarker_btn"><img
						src="${createLinkTo(dir: 'images/markers', file: 'map_marker.png')}" />
					</label>
					<button id="search_btn">Search</button>

				</fieldset>
			</form>
		</div>
	</div>

	<div id="modal"></div>
</body>
</html>
