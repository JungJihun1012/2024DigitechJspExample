package sample;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class visitCounterServlet
 */
public class visitCounterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public visitCounterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    private int currentValue = 0;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		
        synchronized (this) {
        	currentValue++;
		}
		
		System.out.println(currentValue);
		
		response.getWriter().println("<html><head></head>");
		response.getWriter().println("<body>");
		response.getWriter().println("현재의 값: ");
		response.getWriter().println(currentValue);
		response.getWriter().println("</body>");
		response.getWriter().println("</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
