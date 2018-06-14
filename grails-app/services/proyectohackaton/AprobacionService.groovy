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
}
