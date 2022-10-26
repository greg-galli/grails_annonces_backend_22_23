package grails_estia_22_23

import grails.gorm.transactions.Transactional
import grails.util.Holders
import org.springframework.web.multipart.MultipartFile

@Transactional
class MyService {
    def getUserSpecificAnnonces(User currentUser, Map params)
    {
        def annonceList
        // S'il s'agit d'un administrateur ou d'un modérateur, on renvoi la liste complète des annonces
        if (currentUser.getAuthorities().authority.contains('ROLE_ADMIN') || currentUser.getAuthorities().authority.contains('ROLE_MODO')) {
            if (params.author)
                annonceList = Annonce.findAllByAuthor(User.get(params.author))
            else
                annonceList = Annonce.list(params)
        }
        else // Sinon, on retourne uniquement les annonces de l'utilisateur courant
            annonceList = currentUser.annonces
        return annonceList
    }

    def uploadFiles(Annonce annonce, List<MultipartFile> files) {
        files.each {
            MultipartFile file ->
                def filename = generator( (('A'..'Z')+('0'..'9')).join(), 12 )
                String destinationFilePathBase = Holders.getGrailsApplication().config.illustrations.basePath
                File destinationFile = new File(destinationFilePathBase+filename)
                while(destinationFile.exists())
                {
                    filename = generator( (('A'..'Z')+('0'..'9')).join(), 12 )
                    destinationFile = new File(destinationFilePathBase+filename)
                }
                file.transferTo(destinationFile)
                annonce.addToIllustrations(new Illustration(filename:filename)).save()
        }
    }

    def generator = { String alphabet, int n ->
        new Random().with {
            (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
        }
    }
}
