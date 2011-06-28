package net.sf.service.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.util.Assert;

public class DBUtils {
	// Prevent initiation
	private DBUtils() {

	}

	/**
	 * Format the list elements to the string for the IN clause of oracle.<br>
	 * <B>NOTE: It is without brackets</B>
	 * 
	 * @param list
	 * @return "'a','b','c'"
	 */
	public static String toInList(List<String> list) {
		StringBuilder r = new StringBuilder("");
		if (list == null || list.isEmpty()) {
			return r.toString();
		}
		int i = 0;
		for (String s : list) {
			if (i > 0 && i < list.size()) {
				r.append(",");
			}
			r.append("'").append(s).append("'");
			i++;
		}
		return r.toString();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<String> l = new ArrayList<String>();
		l.add("a");
		l.add("b");
		l.add("c");
		Assert.isTrue("'a','b','c'".equals(DBUtils.toInList(l)));

	}

}
