

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
 * Servlet implementation class RegisterUser1
 */
@WebServlet("/RegisterUser1")
public class RegisterUser1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 response.setContentType("text/html");
		 DatabaseManager db = new DatabaseManager();
		 java.sql.Connection  con = db.getConnection();
		 
		 try (PrintWriter out = response.getWriter()) {
	        	
	           String name = request.getParameter("name");
	           String voter_card_number = request.getParameter("voternumber");
	           String address = request.getParameter("address");
	           String dob = request.getParameter("dob");
	           String contact = request.getParameter("number");
	           String email = request.getParameter("email");
	           
			   
	          PreparedStatement preparedStatement = con.prepareStatement("insert into voters (name,pnumber,email,voter_card_number,addrs,dob)values('"+name+"','"+contact+"','"+email+"','"+voter_card_number+"','"+address+"','"+dob+"')");
			  preparedStatement.executeUpdate();
//			  out.println("registration success");
			  response.sendRedirect("adminWelcome.jsp");
	        
	        } catch (SQLException ex) {
	        	System.out.println(ex.getMessage());
	        } 

		 System.out.println("Working!!!!!");
	}

}
