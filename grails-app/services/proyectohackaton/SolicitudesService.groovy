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
    
    def guarda(params){
        try{
            println "guardando solicitud inicial asd"+params
            //estadoPendiente
            Solicitud solicitud = new Solicitud()
            solicitud.tipoSolicitud=TipoSolicitud.get(params.tipoSolicitudId)
            solicitud.fechaCreacion=new Date()
            solicitud.estado=EstadoSolicitud.findByCodigo("1")

            if(!solicitud.save(flush:true)){
                println solicitud.errors.allErrors
            }
            params.each{key, value->
                def configuracionVariable= ConfiguracionVariable.findByPropiedad(key)
                if(configuracionVariable){
                    PropiedadesSolicitud propiedadesSolicitud= new PropiedadesSolicitud()
                    propiedadesSolicitud.solicitud=solicitud
                    propiedadesSolicitud.configuracion=configuracionVariable
                    propiedadesSolicitud.valor=value

                    propiedadesSolicitud.save(flush:true)
                }
            }
            
            FlujoSolicitud flujoSolicitud= new FlujoSolicitud()
            def colaborador=Colaborador.get(params.colaboradorId)
            def configuracionSolicitudAutorizacion=ConfiguracionSolicitudAutorizacion.findByGrupoColaborador(colaborador.grupoColaborador)
            
            configuracionSolicitudAutorizacion.each{
                println it
            }
            
        }catch(e){
            println "se cae guarda "
            println e
        }
        
        
    }
    
}
