package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoDatoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoDato.list(params), model:[tipoDatoInstanceCount: TipoDato.count()]
    }

    def show(TipoDato tipoDatoInstance) {
        respond tipoDatoInstance
    }

    def create() {
        respond new TipoDato(params)
    }

    @Transactional
    def save(TipoDato tipoDatoInstance) {
        if (tipoDatoInstance == null) {
            notFound()
            return
        }

        if (tipoDatoInstance.hasErrors()) {
            respond tipoDatoInstance.errors, view:'create'
            return
        }

        tipoDatoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoDatoInstance.label', default: 'TipoDato'), tipoDatoInstance.id])
                redirect tipoDatoInstance
            }
            '*' { respond tipoDatoInstance, [status: CREATED] }
        }
    }

    def edit(TipoDato tipoDatoInstance) {
        respond tipoDatoInstance
    }

    @Transactional
    def update(TipoDato tipoDatoInstance) {
        if (tipoDatoInstance == null) {
            notFound()
            return
        }

        if (tipoDatoInstance.hasErrors()) {
            respond tipoDatoInstance.errors, view:'edit'
            return
        }

        tipoDatoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoDato.label', default: 'TipoDato'), tipoDatoInstance.id])
                redirect tipoDatoInstance
            }
            '*'{ respond tipoDatoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoDato tipoDatoInstance) {

        if (tipoDatoInstance == null) {
            notFound()
            return
        }

        tipoDatoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoDato.label', default: 'TipoDato'), tipoDatoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoDatoInstance.label', default: 'TipoDato'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
