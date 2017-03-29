package com.book.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.book.pojo.BookStore;
@Repository
@Transactional
public interface BookStoreMapper {
    int deleteByPrimaryKey(String bookid);

    int insert(BookStore record);

    int insertSelective(BookStore record);

    BookStore selectByPrimaryKey(String bookid);

    int updateByPrimaryKeySelective(BookStore record);

    int updateByPrimaryKey(BookStore record);
    
    List<BookStore> selectAll();
}