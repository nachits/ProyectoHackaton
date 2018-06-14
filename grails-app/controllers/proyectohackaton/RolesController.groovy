package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RolesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Roles.list(params), model:[rolesInstanceCount: Roles.count()]
    }

    def show(Roles rolesInstance) {
        respond rolesInstance
    }

    def create() {
        respond new Roles(params)
    }

    @Transactional
    def save(Roles rolesInstance) {
        if (rolesInstance == null) {
            notFound()
            return
        }

        if (rolesInstance.hasErrors()) {
            respond rolesInstance.errors, view:'create'
            return
        }

        rolesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rolesInstance.label', default: 'Roles'), rolesInstance.id])
                redirect rolesInstance
            }
            '*' { respond rolesInstance, [status: CREATED] }
        }
    }

    def edit(Roles rolesInstance) {
        respond rolesInstance
    }

    @Transactional
    def update(Roles rolesInstance) {
        if (rolesInstance == null) {
            notFound()
            return
        }

        if (rolesInstance.hasErrors()) {
            respond rolesInstance.errors, view:'edit'
            return
        }

        rolesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Roles.label', default: 'Roles'), rolesInstance.id])
                redirect rolesInstance
            }
            '*'{ respond rolesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Roles rolesInstance) {

        if (rolesInstance == null) {
            notFound()
            return
        }

        rolesInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Roles.label', default: 'Roles'), rolesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rolesInstance.label', default: 'Roles'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
