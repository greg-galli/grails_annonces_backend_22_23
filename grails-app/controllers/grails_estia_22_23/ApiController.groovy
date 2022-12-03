package grails_estia_22_23

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_CLIENT'])
class ApiController {

    UserService userService

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
                userInstance.save(flush:true)
                break
            case "PATCH":
                def json = request.getJSON()
                if (json.getAt("username"))
                    userInstance.username = json.getAt("username")
                if (json.getAt("password"))
                    userInstance.password = json.getAt("password")
                if (userInstance.save(flush:true))
                    return response.status = 200
                return response.status = 400
                break
            case "DELETE":
                userInstance.delete()
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
                renderThis(User.list(), request.getHeader("Accept"))
                break
            case "POST":
                def json = request.JSON
                def user = new User(username: json.username, password: json.password)
//                user.save(flush: true)
                userService.save(user)
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
