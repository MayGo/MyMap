package ee.planet.maix



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(IconController)
@Mock(Icon)
class IconControllerTests {

    void testIndex() {
        controller.index()
        assert "/icon/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.iconInstanceList.size() == 0
        assert model.iconInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.iconInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.iconInstance != null
        assert view == '/icon/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/icon/show/1'
        assert controller.flash.message != null
        assert Icon.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/icon/list'


        def icon = new Icon()

        // TODO: populate domain properties

        assert icon.save() != null

        params.id = icon.id

        def model = controller.show()

        assert model.iconInstance == icon
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/icon/list'


        def icon = new Icon()

        // TODO: populate valid domain properties

        assert icon.save() != null

        params.id = icon.id

        def model = controller.edit()

        assert model.iconInstance == icon
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/icon/list'

        response.reset()


        def icon = new Icon()

        // TODO: populate valid domain properties

        assert icon.save() != null

        // test invalid parameters in update
        params.id = icon.id

        controller.update()

        assert view == "/icon/edit"
        assert model.iconInstance != null

        icon.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/icon/show/$icon.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/icon/list'

        response.reset()

        def icon = new Icon()

        // TODO: populate valid domain properties
        assert icon.save() != null
        assert Icon.count() == 1

        params.id = icon.id

        controller.delete()

        assert Icon.count() == 0
        assert Icon.get(icon.id) == null
        assert response.redirectedUrl == '/icon/list'
    }
}
