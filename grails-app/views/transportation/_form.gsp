<%@ page import="ee.planet.maix.Transportation" %>



<div class="fieldcontain ${hasErrors(bean: transportationInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="transportation.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${transportationInstance?.name}"/>
</div>

