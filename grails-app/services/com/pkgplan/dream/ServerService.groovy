package com.pkgplan.dream

import com.pkgplan.auth.User
import org.apache.commons.collections.CollectionUtils

class ServerService {

    /**
     * get the least Loaded Server（it means the least user，and the max capacity）
     *
     * @return the one we want
     */
    def getLeastLoadedServer() {
        List<Server> serverList = Server.getAll();
        Collections.sort(serverList, new Comparator<Server>(){
            int compare(Server server1, Server server2) {
                Set<User> usersS1 = server1.getUsers() == null ? new HashSet<>(): server1.getUsers();
                Set<User> usersS2 = server2.getUsers() == null ? new HashSet<>():server2.getUsers();

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
}