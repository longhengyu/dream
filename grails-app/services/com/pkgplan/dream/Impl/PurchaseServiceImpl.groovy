package com.pkgplan.dream.Impl

import com.pkgplan.dream.PurchaseService
import org.springframework.stereotype.Service
import com.pkgplan.dream.exception.InstanceNotFoundException
import com.pkgplan.dream.Purchase
import org.codehaus.groovy.runtime.TimeCategory
import org.apache.commons.lang.RandomStringUtils
import java.text.DateFormat
import java.text.SimpleDateFormat

/**
 * User: longhengyu
 * Date: 12-12-18
 */
@Service("purchaseService")
class PurchaseServiceImpl implements PurchaseService {

    String charset = (('A'..'Z') + ('0'..'9')).join()
    Integer length = 9

    Purchase proceedPurchase(Long purchaseId, String paymentMethodId) throws InstanceNotFoundException {
        def purchaseInstance = Purchase.get(purchaseId)
        if (!purchaseInstance) {
            throw new InstanceNotFoundException()
        }
        def owner = purchaseInstance.owner
        def product = purchaseInstance.product
        Date now = new Date()
        Date fromDate = now > owner.dateExpired ? now : owner.dateExpired
        Date endDate
        use(TimeCategory) {
            endDate = fromDate + product.pYear.year + product.pMonth.month + product.pDay.day + product.pHour.hour + product.pMinute.minute
        }

        owner.dateExpired = endDate
        owner.save()

        purchaseInstance.datePay = now
        purchaseInstance.paymentMethod = paymentMethodId


        String randomString = RandomStringUtils.random(length, charset.toCharArray())
        purchaseInstance.purchaseNumber = "${new SimpleDateFormat('yyyyMMdd').format(now)}${randomString}"
        purchaseInstance.save()
        return purchaseInstance
    }
}
