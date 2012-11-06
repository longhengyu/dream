import com.pkgplan.auth.*

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testUser = new User(username: 'user', enabled: true, password: 'user', email: 'user@pkgplan.com')
        testUser.save(flush: true)

        def testAdmin = new User(username: 'admin', enabled: true, password: 'admin', email: 'admin@pkgplan.com')
        testAdmin.save(flush: true)

        UserRole.create testUser, userRole, true
        UserRole.create testAdmin, adminRole, true

        assert User.count() == 2
        assert Role.count() == 2
        assert UserRole.count() == 2

    }
    def destroy = {
    }
}
