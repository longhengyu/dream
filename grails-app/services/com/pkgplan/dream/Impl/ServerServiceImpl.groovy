package com.pkgplan.dream.Impl

import com.pkgplan.auth.User
import org.apache.commons.collections.CollectionUtils
import org.springframework.stereotype.Service
import org.springframework.stereotype.Component
import javax.annotation.Resource
import com.pkgplan.dream.ServerService
import com.pkgplan.dream.Server

@Service("serverService")
class ServerServiceImpl implements ServerService{

    /**
     * get the least Loaded Server（it means the least user，and the max capacity）
     *
     * @return the one we want
     * @author zhoudi
     * @since 1.0.0
     */
    Server getLeastLoadedServer() {
        List<Server> serverList = Server.getAll();
        Collections.sort(serverList, new Comparator<Server>(){
            int compare(Server server1, Server server2) {
                Set<User> usersS1 = server1.users?: new HashSet<>();
                Set<User> usersS2 = server2.users?: new HashSet<>();

                //the same ip address means the same server
                if (server1.ipAddr.equals(server2.ipAddr)) {
                    return 0;
                }

                //if they have the same user，we will make the higher of capacity one first
                if (usersS1.size() == usersS2.size()) {
                    return -server1.capacity.compareTo(server2.capacity)
                }
                return usersS1.size().compareTo(usersS2.size())
            }
        })
        if (CollectionUtils.isNotEmpty(serverList)) {
            //return wo want one
            return serverList.get(0);
        }
        return null;
    }

    Server findServerByUser(User user) {
        def c = Server.createCriteria()
        def result = c.get {
            users {
                idEq(user.id)
            }
        }
        return result;
    }
}