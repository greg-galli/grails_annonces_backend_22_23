package grails_estia_22_23

class Annonce {

    String title
    String description
    Float price
    Boolean isActive = Boolean.FALSE
    Date dateCreated
    Date lastUpdated
    List illustrations

    static belongsTo = [author: User]

    static hasMany = [illustrations: Illustration]

    static constraints = {
        title size: 3..50, nullable: false, blank: false
        description nullable: false, blank: false
        price min:0F, scale: 2, nullable: false
        illustrations nullable: true
    }

    static mapping = {
        description type: 'text'
    }
}
