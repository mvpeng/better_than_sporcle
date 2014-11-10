package login2;

import java.util.HashMap;

public class AccountManager {
	private HashMap<String,String> passwords;
	
	public AccountManager() {
		passwords = new HashMap<String,String>();
	}
	
	public void createAccount(String name, String pass) {
		passwords.put(name, pass);
	}
	
	public boolean accountExists(String name) {
		return passwords.containsKey(name);
	}
	
	public boolean passCorrect(String name, String pass) {
		String pw = passwords.get(name);
		if (pw != null) {
			return pw.equals(pass);
		} else {
			return false;
		}
	}
}
