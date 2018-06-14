package proyectohackaton

import grails.transaction.Transactional


@Transactional
class AprobacionService {
    
    def obtienePendienteAprobacion(params) {
        
        def estadoFlujoPendiente=EstadoFlujoSolicitud.findByCodigo("1") //pendiente
        def flujosSolicitud=FlujoSolicitud.findAllByAprobadorAndActivoAndEstado(Colaborador.get(params.idUsuario),true,estadoFlujoPendiente)
        
        //println "flujosSolicitud "+flujosSolicitud
        def retorno=[]
        flujosSolicitud.each{
            def objeto= [
            numeroSolicitud:it.solicitud.id,
            fechaIngreso:it.solicitud.fechaCreacion,
            tipoSolicitud:it.solicitud.tipoSolicitud.glosa,
            categoria:it.solicitud.tipoSolicitud.categoria.glosa,
            colaborador:it.solicitud.colaborador.nombre+" "+it.solicitud.colaborador.apellidoPaterno,
            gerencia:it.solicitud.colaborador.grupoColaborador.gerencia,
            fechaRecepcion:it.fechaCreacion]
            retorno<<objeto
        }
        
        retorno
        
    }
    
    def aprobarSolicitud(solicitud) {
        def solicitudInstance = Solicitud.get(solicitud)
        def flujoSolicitudActual = solicitudInstance.flujosSolicitud.find{it.activo}
        
        flujoSolicitudActual.activo = false
        flujoSolicitudActual.fechaActualizacion = new Date()
        flujoSolicitudActual.estado = EstadoFlujoSolicitud.findByCodigo('2')
        
        flujoSolicitudActual.save(flush:true)
        
        if(flujoSolicitudActual.esAprobadorFinal){
            solicitudInstance.estado = EstadoSolicitud.findByCodigo('2')
            solicitudInstance.save(flush:true)
            def colaboradorInstance = Colaborador.get(solicitudInstance.colaborador.id)
            colaboradorInstance.saldoVacaciones = colaboradorInstance.saldoVacaciones - solicitudInstance.propiedadesSolicitud.find{it.configuracion.propiedad=='cantidadDias'}?.valor?.toInteger()
            colaboradorInstance.save(flush:true)
        }else{
            def proximoFlujo = solicitudInstance.flujosSolicitud.find{it.orden == (flujoSolicitudActual.orden + 1)}
            proximoFlujo.activo = true
            proximoFlujo.fechaCreacion = new Date()
            proximoFlujo.save(flush:true)
        }    
    }
    
    def rechazarSolicitud(solicitud) {
        
        def flujoSolicitudActual = solicitud.find{it.activo}
        
        flujoSolicitudActual.activo = false
        flujoSolicitudActual.fechaActualizacion = new Date()
        flujoSolicitudActual.estado = EstadoFlujoSolicitud.findByCodigo('3')
        
        flujoSolicitudActual.save(flush:true)
        
        solicitud.estado = EstadoSolicitud.findByCodigo('3')
        
        solicitud.save(flush:true)
    }
}
