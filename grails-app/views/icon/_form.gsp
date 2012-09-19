<%@ page import="ee.planet.maix.Icon" %>



<div class="fieldcontain ${hasErrors(bean: iconInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="icon.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${iconInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: iconInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="icon.tags.label" default="Tags" />
		
	</label>
	<g:select name="tags" from="${ee.planet.maix.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${iconInstance?.tags*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: iconInstance, field: 'uri', 'error')} ">
	<label for="uri">
		<g:message code="icon.uri.label" default="Uri" />
		
	</label>
	<g:textField name="uri" value="${iconInstance?.uri}"/>
</div>

