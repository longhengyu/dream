package com.pkgplan.dream.Impl

import com.pkgplan.dream.Giftcard
import com.pkgplan.dream.GiftcardService
import com.pkgplan.dream.Product
import com.pkgplan.dream.Purchase
import org.springframework.stereotype.Service

/**
 * User: zhoudi
 * Date: 12-12-16
 * Time: pm9:24
 */
@Service("giftcardService")
class GiftcardServiceImpl implements GiftcardService{


    @Override
    boolean processGiftcardIfValid(Purchase purchase, Product product, String code) {
        def c = Giftcard.createCriteria()
        def cards = c.list {
            and {
                //eq('owner', purchase.owner) /* it doesn't have to be the owner who use it . 2015.1.14 */
                eq('status', "Available")
                eq('product', product)
                eq('code', code)
            }
        }
        if(cards.size() != 0) {
            def card = cards.get(0)
            if (card.code == code && card.product.id == product.id && "Available".equals(card.status)) {
                card.status = "Used";
                card.dateUsed = new Date()
                card.purchase = purchase
                if (card.save()) {
                    return true
                } else {
                    //TODO need to handle this
                    throw RuntimeException("error when process giftcard")
                }
            }
        }
        return false
    }
}
