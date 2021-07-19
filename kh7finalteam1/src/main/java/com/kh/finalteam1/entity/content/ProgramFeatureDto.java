package com.kh.finalteam1.entity.content;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProgramFeatureDto {
	private int featureNo;
	private String featureName;
	
	private String newFeatureName;
}
