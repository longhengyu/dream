package com.pkgplan.dream

import com.pkgplan.dream.exception.InstanceNotFoundException

/**
 * User: longhengyu
 * Date: 12-12-18
 */
public interface PurchaseService {
    Purchase proceedPurchase(Long purchaseId, String paymentMethodId) throws InstanceNotFoundException
}
