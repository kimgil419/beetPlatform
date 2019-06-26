package com.beetoffice.project.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class SourceVO {
	
	@Getter @Setter
	int source_idx, project_idx;
	
	@Getter @Setter
	String user_id, source_name, source_code, source_progress;

}
