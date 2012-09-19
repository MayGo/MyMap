<%=packageName%>

			<g:if test="\${flash.message}">
			<div class="message" role="status">\${flash.message}</div>
			</g:if>
			<g:hasErrors bean="\${${propertyName}}">
			<ul class="errors" role="alert">
				<g:eachError bean="\${${propertyName}}" var="error">
				<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
			<g:hiddenField name="modal" value="modal" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
						<g:submitToRemote name="create" action="save" 
         onSuccess=" jQuery.modal.onSuccess(data, '#modal')" onFailure=" jQuery.modal.onFailure(data)"
                   value="\${message(code: 'default.button.create.label', default: 'Create')}"  /></fieldset>
			</g:form>
