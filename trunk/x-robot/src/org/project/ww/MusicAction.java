package org.project.ww;

import java.util.List;

import org.project.dao.MusicDao;

import com.catic.tool.PageInfo;
import com.opensymphony.xwork.ActionSupport;

public class MusicAction extends ActionSupport {

	private List musicList;

	public String execute() throws Exception {

		if (t_type == null)
			t_type = "全部";

		if (t_key == null)
			t_key = "";

		if (type == null || type.equals("0"))
			type = "";
		
		if(type.equals("1"))
			type = "流行音乐";
		if(type.equals("2"))
			type = "幽默诙谐";
		if(type.equals("3"))
			type = "影视动漫";
		if(type.equals("4"))
			type = "其他流行";

		if (op.equals("music")) {
			pageInfo = new PageInfo();
		    pageInfo.setPage(page);
		    pageInfo.setPageRows(pageRows);
			musicList = musicDao.getMusicList(t_key, t_type, type, pageInfo);
			return "music";
		}

		return SUCCESS;
			
	}

	private String op;
	private String t_key;
	private String t_type;
	private String type;
	private String user_msn;

	private MusicDao musicDao;

	public List getMusicList() {
		return musicList;
	}

	public void setMusicList(List musicList) {
		this.musicList = musicList;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getT_key() {
		return t_key;
	}

	public void setT_key(String t_key) {
		this.t_key = t_key;
	}

	public String getT_type() {
		return t_type;
	}

	public void setT_type(String t_type) {
		this.t_type = t_type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public MusicDao getMusicDao() {
		return musicDao;
	}

	public void setMusicDao(MusicDao musicDao) {
		this.musicDao = musicDao;
	}

	private int page = 1;
	private int pageRows = 10;
	private PageInfo pageInfo;

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	/**
	 * @return 返回 page。
	 * 
	 */
	public int getPage() {

		return page;
	}

	/**
	 * @param page
	 *            要设置的 page。
	 * 
	 */
	public void setPage(int page) {
		if (page >= 1)
			this.page = page;
	}

	/**
	 * @return 返回 pageRows。
	 * 
	 */
	public int getPageRows() {

		return pageRows;
	}

	/**
	 * @param pageRows
	 *            要设置的 pageRows。
	 * 
	 */
	public void setPageRows(int pageRows) {

		this.pageRows = pageRows;
	}

	public String getUser_msn() {
		return user_msn;
	}

	public void setUser_msn(String user_msn) {
		this.user_msn = user_msn;
	}
}
