<%@ page import="ee.planet.maix.Car" %>

<g:if test="${flash.message}">
	<div class="message" role="status">${flash.message}</div>
</g:if>
<g:hasErrors bean="${carInstance}">
	<ul class="errors" role="alert">
		<g:eachError bean="${carInstance}" var="error">
			<li
				<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
					error="${error}" />
			</li>
		</g:eachError>
	</ul>
</g:hasErrors>
<g:form method="post"
	>
	<g:hiddenField name="id" value="${carInstance?.id}" />
	<g:hiddenField name="version" value="${carInstance?.version}" />
	<g:hiddenField name="modal" value="modal" />
	<fieldset class="form">
		<g:render template="form" />
	</fieldset>
	<fieldset class="buttons">
		<g:submitToRemote name="update" action="update"
			onSuccess=" jQuery.modal.onSuccess(data, '#modal');" onFailure=" jQuery.modal.onFailure(data)"
			value="${message(code: 'default.button.update.label')}" />

		<g:submitToRemote name="delete" action="delete"
			onSuccess=" jQuery.modal.onSuccess(data, '#modal');"
			onFailure=" jQuery.modal.onFailure(data)"
			value="${message(code: 'default.button.delete.label')}" />

	</fieldset>
</g:form>
