package com.kh.finalteam1.vo;

import com.kh.finalteam1.entity.WishListDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SimilarContentVO {
	private int contentNo;
	private String contentThumbnail;
	private int contentLimit;
	private int contentRelease;
	private String contentInfo;
	private int seasonCount;
	private int contentPlayTime;
	private int clientNo;
	private int matchingCount;
	
	@Override
	public SimilarContentVO clone() throws CloneNotSupportedException {
		return SimilarContentVO.builder()
				.contentNo(this.contentNo)
				.contentThumbnail(this.contentThumbnail)
				.contentLimit(this.contentLimit)
				.contentRelease(this.contentRelease)
				.contentInfo(this.contentInfo)
				.seasonCount(this.seasonCount)
				.contentPlayTime(this.contentPlayTime)
				.clientNo(this.clientNo)
				.matchingCount(this.matchingCount)
			.build();
	}
}
