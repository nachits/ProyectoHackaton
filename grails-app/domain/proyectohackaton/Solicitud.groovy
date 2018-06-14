package proyectohackaton

class Solicitud {
    
    TipoSolicitud tipoSolicitud
    Date fechaCreacion
    TipoEstadoSolicitud tipoEstadoSolicitud
    
    static hasMany = [flujosSolicitud: FlujoSolicitud] 
    
    static mapping = {
        
        flujosSolicitud lazy: false
        
    }
    
    static constraints = {
    }
}
