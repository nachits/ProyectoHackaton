package proyectohackaton

class TipoSolicitud {
    
    String codigo
    String glosa
    Categoria categoria
    
    static constraints = {
        categoria nullable: true
    }
}
