package proyectohackaton



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SolicitudController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def solicitudesService
    def aprobacionService
    
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        
        def colaborador = Colaborador.get(1)
        def solicitudes = Solicitud.findAllByColaborador(colaborador)
        def listaSolicitudes = []
        solicitudes.each{
            println it.flujosSolicitud?.find{it.activo}.aprobador.nombre
            listaSolicitudes<<[id:it.id,
                fechaCreacion:it.fechaCreacion,
                categoria:it.tipoSolicitud?.categoria?.glosa,
                tipoSolicitud:it.tipoSolicitud.glosa,
                estado:it.estado?.glosa,
                colaborador:it.colaborador?.nombre,
                gerencia:it.colaborador.grupoColaborador.gerencia,
                totalAutorizaciones:it.flujosSolicitud.size(),
                totalAutorizados:it.flujosSolicitud?.find{it.activo}.orden-1,
                responsable:it.flujosSolicitud?.find{it.activo}.aprobador.nombre,
                fechaDesde:it.flujosSolicitud?.find{it.activo}.fechaCreacion,
                fechaHasta:it.flujosSolicitud?.find{it.activo}.fechaActualizacion,
                diasTranscurridos:it.flujosSolicitud?.find{it.activo}.fechaCreacion-new Date(),
                cantidadDias:it.propiedadesSolicitud?.find{it.configuracion.propiedad=='cantidadDias'}?.valor,
                fechaDesdeSolicitud:it.propiedadesSolicitud?.find{propiedad->propiedad.configuracion.propiedad=='fechaDesde'}?.valor,
                fechaHastaSolicitud:it.propiedadesSolicitud?.find{propiedad->propiedad.configuracion.propiedad=='fechaHasta'}?.valor,
                saldoVacaciones:it.colaborador.saldoVacaciones-it.propiedadesSolicitud?.find{it.configuracion.propiedad=='cantidadDias'}?.valor.toInteger()
            ]
        }

       [solicitudInstanceList:listaSolicitudes]
    }

    def show(Solicitud solicitudInstance) {
        respond solicitudInstance
    }

    def create() {
        respond new Solicitud(params)
    }

    @Transactional
    def save(Solicitud solicitudInstance) {
        if (solicitudInstance == null) {
            notFound()
            return
        }

        if (solicitudInstance.hasErrors()) {
            respond solicitudInstance.errors, view:'create'
            return
        }

        solicitudInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'solicitudInstance.label', default: 'Solicitud'), solicitudInstance.id])
                redirect solicitudInstance
            }
            '*' { respond solicitudInstance, [status: CREATED] }
        }
    }

    def edit(Solicitud solicitudInstance) {
        respond solicitudInstance
    }

    @Transactional
    def update(Solicitud solicitudInstance) {
        if (solicitudInstance == null) {
            notFound()
            return
        }

        if (solicitudInstance.hasErrors()) {
            respond solicitudInstance.errors, view:'edit'
            return
        }

        solicitudInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Solicitud.label', default: 'Solicitud'), solicitudInstance.id])
                redirect solicitudInstance
            }
            '*'{ respond solicitudInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Solicitud solicitudInstance) {

        if (solicitudInstance == null) {
            notFound()
            return
        }

        solicitudInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Solicitud.label', default: 'Solicitud'), solicitudInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitudInstance.label', default: 'Solicitud'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    def crea(){
        println "entra a cera controller"
        println "params: ${params}"
        [configuracionVariable:solicitudesService.crea(params), params:params]
    }
    
    def guarda(){
        println "entra a guarda controller"
        println "params:${params}"
        solicitudesService.guarda(params)
    }
    
    def obtienePendienteAprobacion(){
        println "entra a obtienePendienteAprobacion  controller"
        aprobacionService.obtienePendienteAprobacion(params)
        println "sale a obtienePendienteAprobacion  controller"
    }
}
