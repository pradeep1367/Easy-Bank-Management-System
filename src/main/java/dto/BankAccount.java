package dto;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;

@Entity
public class BankAccount {
	@Id
	@GeneratedValue(generator = "acno")
	@SequenceGenerator(initialValue = 200000120, allocationSize = 1, sequenceName = "acno", name = "acno")
	private Long accountNo;

	private String accountType;
	private double amount;
	private boolean status;
	private double aclimit;

	@ManyToOne
	private Customer customer;

	@OneToMany(cascade = CascadeType.ALL)
	private List<Transaction> transactions = new ArrayList<>();

	public BankAccount() {}

	// Getters and Setters--
	
	public Long getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public double getAclimit() {
		return aclimit;
	}

	public void setAclimit(double aclimit) {
		this.aclimit = aclimit;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<Transaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<Transaction> transactions) {
		this.transactions = transactions;
	}
}
