package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import dto.Customer;

@WebServlet("/customersignup")
public class CustomerSignup extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CustomerDao dao=new CustomerDao();

		long mobile=Long.parseLong(req.getParameter("mobile"));
		String email=req.getParameter("email"); 
		Date date=Date.valueOf(req.getParameter("dob"));

		int	age=Period.between(date.toLocalDate(), LocalDate.now()).getYears();
		if(age<18)
		{
			resp.getWriter().print("<h1> You have to be 18 above to create an account</h1>");
			req.getRequestDispatcher("signup.html").include(req, resp);

		}
		else
		{
			if(dao.check(mobile).isEmpty()&&dao.check(email).isEmpty()) 
			{
				Customer customer=new Customer();
				customer.setName(req.getParameter("name"));
				customer.setEmail(req.getParameter("email"));
				customer.setPassword(req.getParameter("password"));
				customer.setGender(req.getParameter("gender"));
				customer.setDob(date);
				customer.setMobile(mobile);

				dao.save(customer);
				Customer customer2=dao.check(email).get(0);
				resp.getWriter().print("<h1>Account Created Successfuly</h1>");
				if(customer2.getGender().equals("male"))
					resp.getWriter().print("<h1>Hello Sir</h1>");
				else
					resp.getWriter().print("<h1>Hello Mam</h1>");
				resp.getWriter().print("<h1>Your customer Id is:-"+customer2.getCust_id()+"</h1>");
				req.getRequestDispatcher("home.html").include(req, resp);

			}   
			else
			{
				resp.getWriter().print("<h1> Email and Mobile number alreadly exits</h1>");
				req.getRequestDispatcher("signup.html").include(req, resp);

			}
		}
	}
}
