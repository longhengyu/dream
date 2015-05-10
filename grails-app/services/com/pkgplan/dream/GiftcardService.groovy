package com.pkgplan.dream

public interface GiftcardService {

    boolean processGiftcardIfValid(Purchase purchase, Product product, String code)
    String generateGiftcardCode()
}
