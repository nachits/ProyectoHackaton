package proyectohackaton

class PropiedadesSolicitud {
    
    static belongsTo = [solicitud: Solicitud]
    
    Solicitud solicitud
    ConfiguracionVariable configuracion
    String valor
    
    static constraints = {
    }
}
