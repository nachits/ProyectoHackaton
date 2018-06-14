package proyectohackaton

class Colaborador {
    GrupoColaborador grupoColaborador
    String nombreUsuario
    Integer rut
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    Integer saldoVacaciones
    Integer saldoMedioDias
    EstadoColaborador estadoColaborador 
    static hasMany = [roles: Roles] 
    
    static constraints = {
    }
}
