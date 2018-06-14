package proyectohackaton

class GrupoColaborador {
    
    String nombre
    String gerencia
    
    static constraints = {
        gerencia nullable: true
    }
}
