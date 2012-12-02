package com.pkgplan.dream



import grails.test.mixin.*
import grails.test.mixin.domain.DomainClassUnitTestMixin
import com.pkgplan.auth.User

import grails.plugins.springsecurity.SpringSecurityService
import org.springframework.security.authentication.encoding.PasswordEncoder

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestMixin(DomainClassUnitTestMixin)
class ServerServiceTests{

    void testGetLeastLoadedServer() {
        defineBeans {
            springSecurityService(SpringSecurityService)
        }



        User userZhou =  saveZhoudi()
        userZhou.springSecurityService.passwordEncoder = new TestEncoder()
        Server server1 = mockDomain(Server) as Server;

        server1.ipAddr = "123.133.23.1";
        server1.dateCreated = new Date()
        server1.hostname = "aaa.com"
        server1.capacity = 2
        server1.users =  [userZhou];
        server1.save();


        Server server4 = mockDomain(Server) as Server;

        server4.ipAddr = "123.133.23.4";
        server4.dateCreated = new Date()
        server4.hostname = "ddd.com"
        server4.capacity = 4
        server4.save()

        Server server3 = mockDomain(Server) as Server;

        server3.ipAddr = "123.133.23.3";
        server3.dateCreated = new Date()
        server3.hostname = "ccc.com"
        server3.capacity = 2
        server3.save()

        Server server = service.getLeastLoadedServer();
        assertNotNull(server)
        assertEquals("123.133.23.4",server.ipAddr)
        assertEquals("ddd.com",server.hostname)
        assertEquals(4,server.capacity);
    }

    private User saveZhoudi() {
        User userZhoud = mockDomain(User) as User;
        userZhoud.username = "zhoudi"
        userZhoud.password = "aaa"
        userZhoud.email = "aaa@ggg.com"
        userZhoud.dateCreated = new Date()
        userZhoud.enabled = true
        userZhoud.profile = new Profile(fullName: "test1", gender: "Male", country: "china", timezone: TimeZone.default);
        return userZhoud
    }


    public class TestEncoder implements PasswordEncoder {

        String encodePassword(String s, Object o) {
            return "111"
        }

        boolean isPasswordValid(String s, String s1, Object o) {
            return true;
        }
    }
}