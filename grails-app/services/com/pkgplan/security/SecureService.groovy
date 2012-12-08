package com.pkgplan.security

/**
 * User: zhoudi
 * Date: 12-12-8
 * Time: PM2:03
 */
public interface SecureService {

    def generateSecFile(String hostname)

    /**
     * @param password target of password
     * @return encoded password
     * @since 1.0.0
     */
    String encodePasswordForVpn(String password)
}