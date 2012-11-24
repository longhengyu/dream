import com.pkgplan.auth.*
import com.pkgplan.dream.Server
import javax.servlet.http.HttpServletRequest

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

            if (Server.count() == 0) {
                //init server data
                DbUnitOperator.operate("INSERT","../data/dev/init-server.xml")
            }
        }
    }
    def destroy = {
    }
}
