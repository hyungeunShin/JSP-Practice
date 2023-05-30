package ch11.test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class BoardRepository {
	private static int no = 0;
	private ArrayList<BoardVO> listOfBoard = new ArrayList<BoardVO>();
	private static BoardRepository instance = new BoardRepository();
	
	public static BoardRepository getInstance() {
		return instance;
	}
	
	// 게시판 목록 전체 가져오기
	public ArrayList<BoardVO> selectBoardList(){
		return listOfBoard;
	}
	
	// 게시글 1개 가져오기
	public BoardVO getBoardById(int no) {
		return listOfBoard.get(no);
	}
	
	// 게시글 추가
	public void addBoard(BoardVO board) {
		listOfBoard.add(board);
		no++;
	}
	
	// 게시글 삭제
	public void deleteBoard(int no) {
		listOfBoard.set(no, null);
	}
	
	// 게시글 수정
	public void updateBoard(BoardVO board) {
		BoardVO vo = listOfBoard.get(board.getNo());
		
		vo.setTitle(board.getTitle());
		vo.setWriter(board.getWriter());
		vo.setContent(board.getContent());
	}
	
	// 게시글 번호 가져오기
	public int getNo() {
		return no;
	}
	
	public String getFileExt(String fileName) {
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		return ext;
	}
	
	// 날짜 출력할때 활용
	public String getCurrenTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(cal.getTime());
	}
}
