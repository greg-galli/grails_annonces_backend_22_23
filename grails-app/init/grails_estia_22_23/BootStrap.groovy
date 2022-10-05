package grails_estia_22_23

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def clientRole = new Role(authority: 'ROLE_CLIENT').save()
        def userAdmin = new User(username: "admin", password: "admin").save()
        UserRole.create(userAdmin, adminRole, true)

        ["Alice", "Bobby", "Charly", "Denis", "Etienne"].each { String usernameFromList ->
            def userInstance = new User(username: usernameFromList, password: "password").save()
            UserRole.create(userInstance, clientRole)


            (1..5).each { Integer index ->
                def annonceInstance = new Annonce(
                        title: "title $index $usernameFromList",
                        description: "Description $index $usernameFromList",
                        price: index * 100,
                        isActive: Boolean.TRUE)

                (1..5).each {
                    annonceInstance.addToIllustrations(new Illustration(filename: "grails.svg"))
                }

                userInstance.addToAnnonces(annonceInstance)
            }

            userInstance.save()
        }

    }
    def destroy = {}
}
