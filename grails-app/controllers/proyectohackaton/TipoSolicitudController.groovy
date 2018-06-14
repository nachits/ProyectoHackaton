package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoSolicitudController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoSolicitud.list(params), model:[tipoSolicitudInstanceCount: TipoSolicitud.count()]
    }

    def show(TipoSolicitud tipoSolicitudInstance) {
        respond tipoSolicitudInstance
    }

    def create() {
        respond new TipoSolicitud(params)
    }

    @Transactional
    def save(TipoSolicitud tipoSolicitudInstance) {
        if (tipoSolicitudInstance == null) {
            notFound()
            return
        }

        if (tipoSolicitudInstance.hasErrors()) {
            respond tipoSolicitudInstance.errors, view:'create'
            return
        }

        tipoSolicitudInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoSolicitudInstance.label', default: 'TipoSolicitud'), tipoSolicitudInstance.id])
                redirect tipoSolicitudInstance
            }
            '*' { respond tipoSolicitudInstance, [status: CREATED] }
        }
    }

    def edit(TipoSolicitud tipoSolicitudInstance) {
        respond tipoSolicitudInstance
    }

    @Transactional
    def update(TipoSolicitud tipoSolicitudInstance) {
        if (tipoSolicitudInstance == null) {
            notFound()
            return
        }

        if (tipoSolicitudInstance.hasErrors()) {
            respond tipoSolicitudInstance.errors, view:'edit'
            return
        }

        tipoSolicitudInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoSolicitud.label', default: 'TipoSolicitud'), tipoSolicitudInstance.id])
                redirect tipoSolicitudInstance
            }
            '*'{ respond tipoSolicitudInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoSolicitud tipoSolicitudInstance) {

        if (tipoSolicitudInstance == null) {
            notFound()
            return
        }

        tipoSolicitudInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoSolicitud.label', default: 'TipoSolicitud'), tipoSolicitudInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoSolicitudInstance.label', default: 'TipoSolicitud'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
