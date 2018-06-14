package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PlantillaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Plantilla.list(params), model:[plantillaInstanceCount: Plantilla.count()]
    }

    def show(Plantilla plantillaInstance) {
        respond plantillaInstance
    }

    def create() {
        respond new Plantilla(params)
    }

    @Transactional
    def save(Plantilla plantillaInstance) {
        if (plantillaInstance == null) {
            notFound()
            return
        }

        if (plantillaInstance.hasErrors()) {
            respond plantillaInstance.errors, view:'create'
            return
        }

        plantillaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'plantillaInstance.label', default: 'Plantilla'), plantillaInstance.id])
                redirect plantillaInstance
            }
            '*' { respond plantillaInstance, [status: CREATED] }
        }
    }

    def edit(Plantilla plantillaInstance) {
        respond plantillaInstance
    }

    @Transactional
    def update(Plantilla plantillaInstance) {
        if (plantillaInstance == null) {
            notFound()
            return
        }

        if (plantillaInstance.hasErrors()) {
            respond plantillaInstance.errors, view:'edit'
            return
        }

        plantillaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Plantilla.label', default: 'Plantilla'), plantillaInstance.id])
                redirect plantillaInstance
            }
            '*'{ respond plantillaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Plantilla plantillaInstance) {

        if (plantillaInstance == null) {
            notFound()
            return
        }

        plantillaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Plantilla.label', default: 'Plantilla'), plantillaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'plantillaInstance.label', default: 'Plantilla'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
