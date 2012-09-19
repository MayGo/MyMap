package ee.planet.maix



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(MarkerController)
@Mock(Marker)
class MarkerControllerTests {

    void testIndex() {
        controller.index()
        assert "/marker/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.markerInstanceList.size() == 0
        assert model.markerInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.markerInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.markerInstance != null
        assert view == '/marker/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/marker/show/1'
        assert controller.flash.message != null
        assert Marker.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/marker/list'


        def marker = new Marker()

        // TODO: populate domain properties

        assert marker.save() != null

        params.id = marker.id

        def model = controller.show()

        assert model.markerInstance == marker
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/marker/list'


        def marker = new Marker()

        // TODO: populate valid domain properties

        assert marker.save() != null

        params.id = marker.id

        def model = controller.edit()

        assert model.markerInstance == marker
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/marker/list'

        response.reset()


        def marker = new Marker()

        // TODO: populate valid domain properties

        assert marker.save() != null

        // test invalid parameters in update
        params.id = marker.id

        controller.update()

        assert view == "/marker/edit"
        assert model.markerInstance != null

        marker.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/marker/show/$marker.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/marker/list'

        response.reset()

        def marker = new Marker()

        // TODO: populate valid domain properties
        assert marker.save() != null
        assert Marker.count() == 1

        params.id = marker.id

        controller.delete()

        assert Marker.count() == 0
        assert Marker.get(marker.id) == null
        assert response.redirectedUrl == '/marker/list'
    }
}
