package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import dto.Customer;

@WebServlet("/customerLogin")
public class CustomerLogin  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userid= Integer.parseInt(req.getParameter("userid"));
		String password=req.getParameter("password");

		CustomerDao dao=new CustomerDao();
		Customer  customer =dao.login(userid);
		if(customer==null) 
		{
			resp.getWriter().print("<h1>Invalid Customer Id</h1>");
			req.getRequestDispatcher("login.html").include(req, resp);
		}

		else 
		{
			if(customer.getPassword().equals(password))
			{
				//--Session adding the login of customer--
				req.getSession().setAttribute("customer", customer);

				resp.getWriter().print("<h1>Login Success</h1>");
				req.getRequestDispatcher("Customerhome.html").include(req, resp);

			}
			else
			{
				resp.getWriter().print("<h1>Invalid password</h1>");
				req.getRequestDispatcher("login.html").include(req, resp);


			}
		}
	}
}
