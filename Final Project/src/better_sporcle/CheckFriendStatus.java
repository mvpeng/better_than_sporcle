package better_sporcle;

import java.sql.*;

public class CheckFriendStatus {

	public static String displayFriendStatus(Connection con, String me, String them) throws SQLException {
		Statement stmt = con.createStatement();
		stmt.executeQuery("USE " + MyDBInfo.MYSQL_DATABASE_NAME);
		String cond1 = "(username_from=\"" + me +"\" OR username_to=\"" + me + "\")";
		String cond2 = "(username_from=\"" + them +"\" OR username_to=\"" + them + "\")";
		ResultSet rs = stmt.executeQuery("SELECT * FROM friends WHERE " + cond1 + " AND " + cond2);
		if (!rs.isBeforeFirst()) {
			return displayFriendButton(them);
		} else {
			//there should only ever be one entry per pair, so can use rs.first()
			rs.first();
			int status = rs.getInt("status");
			if (status == 1) {
				return displayAlreadyFriends(them);
			} else { //status is 0
				if (rs.getString("username_from").equals(me)) {
					return displayRequestPending();
				} else {
					return displayRespondToRequest(them);
				}
			}
		}
	}
	
	public static String displayRespondToRequest(String them) {
		String confirm = "<form action=\"ConfirmFriendRequestServlet\" method=\"post\"><input type=\"hidden\" name=\"them\" value=" +them+"><input type=\"submit\" value=\"Confirm Friend Request\"></form>";
		String delete = "<form action=\"DeleteFriendRequestServlet\" method=\"post\"><input type=\"hidden\" name=\"them\" value=" +them+"><input type=\"submit\" value=\"Delete Friend Request\"></form>";
		return confirm+delete;
	}
	
	public static String displayRequestPending() {
		String out = "<p>Your friend request to this user is pending</p>";
		return out;
	}
	
	public static String displayAlreadyFriends(String them) {
		String out = "<p>You are friends! :) </p>";
		String delete = "<form action=\"DeleteFriendRequestServlet\" method=\"get\"><input type=\"hidden\" name=\"them\" value=" +them+"><input type=\"submit\" value=\"Remove from Friends?\"></form>";
		return out+delete;
	}
	
	public static String displayFriendButton(String them) {
		String out = "<form action=\"SendFriendRequestServlet\" method=\"post\"><input type=\"hidden\" name=\"them\" value=" +them+"><input type=\"submit\" value=\"Send Friend Request\"></form>";
		return out;
	}
}
