package com.pkgplan.dream

import grails.test.mixin.Mock
import grails.test.mixin.TestFor

@TestFor(GiftcardController)
@Mock(Giftcard)
class GiftcardControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/giftcard/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.giftcardInstanceList.size() == 0
        assert model.giftcardInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.giftcardInstance != null
    }

    void testSave() {
        controller.save()

        assert model.giftcardInstance != null
        assert view == '/giftcard/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/giftcard/show/1'
        assert controller.flash.message != null
        assert Giftcard.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/giftcard/list'

        populateValidParams(params)
        def giftcard = new Giftcard(params)

        assert giftcard.save() != null

        params.id = giftcard.id

        def model = controller.show()

        assert model.giftcardInstance == giftcard
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/giftcard/list'

        populateValidParams(params)
        def giftcard = new Giftcard(params)

        assert giftcard.save() != null

        params.id = giftcard.id

        def model = controller.edit()

        assert model.giftcardInstance == giftcard
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/giftcard/list'

        response.reset()

        populateValidParams(params)
        def giftcard = new Giftcard(params)

        assert giftcard.save() != null

        // test invalid parameters in update
        params.id = giftcard.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/giftcard/edit"
        assert model.giftcardInstance != null

        giftcard.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/giftcard/show/$giftcard.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        giftcard.clearErrors()

        populateValidParams(params)
        params.id = giftcard.id
        params.version = -1
        controller.update()

        assert view == "/giftcard/edit"
        assert model.giftcardInstance != null
        assert model.giftcardInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/giftcard/list'

        response.reset()

        populateValidParams(params)
        def giftcard = new Giftcard(params)

        assert giftcard.save() != null
        assert Giftcard.count() == 1

        params.id = giftcard.id

        controller.delete()

        assert Giftcard.count() == 0
        assert Giftcard.get(giftcard.id) == null
        assert response.redirectedUrl == '/giftcard/list'
    }
}
