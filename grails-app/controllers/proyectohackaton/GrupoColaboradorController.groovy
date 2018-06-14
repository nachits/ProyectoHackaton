package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GrupoColaboradorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond GrupoColaborador.list(params), model:[grupoColaboradorInstanceCount: GrupoColaborador.count()]
    }

    def show(GrupoColaborador grupoColaboradorInstance) {
        respond grupoColaboradorInstance
    }

    def create() {
        respond new GrupoColaborador(params)
    }

    @Transactional
    def save(GrupoColaborador grupoColaboradorInstance) {
        if (grupoColaboradorInstance == null) {
            notFound()
            return
        }

        if (grupoColaboradorInstance.hasErrors()) {
            respond grupoColaboradorInstance.errors, view:'create'
            return
        }

        grupoColaboradorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'grupoColaboradorInstance.label', default: 'GrupoColaborador'), grupoColaboradorInstance.id])
                redirect grupoColaboradorInstance
            }
            '*' { respond grupoColaboradorInstance, [status: CREATED] }
        }
    }

    def edit(GrupoColaborador grupoColaboradorInstance) {
        respond grupoColaboradorInstance
    }

    @Transactional
    def update(GrupoColaborador grupoColaboradorInstance) {
        if (grupoColaboradorInstance == null) {
            notFound()
            return
        }

        if (grupoColaboradorInstance.hasErrors()) {
            respond grupoColaboradorInstance.errors, view:'edit'
            return
        }

        grupoColaboradorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'GrupoColaborador.label', default: 'GrupoColaborador'), grupoColaboradorInstance.id])
                redirect grupoColaboradorInstance
            }
            '*'{ respond grupoColaboradorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(GrupoColaborador grupoColaboradorInstance) {

        if (grupoColaboradorInstance == null) {
            notFound()
            return
        }

        grupoColaboradorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'GrupoColaborador.label', default: 'GrupoColaborador'), grupoColaboradorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupoColaboradorInstance.label', default: 'GrupoColaborador'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
