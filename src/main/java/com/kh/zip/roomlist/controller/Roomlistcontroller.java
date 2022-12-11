package com.kh.zip.roomlist.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zip.chat.model.service.Chatservice;
import com.kh.zip.chat.model.vo.Chatroom;
import com.kh.zip.inquiry.model.service.Inquiryservice;
import com.kh.zip.inquiry.model.vo.Inquiry;
import com.kh.zip.review.model.service.Reviewservice;
import com.kh.zip.review.model.vo.Review;
import com.kh.zip.roomlist.model.service.Roomlistservice;
import com.kh.zip.roomlist.model.vo.Attachment;
import com.kh.zip.roomlist.model.vo.Roomlist;
import com.kh.zip.roomlist.model.vo.Wishlist;

@Controller
public class Roomlistcontroller {
	
	@Autowired
	private Roomlistservice roomlistservice;
	
	@Autowired
	private Chatservice chatservice;
	
	@Autowired
	private Inquiryservice inquiryservice;
	
	@Autowired
	private Reviewservice reviewservice;
	
	@RequestMapping("list.ro")
	public String searchRoomAll(Model model) {
		
		ArrayList<Roomlist> list = roomlistservice.searchRoomAll();
		
		model.addAttribute("list", list);
		
		return "roomlist/roomlistmain";
	}
	
	@RequestMapping("deTail.ro")
	public String deTailRoom(int rno, int userNo, Model model) {
		
		Wishlist w = new Wishlist();
		w.setRoomNo(rno);
		w.setUserNo(userNo);
		
		w = roomlistservice.selectWishlist(w);
		
		Roomlist r = roomlistservice.detailRoom(rno);
		
		String userId = roomlistservice.selectUserId(userNo);
		
		String masterId = roomlistservice.selectMasterId(rno);
		
		Chatroom ch = new Chatroom();
		ch.setUserId(userId);
		ch.setMasterId(masterId);
		
		ch = chatservice.selectChatroom(ch);
		
		ArrayList<Attachment> list = roomlistservice.selectImages(rno);
		
		Attachment at = roomlistservice.selectDocument(rno);
		
		model.addAttribute("w", w);
		
		model.addAttribute("r", r);
		
		model.addAttribute("ch", ch);
		
		model.addAttribute("list", list);
		
		model.addAttribute("at", at);
		
		return "roomlist/roomlistdetail";
	}
	
	@RequestMapping("detail.ro")
	public String detailRoom(int rno, Model model) {
		
		Roomlist r = roomlistservice.detailRoom(rno);
		
		ArrayList<Attachment> list = roomlistservice.selectImages(rno);
		
		Attachment at = roomlistservice.selectDocument(rno);
		
		model.addAttribute("r", r);
		
		model.addAttribute("list", list);
		
		model.addAttribute("at", at);
		
		return "roomlist/roomlistdetail";
	}
	
	@RequestMapping("registerPage.ro")
	public String registerPage(int userNo, String userStatus, HttpSession session) {
		
		Roomlist r = roomlistservice.checkRoom(userNo);
		
		if(r == null && !userStatus.equals("P")) {
			
			return "roomlist/roomregister";
		}
		else if(userStatus.equals("P")) {
			
			session.setAttribute("alertMsg","정지된 회원은 방등록이 불가능합니다.");
			return "redirect:./";
		}
		else {
			
			session.setAttribute("alertMsg","현재 등록된 방이 있어서 추가로 방등록이 불가능합니다.");
			return "redirect:./";
		}
	}
	
