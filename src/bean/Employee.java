package bean;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the EMPLOYEES database table.
 * 
 */
@Entity
@Table(name="EMPLOYEES")
@NamedQueries ({
	@NamedQuery(name="Employee.findAll", query="SELECT e FROM Employee e"),
	@NamedQuery(name="Employee.findEmployeeByFirstAndLastName", 
                query="SELECT e FROM Employee e WHERE e.firstName = ?1 and e.lastName = ?2")
})
public class Employee implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name="EMPLOYEE_ID")
	private long employeeId;


	@Column(name="FIRST_NAME")
	private String firstName;
	
	@Column(name="LAST_NAME")
	private String lastName;
	
	private String email;
	
	@Temporal(TemporalType.DATE)
	@Column(name="HIRE_DATE")
	private Date hireDate;
	
	@Column(name="PHONE_NUMBER")
	private String phoneNumber;

	private Double salary;
	
	@Column(name="COMMISSION_PCT")
	private Double commissionPct;
	@Column(name="JOB_ID")
	private String jobId;
	@Column(name="MANAGER_ID")
	private int managerId;

	@Column(name="DEPARATMENT_ID")
	private int departmentId;



	public Employee() {
	}



	public Employee(String firstName, String lastName, String email, Date hireDate, String phoneNumber, Double salary,
			Double commissionPct, String jobId, int managerId, int departmentId) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.hireDate = hireDate;
		this.phoneNumber = phoneNumber;
		this.salary = salary;
		this.commissionPct = commissionPct;
		this.jobId = jobId;
		this.managerId = managerId;
		this.departmentId = departmentId;
	}



	public long getEmployeeId() {
		return employeeId;
	}



	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}



	public String getFirstName() {
		return firstName;
	}



	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}



	public String getLastName() {
		return lastName;
	}



	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public Date getHireDate() {
		return hireDate;
	}



	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}



	public String getPhoneNumber() {
		return phoneNumber;
	}



	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}



	public Double getSalary() {
		return salary;
	}



	public void setSalary(Double salary) {
		this.salary = salary;
	}



	public Double getCommissionPct() {
		return commissionPct;
	}



	public void setCommissionPct(Double commissionPct) {
		this.commissionPct = commissionPct;
	}



	public String getJobId() {
		return jobId;
	}



	public void setJobId(String jobId) {
		this.jobId = jobId;
	}



	public int getManagerId() {
		return managerId;
	}



	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}



	public int getDepartmentId() {
		return departmentId;
	}



	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}



	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", firstName=" + firstName + ", lastName=" + lastName + ", email="
				+ email + ", hireDate=" + hireDate + ", phoneNumber=" + phoneNumber + ", salary=" + salary
				+ ", commissionPct=" + commissionPct + ", jobId=" + jobId + ", managerId=" + managerId
				+ ", departmentId=" + departmentId + "]";
	}

	

}