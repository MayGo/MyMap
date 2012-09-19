<%@ page import="ee.planet.maix.Route" %>



<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'duration', 'error')} required">
	<label for="duration">
		<g:message code="route.duration.label" default="Duration" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="duration" required="" value="${fieldValue(bean: routeInstance, field: 'duration')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'durationText', 'error')} ">
	<label for="durationText">
		<g:message code="route.durationText.label" default="Duration Text" />
		
	</label>
	<g:textField name="durationText" value="${routeInstance?.durationText}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'distance', 'error')} required">
	<label for="distance">
		<g:message code="route.distance.label" default="Distance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="distance" required="" value="${fieldValue(bean: routeInstance, field: 'distance')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'distanceText', 'error')} ">
	<label for="distanceText">
		<g:message code="route.distanceText.label" default="Distance Text" />
		
	</label>
	<g:textField name="distanceText" value="${routeInstance?.distanceText}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'origin', 'error')} required">
	<label for="origin">
		<g:message code="route.origin.label" default="Origin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="origin" name="origin.id" from="${ee.planet.maix.Marker.list()}" optionKey="id" required="" value="${routeInstance?.origin?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'destination', 'error')} required">
	<label for="destination">
		<g:message code="route.destination.label" default="Destination" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="destination" name="destination.id" from="${ee.planet.maix.Marker.list()}" optionKey="id" required="" value="${routeInstance?.destination?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="route.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${routeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'transportation', 'error')} required">
	<label for="transportation">
		<g:message code="route.transportation.label" default="Transportation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="transportation" name="transportation.id" from="${ee.planet.maix.Transportation.list()}" optionKey="id" required="" value="${routeInstance?.transportation?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'trips', 'error')} ">
	<label for="trips">
		<g:message code="route.trips.label" default="Trips" />
		
	</label>
	
</div>

