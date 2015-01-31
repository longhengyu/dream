package com.pkgplan.dream

import com.pkgplan.auth.User

/**
 * User: zhoudi
 * Date: 12-12-8
 * Time: PM2:31
 */
public interface UserService {

    boolean isCurrentUserValid()

    /**
     * get current User
     * @return user
     * @since 1.0.0
     */
    User currentUser()

    boolean isAdminLoggedIn()

    boolean isUserLonggedIn()

	String getUserVpnPassword(User user)
}
