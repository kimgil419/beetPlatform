/*package com.beetoffice.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
public class WebMvcConfiguration extends WebMvcConfigurationSupport {

	private static final String CLASSPATH_RESOURCE_LOCATION = "classpath:/static/";
	
	@Value("${resource.uploads.root}")
	private String uploadsRoot;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/uploads/**").addResourceLocations(uploadsRoot).setCachePeriod(31536000);
		registry.addResourceHandler("/assets/**").addResourceLocations(CLASSPATH_RESOURCE_LOCATION+"assets/").setCachePeriod(31536000);
        registry.addResourceHandler("/vendor/**").addResourceLocations(CLASSPATH_RESOURCE_LOCATION+"vendor/").setCachePeriod(31536000);
        registry.addResourceHandler("/html/**").addResourceLocations(CLASSPATH_RESOURCE_LOCATION+"html/").setCachePeriod(31536000);
	}
	
}
*/