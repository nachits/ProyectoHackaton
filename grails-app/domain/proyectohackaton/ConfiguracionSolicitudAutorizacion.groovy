package proyectohackaton

class ConfiguracionSolicitudAutorizacion {
    
    TipoSolicitud tipoSolicitud
    Integer orden
    Colaborador colaboradorAprobador
    Colaborador colaboradorAprobadorSuplente
    GrupoColaborador grupoColaborador
    Boolean activo
    Boolean esAprobadorFinal
    
    
    static constraints = {
    }
}
