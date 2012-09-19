package ee.planet.maix



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(RouteController)
@Mock(Route)
class RouteControllerTests {

    void testIndex() {
        controller.index()
        assert "/route/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.routeInstanceList.size() == 0
        assert model.routeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.routeInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.routeInstance != null
        assert view == '/route/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/route/show/1'
        assert controller.flash.message != null
        assert Route.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/route/list'


        def route = new Route()

        // TODO: populate domain properties

        assert route.save() != null

        params.id = route.id

        def model = controller.show()

        assert model.routeInstance == route
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/route/list'


        def route = new Route()

        // TODO: populate valid domain properties

        assert route.save() != null

        params.id = route.id

        def model = controller.edit()

        assert model.routeInstance == route
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/route/list'

        response.reset()


        def route = new Route()

        // TODO: populate valid domain properties

        assert route.save() != null

        // test invalid parameters in update
        params.id = route.id

        controller.update()

        assert view == "/route/edit"
        assert model.routeInstance != null

        route.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/route/show/$route.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/route/list'

        response.reset()

        def route = new Route()

        // TODO: populate valid domain properties
        assert route.save() != null
        assert Route.count() == 1

        params.id = route.id

        controller.delete()

        assert Route.count() == 0
        assert Route.get(route.id) == null
        assert response.redirectedUrl == '/route/list'
    }
}
