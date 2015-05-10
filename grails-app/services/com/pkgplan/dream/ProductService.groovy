package com.pkgplan.dream

/**
 *
 * User: zhoudi
 * Date: 12-12-16
 * Time: PM9:20
 */
public interface ProductService {

    /**
     * convert rmb to usd for product price
     * @return usd price
     * @since 1.0.0
     */
    public BigDecimal convertPriceCNYtoUSD(BigDecimal cny)
    public Product getTestProduct()
    public Product getBasicProduct()
}