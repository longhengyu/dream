import com.pkgplan.auth.*
import com.pkgplan.dream.Server
import javax.servlet.http.HttpServletRequest
import com.pkgplan.dream.Product
import com.pkgplan.dream.Giftcard

class BootStrap {

    def grailsApplication

    def init = { servletContext ->

        HttpServletRequest.metaClass.isXhr = {->
                'XMLHttpRequest' == delegate.getHeader('X-Requested-With')
        }
        if (User.count() == 0 && Role.count() == 0) {
            //init data
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

        if (Server.count() == 0) {
            //init server data
			def server = new Server(hostname: 'vps001', capacity: 20, ipAddr: '173.255.217.70')
			server.save(flush: true)

			assert Server.count() == 1
        }

        if (Product.count() == 0) {
            //init product data
			def product1 = new Product(name: 'Basic 1 Month Plan', code: 'b26', description: 'Server Located in California, High Speed, No Access Limit for 1 month. (DO NOT support p2p)', imageUrl: 'http://ww1.sinaimg.cn/mw690/ba2b4929gw1dz8xb9q489j.jpg', price: 26, pMonth: 1, status: 'OnSell')
			def product2 = new Product(name: 'Flying 3 Month Plan', code: 'f72', description: 'Server Located in California, High Speed, No Access Limit for 3 Months. Discount Price. (DO NOT support p2p)', imageUrl: 'http://ww3.sinaimg.cn/mw690/ba2b4929gw1dz8xbbaj9oj.jpg', price: 72, pMonth: 3, status: 'OnSell')
			def product3 = new Product(name: 'Prime 1 Year Plan', code: 'p280', description: 'Server Located in California, High Speed, No Access Limit for 1 Year. Discount Price. (DO NOT support p2p)', imageUrl: 'http://ww4.sinaimg.cn/mw690/ba2b4929gw1dz8yjllcl3j.jpg', price: 280, pYear: 1, status: 'OnSell')

			product1.save(flush: true)
			product2.save(flush: true)
			product3.save(flush: true)

        }

        if (Giftcard.count() == 0) {
            //init giftcard data
        }
    }
    def destroy = {
    }
}
