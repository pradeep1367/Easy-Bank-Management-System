package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BankDao;
import dao.CustomerDao;
import dto.BankAccount;
import dto.Customer;

@WebServlet("/createbankaccount")
public class Createbankaccount extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String banktype=req.getParameter("banktype");

		Customer customer=(Customer)req.getSession().getAttribute("customer");

		List<BankAccount> list=customer.getAccount();
		boolean flag=true;

		for(BankAccount account:list) 
		{
			if(account.getAccountType().equals(banktype))
			{
				flag=false;
				break;
			}
		}
		if(flag) 
		{
			BankAccount account=new BankAccount();

			account.setAccountType(banktype);

			if(banktype.equals("saving")) 
				account.setAclimit(10000);
			else 
				account.setAclimit(65000);

			account.setCustomer(customer);

			BankDao dao=new BankDao();
			dao.save(account);

			List<BankAccount> list2=list;

			list2.add(account);

			customer.setAccount(list2);

			CustomerDao customerDao=new CustomerDao();
			customerDao.update(customer);

			res.getWriter().print("<h1> Account Created Succesfully wait for the Management Approval</h1>");
			req.getRequestDispatcher("login.html").include(req, res);

		}
		else
		{
			res.getWriter().print("<h1>"+banktype+" Account Already Exits</h1>");
			req.getRequestDispatcher("Customerhome.html").include(req, res);
		}

	}
}
