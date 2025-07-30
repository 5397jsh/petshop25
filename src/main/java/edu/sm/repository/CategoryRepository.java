package edu.sm.repository;

import edu.sm.dto.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryRepository {
    List<Category> selectAll() throws Exception;

}