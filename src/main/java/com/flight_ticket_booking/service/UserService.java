package com.flight_ticket_booking.service;

import java.util.List;

import com.flight_ticket_booking.dao.UserDao;
import com.flight_ticket_booking.dto.User;

public class UserService {

    UserDao dao = new UserDao();

    /*
	 * saveUserdetails
     */
    public User saveUser(User user) {
        return dao.saveUser(user);
    }

    /*
	 * getAllUser
     */
    public List<User> getAllUser() {
        return dao.getAllUser();
    }

    /*
	 * getUserByEmail
     */
    public User getUserByEmail(String email) {
        return dao.getUserByEmail(email);
    }
    /**
     * added on 18/09/2026 by Sumit kr.
     * @param email
     * @param newPassword
     * @return 
     */
    public int updatePasswordByEmail(String email, String newPassword) {
        return dao.updatePasswordByEmail(email, newPassword);
    }
}
