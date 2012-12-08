package com.pkgplan.dream

/**
 * The Server service which can provide vpn services for the users.
 * User: zhoudi
 * Date: 12-12-8
 * Time: PM1:51
 */
public interface ServerService {


    /**
     * get the least Loaded Server（it means the least user，and the max capacity）
     *
     * @return the one we want
     * @author zhoudi
     * @since 1.0.0
     */
    Server getLeastLoadedServer()
}