package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstadoColaboradorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EstadoColaborador.list(params), model:[estadoColaboradorInstanceCount: EstadoColaborador.count()]
    }

    def show(EstadoColaborador estadoColaboradorInstance) {
        respond estadoColaboradorInstance
    }

    def create() {
        respond new EstadoColaborador(params)
    }

    @Transactional
    def save(EstadoColaborador estadoColaboradorInstance) {
        if (estadoColaboradorInstance == null) {
            notFound()
            return
        }

        if (estadoColaboradorInstance.hasErrors()) {
            respond estadoColaboradorInstance.errors, view:'create'
            return
        }

        estadoColaboradorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estadoColaboradorInstance.label', default: 'EstadoColaborador'), estadoColaboradorInstance.id])
                redirect estadoColaboradorInstance
            }
            '*' { respond estadoColaboradorInstance, [status: CREATED] }
        }
    }

    def edit(EstadoColaborador estadoColaboradorInstance) {
        respond estadoColaboradorInstance
    }

    @Transactional
    def update(EstadoColaborador estadoColaboradorInstance) {
        if (estadoColaboradorInstance == null) {
            notFound()
            return
        }

        if (estadoColaboradorInstance.hasErrors()) {
            respond estadoColaboradorInstance.errors, view:'edit'
            return
        }

        estadoColaboradorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EstadoColaborador.label', default: 'EstadoColaborador'), estadoColaboradorInstance.id])
                redirect estadoColaboradorInstance
            }
            '*'{ respond estadoColaboradorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EstadoColaborador estadoColaboradorInstance) {

        if (estadoColaboradorInstance == null) {
            notFound()
            return
        }

        estadoColaboradorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EstadoColaborador.label', default: 'EstadoColaborador'), estadoColaboradorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoColaboradorInstance.label', default: 'EstadoColaborador'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
