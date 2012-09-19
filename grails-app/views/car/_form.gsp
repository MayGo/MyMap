<%@ page import="ee.planet.maix.Car" %>



<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'fuelConsumption', 'error')} required">
	<label for="fuelConsumption">
		<g:message code="car.fuelConsumption.label" default="Fuel Consumption" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="fuelConsumption" required="" value="${fieldValue(bean: carInstance, field: 'fuelConsumption')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="car.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${carInstance?.name}"/>
</div>

