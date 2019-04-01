import java.util.List;

import model.DAO;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DAO dao = new DAO();
		List<String> jobs = dao.getAllJobId();
		for (String job : jobs) {
			System.out.println(job);
		}
	}

}
