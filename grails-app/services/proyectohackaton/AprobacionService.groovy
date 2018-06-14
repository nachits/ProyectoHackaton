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
        //def retorno=[numeroSolicitud:flujosSolicitud.solicitud.id,fechaIngreso:flujosSolicitud.solicitud.fechaCreacion]
        
       // println "retorno "+retorno
        
        retorno
        
    }
    
    def aprobarSolicitud(solicitud) {
        
        def flujoSolicitudActual = solicitud.find{it.activo}
        
        flujoSolicitudActual.activo = false
        flujoSolicitudActual.fechaActualizacion = new Date()
        flujoSolicitudActual.estado = EstadoFlujoSolicitud.findByCodigo('2')
        
        flujoSolicitudActual.save(flush:true)
        
        if(flujoSolicitudActual.esAprobadorFinal){
            solicitud.estado = EstadoSolicitud.findByCodigo('2')
        
            solicitud.save(flush:true)
        }else{
            def proximoFlujo = solicitud.find{it.orden == (flujoSolicitudActual.orden + 1)}
            
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
