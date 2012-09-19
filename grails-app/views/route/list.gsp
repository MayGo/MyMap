
<%@ page import="ee.planet.maix.Route" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'route.label', default: 'Route')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-route" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-route" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="duration" title="${message(code: 'route.duration.label', default: 'Duration')}" />
					
						<g:sortableColumn property="durationText" title="${message(code: 'route.durationText.label', default: 'Duration Text')}" />
					
						<g:sortableColumn property="distance" title="${message(code: 'route.distance.label', default: 'Distance')}" />
					
						<g:sortableColumn property="distanceText" title="${message(code: 'route.distanceText.label', default: 'Distance Text')}" />
					
						<th><g:message code="route.origin.label" default="Origin" /></th>
					
						<th><g:message code="route.destination.label" default="Destination" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${routeInstanceList}" status="i" var="routeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${routeInstance.id}">${fieldValue(bean: routeInstance, field: "duration")}</g:link></td>
					
						<td>${fieldValue(bean: routeInstance, field: "durationText")}</td>
					
						<td>${fieldValue(bean: routeInstance, field: "distance")}</td>
					
						<td>${fieldValue(bean: routeInstance, field: "distanceText")}</td>
					
						<td>${fieldValue(bean: routeInstance, field: "origin")}</td>
					
						<td>${fieldValue(bean: routeInstance, field: "destination")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${routeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
