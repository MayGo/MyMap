package ee.planet.maix



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(TripController)
@Mock(Trip)
class TripControllerTests {

    void testIndex() {
        controller.index()
        assert "/trip/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tripInstanceList.size() == 0
        assert model.tripInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tripInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.tripInstance != null
        assert view == '/trip/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/trip/show/1'
        assert controller.flash.message != null
        assert Trip.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/trip/list'


        def trip = new Trip()

        // TODO: populate domain properties

        assert trip.save() != null

        params.id = trip.id

        def model = controller.show()

        assert model.tripInstance == trip
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/trip/list'


        def trip = new Trip()

        // TODO: populate valid domain properties

        assert trip.save() != null

        params.id = trip.id

        def model = controller.edit()

        assert model.tripInstance == trip
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/trip/list'

        response.reset()


        def trip = new Trip()

        // TODO: populate valid domain properties

        assert trip.save() != null

        // test invalid parameters in update
        params.id = trip.id

        controller.update()

        assert view == "/trip/edit"
        assert model.tripInstance != null

        trip.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/trip/show/$trip.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/trip/list'

        response.reset()

        def trip = new Trip()

        // TODO: populate valid domain properties
        assert trip.save() != null
        assert Trip.count() == 1

        params.id = trip.id

        controller.delete()

        assert Trip.count() == 0
        assert Trip.get(trip.id) == null
        assert response.redirectedUrl == '/trip/list'
    }
}
