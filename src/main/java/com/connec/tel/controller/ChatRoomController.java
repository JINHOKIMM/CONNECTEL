package com.connec.tel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connec.tel.dto.ChatRoom;
import com.connec.tel.service.ChatRoomRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/chat")
public class ChatRoomController {

 private final ChatRoomRepository chatRoomRepository;

 // 채팅 리스트 화면
 @GetMapping("/room")
 public String rooms(Model model) {
     return "/chat/room";
 }
 // 모든 채팅방 목록 반환
 @GetMapping("/rooms")
 @ResponseBody
 public List<ChatRoom> room() {
     return chatRoomRepository.findAllRoom();
 }
 // 채팅방 생성
 @PostMapping("/room")
 @ResponseBody
 public ChatRoom createRoom(@RequestParam String name, @RequestParam String emp_no) {
     return chatRoomRepository.createChatRoom(name, emp_no);
 }
 // 채팅방 입장 화면
 @GetMapping("/room/enter/{roomId}")
 @ResponseBody
 public Map<String, Object> roomDetail(Model model, @PathVariable String roomId) {
	 Map<String, Object> map = new HashMap<String, Object>();
	 map.put("roomId", roomId);
     return map;
 }
 // 특정 채팅방 조회
 @GetMapping("/room/{roomId}")
 @ResponseBody
 public Map<String, ChatRoom> roomInfo(@PathVariable String roomId) {
     return chatRoomRepository.findRoomById(roomId);
 }
}