package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import controller.action.Action;


public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(FrontController.class);
	HashMap<String,Action> mapper =null;
	
	@Override
	public void init() throws ServletException {
		mapper = (HashMap<String, Action>) getServletContext().getAttribute("mapper");
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		doProcess(request, response);
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info("진입");
		
		String key = request.getServletPath(); // *.do
		if(key.contains(".do")) {
			key = key.substring(key.lastIndexOf("/")+1, key.lastIndexOf(".")); // *
		} else {
			key = request.getParameter("command");
		}
		mapper.get(key);
		/*
		String key = request.getParameter("command");*/
		log.info("url-pattern : "+key+"\t mapped class : "+mapper.get(key));
		
		if(key == null){
			key = "login";
		}
		Action action = mapper.get(key);
		action.execute(request, response);
		
	}
	
}
