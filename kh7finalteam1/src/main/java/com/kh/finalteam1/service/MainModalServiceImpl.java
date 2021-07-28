package com.kh.finalteam1.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.LikeListDto;
import com.kh.finalteam1.entity.WishListDto;
import com.kh.finalteam1.entity.YesSeriesDto;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.LikeListDao;
import com.kh.finalteam1.repository.SeriesDao;
import com.kh.finalteam1.repository.WatchLogDao;
import com.kh.finalteam1.repository.WishListDao;
import com.kh.finalteam1.vo.MainModalDetailVO;
import com.kh.finalteam1.vo.SimilarContentVO;

@Service
public class MainModalServiceImpl implements MainModalService {
	@Autowired
	private SqlSession sqlSession;
		
	@Autowired
	private ContentDao contentDao;
	
	@Autowired
	private SeriesDao seriesDao;
	
	@Autowired
	private WishListDao wishListDao;
	
	@Autowired
	private LikeListDao likeListDao;
	
	@Override
	public MainModalDetailVO getModalDetailVO(int contentNo, int clientNo) {
		//해당 content 가져오는 메소드
		ContentDto contentDto = contentDao.get(contentNo);
				
		//series 여부가 Y면 seriesDto List 가져오기
		List<YesSeriesDto> seriesList = new ArrayList<YesSeriesDto>();
		if(contentDto.getContentSeries().equals("Y")) {
			seriesList = seriesDao.yesList(contentNo);
		}	
		
		//해당 content에 해당하는 wishlist 불러오기
		WishListDto parameter = WishListDto.builder()
									.clientNo(clientNo)
									.contentNo(contentNo)
								.build();		
		WishListDto wishListDto = wishListDao.getWishList(parameter);
		
		LikeListDto likeParam = LikeListDto.builder()
								.clientNo(clientNo)
								.contentNo(contentNo)
							.build();
		
		LikeListDto likeListDto = likeListDao.getLikeList(likeParam);
				
		//해당 content의 장르 가져오는 메소드
		List<String> genreList = getGenre(contentNo);
		
		//해당 content의 프로그램 특징 가져오는 메소드
		List<String> featureList = getFeature(contentNo);
		
		//해당 content의 출연진 가져오는 메소드
		List<String> castList = getCast(contentNo);
		
		List<SimilarContentVO> similarList = getSimilarList(genreList);
		
		MainModalDetailVO mainModalDetailVO = MainModalDetailVO.builder()
								.contentDto(contentDto)
								.genreList(genreList)
								.featureList(featureList)
								.castList(castList)
								.seriesList(seriesList)
								.wishListDto(wishListDto)
								.likeListDto(likeListDto)
								.similarList(similarList)
							.build();
		
		return mainModalDetailVO;
	}
	
	@Override
	public List<SimilarContentVO> getSimilarList(List<String> genreList) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<String> getGenre(int contentNo) {
		return sqlSession.selectList("mainModalService.getGenre", contentNo);
	}

	@Override
	public List<String> getFeature(int contentNo) {
		return sqlSession.selectList("mainModalService.getFeature", contentNo);
	}

	@Override
	public List<String> getCast(int contentNo) {
		return sqlSession.selectList("mainModalService.getCast", contentNo);
	}

	@Override
	public void insertWishList(int clientNo, int contentNo) {
		WishListDto wishListDto = WishListDto.builder()
									.clientNo(clientNo)
									.contentNo(contentNo)
								.build();
		
		wishListDao.insertWishList(wishListDto);
	}

	@Override
	public void deleteWishList(int clientNo, int contentNo) {
		WishListDto wishListDto = WishListDto.builder()
									.clientNo(clientNo)
									.contentNo(contentNo)
								.build();

		wishListDao.deleteWishList(wishListDto);
		
	}

	
}
