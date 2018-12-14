package org.itrip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 图片管理
 * @author Administrator
 *
 */
@Controller
public class PictureController {
	/**
	 * 图片添加
	 * @return
	 */
	@RequestMapping("picture-add.do")
	public String pictureAdd() {
		return "picture-add";
	}
	/**
	 * 图片管理
	 * @return
	 */
	@RequestMapping("picture-list.do")
	public String pictureList() {
		return "picture-list";
	}
	/**
	 * 图片编辑
	 * @return
	 */
	@RequestMapping("picture-show.do")
	public String pictureShow() {
		return "picture-show";
	}
}
