
<%@ page import="ee.planet.maix.Route" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'route.label', default: 'Route')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-route" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-route" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list route">
			
				<g:if test="${routeInstance?.duration}">
				<li class="fieldcontain">
					<span id="duration-label" class="property-label"><g:message code="route.duration.label" default="Duration" /></span>
					
						<span class="property-value" aria-labelledby="duration-label"><g:fieldValue bean="${routeInstance}" field="duration"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${routeInstance?.durationText}">
				<li class="fieldcontain">
					<span id="durationText-label" class="property-label"><g:message code="route.durationText.label" default="Duration Text" /></span>
					
						<span class="property-value" aria-labelledby="durationText-label"><g:fieldValue bean="${routeInstance}" field="durationText"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${routeInstance?.distance}">
				<li class="fieldcontain">
					<span id="distance-label" class="property-label"><g:message code="route.distance.label" default="Distance" /></span>
					
						<span class="property-value" aria-labelledby="distance-label"><g:fieldValue bean="${routeInstance}" field="distance"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${routeInstance?.distanceText}">
				<li class="fieldcontain">
					<span id="distanceText-label" class="property-label"><g:message code="route.distanceText.label" default="Distance Text" /></span>
					
						<span class="property-value" aria-labelledby="distanceText-label"><g:fieldValue bean="${routeInstance}" field="distanceText"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${routeInstance?.origin}">
				<li class="fieldcontain">
					<span id="origin-label" class="property-label"><g:message code="route.origin.label" default="Origin" /></span>
					
						<span class="property-value" aria-labelledby="origin-label"><g:link controller="marker" action="show" id="${routeInstance?.origin?.id}">${routeInstance?.origin?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${routeInstance?.destination}">
				<li class="fieldcontain">
					<span id="destination-label" class="property-label"><g:message code="route.destination.label" default="Destination" /></span>
					
						<span class="property-value" aria-labelledby="destination-label"><g:link controller="marker" action="show" id="${routeInstance?.destination?.id}">${routeInstance?.destination?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${routeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="route.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${routeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${routeInstance?.transportation}">
				<li class="fieldcontain">
					<span id="transportation-label" class="property-label"><g:message code="route.transportation.label" default="Transportation" /></span>
					
						<span class="property-value" aria-labelledby="transportation-label"><g:link controller="transportation" action="show" id="${routeInstance?.transportation?.id}">${routeInstance?.transportation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${routeInstance?.trips}">
				<li class="fieldcontain">
					<span id="trips-label" class="property-label"><g:message code="route.trips.label" default="Trips" /></span>
					
						<g:each in="${routeInstance.trips}" var="t">
						<span class="property-value" aria-labelledby="trips-label"><g:link controller="trip" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${routeInstance?.id}" />
					<g:link class="edit" action="edit" id="${routeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
