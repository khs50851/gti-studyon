package com.studyon.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class So_LectureMapperTests {
	private static final Logger log = LoggerFactory.getLogger(So_LectureMapperTests.class);
	
	@Setter(onMethod_ = @Autowired)
	private So_LectureMapper mapper;
	
	@Test
	public void testGetLectInfo() {
		mapper.getLectInfo();
	}
	
}
