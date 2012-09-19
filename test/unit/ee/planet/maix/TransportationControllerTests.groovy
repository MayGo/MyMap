package ee.planet.maix



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(TransportationController)
@Mock(Transportation)
class TransportationControllerTests {

    void testIndex() {
        controller.index()
        assert "/transportation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.transportationInstanceList.size() == 0
        assert model.transportationInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.transportationInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.transportationInstance != null
        assert view == '/transportation/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/transportation/show/1'
        assert controller.flash.message != null
        assert Transportation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/transportation/list'


        def transportation = new Transportation()

        // TODO: populate domain properties

        assert transportation.save() != null

        params.id = transportation.id

        def model = controller.show()

        assert model.transportationInstance == transportation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/transportation/list'


        def transportation = new Transportation()

        // TODO: populate valid domain properties

        assert transportation.save() != null

        params.id = transportation.id

        def model = controller.edit()

        assert model.transportationInstance == transportation
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/transportation/list'

        response.reset()


        def transportation = new Transportation()

        // TODO: populate valid domain properties

        assert transportation.save() != null

        // test invalid parameters in update
        params.id = transportation.id

        controller.update()

        assert view == "/transportation/edit"
        assert model.transportationInstance != null

        transportation.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/transportation/show/$transportation.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/transportation/list'

        response.reset()

        def transportation = new Transportation()

        // TODO: populate valid domain properties
        assert transportation.save() != null
        assert Transportation.count() == 1

        params.id = transportation.id

        controller.delete()

        assert Transportation.count() == 0
        assert Transportation.get(transportation.id) == null
        assert response.redirectedUrl == '/transportation/list'
    }
}
