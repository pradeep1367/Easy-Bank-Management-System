package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BankDao;
import dto.BankAccount;
import dto.Transaction;
import dto.Customer;
@WebServlet("/Withdraw")
public class Withdraw  extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Customer customer=(Customer) req.getSession().getAttribute("customer");
		if(customer== null)
		{
			resp.getWriter().print("<h1> Session Expired Login</h1>");
			req.getRequestDispatcher("login.html").include(req, resp);
		}
		else
		{
			double amt=Double.parseDouble(req.getParameter("amt"));

			long acno=(long)req.getSession().getAttribute("acno");
			BankDao bankDao=new BankDao();

			BankAccount  account=bankDao.find(acno);


			if(amt>account.getAmount()) 
			{
				resp.getWriter().print("<h1>Insufficent Balance</h1>");
				req.getRequestDispatcher("AccountHome.jsp").include(req, resp);
			}
			else 
			{

				if(amt>account.getAclimit())
				{
					resp.getWriter().print("<h1>Out of Limit Enter the within the limit 10000</h1>");
					req.getRequestDispatcher("AccountHome.jsp").include(req, resp);
				}
				else 
				{

					account.setAmount(account.getAmount()-amt);

					Transaction transaction=new Transaction();
					transaction.setDeposit(0);
					transaction.setWithdraw(amt);
					transaction.setBalance(account.getAmount());
					transaction.setDateTime(LocalDateTime.now());

					List<Transaction>list=account.getTransactions();
					list.add(transaction);

					account.setTransactions(list);


					bankDao.update(account);

					resp.getWriter().print("<h1>Amount Withdraw Succesfully</h1>");
					req.getRequestDispatcher("AccountHome.jsp").include(req, resp);
				}
			} 
		}
	}
}
