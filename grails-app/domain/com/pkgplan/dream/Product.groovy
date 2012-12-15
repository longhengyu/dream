package com.pkgplan.dream

class Product {

    String name
    String description
    BigDecimal price // all price in CNY
    BigDecimal dollarPrice
	String imageUrl
    Date dateCreated
    int pYear = 0
    int pMonth = 0
    int pDay = 0
    int pHour = 0
    int pMinute = 0
    String status

    // this code is the identification of each item which specified by the product owner (admin)
    // we can use this code for reference of i18n information. for example for i18n name and description
    // adding the translated description in i18n file, for example
    // product.description.10001=Some Product Description.
    // product.name.10001=SomeName
    // usage will be
    // <g:message code="product.description.${productInstance.code}"/>
    String code

    static constraints = {
        name(blank: false)
        code(blank: false)
        description(maxSize: 1000)
		imageUrl(url: true)
        price(nullable: false, min: new BigDecimal(0))
        dollarPrice(nullable: false, min: new BigDecimal(0))
        status(inList: ['OnSell','Hidden','OffSall'], blank: false)
        pYear(min: 0)
        pMonth(min: 0)
        pDay(min: 0)
        pHour(min: 0)
        pMinute(min: 0)
    }

    String toString() {
        return name
    }
}
