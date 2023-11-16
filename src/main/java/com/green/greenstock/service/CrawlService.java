package com.green.greenstock.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.green.greenstock.dto.NewsCrawlDTO;

@Service
public class CrawlService {

	/*
	 * public Map<String, String> indexCrawl() { try { // 아래 URL 은 삭제되었을 수 있으므로, 문제가
	 * 발생한다면 최신 기사의 URL 을 사용한다. //
	 * https://www.google.com/search?q=%EC%97%90%EC%BD%94%ED%94%84%EB%A1%9C&dpr=1
	 * Document doc = Jsoup.connect("https://finance.naver.com/").get(); Elements
	 * element2 = doc.select(".num"); System.out.println("실행됨"); Map<String, String>
	 * map = new HashMap<>(); map.put("cospivalue", element2.get(1).text());
	 * map.put("cosdaqvalue", element2.get(2).text()); map.put("cospi200value",
	 * element2.get(3).text()); return map; } catch (IOException e) { // e 에는 thumb
	 * 클래스와 a 가 있다. e.printStackTrace(); return null; } }
	 * 
	 */
	public List<NewsCrawlDTO> newsCrawl() {
		try {
			Document doc = Jsoup.connect("https://finance.naver.com/news/mainnews.naver").get();
			Elements newsList = doc.select(".newsList");
			Elements newsContents = newsList.select("dl");
			List<NewsCrawlDTO> newsCrawlList = new ArrayList<>();
			newsContents.forEach(e -> {
				NewsCrawlDTO dto = new NewsCrawlDTO();
				dto.setThumb(e.select(".thumb img").attr("src"));
				dto.setAhref(e.select(".articleSubject a").attr("abs:href"));
				dto.setSubject(e.select(".articleSubject a").text());
				dto.setSummary(e.select(".articleSummary").text());
				dto.setCompany(e.select(".articleSummary .press").text());
				dto.setRegdate(e.select(".articleSummary .wdate").text());
				newsCrawlList.add(dto);
			});
			return newsCrawlList;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}