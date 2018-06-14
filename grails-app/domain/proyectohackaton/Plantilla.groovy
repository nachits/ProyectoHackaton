package proyectohackaton

class Plantilla {
    TipoSolicitud tipoSolicitud
    String html
    Date fecha

    static constraints = {
        tipoSolicitud nullable: false
    }
}
