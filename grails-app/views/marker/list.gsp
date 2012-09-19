
<%@ page import="ee.planet.maix.Marker" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'marker.label', default: 'Marker')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-marker" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-marker" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="image" title="${message(code: 'marker.image.label', default: 'Image')}" />
					
						<g:sortableColumn property="lat" title="${message(code: 'marker.lat.label', default: 'Lat')}" />
					
						<g:sortableColumn property="lng" title="${message(code: 'marker.lng.label', default: 'Lng')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'marker.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${markerInstanceList}" status="i" var="markerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${markerInstance.id}">${fieldValue(bean: markerInstance, field: "image")}</g:link></td>
					
						<td>${fieldValue(bean: markerInstance, field: "lat")}</td>
					
						<td>${fieldValue(bean: markerInstance, field: "lng")}</td>
					
						<td>${fieldValue(bean: markerInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${markerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
