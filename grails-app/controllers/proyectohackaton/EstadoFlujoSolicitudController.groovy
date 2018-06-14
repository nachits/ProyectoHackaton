package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstadoFlujoSolicitudController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EstadoFlujoSolicitud.list(params), model:[estadoFlujoSolicitudInstanceCount: EstadoFlujoSolicitud.count()]
    }

    def show(EstadoFlujoSolicitud estadoFlujoSolicitudInstance) {
        respond estadoFlujoSolicitudInstance
    }

    def create() {
        respond new EstadoFlujoSolicitud(params)
    }

    @Transactional
    def save(EstadoFlujoSolicitud estadoFlujoSolicitudInstance) {
        if (estadoFlujoSolicitudInstance == null) {
            notFound()
            return
        }

        if (estadoFlujoSolicitudInstance.hasErrors()) {
            respond estadoFlujoSolicitudInstance.errors, view:'create'
            return
        }

        estadoFlujoSolicitudInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estadoFlujoSolicitudInstance.label', default: 'EstadoFlujoSolicitud'), estadoFlujoSolicitudInstance.id])
                redirect estadoFlujoSolicitudInstance
            }
            '*' { respond estadoFlujoSolicitudInstance, [status: CREATED] }
        }
    }

    def edit(EstadoFlujoSolicitud estadoFlujoSolicitudInstance) {
        respond estadoFlujoSolicitudInstance
    }

    @Transactional
    def update(EstadoFlujoSolicitud estadoFlujoSolicitudInstance) {
        if (estadoFlujoSolicitudInstance == null) {
            notFound()
            return
        }

        if (estadoFlujoSolicitudInstance.hasErrors()) {
            respond estadoFlujoSolicitudInstance.errors, view:'edit'
            return
        }

        estadoFlujoSolicitudInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EstadoFlujoSolicitud.label', default: 'EstadoFlujoSolicitud'), estadoFlujoSolicitudInstance.id])
                redirect estadoFlujoSolicitudInstance
            }
            '*'{ respond estadoFlujoSolicitudInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EstadoFlujoSolicitud estadoFlujoSolicitudInstance) {

        if (estadoFlujoSolicitudInstance == null) {
            notFound()
            return
        }

        estadoFlujoSolicitudInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EstadoFlujoSolicitud.label', default: 'EstadoFlujoSolicitud'), estadoFlujoSolicitudInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoFlujoSolicitudInstance.label', default: 'EstadoFlujoSolicitud'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
