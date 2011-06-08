package com.catic.bean;

import net.sf.robot.util.message.InstanceMessage;
import net.sf.robot.util.service.impl.Queue;

import com.catic.tool.DataBase;

public class InviteBuddy {

	String sql = "";

	DataBase db = new DataBase();

	public String getStr(String str) {
		try {
			String temp_p = str;
			byte[] temp_t = temp_p.getBytes("ISO8859-1");
			String temp = new String(temp_t);
			return temp;
		} catch (Exception e) {
		}
		return "NULL";
	}

	public String addContact(String FRIENDEMAILSTR, String CONTACTEMAIL,
			String delay) {
		String strResult = "";

		try {
			String[] FStr = FRIENDEMAILSTR.split(",");

			for (int i = 0; i < FStr.length; i++) {
				String[] contact = FStr[i].split(";");

				if (isInvited(contact[0]) == 1) {// ����ɹ�
					strResult = strResult + contact[0] + ",1" + ";";
				} else if (isInviting(contact[0]) == 1) {// ������
					strResult = strResult + contact[0] + ",2" + ";";
				} else {

					sql = "insert into T_FRIEND(FRIENDID,CONTACTEMAIL,FRIENDEMAIL,CREATEDATE,SUCCESS,INVITE_TIME,FRIEND_EMAIL) values(friendid.nextval,'"
							+ CONTACTEMAIL + "','" + contact[0] + "',sysdate,0,";

					if (delay.equals("0")) {

						sql = sql + "sysdate,'"+contact[1]+"')";

						db.update(sql);

//						try {
//							InstanceMessage message = new InstanceMessage(
//									"www.10010.com@hotmail.com", // ����һ��InstanceMessage
//									contact, "contact add " + contact);
//
//							message
//									.setInnerType(InstanceMessage.INNERTYPE_MSNCONTROL); // ���ø�Message������
//							message.setRequest(false); // ���ø�Message����һ���û���request
//
//							Queue.pushResponse(message); // ��message����Queue,ϵͳ���Զ����͵�ƽ̨
//
//							System.out.println(message.getContact());
//						} catch (Exception ex) {
//							ex.printStackTrace();
//						}

					}

					if (delay.equals("5")) {

						sql = sql + "SYSDATE + 5/(24 * 60),'"+contact[1]+"')";

						db.update(sql);
					}

					if (delay.equals("60")) {

						sql = sql + "sysdate + 1/24,'"+contact[1]+"')";

						db.update(sql);
					}

					strResult = strResult + contact[0] + ",0" + ";";

				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return strResult;
	}

	// ��������
	public String getTotal(String msnid) {

		sql = "select count(1) from T_FRIEND t where T.CONTACTEMAIL = '"
				+ msnid + "'";

		return db.getBySql(sql);
	}

	// ����ɹ���
	public String getSuccess(String msnid) {
		sql = "select count(1) from T_FRIEND t where T.CONTACTEMAIL = '"
				+ msnid + "' and T.SUCCESS = 1";
		return db.getBySql(sql);
	}

	// ���ֻ���
	public String getUnicom(String msnid) {
		sql = "select count(1) from T_FRIEND t,MSN_CERTIFICATION m where T.FRIENDEMAIL = M.USER_MSN and T.CONTACTEMAIL = '"
				+ msnid + "'";
		return db.getBySql(sql);
	}

	// �Ƿ���������
	public int isInviting(String msnid) {

		sql = "select 1 from T_FRIEND t where T.SUCCESS = 0 and T.FRIENDEMAIL = '"
				+ msnid + "'";

		return db.isExist(sql);// ����-1 ������-0

	}

	// �Ƿ�����ɹ�
	public int isInvited(String msnid) {

		sql = "select 1 from T_FRIEND t where T.SUCCESS = 1 and T.FRIENDEMAIL = '"
				+ msnid + "'";

		return db.isExist(sql);// ����-1 ������-0
	}
}