	@RequestMapping("register.ro")
	public String registerRoom(Roomlist r, MultipartFile[] upfile1, MultipartFile upfile2, HttpSession session, Model model) {
		
		int result1 = roomlistservice.registerRoom(r);
		
		if(result1 > 0) {
			
			Attachment a = new Attachment();
			
			String changeName = saveFile(upfile1[0], session);
			a.setOriginName(upfile1[0].getOriginalFilename());
			a.setChangeName("resources/upfiles/"+changeName);
			
			int result2 = roomlistservice.registerThumbnail(a);
			
			if(result2 > 0) {
				
				for(int i = 1; i < upfile1.length; i++) {
					
					Attachment at = new Attachment();
					
					String changeName2 = saveFile(upfile1[i], session);
					at.setOriginName(upfile1[i].getOriginalFilename());
					at.setChangeName("resources/upfiles/"+changeName2);
					
					roomlistservice.registerImages(at);
				}
				
				Attachment at = new Attachment();
				
				String changeName3 = saveFile(upfile2, session);
				at.setOriginName(upfile2.getOriginalFilename());
				at.setChangeName("resources/upfiles/"+changeName3);
				
				roomlistservice.registerDocument(at);
			}
			session.setAttribute("alertMsg","방등록 승인 요청되었습니다. 승인 또는 거절 여부는 마이페이지에서 확인 가능합니다.");
			return "redirect:./";
		}
		else {
			model.addAttribute("errorMsg", "방등록 요청 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updatePage.ro")
	public String updateRoomPage(int roomNo, Model model) {
		
		Roomlist r = roomlistservice.detailRoom(roomNo);
		
		ArrayList<Attachment> list = roomlistservice.selectImages(roomNo);
		
		Attachment at = roomlistservice.selectDocument(roomNo);
		
		model.addAttribute("r", r);
		
		model.addAttribute("list", list);
		
		model.addAttribute("at", at);
		
		return "roomlist/roomupdate";
	}
	
	@RequestMapping("update.ro")
	public String updateRoom(Roomlist r, MultipartFile[] upfile1, MultipartFile upfile2, HttpSession session, Model model) {
		
		int result1 = roomlistservice.updateRoom(r);
		
		Attachment d = roomlistservice.selectDocument(r.getRoomNo());
		
		if(result1 > 0) {
			
			if(!upfile1[0].getOriginalFilename().equals("")) {
				
				ArrayList<Attachment> list = roomlistservice.selectImages(r.getRoomNo());
				
				for(int i = 0; i < list.size(); i++) {
					
					new File(session.getServletContext().getRealPath("/"+list.get(i).getChangeName())).delete();
				}
				
				roomlistservice.updateFiles(r.getRoomNo());
				
				Attachment at = new Attachment();
				
				String changeName = saveFile(upfile1[0], session);
				at.setOriginName(upfile1[0].getOriginalFilename());
				at.setChangeName("resources/upfiles/"+changeName);
				at.setRefRno(r.getRoomNo());
				
				int result2 = roomlistservice.updateThumbnail(at);
				
				if(result2 > 0) {
					
					for(int i = 1; i < upfile1.length; i++) {
						
						Attachment at2 = new Attachment();
						
						String changeName2 = saveFile(upfile1[i], session);
						at2.setOriginName(upfile1[i].getOriginalFilename());
						at2.setChangeName("resources/upfiles/"+changeName2);
						at2.setRefRno(r.getRoomNo());
						
						roomlistservice.updateImages(at2);
					}
				}
			}
			
			if(!upfile2.getOriginalFilename().equals("")) {
				
				new File(session.getServletContext().getRealPath("/"+d.getChangeName())).delete();
				
				Attachment at = new Attachment();
				
				String changeName3 = saveFile(upfile2, session);
				at.setOriginName(upfile2.getOriginalFilename());
				at.setChangeName("resources/upfiles/"+changeName3);
				at.setRefRno(r.getRoomNo());
				
				roomlistservice.updateDocument(at);
			}
			
			session.setAttribute("alertMsg","방정보가 수정되었습니다.");
			return "redirect:detail.ro?rno=" + r.getRoomNo();
		}
		
		else {
			model.addAttribute("errorMsg", "방 수정 요청 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.ro")
	public String deleteRoom(Roomlist r, HttpSession session, Model model) {
		
		int result = roomlistservice.deleteRoom(r.getRoomNo());
		
		if(result > 0) {
			
			ArrayList<Attachment> list = roomlistservice.selectImages(r.getRoomNo());
			
			for(int i = 0; i < list.size(); i++) {
				
				new File(session.getServletContext().getRealPath("/"+list.get(i).getChangeName())).delete();
			}
			
			Attachment at = roomlistservice.selectDocument(r.getRoomNo());
			
			new File(session.getServletContext().getRealPath("/"+at.getChangeName())).delete();
			
			roomlistservice.updateFiles(r.getRoomNo());
			
			session.setAttribute("alertMsg","등록된 방이 삭제되었습니다.");
			return "redirect:./";
		}
		else {
			model.addAttribute("errorMsg", "방 삭제 요청 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("approve.ro")
	public String approveRoom(Roomlist r, HttpSession session, Model model) {
		
		int result = roomlistservice.approveRoom(r.getRoomNo());
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","방등록이 승인 처리되었습니다.");
			return "redirect:./";
		}
		else {
			model.addAttribute("errorMsg", "승인 요청 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("reject.ro")
	public String rejectRoom(Roomlist r, HttpSession session, Model model) {
		
		int result = roomlistservice.deleteRoom(r.getRoomNo());
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","방등록이 거절 처리되었습니다.");
			return "redirect:./";
		}
		else {
			model.addAttribute("errorMsg", "거절 요청 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("addWishlist.ro")
	public String addWishlist(int userNo, int roomNo, HttpSession session, Model model) {
		
		Wishlist w = new Wishlist();
		w.setRoomNo(roomNo);
		w.setUserNo(userNo);
		
		int result = roomlistservice.addWishlist(w);
		
		if(result > 0) {
			
			model.addAttribute("userNo", userNo);
			session.setAttribute("alertMsg","관심 목록에 추가되었습니다.");
			return "redirect:deTail.ro?rno=" + roomNo;
		}
		else {
			model.addAttribute("errorMsg", "관심 목록 추가 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("removeWishlist.ro")
	public String removeWishlist(int userNo, int roomNo, HttpSession session, Model model) {
		
		Wishlist w = new Wishlist();
		w.setRoomNo(roomNo);
		w.setUserNo(userNo);
		
		int result = roomlistservice.removeWishlist(w);
		
		if(result > 0) {
			
			model.addAttribute("userNo", userNo);
			session.setAttribute("alertMsg","관심 목록에서 삭제되었습니다.");
			return "redirect:deTail.ro?rno=" + roomNo;
		}
		else {
			model.addAttribute("errorMsg", "관심 목록 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("selectOption.ro")
	public String selectOption(Roomlist r, Model model) {
		
		ArrayList<Roomlist> list = roomlistservice.selectOption(r);
		
		model.addAttribute("list", list);
		
		return "roomlist/roomlistmain";
	}
	
	@RequestMapping(value="roomenroll.bo")
	public String roomenroll(int userNo, Model model) {
		
		ArrayList<Roomlist> list = roomlistservice.roomenroll(userNo);
		ArrayList<Inquiry> list2 = inquiryservice.inquiry(userNo);
		ArrayList<Review> list3 = reviewservice.review(userNo);
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		
		return "userinfo/mywriting";
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/upfiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
}