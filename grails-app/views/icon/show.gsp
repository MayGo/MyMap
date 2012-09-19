
<%@ page import="ee.planet.maix.Icon" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'icon.label', default: 'Icon')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-icon" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-icon" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list icon">
			
				<g:if test="${iconInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="icon.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${iconInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${iconInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="icon.tags.label" default="Tags" /></span>
					
						<g:each in="${iconInstance.tags}" var="t">
						<span class="property-value" aria-labelledby="tags-label"><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${iconInstance?.uri}">
				<li class="fieldcontain">
					<span id="uri-label" class="property-label"><g:message code="icon.uri.label" default="Uri" /></span>
					
						<span class="property-value" aria-labelledby="uri-label"><g:fieldValue bean="${iconInstance}" field="uri"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${iconInstance?.id}" />
					<g:link class="edit" action="edit" id="${iconInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
