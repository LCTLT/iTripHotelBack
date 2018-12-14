package org.itrip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 产品管理
 * @author Administrator
 *
 */
@Controller
public class ProductController {
	/**
	 * 品牌管理
	 */
	@RequestMapping("product-brand.do")
	public String productBrand() {
		return "product-brand";
	}
	/**
	 * 分类管理
	 */
	@RequestMapping("product-category.do")
	public String productCategory() {
		return "product-category";
	}
	/**
	 * 分类显示
	 */
	@RequestMapping("product-category-add.do")
	public String productCategoryAdd() {
		return "product-category-add";
	}
	/**
	 * 品牌管理
	 */
	@RequestMapping("product-list.do")
	public String productList() {
		return "product-list";
	}
}
