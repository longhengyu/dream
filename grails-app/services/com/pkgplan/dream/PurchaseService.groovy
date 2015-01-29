package com.pkgplan.dream

import com.pkgplan.dream.exception.InstanceNotFoundException

/**
 * User: longhengyu
 * Date: 12-12-18
 */
public interface PurchaseService {
    Purchase proceedPurchase(Long purchaseId, String paymentMethodId) throws InstanceNotFoundException
    boolean proceedCreditCard(String stripeToken, Double amount)
    Map<String, String> buildAlipayRequestParams(String purchaseId)
    String generatePurchaseNumber()
    boolean alipayVerify(Map<String, String> params)
    boolean proceedAlipayTransaction(Purchase purchaseInstance)
    boolean alipaySendGoods(String trade_no, String logistics_name, String invoice_no, String transport_type)
}


