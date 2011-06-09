package org.project.impl;

import java.util.List;

import org.project.dao.MusicDao;
import org.project.dao.SqlDao;

import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class MusicImpl implements MusicDao {

	private SqlDao sqlDao;

	public List getMusicList(String t_key, String t_type, String type,
			PageInfo pageInfo) {

		String sql = "select t.id,t.songs,t.singer,t.type,t.valid from t_ring t where 1=1";

		if (!type.equals("")) {
			sql = sql + " and t.type = '" + type + "'";
		}
		if (t_type.equals("全部") && !t_key.equals("")) {
			sql = sql + " and (upper(t.songs) like '%" + t_key.toUpperCase()
					+ "%' or upper(t.singer) like '%" + t_key.toUpperCase()
					+ "%')";
		}
		if (t_type.equals("歌曲") && !t_key.equals("")) {
			sql = sql + " and upper(t.songs) like '%" + t_key.toUpperCase()
					+ "%'";
		}
		if (t_type.equals("歌手") && !t_key.equals("")) {
			sql = sql + " and upper(t.singer) like '%" + t_key.toUpperCase()
					+ "%'";
		}

		sql = sql + " order by id desc";

		PageCtrl pageCtrl = new PageCtrl();
		pageCtrl.setSqlDao(sqlDao);
		pageCtrl.setPageInfo(pageInfo);
		pageCtrl.setStrSQL(sql);
		return pageCtrl.getRecords();

	}

	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
