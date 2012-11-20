import com.pkgplan.auth.*
import com.pkgplan.dream.Server
import ch.gstream.grails.plugins.dbunitoperator.DbUnitOperator

class BootStrap {

    def init = { servletContext ->
        if (User.count() == 0 && Role.count() == 0) {

            //init data
            DbUnitOperator.create();

//            def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
//            def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
//
//            def testUser = new User(username: 'user', enabled: true, password: 'user', email: 'user@pkgplan.com')
//            testUser.save(flush: true)
//
//            def testAdmin = new User(username: 'admin', enabled: true, password: 'admin', email: 'admin@pkgplan.com')
//            testAdmin.save(flush: true)
//
//            UserRole.create testUser, userRole, true
//            UserRole.create testAdmin, adminRole, true

            assert User.count() == 2
            assert Role.count() == 2
            assert UserRole.count() == 2

            if (Server.count() == 0) {
                def newServer = new Server(ipAddr: '173.255.217.70', hostname: 'vps001', capacity: 20, users: [testAdmin]);
                newServer.save(flush: true)
                def newServer2 = new Server(ipAddr: '173.255.217.71', hostname: 'vps002', capacity: 20, users: [testUser]);
                newServer2.save(flush: true)
            }
            def s = Server.createCriteria().list{
                users{
                    eq("username", "user")
                }
            }
            s.size()
            Server sin = Server.withCriteria(uniqueResult: true) {
                users{
                    eq("username", "admin")
                }
            }

            sin.ipAddr

        }

    }
    def destroy = {
    }
}
