package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstadoSolicitudController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EstadoSolicitud.list(params), model:[estadoSolicitudInstanceCount: EstadoSolicitud.count()]
    }

    def show(EstadoSolicitud estadoSolicitudInstance) {
        respond estadoSolicitudInstance
    }

    def create() {
        respond new EstadoSolicitud(params)
    }

    @Transactional
    def save(EstadoSolicitud estadoSolicitudInstance) {
        if (estadoSolicitudInstance == null) {
            notFound()
            return
        }

        if (estadoSolicitudInstance.hasErrors()) {
            respond estadoSolicitudInstance.errors, view:'create'
            return
        }

        estadoSolicitudInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estadoSolicitudInstance.label', default: 'EstadoSolicitud'), estadoSolicitudInstance.id])
                redirect estadoSolicitudInstance
            }
            '*' { respond estadoSolicitudInstance, [status: CREATED] }
        }
    }

    def edit(EstadoSolicitud estadoSolicitudInstance) {
        respond estadoSolicitudInstance
    }

    @Transactional
    def update(EstadoSolicitud estadoSolicitudInstance) {
        if (estadoSolicitudInstance == null) {
            notFound()
            return
        }

        if (estadoSolicitudInstance.hasErrors()) {
            respond estadoSolicitudInstance.errors, view:'edit'
            return
        }

        estadoSolicitudInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EstadoSolicitud.label', default: 'EstadoSolicitud'), estadoSolicitudInstance.id])
                redirect estadoSolicitudInstance
            }
            '*'{ respond estadoSolicitudInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EstadoSolicitud estadoSolicitudInstance) {

        if (estadoSolicitudInstance == null) {
            notFound()
            return
        }

        estadoSolicitudInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EstadoSolicitud.label', default: 'EstadoSolicitud'), estadoSolicitudInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoSolicitudInstance.label', default: 'EstadoSolicitud'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
