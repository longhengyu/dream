import com.pkgplan.auth.*
import com.pkgplan.dream.Server
import ch.gstream.grails.plugins.dbunitoperator.DbUnitOperator

class BootStrap {

    def init = { servletContext ->
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
