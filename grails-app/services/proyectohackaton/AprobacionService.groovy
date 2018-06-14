package proyectohackaton

import grails.transaction.Transactional

@Transactional
class AprobacionService {

    def obtienePendienteAprobacion(params) {
        
        def estadoFlujoPendiente=EstadoFlujoSolicitud.findByCodigo("1") //pendiente
        def flujosSolicitud=FlujoSolicitud.findAllByAprobadorAndActivoAndEstado(Colaborador.get(params.colaboradorId),true,estadoFlujoPendiente)
        
        println "flujosSolicitud "+flujosSolicitud
        
        [:]
        
    }
}
