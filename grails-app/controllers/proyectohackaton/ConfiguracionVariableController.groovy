package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConfiguracionVariableController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConfiguracionVariable.list(params), model:[configuracionVariableInstanceCount: ConfiguracionVariable.count()]
    }

    def show(ConfiguracionVariable configuracionVariableInstance) {
        respond configuracionVariableInstance
    }

    def create() {
        respond new ConfiguracionVariable(params)
    }

    @Transactional
    def save(ConfiguracionVariable configuracionVariableInstance) {
        if (configuracionVariableInstance == null) {
            notFound()
            return
        }

        if (configuracionVariableInstance.hasErrors()) {
            respond configuracionVariableInstance.errors, view:'create'
            return
        }

        configuracionVariableInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'configuracionVariableInstance.label', default: 'ConfiguracionVariable'), configuracionVariableInstance.id])
                redirect configuracionVariableInstance
            }
            '*' { respond configuracionVariableInstance, [status: CREATED] }
        }
    }

    def edit(ConfiguracionVariable configuracionVariableInstance) {
        respond configuracionVariableInstance
    }

    @Transactional
    def update(ConfiguracionVariable configuracionVariableInstance) {
        if (configuracionVariableInstance == null) {
            notFound()
            return
        }

        if (configuracionVariableInstance.hasErrors()) {
            respond configuracionVariableInstance.errors, view:'edit'
            return
        }

        configuracionVariableInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConfiguracionVariable.label', default: 'ConfiguracionVariable'), configuracionVariableInstance.id])
                redirect configuracionVariableInstance
            }
            '*'{ respond configuracionVariableInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConfiguracionVariable configuracionVariableInstance) {

        if (configuracionVariableInstance == null) {
            notFound()
            return
        }

        configuracionVariableInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConfiguracionVariable.label', default: 'ConfiguracionVariable'), configuracionVariableInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracionVariableInstance.label', default: 'ConfiguracionVariable'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
