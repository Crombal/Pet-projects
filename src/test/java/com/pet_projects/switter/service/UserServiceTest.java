package com.pet_projects.switter.service;

import com.pet_projects.switter.domain.Role;
import com.pet_projects.switter.domain.User;
import com.pet_projects.switter.repository.UserRepository;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Collections;

import static com.pet_projects.switter.controller.RegistrationController.hostname;
import static org.hamcrest.CoreMatchers.is;
import static org.mockito.Mockito.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource("/application-test.properties")
class UserServiceTest {

    @Autowired
    private UserService userService;

    @MockBean
    private UserRepository userRepository;

    @MockBean
    private MailSender mailSender;

    @MockBean
    private PasswordEncoder passwordEncoder;

    @Test
    void addUserTest() {
        User user = new User();

        hostname = "";

        user.setEmail("some@gmail.com");

        boolean isUserCreated = userService.addUser(user);

        Assert.assertTrue(isUserCreated);
        Assert.assertNotNull(user.getActivationCode());
        Assert.assertTrue(is(user.getRoles()).matches(Collections.singleton(Role.USER)));

        verify(userRepository, times(1)).save(user);
        verify(mailSender, times(1))
                .send(
                        ArgumentMatchers.eq(user.getEmail()),
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString()
                );
    }

    @Test
    public void addUserFailTest() {
        User user = new User();

        hostname = "";

        user.setUsername("John");

        doReturn(user)
                .when(userRepository)
                .findByUsername("John");

        boolean isUserCreated = userService.addUser(user);

        Assert.assertFalse(isUserCreated);

        verify(userRepository, times(0)).save(any(User.class));
        verify(mailSender, times(0))
                .send(
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString()
                );
    }

    @Test
    void activateUserTest() {
        User user = new User();

        user.setActivationCode("bingo!");

        doReturn(user)
                .when(userRepository)
                .findByActivationCode("activate");

        boolean isUserActivated = userService.activateUser("activate");

        Assert.assertTrue(isUserActivated);
        Assert.assertNull(user.getActivationCode());

        verify(userRepository, times(1)).save(user);
    }

    @Test
    public void activateUserFailTest() {
        boolean isUserActivated = userService.activateUser("activate me");

        Assert.assertFalse(isUserActivated);

        verify(userRepository, times(0)).save(any(User.class));
    }
}