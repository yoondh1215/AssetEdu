package kr.co.kfs.assetedu.servlet.view;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.View;

import com.google.gson.Gson;

public class JsonView implements View {

	@Override
	public void render(Map<String, ?> model, 
			HttpServletRequest request, 
			HttpServletResponse response)
			throws Exception {

		Gson gson = new Gson(); 
		String json = gson.toJson(model); 
		PrintWriter out;
		response.setContentType("application/json; charset=utf-8");
		out = response.getWriter();
		out.write(json);
		out.flush();
		out.close();		
	}

}
