<%@ page import="ee.planet.maix.Trip" %>



<div class="fieldcontain ${hasErrors(bean: tripInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="trip.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${tripInstance?.name}"/>
</div>
<div class="fieldcontain ">
	<label for="name">
		<g:message code="trip.distance.label" default="Distance" />
		
	</label>${tripInstance?.distance?tripInstance?.distance/1000:0} <g:message code="unit.km" default="km" />
</div>
<div class="fieldcontain ">
	<label for="name">
		<g:message code="trip.duration.label" default="Duration" />
	</label>${tripInstance?.duration?tripInstance?.duration/3600:0} <g:message code="unit.hours" default="h" />
</div>
<div class="fieldcontain ">
	<label for="name">
		<g:message code="trip.fuelConsumption.label" default="Fuel consumption" />
	</label>${tripInstance?.fuelConsumption?tripInstance?.fuelConsumption:0} <g:message code="unit.liters" default="l" />
</div>
<div class="fieldcontain ">
	<label for="name">
		<g:message code="trip.fuelCost.label" default="Money for fuel" />
	</label>${tripInstance?.fuelCost?tripInstance?.fuelCost:0} <g:message code="unit.euro" default="Euros" />
</div>
<%-- <div class="fieldcontain ${hasErrors(bean: tripInstance, field: 'routes', 'error')} ">
	<label for="routes">
		<g:message code="trip.routes.label" default="Routes" />
		
	</label>
	<g:select name="routes" from="${ee.planet.maix.Route.list()}" multiple="multiple" optionKey="id" size="5" value="${tripInstance?.routes*.id}" class="many-to-many"/>
</div>--%>

