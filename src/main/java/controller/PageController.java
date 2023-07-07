package controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.animal.AnimalBody;

@WebServlet
public class PageController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse rsep) throws ServletException, IOException {
		
		Map<String, String> params = new LinkedHashMap<>();
		
		
		
//		boolean exPr = p >= 10;
		boolean exNx  ;
		
		req.setAttribute("exPr", true);
		req.setAttribute("exNx", false);

//		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, rsep);
	}
}
