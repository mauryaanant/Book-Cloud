package com.piyush.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.piyush.models.Book;
import com.piyush.models.User;
import com.piyush.models.UserDetails;
import com.piyush.repo.AdminRepo;
import com.piyush.repo.BookRepo;
import com.piyush.repo.UserRepo;



@Service
public class Appservice {

    @Autowired
    private BookRepo bookRepo;

    @Autowired
    private AdminRepo adminRepo;

    @Autowired
    private UserRepo userRepo;

    // Admin Services
    public String login(String id, String password) {
        return adminRepo.login(id, password);
    }

    public String updatePassword(String opass, String npass, String rpass, String id) {
        return adminRepo.updatePassword(opass, npass, rpass, id);
    }

    public String forgetPassword(String email) {
        return adminRepo.forgetPassword(email);
    }

    // Book Services
    public List<Book> getBooks(String name) {
        return bookRepo.getBooks(name);
    }

    public Book getBook(String name) {
        return bookRepo.getBook(name);
    }

    public boolean addBook(Book book) {
        return bookRepo.addBook(book);
    }

    public void updateBookImage(String name, MultipartFile image) {
        bookRepo.updateBookImage(name, image);
    }

    public void updateBook(Book book) {
        bookRepo.updateBook(book);
    }

    public void deleteBook(String name) {
        bookRepo.deleteBook(name);
    }

    public List<String> getBookNames() {
        return bookRepo.getBookNames();
    }

    public List<Book> getBooks() {
        return bookRepo.getBooks();
    }

    public byte[] getBookImage(String name) {
        return bookRepo.getBookImage(name);
    }

    public byte[] getBookContent(String name) {
        return bookRepo.getBookContent(name);
    }

    public List<Book> getSuggestedProducts(Book product) {
        try {
            return bookRepo.getRandomBooks();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
     public List<Book> getBooksByCategory(String category) {
		return bookRepo.getBooksByCategory(category);
	}

    // User Services
    public User registerUser(User user) {
        return userRepo.registerUser(user);
    }

    public User getUser(String email) {
		return userRepo.getUser(email);
	}
    public String updateuserPassword(String opass, String npass, String rpass, String email) {
        return userRepo.updateuserPassword(opass, npass, rpass, email);
    }

    public String forgetuserPassword(String email) {
        return userRepo.forgetuserPassword(email);
    }

    public void updateUser(User user) {
		userRepo.updateUser(user);
	}

	public void updateUserDetails(UserDetails userDetails) {
		userRepo.updateUserDetails(userDetails);
	}

	public UserDetails getUserDetails(String email) {
		return userRepo.getUserDetails(email);
	}

}
