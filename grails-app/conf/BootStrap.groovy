import com.pkgplan.auth.*
import com.pkgplan.dream.Server
import ch.gstream.grails.plugins.dbunitoperator.DbUnitOperator

class BootStrap {

    def init = { servletContext ->
        if (User.count() == 0 && Role.count() == 0) {
            //init data
            DbUnitOperator.create()

            assert User.count() == 2
            assert Role.count() == 2
            assert UserRole.count() == 2

            if (Server.count() == 0) {
                //init server data
                DbUnitOperator.operate("INSERT","../data/dev/init-server.xml")
            }
        }
    }
    def destroy = {
    }
}
