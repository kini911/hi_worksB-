package com.worksb.hi.board.service;

import java.util.List;

import com.worksb.hi.project.service.ProjectVO;

public interface BoardService {
	// 이진
	// 게시글 등록
	public int insertBoard(BoardVO boardVO);
	// 업무글 등록 - 상위, 하위
	public int insertTask(TaskVO taskVO);
	// 투표글 등록
	public int insertVote(VoteVO voteVO);
	// 투표 항목 등록
	public int insertVoteList(VoteVO voteVO);
	// 일정글 등록
	public int insertSche(ScheVO scheVO);
	
	// 일정 조회
	public ScheVO getScheInfo(ScheVO scheVO);
	// 투표 조회
	public List<VoteVO> getVoteInfo(VoteVO voteVO);
	// 투표 항목 조회
	public List<VoteVO> getVoteList(VoteVO voteVO);
	// 업무 조회
	public List<AllTaskBoardVO> getTaskInfo(AllTaskBoardVO allTaskBoardVO);
	// 상위 업무 taskId 조회
	public int getHighTaskId(AllTaskBoardVO allTaskBoardVO);
	// 업무 담당자 조회
	public List<AllTaskBoardVO> getManager(AllTaskBoardVO allTaskBoardVO);
	// 하위 업무 조회
	public List<AllTaskBoardVO> getSubTask(int TaskId);
	
	// 업무 담당자 등록
	public int insertTaskManager(TaskVO taskVO);
	
	// 업무탭 리스트
	public List<AllTaskBoardVO> getTaskList(int projectId);
	
	// 업무 수정
	public int updateTask(TaskVO taskVO);
	// 일반글 수정
	public int updateBoard(BoardVO boardVO);
	public int updateTaskManager(TaskVO taskVO);
  
	// 일반게시글 삭제
	public int deleteBoard(BoardVO boardVO);
	
	// 업무 삭제
	public int deleteManagerList(TaskVO taskVO); // 업무게시글의의 담당자 전체 리스트 삭제
	
	
	
	// 게시글 정보
	public BoardVO getBoardInfo(int prjBoardId);
	
	// 좋아요 등록
	public int insertPrjLike(BoardVO boardVO);
	// 좋아요 취소
	public int deletePrjLike(BoardVO boardVO);
	// 좋아요 확인
	public BoardVO getMemLike(BoardVO boardVO);
	// 좋아요 확인 - 게시글
	public List<BoardVO> getPrjLike(BoardVO boardVO);

	
	
  // 업무글 삭제
	public int deleteTask(TaskVO taskVO);
	
	// 투표글 수정
	public int updateVote(VoteVO voteVO);
	
	// 투표 인원수
	public int countVoteParticir(VoteVO voteVO);
	
	// 투표글 삭제
	public int deleteVote(VoteVO voteVO);
	
	
	// 상단 고정 업데이트
	public int updatePin(BoardVO boardVO);
	
	// 회원의 프로젝트 별 북마크 리스트
	public List<BoardVO> getBookmarkList(ProjectVO projectVO);
	
	// 게시글 북마크 등록
	public int insertBookmark(BoardVO boardVO);
	
	// 게시글 북마크 삭제
	public int deleteBookmark(BoardVO boardVO);

	// 일정 참가,미참
	public int sheParticipate(ScheParticirVO spVO);
	
	//투표 하기 (삭제 -> 등록)
	public int voteInsert(List<VoteVO> voteList);
	
	//투표 취소
	public void votePaticirDelete(VoteVO voteVO);
	
	//내가 선택한 투표 리스트
	public List<VoteVO> getVoteListByMember(VoteVO voteVO);

	//게시글 별 일정 참여자 리스트 출력
	public List<ScheParticirVO> getParticir(ScheParticirVO particir);
	
	//게시글 별 투표 참여자 리스트 출력
	public List<VoteVO> getVoteParticir(VoteVO particir);
	
	
	
	
	
	
	//정현
	//프로젝트 일정 캘린더 조회
	public List<ScheVO> getScheCalendar(int projectId);
	//프로젝트 업무 캘린더 조회
	public List<TaskVO> getTaskCalendar(int projectId);
	//프로젝트 일정 상세 조회
	public BoardVO getScheBoardInfo(int prjBoardId);

}
