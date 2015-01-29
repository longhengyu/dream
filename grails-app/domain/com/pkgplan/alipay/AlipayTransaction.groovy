package com.pkgplan.alipay
import com.pkgplan.dream.Purchase


class AlipayTransaction {

    static belongsTo = [purchase: Purchase]

    String alipay_trade_no
    String status = "Pending"

    static constraints = {
        alipay_trade_no (blank: false)
        status(inList: ['Pending','Finished'], blank: false)

    }
}