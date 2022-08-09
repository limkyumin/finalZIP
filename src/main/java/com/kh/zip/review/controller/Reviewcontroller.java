package com.kh.zip.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.common.template.userPagination;
import com.kh.zip.inquiry.model.vo.Inquiry;
import com.kh.zip.review.model.service.Reviewservice;
import com.kh.zip.review.model.vo.Review;
import com.kh.zip.roomlist.model.vo.Roomlist;

@Controller
public class Reviewcontroller {
	
	@Autowired
	Reviewservice reviewservice;
	
	@RequestMapping("review.re")
	public String reviewMain(@RequestParam(value="rpage",defaultValue="1") int currentPage, Model model) {
		
		int pageLimit = 5;
		int reviewLimit = 9;
		
		int listCount = reviewservice.selectListCount();
		
		userPageInfo pi = userPagination.getPageInfo(listCount, currentPage, pageLimit, reviewLimit);
		
		ArrayList<Review> list = reviewservice.selectAll(pi);
		
		int startIndex;
		int endIndex;
		String content2 = "";
		
		if(!list.isEmpty()) {
			for(int i =0; i<list.size(); i++) {
				startIndex = list.get(i).getReviewContent().indexOf("/zip/");
				if(startIndex!=-1) {
					content2 = list.get(i).getReviewContent().substring(startIndex);
					endIndex = content2.indexOf("\" title=\"");
					
					list.get(i).setThumbnail(content2.substring(0,endIndex));
				}
			}
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "review/reviewmain";
	}
	
	@RequestMapping("enrollPage.re")
	public String reviewEnrollPage() {
		
		return "review/reviewpage";
	}
	
	@RequestMapping("insert.re")
	public String insertReview(Review r, HttpSession session, Model model) {
		
		int result = reviewservice.insertReview(r);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","입주후기가 등록되었습니다.");
			return "redirect:review.re";
		}
		else {
			
			model.addAttribute("errorMsg", "입주후기 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.re")
	public String reviewDetail(int rno, Model model) {
		
		Review r = reviewservice.reviewDetail(rno);
		
		model.addAttribute("r", r);
		
		return "review/reviewdetail";
	}
	
	@RequestMapping("updateForm.re")
	public String updateReviewForm(int rno, Model model) {
		
		Review r = reviewservice.reviewDetail(rno);
		
		model.addAttribute("r", r);
		
		return "review/reviewupdate";
	}
	
	@RequestMapping("update.re")
	public String updateReview(Review r, HttpSession session, Model model) {
		
		Review re = new Review();
		re.setReviewNo(r.getReviewNo());
		re.setReviewTitle(r.getReviewTitle());
		re.setReviewContent(r.getReviewContent());
		
		int result = reviewservice.updateReview(re);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","입주후기가 수정되었습니다.");
			return "redirect:detail.re?rno=" + r.getReviewNo();
		}
		else {
			
			model.addAttribute("errorMsg", "입주후기 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.re")
	public String deleteReview(int rno, HttpSession session, Model model) {
		
		int result = reviewservice.deleteReview(rno);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","입주후기가 삭제되었습니다.");
			return "redirect:review.re";
		}
		else {
			
			model.addAttribute("errorMsg", "입주후기 수정 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="topList.re", produces="application/json; charset=UTF-8")
	public String selectTopList() {
		
		ArrayList<Review> list = reviewservice.selectTopList();
		
		int startIndex;
		int endIndex;
		String content2 = "";
		
		if(!list.isEmpty()) {
			for(int i =0; i<list.size(); i++) {
				startIndex = list.get(i).getReviewContent().indexOf("/zip/");
				if(startIndex!=-1) {
					content2 = list.get(i).getReviewContent().substring(startIndex);
					endIndex = content2.indexOf("\" title=\"");
					
					list.get(i).setThumbnail(content2.substring(0,endIndex));
				}
			}
		}
		
		return new Gson().toJson(list);
	}
	
	
}