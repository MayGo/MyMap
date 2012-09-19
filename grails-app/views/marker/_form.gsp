<%@ page import="ee.planet.maix.Marker" %>
	<script>
	$(function() {
		var markersPath="${createLinkTo(dir: 'images/markers')}";
		    $( "#markerImage" ).autocomplete({
				minLength: 0,
				source: "${createLink(controller: 'icon', action:'find')}",
				focus: function( event, ui ) {
					$( "#markerImage" ).val( ui.item.name );
					return false;
				},
				select: function( event, ui ) {
					$( "#markerImage-id" ).val( ui.item.id );
					//$( "#project-id" ).val( ui.item.value );
				//	$( "#project-description" ).html( ui.item.desc );
				//	$( "#project-icon" ).attr( "src", "images/" + ui.item.icon );
		
					return false;
				}
			}).data( "autocomplete" )._renderItem = function( ul, item ) {
				return $( "<li></li>" )
					.data( "item.autocomplete", item )
					.append( "<a><p  class='linkWithImage'><img src='" + markersPath+"/"+item.uri + "' /> " + item.name + "</p></a>" )
					.appendTo( ul );
			};

	});
	</script>

<div class="fieldcontain ${hasErrors(bean: markerInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="marker.image.label" default="Image" />
		
	</label>
	<g:hiddenField id="markerImage-id" name="image.id" value="${markerInstance?.image?.id}" />
	<g:textField id="markerImage"  name="imageName" value="${markerInstance?.image?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: markerInstance, field: 'lat', 'error')} ">
	<label for="lat">
		<g:message code="marker.lat.label" default="Lat" />
		
	</label>
	<g:textField name="lat" value="${markerInstance?.lat}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: markerInstance, field: 'lng', 'error')} ">
	<label for="lng">
		<g:message code="marker.lng.label" default="Lng" />
		
	</label>
	<g:textField name="lng" value="${markerInstance?.lng}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: markerInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="marker.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${markerInstance?.name}"/>
</div>

