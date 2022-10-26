package grails_estia_22_23

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
class UserController {

    UserService userService

    static allowedMethods = [save: "POST"]

    def index(Integer max) {
        respond userService.list(params), model: [userCount: userService.count()]
    }

    def show(Long id) {
        respond userService.get(id), model: [roleList: Role.list()]
    }

    def create() {
        respond new User(params), model: [roleList: Role.list()]
    }

    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
            def roleInstance = Role.get(params.role)
            UserRole.create(user, roleInstance, true)
        } catch (ValidationException e) {
            respond user.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userService.get(id), model: [roleList: Role.list()]
    }

    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
            UserRole.removeAll(user)
            def roleInstance = Role.get(params.role)
            UserRole.create(user, roleInstance, true)
        } catch (ValidationException e) {
            respond user.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        UserRole.removeAll(User.get(id))
        userService.delete(id)

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
        redirect action: "index", method: "GET"
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
