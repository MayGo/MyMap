<%=packageName ? "package ${packageName}\n\n" : ''%>import org.springframework.dao.DataIntegrityViolationException

import grails.converters.JSON
class ${className}Controller {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [${propertyName}List: ${className}.list(params), ${propertyName}Total: ${className}.count()]
    }
	def listJSON(){
		def ${propertyName}List=${className}.list(params)

		//def ${propertyName}Formatted=${propertyName}List.collect{[it]}
		render ${propertyName}List as JSON
	}
	def create() {
		def ${propertyName} = ${className}.get(params.id)
		if(params.modal){
			if (${propertyName}) {
				render(template: "modalEdit", model: [${propertyName}: ${propertyName}])
			}else{
				render(template: "modal", model: [${propertyName}: new ${className}()])
			}
		}else{
			[${propertyName}: new ${className}(params)]
		}
	}
	def saveAJAX() {
		def ${propertyName} = new ${className}(params)
		if (!${propertyName}.save(flush: true)) {
			render ${propertyName} .errors.allErrors.collect {
				message(error:it,encodeAs:'HTML')
			}
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: '${domainClass.propertyName}.label'),
			${propertyName} .id
		])
		render flash.message
	}
	def save() {
		def ${propertyName} = new ${className}(params)
		if(params.modal){
			if (!${propertyName}.save(flush: true)) {
				render(view: "create", model: [${propertyName}: ${propertyName}])
				return
			}
			render message(code: 'default.created.message', args: [
				message(code: '${domainClass.propertyName}.label'),
				${propertyName}.id
			])
		}else{
			if (!${propertyName}.save(flush: true)) {
				render(view: "create", model: [${propertyName}: ${propertyName}])
				return
			}

			flash.message = message(code: 'default.created.message', args: [
				message(code: '${domainClass.propertyName}.label'),
				${propertyName}.id
			])
			redirect(action: "show", id: ${propertyName}.id)
		}
	}
	def show() {
		def ${propertyName} = ${className}.get(params.id)

		if(params.modal){
			if (!${propertyName}) {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: '${domainClass.propertyName}.label'),
					params.id
				])
				render "error"
				return
			}
			render(template: "show", model: [${propertyName}: ${propertyName}])
		}else{

			if (!${propertyName}) {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: '${domainClass.propertyName}.label'),
					params.id
				])
				redirect(action: "list")
				return
			}
			[${propertyName}: ${propertyName}]
		}

	}
	def edit() {
		 def ${propertyName} = ${className}.get(params.id)
		if(params.modal){
			if (!${propertyName}) {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: '${domainClass.propertyName}.label'),
					params.id
				])
				render "error"
				return
			}
			render(template: "edit", model: [${propertyName}: ${propertyName}])
		}else{

			if (!${propertyName}) {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: '${domainClass.propertyName}.label'),
					params.id
				])
				redirect(action: "list")
				return
			}
			[${propertyName}: ${propertyName}]
		}
	}

	def update() {
		def ${propertyName} =  ${className}.get(params.id)
		if (!${propertyName}) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: '${domainClass.propertyName}.label'),
				params.id
			])
			if(params.modal)render flash.message
			else redirect(action: "list")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (${propertyName}.version > version) {
				${propertyName}.errors.rejectValue("version", "default.optimistic.locking.failure",
				[
					message(code: '${domainClass.propertyName}.label')]
				as Object[])
				if(params.modal)render flash.message
				else render(view: "edit", model: [${propertyName}: ${propertyName}])
				return
			}
		}

		${propertyName}.properties = params

		if (!${propertyName}.save(flush: true)) {
			if(params.modal)render flash.message
			else  render(view: "edit", model: [${propertyName}: ${propertyName}])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: '${domainClass.propertyName}.label'),
			${propertyName}.id
		])
		if(params.modal)render flash.message
		else  redirect(action: "show", id: ${propertyName}.id)
	}

	def delete() {
		def ${propertyName} = ${className}.get(params.id)
		if (!${propertyName}) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: '${domainClass.propertyName}.label'),
				params.id
			])
			if(params.modal)render flash.message
			else redirect(action: "list")
			return
		}

		try {
			${propertyName}.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: '${domainClass.propertyName}.label'),
				params.id
			])
			if(params.modal)render flash.message
			else redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: '${domainClass.propertyName}.label'),
				params.id
			])
			if(params.modal)render flash.message
			else redirect(action: "show", id: params.id)
		}
	}
}
