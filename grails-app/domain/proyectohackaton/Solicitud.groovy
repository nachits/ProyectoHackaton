package proyectohackaton

class Solicitud {
    
    TipoSolicitud tipoSolicitud
    Date fechaCreacion
    EstadoSolicitud estado
    Colaborador colaborador
    
    static hasMany = [flujosSolicitud: FlujoSolicitud, propiedadesSolicitud:PropiedadesSolicitud] 
    
    static mapping = {
        
        flujosSolicitud lazy: false
        
    }
    
    static constraints = {
        colaborador nullable: true
    }
}
