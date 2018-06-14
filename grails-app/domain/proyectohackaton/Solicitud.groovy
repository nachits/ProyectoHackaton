package proyectohackaton

class Solicitud {
    
    TipoSolicitud tipoSolicitud
    Date fechaCreacion
    EstadoSolicitud estado
    Colaborador colaborador
    
    static hasMany = [flujosSolicitud: FlujoSolicitud] 
    
    static mapping = {
        
        flujosSolicitud lazy: false
        
    }
    
    static constraints = {
        colaborador nullable: true
    }
}
