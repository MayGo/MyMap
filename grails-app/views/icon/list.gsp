
<%@ page import="ee.planet.maix.Icon" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'icon.label', default: 'Icon')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-icon" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-icon" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'icon.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="uri" title="${message(code: 'icon.uri.label', default: 'Uri')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${iconInstanceList}" status="i" var="iconInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${iconInstance.id}">${fieldValue(bean: iconInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: iconInstance, field: "uri")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${iconInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
