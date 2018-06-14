package proyectohackaton

class FlujoSolicitud {
    
    static belongsTo = [solicitud: Solicitud]
    
    Solicitud solicitud
    Colaborador aprobador
    Integer orden
    Boolean esAprobadorFinal
    Boolean activo
    Colaborador aprobadorSuplente
    EstadoFlujoSolicitud estado
    Date fechaCreacion
    Date fechaActualizacion //aprueba o rechaza
    
    static mapping = {
        
        solicitud lazy: false
        
    }
    
    static constraints = {
        
        fechaActualizacion nullable: true
        fechaCreacion nullable: true
    }
}
