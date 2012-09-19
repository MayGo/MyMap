package ee.planet.maix



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(CarController)
@Mock(Car)
class CarControllerTests {

    void testIndex() {
        controller.index()
        assert "/car/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.carInstanceList.size() == 0
        assert model.carInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.carInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.carInstance != null
        assert view == '/car/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/car/show/1'
        assert controller.flash.message != null
        assert Car.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/car/list'


        def car = new Car()

        // TODO: populate domain properties

        assert car.save() != null

        params.id = car.id

        def model = controller.show()

        assert model.carInstance == car
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/car/list'


        def car = new Car()

        // TODO: populate valid domain properties

        assert car.save() != null

        params.id = car.id

        def model = controller.edit()

        assert model.carInstance == car
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/car/list'

        response.reset()


        def car = new Car()

        // TODO: populate valid domain properties

        assert car.save() != null

        // test invalid parameters in update
        params.id = car.id

        controller.update()

        assert view == "/car/edit"
        assert model.carInstance != null

        car.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/car/show/$car.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/car/list'

        response.reset()

        def car = new Car()

        // TODO: populate valid domain properties
        assert car.save() != null
        assert Car.count() == 1

        params.id = car.id

        controller.delete()

        assert Car.count() == 0
        assert Car.get(car.id) == null
        assert response.redirectedUrl == '/car/list'
    }
}
