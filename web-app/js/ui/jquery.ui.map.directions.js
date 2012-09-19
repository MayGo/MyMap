/*!
 * jQuery UI Google Map 3.0-alpha
 * http://code.google.com/p/jquery-ui-map/
 * Copyright (c) 2010 - 2011 Johan Säll Larsson
 * Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
 *
 * Depends:
 *		jquery.ui.map.js
 */
(function($) {

	$.extend($.ui.gmap.prototype, {

		/**
		 * Computes directions between two or more places.
		 * 
		 * @param directionsRequest:google.maps.DirectionsRequest
		 * @param
		 *            directionsRendererOptions:google.maps.DirectionsRendererOptions
		 *            (optional)
		 * @param callback:function(result:google.maps.DirectionsResult,
		 *            status:google.maps.DirectionsStatus)
		 * @see http://code.google.com/intl/sv-SE/apis/maps/documentation/javascript/reference.html#DirectionsRequest
		 * @see http://code.google.com/intl/sv-SE/apis/maps/documentation/javascript/reference.html#DirectionsRendererOptions
		 * @see http://code.google.com/intl/sv-SE/apis/maps/documentation/javascript/reference.html#DirectionsResult
		 */
		displayDirections : function(a, b, c, s) {

			var d = this;
			var e = this.get('services > DirectionsService',
					new google.maps.DirectionsService());
			var f = this.get('services > DirectionsRenderer' + s,
					new google.maps.DirectionsRenderer());

			var dir = this.get('directionsRenderers', []);

			f.setOptions(b);
			 google.maps.event.addListener(f, 'click', (function(event,index){
			   
			alert("click");
			    infowindow.setContent("sdfsdf");
			    infowindow.position = event.latLng;
			    infowindow.open(d.get('map'));
			      
			    }));
			e.route(a, function(g, h) {
				if (h === 'OK') {
					if (b.panel) {
						f.setDirections(g);
					}
					f.setMap(d.get('map'));

				} else {
					f.setMap(null);
				}

				if (s) {
					dir[s] = f;
				} else {
					dir.push(f);
				}

				d._call(c, g, h);
			});
		},
		toggleDirectionsRenderer : function(id, enabled) {
			var dirs = this.get('directionsRenderers');

			var dir = dirs[id];
			if (dir) {
				dir.setOptions({
					'suppressPolylines' : enabled
				});
				dir.setMap(dir.getMap());
			} else {
				alert("NO dir");
			}
		},
		removeDirectionsRenderer : function(id) {
			var dirs = this.get('directionsRenderers');

			var dir = dirs[id];
			if (dir) {
				dir.setMap(null);

				// alert(dir.getOptions());
			} else {
				alert("NO dir");
			}
		},
		getDirectionRoutes : function(id) {
			var dirs = this.get('directionsRenderers');
			var dir = dirs[id];
			if (dir) {
				return dir.getDirections().routes;
			} else {
				alert("NO dir");
				return null;
			}
		},

	// findDirection: function(a, b, c, d) {
	// var e = this.get('markers');
	// for ( f in e ) {
	// var g = ( c && e[f][a] ) ? ( e[f][a].split(c).indexOf(b) > -1 ) : (
	// e[f][a] === b );
	// this._call(d, e[f], g);
	// };
	// },
	});

}(jQuery));