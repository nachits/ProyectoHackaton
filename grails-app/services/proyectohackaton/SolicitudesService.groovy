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
            def colaborador=Colaborador.get(params.colaboradorId)
            println "guardando solicitud inicial asd"+params
            //estadoPendiente
            Solicitud solicitud = new Solicitud()
            solicitud.tipoSolicitud=TipoSolicitud.get(params.tipoSolicitudId)
            solicitud.fechaCreacion=new Date()
            solicitud.estado=EstadoSolicitud.findByCodigo("1")
            solicitud.colaborador=colaborador

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
            
            
            def configuracionSolicitudAutorizacion=ConfiguracionSolicitudAutorizacion.findAllByGrupoColaborador(colaborador.grupoColaborador)
            
            configuracionSolicitudAutorizacion.each{
                if(it.activo){
                    FlujoSolicitud flujoSolicitud = new FlujoSolicitud()
                    flujoSolicitud.solicitud=solicitud
                    flujoSolicitud.aprobador=it.colaboradorAprobador
                    flujoSolicitud.aprobadorSuplente=it.colaboradorAprobadorSuplente
                    flujoSolicitud.orden=it.orden
                    flujoSolicitud.estado=EstadoFlujoSolicitud.findByCodigo("1")
                    flujoSolicitud.esAprobadorFinal=it.esAprobadorFinal
                    flujoSolicitud.activo=true
                    if (!flujoSolicitud.save(flush:true)){
                        println flujoSolicitud.errors.allErrors
                    }
                    
                }
            }
            
        }catch(e){
            println "se cae guarda "
            println e
        }
        
        
    }
    
}
