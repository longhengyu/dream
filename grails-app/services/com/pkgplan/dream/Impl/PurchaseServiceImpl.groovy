package com.pkgplan.dream.Impl

import com.pkgplan.dream.Purchase
import com.pkgplan.dream.PurchaseService
import com.pkgplan.dream.Server
import com.pkgplan.dream.ServerService
import com.pkgplan.dream.exception.InstanceNotFoundException
import org.apache.commons.lang.RandomStringUtils
import org.codehaus.groovy.runtime.TimeCategory
import org.springframework.stereotype.Service

import java.text.SimpleDateFormat
import javax.annotation.Resource

/**
 * User: longhengyu
 * Date: 12-12-18
 */
@Service("purchaseService")
class PurchaseServiceImpl implements PurchaseService {

    String charset = (('A'..'Z') + ('0'..'9')).join()
    Integer length = 9

    @Resource
    ServerService serverService

    Purchase proceedPurchase(Long purchaseId, String paymentMethodId) throws InstanceNotFoundException {

        // find purchase
        def purchaseInstance = Purchase.get(purchaseId)
        if (!purchaseInstance) {
            throw new InstanceNotFoundException()
        }

        // if this user has no server, assign owner to server
        def owner = purchaseInstance.owner
        if (serverService.findServerByUser(owner) == null) {
            Server server = serverService.getLeastLoadedServer()
            server.users.add(owner)
            server.save()
        }

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
