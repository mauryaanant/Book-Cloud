package com.piyush.repo;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.piyush.mail.MailSend;
import com.piyush.models.User;
import com.piyush.models.UserDetails;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

@Repository
public class UserRepo {

    @Autowired
    private EntityManager entityManager;

    @Autowired
    private MailSend ms;

    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Transactional
    public User registerUser(User user) {
    	Session session = entityManager.unwrap(Session.class);
		session.persist(user);
		return user;
	}
    
    public User getUser(String email) {
		Session session = entityManager.unwrap(Session.class);
		return session.get(User.class, email);
	}


    @Transactional
    public String updateuserPassword(String opass, String npass, String rpass, String email) {
        if (npass.equals(rpass)) {
            Session session = entityManager.unwrap(Session.class);
            User a = session.get(User.class, email);

            if (a == null) {
                return "User not found!";
            }

            if (passwordEncoder.matches(opass, a.getPassword())) {
                a.setPassword(passwordEncoder.encode(npass));
                session.persist(a);

                String remail = email;
                String sub = "Book App: Password Updation.";
                String body = "Password Updated Successfully"; 
                String result = ms.doMailSend(remail, sub, body);
                System.out.println(result);

                return "Password Updated Successfully!";
            } else {
                return "Wrong OLD Password Entered!";
            }
        } else {
            return "New Password Mismatched!";
        }
    }

    @Transactional
    public String forgetuserPassword(String email) {
        Session session = entityManager.unwrap(Session.class);
        User a = session.get(User.class, email);

        if (a == null) {
            return "Mail Id not registered!";
        } else {
            // Generate random alphanumeric password
            String chars = "abcdefghijklmnopqrstuvwxyz@#%^&ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder p = new StringBuilder();

            for (int x = 0; x < 6; x++) {
                int index = (int) (Math.random() * chars.length());
                p.append(chars.charAt(index));
            }

            String rawPassword = p.toString();
            a.setPassword(passwordEncoder.encode(rawPassword)); // encode generated password
            session.persist(a);

            String remail = email;
            String sub = "Book Cloud: New Password Generated.";
            String body = "<div style='text-align: center; border: 1px dashed black;'>"
                    + "<img style='padding: 20px;' src='https://www.anant.in/assets/incapp-logo/incapp-logo-box.webp' height='70px' />"
                    + "<hr/>"
                    + "<h1><span style='color: red;'>BooK Cloud:</span> New Password Generated.</h1>"
                    + "<hr/>"
                    + "<p>Your New Password is: <b><mark>" + rawPassword + "</mark></b></p>"
                    + "<p style='padding: 10px; color: white; background-color: black;'>Rights reserved by Anant</p>"
                    + "</div>";

            String result = ms.doMailSend(remail, sub, body);
            System.out.println(result);

            return "New Password Sent!";
        }
    }
    
    @Transactional
	public void updateUser(User user) {
		Session session = entityManager.unwrap(Session.class);
		session.merge(user);
	}

	@Transactional
	public void updateUserDetails(UserDetails userDetails) {
		Session session = entityManager.unwrap(Session.class);
		if (userDetails.getId() == 0) {
			session.persist(userDetails);
		} else {
			session.merge(userDetails);
		}
	}
	
	public UserDetails getUserDetails(String email) {
		TypedQuery<UserDetails> query = entityManager
				.createQuery("SELECT ud FROM UserDetails ud WHERE ud.user.email = :email", UserDetails.class);
		query.setParameter("email", email);
		try {
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}
}
