package dto;

import java.sql.Date;
import java.util.List;
import javax.persistence.*;

@Entity
public class Customer {
    @Id
    @SequenceGenerator(initialValue = 100000011, allocationSize = 1, sequenceName = "custid", name = "custid")
    @GeneratedValue(generator = "custid")
    private int cust_id;

    private String name;
    private String email;
    private String password;
    private Long mobile;
    private Date dob;
    private String gender;

    @OneToMany
    private List<BankAccount> account;

    public Customer() {}

    // Getters and Setters---
    
    public int getCust_id() {
        return cust_id;
    }

    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Long getMobile() {
        return mobile;
    }

    public void setMobile(Long mobile) {
        this.mobile = mobile;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public List<BankAccount> getAccount() {
        return account;
    }

    public void setAccount(List<BankAccount> account) {
        this.account = account;
    }
}
