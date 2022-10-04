package grails_estia_22_23

import grails.gorm.services.Service

@Service(Illustration)
interface IllustrationService {

    Illustration get(Serializable id)

    List<Illustration> list(Map args)

    Long count()

    void delete(Serializable id)

    Illustration save(Illustration illustration)

}