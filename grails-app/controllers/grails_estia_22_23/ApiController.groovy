package grails_estia_22_23

import grails.converters.JSON
import grails.converters.XML

class ApiController {

    /**
     * GET / PUT / PATCH / DELETE
     * GET : Récupère un utilisateur spécifique (id)
     * PUT / PATCH : Modifient intégralement / partiellement un utilisateur
     * DELETE : Supprime un utilisateur
     */
    def user() {
        // Je teste si le parametre ID est bien défini
        if (!params.id)
            return response.status = 400
        // Je récupère l'instance d'utilisateur associé à cet ID
        def userInstance = User.get(params.id)
        // Je teste si l'utilisateur existe
        if (!userInstance)
            return response.status = 404

        switch (request.getMethod()) {
            case "GET":
                // Je réponds
                renderThis(userInstance, request.getHeader("Accept"))
                break
            case "PUT":
                break
            case "PATCH":
                break
            case "DELETE":
                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }

    /**
     * GET / POST
     * GET : Récupère la liste des utilisateurs
     * POST : Crée un nouvel utilisateur
     */
    def users() {

        switch (request.getMethod()) {
            case "GET":
                break
            case "POST":
                break
        }
    }

    def annonce() {

    }

    def annonces() {

    }

    def renderThis(Object object, String accept) {
        switch (accept) {
            case "xml":
            case "text/xml":
            case "application/xml":
                render object as XML
                break
            case "json":
            case "text/json":
            case "application/json":
            default:
                render object as JSON
                break
        }
    }
}
