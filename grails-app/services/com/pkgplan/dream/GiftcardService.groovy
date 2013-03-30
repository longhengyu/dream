package com.pkgplan.dream

import com.pkgplan.auth.User

public interface GiftcardService {

    boolean processGiftcardIfValid(Purchase purchase, Product product, String code)
}
