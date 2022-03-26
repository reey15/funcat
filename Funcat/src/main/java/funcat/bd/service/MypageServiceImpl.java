package funcat.bd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import funcat.bd.domain.Mypage;
import funcat.bd.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageMapper mypageMapper;
	
	//로그인

	//마이페이지 조회
	@Override
	public Mypage list(Mypage mypage) {
		return mypageMapper.mylist(mypage);
	}
	
	//마이페이지 수정폼
	@Override
	public Mypage getMypage(Mypage mypage) {
		return mypageMapper.selectByID(mypage);
	}
	
	//마이페이지 수정하기
	@Override
	public void update(Mypage mypage) {
		mypageMapper.update(mypage);
	}
	
	// 내 주문내역 조회
	@Override
	public List<Mypage> getMyOrderlist(Mypage mypage) {
		return mypageMapper.orderlist(mypage);
	}
	
	//크리에이터 관리 화면(프로젝트조회)
	@Override
	public Mypage getCreator(Mypage mypage) {
		return mypageMapper.creator(mypage);
	}
	
	public List<Mypage> getProjectlist(Mypage mypage) {
		return mypageMapper.projectlist(mypage);
	}
	
	public Mypage getProjectdetail(Mypage mypage) {
		return mypageMapper.projectdetail(mypage);
	}
	
	public void projectupdate(Mypage mypage) {
		mypageMapper.projectUpdate(mypage);
	}
	
	public void delete(long project_num) {
		mypageMapper.delete(project_num);				
	}

}
