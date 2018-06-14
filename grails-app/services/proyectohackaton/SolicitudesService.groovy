package proyectohackaton

import grails.transaction.Transactional

@Transactional
class SolicitudesService {

    def crea(params) {
        println "crea servicios "+params
    }
}
