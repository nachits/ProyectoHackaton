package proyectohackaton

import grails.transaction.Transactional

@Transactional
class SolicitudesService {

    def crea(params) {
        println "creando servicios "+params
        
        def tipoSolicitud=TipoSolicitud.get(params.tipoSolicitudId)
        def configuracionVariable=ConfiguracionVariable.findAllByTipoSolicitud(tipoSolicitud)
        
        println configuracionVariable
        
        configuracionVariable
        
    }
    
    
}
