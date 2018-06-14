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
    
    static mapping = {
        
        solicitud lazy: false
        
    }
    
    static constraints = {
    }
}
