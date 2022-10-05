package grails_estia_22_23

import grails.gorm.transactions.Transactional

@Transactional
class MyService {


    def getUserSpecificAnnonces(User currentUser, Map params)
    {
        def annonceList
        // S'il s'agit d'un administrateur ou d'un modérateur, on renvoi la liste complète des annonces
        if (currentUser.getAuthorities().authority.contains('ROLE_ADMIN') ||
                currentUser.getAuthorities().authority.contains('ROLE_MODO'))
            annonceList = Annonce.list(params)
        else // Sinon, on retourne uniquement les annonces de l'utilisateur courant
            annonceList = currentUser.annonces
        return annonceList
    }

}
