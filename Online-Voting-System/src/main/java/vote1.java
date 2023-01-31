

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class vote1
 */
@WebServlet("/vote1")
public class vote1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        DatabaseManager db = new DatabaseManager();
		java.sql.Connection  con = db.getConnection();
		
		String voter_card_number = request.getParameter("voterNumber");
		String partie = request.getParameter("partie");
		
		try {
            
        	PreparedStatement preparedStatement1 = con.prepareStatement("insert into temp_vc_number(voter_card_number)values('"+voter_card_number+"')");
        	PreparedStatement preparedStatement2 = con.prepareStatement("insert into vote(voter_card_number,partie)values ('"+voter_card_number+"','"+partie+"')");
        	
        	preparedStatement1.executeUpdate();
        	preparedStatement2.executeUpdate();
          
            response.sendRedirect("index.jsp");
            
        } catch (SQLException e) {
        	out.println(e.getMessage());
        }
		
		System.out.println("vote1 Working... yes ");
	}

}
