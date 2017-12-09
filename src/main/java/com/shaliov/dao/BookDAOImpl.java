package com.shaliov.dao;

import com.shaliov.model.Book;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ShaliovArtiom on 04.12.2017.
 */
@Repository
public class BookDAOImpl implements BookDAO {

    private static final Logger logger = Logger.getLogger(BookDAOImpl.class);

    @Autowired
    private SessionFactory sessionFactory;


    public void addBook(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(book);
        logger.info("\n");
        logger.info("New book saved. Details =" + book);
     }

    public void updateBook(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.update(book);
        logger.info("\n");
        logger.info("Book updated. Details =" + book);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Book> listBooks() {
        Session session = sessionFactory.getCurrentSession();
        String query = "select b from " + Book.class.getSimpleName() + " b";
        List<Book> bookList = (List<Book>) session.createQuery(query).list();
        logger.info("\n");
        bookList.forEach(book->{
            logger.info("Book list ::" + book);
        });
        return bookList;
    }

    public Book getBookById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = session.load(Book.class, new Integer(id));
        logger.info("\n");
        logger.info("Book loaded, Details = " + book);
        return book;
    }

    public void removeBook(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = session.load(Book.class, new Integer(id));
        if(book != null){
            session.delete(book);
            logger.info("\n");
            logger.info("Book loaded, Details = " + book);
        }
    }
}
