package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PropiedadesSolicitudController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PropiedadesSolicitud.list(params), model:[propiedadesSolicitudInstanceCount: PropiedadesSolicitud.count()]
    }

    def show(PropiedadesSolicitud propiedadesSolicitudInstance) {
        respond propiedadesSolicitudInstance
    }

    def create() {
        respond new PropiedadesSolicitud(params)
    }

    @Transactional
    def save(PropiedadesSolicitud propiedadesSolicitudInstance) {
        if (propiedadesSolicitudInstance == null) {
            notFound()
            return
        }

        if (propiedadesSolicitudInstance.hasErrors()) {
            respond propiedadesSolicitudInstance.errors, view:'create'
            return
        }

        propiedadesSolicitudInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'propiedadesSolicitudInstance.label', default: 'PropiedadesSolicitud'), propiedadesSolicitudInstance.id])
                redirect propiedadesSolicitudInstance
            }
            '*' { respond propiedadesSolicitudInstance, [status: CREATED] }
        }
    }

    def edit(PropiedadesSolicitud propiedadesSolicitudInstance) {
        respond propiedadesSolicitudInstance
    }

    @Transactional
    def update(PropiedadesSolicitud propiedadesSolicitudInstance) {
        if (propiedadesSolicitudInstance == null) {
            notFound()
            return
        }

        if (propiedadesSolicitudInstance.hasErrors()) {
            respond propiedadesSolicitudInstance.errors, view:'edit'
            return
        }

        propiedadesSolicitudInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PropiedadesSolicitud.label', default: 'PropiedadesSolicitud'), propiedadesSolicitudInstance.id])
                redirect propiedadesSolicitudInstance
            }
            '*'{ respond propiedadesSolicitudInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PropiedadesSolicitud propiedadesSolicitudInstance) {

        if (propiedadesSolicitudInstance == null) {
            notFound()
            return
        }

        propiedadesSolicitudInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PropiedadesSolicitud.label', default: 'PropiedadesSolicitud'), propiedadesSolicitudInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'propiedadesSolicitudInstance.label', default: 'PropiedadesSolicitud'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
