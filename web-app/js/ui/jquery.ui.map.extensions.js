
/*!
 * jQuery UI Google Map 3.0-alpha
 * http://code.google.com/p/jquery-ui-map/
 * Copyright (c) 2010 - 2011 Johan Säll Larsson
 * Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
 *
 * Depends:
 *      jquery.ui.map.js
 */
( function($) {

	$.extend($.ui.gmap.prototype, {
		 
		/**
		 * Gets the current position
		 * @param callback:function(position, status)
		 * @param geoPositionOptions:object, see https://developer.mozilla.org/en/XPCOM_Interface_Reference/nsIDOMGeoPositionOptions
		 */
		getCurrentPosition: function(a, b) {
		    
			var c = this;
			if ( navigator.geolocation ) {
				navigator.geolocation.getCurrentPosition ( 
					function(position) {
						c._call(a, position, "OK");
					}, 
					function(error) {
						c._call(a, null, error);
					}, 
					b 
				);	
			} else {
				c._call(a, null, "NOT_SUPPORTED");
			}
		},
		
		/**
		 * Watches current position
		 * To clear watch, call navigator.geolocation.clearWatch(this.get('watch'));
		 * @param callback:function(position, status)
		 * @param geoPositionOptions:object, see https://developer.mozilla.org/en/XPCOM_Interface_Reference/nsIDOMGeoPositionOptions
		 */
		watchPosition: function(a, b) {
			var c = this;
			if ( navigator.geolocation ) {
				this.set('watch', navigator.geolocation.watchPosition ( 
					function(position) {
						c._call(a, position, "OK");
					}, 
					function(error) {
						c._call(a, null, error);
					}, 
					b 
				));	
			} else {
				c._call(a, null, "NOT_SUPPORTED");
			}
		},
		/**
		 * Autocomplete using Google Geocoder
		 * 
		 * @param panel:string/node/jquery
		 * @param callback:function(ui)
		 *                called whenever something is selected
		 */
		autocomplete : function(panel, callback) {
		    
		    var self = this;
		    $(this._unwrap(panel)).autocomplete(
			    {
				source : function(request, response) {
				    self.search({
					'address' : request.term
				    }, function(results, status) {
					if (status === 'OK') {
					    response($.map(results, function(item) {
						return {
						    label : item.formatted_address,
						    value : item.formatted_address,
						    position : item.geometry.location
						}
					    }));
					}
				    });
				},
				minLength : 3,
				select : function(event, ui) {
				    self._call(callback, ui);
				},
				open : function() {
				    $(this).removeClass("ui-corner-all").addClass(
					    "ui-corner-top");
				},
				close : function() {
				    $(this).removeClass("ui-corner-top").addClass(
					    "ui-corner-all");
				}
			    });
		}
		
	
	});
	
} (jQuery) );