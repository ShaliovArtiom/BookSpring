package com.shaliov.service;

import com.shaliov.model.Book;

import java.util.List;

/**
 * Created by ShaliovArtiom on 05.12.2017.
 */

public interface BookService {
    void addBook(Book book);
    void updateBook(Book book);
    List<Book> listBooks();
    Book getBookById(int id);
    void removeBook(int id);
}
