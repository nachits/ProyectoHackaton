package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConfiguracionSolicitudAutorizacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConfiguracionSolicitudAutorizacion.list(params), model:[configuracionSolicitudAutorizacionInstanceCount: ConfiguracionSolicitudAutorizacion.count()]
    }

    def show(ConfiguracionSolicitudAutorizacion configuracionSolicitudAutorizacionInstance) {
        respond configuracionSolicitudAutorizacionInstance
    }

    def create() {
        respond new ConfiguracionSolicitudAutorizacion(params)
    }

    @Transactional
    def save(ConfiguracionSolicitudAutorizacion configuracionSolicitudAutorizacionInstance) {
        if (configuracionSolicitudAutorizacionInstance == null) {
            notFound()
            return
        }

        if (configuracionSolicitudAutorizacionInstance.hasErrors()) {
            respond configuracionSolicitudAutorizacionInstance.errors, view:'create'
            return
        }

        configuracionSolicitudAutorizacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'configuracionSolicitudAutorizacionInstance.label', default: 'ConfiguracionSolicitudAutorizacion'), configuracionSolicitudAutorizacionInstance.id])
                redirect configuracionSolicitudAutorizacionInstance
            }
            '*' { respond configuracionSolicitudAutorizacionInstance, [status: CREATED] }
        }
    }

    def edit(ConfiguracionSolicitudAutorizacion configuracionSolicitudAutorizacionInstance) {
        respond configuracionSolicitudAutorizacionInstance
    }

    @Transactional
    def update(ConfiguracionSolicitudAutorizacion configuracionSolicitudAutorizacionInstance) {
        if (configuracionSolicitudAutorizacionInstance == null) {
            notFound()
            return
        }

        if (configuracionSolicitudAutorizacionInstance.hasErrors()) {
            respond configuracionSolicitudAutorizacionInstance.errors, view:'edit'
            return
        }

        configuracionSolicitudAutorizacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConfiguracionSolicitudAutorizacion.label', default: 'ConfiguracionSolicitudAutorizacion'), configuracionSolicitudAutorizacionInstance.id])
                redirect configuracionSolicitudAutorizacionInstance
            }
            '*'{ respond configuracionSolicitudAutorizacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConfiguracionSolicitudAutorizacion configuracionSolicitudAutorizacionInstance) {

        if (configuracionSolicitudAutorizacionInstance == null) {
            notFound()
            return
        }

        configuracionSolicitudAutorizacionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConfiguracionSolicitudAutorizacion.label', default: 'ConfiguracionSolicitudAutorizacion'), configuracionSolicitudAutorizacionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracionSolicitudAutorizacionInstance.label', default: 'ConfiguracionSolicitudAutorizacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
