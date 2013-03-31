import com.pkgplan.auth.*
import com.pkgplan.dream.Server
import javax.servlet.http.HttpServletRequest
import ch.gstream.grails.plugins.dbunitoperator.DbUnitOperator
import com.pkgplan.dream.Product
import com.pkgplan.dream.Giftcard

class BootStrap {

    def grailsApplication

    def init = { servletContext ->

        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"))

        HttpServletRequest.metaClass.isXhr = {->
                'XMLHttpRequest' == delegate.getHeader('X-Requested-With')
        }
        if (User.count() == 0 && Role.count() == 0) {
            //init data
            DbUnitOperator.create()
        }

        if (Server.count() == 0) {
            //init server data
            DbUnitOperator.operate("INSERT","data/init-server.xml")
        }

        if (Product.count() == 0) {
            //init product data
            DbUnitOperator.operate("INSERT","data/init-product.xml")
        }

        if (Giftcard.count() == 0) {
            //init giftcard data
            DbUnitOperator.operate("INSERT","data/init-giftcard.xml")
        }
    }
    def destroy = {
    }
}
