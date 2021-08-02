package com.kh.finalteam1.restcontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.GenreDto;
import com.kh.finalteam1.entity.LikeListDto;
import com.kh.finalteam1.entity.ProgramFeatureDto;
import com.kh.finalteam1.entity.WatchLogDto;
import com.kh.finalteam1.entity.WishListDto;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.GenreDao;
import com.kh.finalteam1.repository.LikeListDao;
import com.kh.finalteam1.repository.ProgramFeatureDao;
import com.kh.finalteam1.repository.SeriesDao;
import com.kh.finalteam1.repository.WatchLogDao;
import com.kh.finalteam1.repository.WishListDao;
import com.kh.finalteam1.service.MainModalService;
import com.kh.finalteam1.vo.ContentListVO;
import com.kh.finalteam1.vo.HoverModalVO;
import com.kh.finalteam1.vo.MainModalDetailVO;

@RestController
@RequestMapping("/data/home")
public class HomeDataController {		
	@Autowired
	private MainModalService mainModalService;
	
	@Autowired
	private WatchLogDao watchLogDao;
		
	@Autowired
	private GenreDao genreDao;
	
	@Autowired
	private ProgramFeatureDao programFeatureDao;
	
	@Autowired
	private ContentDao contentDao;
	
	@Autowired
	private SeriesDao seriesDao;
	
	@Autowired
	private WishListDao wishListDao;
	
	@Autowired
	private LikeListDao likeListDao;
	
	@PostMapping("/insertWatchLog")
	public void insertWatchLog(@ModelAttribute WatchLogDto watchLogDto) {
		watchLogDao.insertWatchLog(watchLogDto);
	}
	
	@PostMapping("/updateContentViews")
	public void updateContentViews(@RequestParam int contentNo) {		
		contentDao.updateContentViews(contentNo);
		System.out.println(contentNo);
	}
	
	@PostMapping("/getContent")
	public MainModalDetailVO getContent(@RequestParam int contentNo, HttpSession session) throws CloneNotSupportedException {		
		MainModalDetailVO mainModalDetailVO = mainModalService.getModalDetailVO(contentNo, getClientNo(session));

		return mainModalDetailVO;
	}
	
	@PostMapping("/insertWishList")
	public void insertWishList(@RequestParam int contentNo, HttpSession session) {
		mainModalService.insertWishList(getClientNo(session), contentNo);		
	}
	
	@PostMapping("/deleteWishList")
	public void deleteWishList(@RequestParam int contentNo, HttpSession session) {
		mainModalService.deleteWishList(getClientNo(session), contentNo);
	}
	
	@PostMapping("/insertLikeList")
	public void insertLikeList(@RequestParam int contentNo, HttpSession session) {
		LikeListDto likeListDto = LikeListDto.builder()
									.clientNo(getClientNo(session))
									.contentNo(contentNo)
								.build();
		
		if(likeListDao.insertLikeList(likeListDto)) {
			contentDao.increaseContentLikes(contentNo);
		}
	}
	
	@PostMapping("/deleteLikeList")
	public void deleteLikeList(@RequestParam int contentNo, HttpSession session) {
		LikeListDto likeListDto = LikeListDto.builder()
									.clientNo(getClientNo(session))
									.contentNo(contentNo)
								.build();
		
		if(likeListDao.deleteLikeList(likeListDto)) {
			contentDao.decreaseContentLikes(contentNo);
		}
	}
	
	public int getClientNo(HttpSession session) {
		return (int)session.getAttribute("clientNo");
	}
	
	@PostMapping("/getGenre")
	public List<GenreDto> getGenre() {
		return genreDao.list();
	}
	
	@PostMapping("/getFeature")
	public List<ProgramFeatureDto> getFeature() {
		return programFeatureDao.list();
	}
	
	
	@PostMapping("/getHoverModalItem")
	public HoverModalVO getHoverModalItem(@RequestParam int contentNo, HttpSession session) {		
		HoverModalVO hoverModalVO = contentDao.getHoverModalVO(contentNo);
		
		if(hoverModalVO.getContentSeries().equals("Y")) {
			hoverModalVO.setSeasonCount(seriesDao.yesTopSeason(contentNo));
		}
		else {
			hoverModalVO.setContentPlayTime((seriesDao.noGet(contentNo)).getContentPlaytime());
		}
		
		WishListDto wishListDto = WishListDto.builder()
									.clientNo(getClientNo(session))
									.contentNo(contentNo)
								.build();
		
		if( wishListDao.getWishList(wishListDto) != null )
			hoverModalVO.setWish(true);
		else
			hoverModalVO.setWish(false);
		
		LikeListDto likeParam = LikeListDto.builder()
									.clientNo(getClientNo(session))
									.contentNo(contentNo)
								.build();

		LikeListDto likeListDto = likeListDao.getLikeList(likeParam);	
						
		if( likeListDto != null )
			hoverModalVO.setLike(true);
		else
			hoverModalVO.setLike(false);
		
		return hoverModalVO;
	}
	
	@GetMapping("/getTvGenreList")
	public List<ContentListVO> getTvGenreList(@RequestParam int genreNo) {
		List<ContentListVO> tvGenreList = contentDao.tvGenreList(genreNo);
		return tvGenreList;
	}
	
	@GetMapping("/getMovieGenreList")
	public List<ContentListVO> getMovieGenreList(@RequestParam int genreNo) {
		List<ContentListVO> movieGenreList = contentDao.movieGenreList(genreNo);
		return movieGenreList;
	}
	
	@PostMapping("/getWishlist")
	public List<ContentDto> getWishlist(HttpSession session){
		int clientNo = (int)session.getAttribute("clientNo");
		
		List<WishListDto> wishList=wishListDao.get(clientNo);	
	
		List<ContentDto> contentList = new ArrayList<ContentDto>();
		for(int i=0;i<wishList.size();i++) {
			contentList.add(contentDao.getList(wishList.get(i).getContentNo()));
		}
		return contentList;
	}
}
