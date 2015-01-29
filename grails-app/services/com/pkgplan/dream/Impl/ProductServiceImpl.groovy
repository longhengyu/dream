package com.pkgplan.dream.Impl

import com.pkgplan.dream.ProductService
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.springframework.stereotype.Service

/**
 * User: zhoudi
 * Date: 12-12-16
 * Time: pm9:24
 */
@Service("productService")
class ProductServiceImpl implements ProductService{

    BigDecimal convertPriceCNYtoUSD(BigDecimal cny) {

        BigDecimal exchangeRate =  ApplicationHolder.application.config.exchangeRate;

        return (cny/exchangeRate).setScale(2, BigDecimal.ROUND_HALF_UP)
    }
}
