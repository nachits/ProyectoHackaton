package proyectohackaton

import grails.transaction.Transactional

@Transactional
class AprobacionService {

    def obtienePendienteAprobacion(params) {
        
        def estadoFlujoPendiente=EstadoFlujoSolicitud.findByCodigo("1") //pendiente
        def flujosSolicitud=FlujoSolicitud.findAllByAprobadorAndActivoAndEstado(Colaborador.get(params.colaboradorId),true,estadoFlujoPendiente)
        
        //println "flujosSolicitud "+flujosSolicitud
        def retorno=[]
        flujosSolicitud.each{
            Expando objeto= new Expando()
            objeto.numeroSolicitud=it.solicitud.id
            objeto.fechaIngreso=it.solicitud.fechaCreacion
            objeto.tipoSolicitud=it.solicitud.tipoSolicitud.glosa
            objeto.categoria=it.solicitud.tipoSolicitud.categoria.glosa
            objeto.colaborador=it.solicitud.colaborador.nombre+" "+it.solicitud.colaborador.apellidoPaterno
            objeto.gerencia=it.solicitud.colaborador.grupoColaborador.gerencia
            objeto.fechaRecepcion=it.fechaCreacion
            retorno<<objeto
        }
        //def retorno=[numeroSolicitud:flujosSolicitud.solicitud.id,fechaIngreso:flujosSolicitud.solicitud.fechaCreacion]
        
        println "retorno "+retorno
        
        retorno
        
    }
}