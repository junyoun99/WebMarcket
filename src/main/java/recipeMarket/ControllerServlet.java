package recipeMarket;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet(urlPatterns = "*.go", initParams = {@WebInitParam(name = "config", value = "/WEB-INF/commandHandler.properties") })
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//<커맨드, 핸들러인스턴스> 매핑 정보 저장
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	//서블릿을 생성하고 초기화할 때 제일 먼저 실행되는 메소드 : init()
	
	public void init(ServletConfig config) throws ServletException {
		String configFile = config.getInitParameter("config");
		Properties prop = new Properties();
		String configFilePath = config.getServletContext().getRealPath(configFile);
		try(FileInputStream fis = new FileInputStream(configFilePath)){
			prop.load(fis);
		} catch (IOException e) {
			throw new ServletException(e);
		}
		
		//속성 파일을 하나씩 읽어서 키값(호출되는 패턴), 실행명령 핸들러로 맵에 저장
		Iterator<Object> keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()) {
			String command = (String) keyIter.next();	//키값 읽고
			String handlerClassName = prop.getProperty(command); //값 읽기
			
			try{
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
				
				commandHandlerMap.put(command, handlerInstance);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
		
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			process(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			process(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String command = request.getRequestURI();
		//command = /week13/hello.do
		
		//request.getContextPath = /week13
		command = command.substring(request.getContextPath().length() + 1);
		//command = hello.do
		
		CommandHandler handler = commandHandlerMap.get(command);
		
		
		
		
		String viewPage = handler.process(request, response);
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		
		rd.forward(request, response);
		
	}

}
