package com.bullsora.kidtimer



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RemoteOverrideController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RemoteOverride.list(params), model:[remoteOverrideInstanceCount: RemoteOverride.count()]
    }

    def show(RemoteOverride remoteOverrideInstance) {
        respond remoteOverrideInstance
    }

    def create() {
        respond new RemoteOverride(params)
    }

    @Transactional
    def save(RemoteOverride remoteOverrideInstance) {
        if (remoteOverrideInstance == null) {
            notFound()
            return
        }

        if (remoteOverrideInstance.hasErrors()) {
            respond remoteOverrideInstance.errors, view:'create'
            return
        }

        remoteOverrideInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'remoteOverride.label', default: 'RemoteOverride'), remoteOverrideInstance.id])
                redirect remoteOverrideInstance
            }
            '*' { respond remoteOverrideInstance, [status: CREATED] }
        }
    }

    def edit(RemoteOverride remoteOverrideInstance) {
        respond remoteOverrideInstance
    }

    @Transactional
    def update(RemoteOverride remoteOverrideInstance) {
        if (remoteOverrideInstance == null) {
            notFound()
            return
        }

        if (remoteOverrideInstance.hasErrors()) {
            respond remoteOverrideInstance.errors, view:'edit'
            return
        }

        remoteOverrideInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RemoteOverride.label', default: 'RemoteOverride'), remoteOverrideInstance.id])
                redirect remoteOverrideInstance
            }
            '*'{ respond remoteOverrideInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RemoteOverride remoteOverrideInstance) {

        if (remoteOverrideInstance == null) {
            notFound()
            return
        }

        remoteOverrideInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RemoteOverride.label', default: 'RemoteOverride'), remoteOverrideInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'remoteOverride.label', default: 'RemoteOverride'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
