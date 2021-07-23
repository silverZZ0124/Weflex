package kh7finalteam1;

import static org.junit.Assert.assertNotNull;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalteam1.entity.NoSeriesDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class Test01 {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		int contentNo = 1;
		NoSeriesDto noSeriesDto = sqlSession.selectOne("series.noGet", contentNo);
		System.out.println(noSeriesDto);
		
		assertNotNull(noSeriesDto);
	}

}
