
<%@ page import="ee.planet.maix.Marker" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'marker.label', default: 'Marker')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-marker" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-marker" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list marker">
			
				<g:if test="${markerInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="marker.image.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><g:fieldValue bean="${markerInstance}" field="image"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${markerInstance?.lat}">
				<li class="fieldcontain">
					<span id="lat-label" class="property-label"><g:message code="marker.lat.label" default="Lat" /></span>
					
						<span class="property-value" aria-labelledby="lat-label"><g:fieldValue bean="${markerInstance}" field="lat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${markerInstance?.lng}">
				<li class="fieldcontain">
					<span id="lng-label" class="property-label"><g:message code="marker.lng.label" default="Lng" /></span>
					
						<span class="property-value" aria-labelledby="lng-label"><g:fieldValue bean="${markerInstance}" field="lng"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${markerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="marker.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${markerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${markerInstance?.id}" />
					<g:link class="edit" action="edit" id="${markerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
