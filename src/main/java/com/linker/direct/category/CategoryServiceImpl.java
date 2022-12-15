package com.linker.direct.category;

import com.linker.direct.item.vo.ItemVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    private final CategoryDAO categoryDao;

    @Override
    public List<CategoryVO> listAll() throws Exception {
        return categoryDao.listAll();
    }

    @Override
    public void create(CategoryVO categoryVO) throws Exception {
        categoryDao.create(categoryVO);
    }

    @Override
    public CategoryVO read(CategoryDTO categoryDto) throws Exception {
        return categoryDao.read(categoryDto);
    }

    @Override
    public void update(CategoryVO categoryVO) throws Exception {
        categoryDao.update(categoryVO);
    }

    @Override
    public void delete(CategoryDTO categoryDto) throws Exception {
        categoryDao.delete(categoryDto);
    }

    @Override
    public String readByItem(ItemVO itemVO) throws Exception {
        return categoryDao.readByItem(itemVO);
    }
}
