package grails_estia_22_23

class Illustration {

    String filename

    static belongsTo = [annonce: Annonce]

    static constraints = {
        filename blank: false, nullable: false
    }

}
