var gridId = "question-grid";
var gridContainer = Ext.get(gridId);
var ds;

var userDateKey = "[[USER_DATE]]";
var contentKey = "[[CONTENT]]";
var robotAnswerTmp = '<table><tr><td width=100% align=center colspan=3><table width=100% cellspacing=0 cellpadding=0 border=0><tr><td width=1% align=left class=top><img width=8 height=19 src=../images/agent/chat_corner.jpg></td><td width=16% class=top></td><td width=52% align=left class=top><img width=60 height=19 src=../images/agent/a1.jpg></td><td width=31% align=right class=top><img width=8 height=19 src=../images/agent/chat_corner2.jpg></td></tr></table><table width=100% cellspacing=0 cellpadding=0 border=0><tr><td class=lr_border>&nbsp;</td><td align=left><table width=100% cellspacing=0 cellpadding=0 border=0><tr><td valign=top class=chat1_color><table width=100% cellspacing=0 cellpadding=0 border=0><tr><td class=chat1_bg><table width=100% cellspacing=1 cellpadding=1 border=0><tr><td width=3% align=left><img width=28 height=27 src=../images/agent/chat_pic1.jpg></td><td width=97% class=greycolor>&nbsp;&nbsp;[[USER_DATE]]</td></tr><tr><td class=blackcolor colspan=2>[[CONTENT]]</td></tr></table></td></tr></table></td></tr></table></td><td class=rr_border>&nbsp;</td></tr></table><table width=100% cellspacing=0 cellpadding=0 border=0><tr><td width=10 valign=top align=left class=bottom><img width=8 height=15 src=../images/agent/chat_corner3.jpg></td><td width=1196 height=5 class=bottom>&nbsp;</td><td width=13 valign=top align=right class=bottom><img width=8 height=15 src=../images/agent/chat_corner4.jpg></td></tr></table></td></tr></table>';
var userAnswerTmp = '<table><tr><td width=100% align=center colspan=3><table width=100% cellspacing=0 cellpadding=0 border=0><tr><td width=1% align=left class=top_11><img width=8 height=19 src=../images/agent/chat_corner_2.jpg></td><td width=16% class=top_11></td><td width=52% align=right class=top_11><img width=60 height=19 src=../images/agent/a1_1.jpg></td><td width=31% align=right class=top_11><img width=8 height=19 src=../images/agent/chat_corner2_1.jpg></td></tr></table><table width=100% cellspacing=0 cellpadding=0 border=0><tr><td class=lr_border_11>&nbsp;</td><td align=left><table width=100% cellspacing=0 cellpadding=0 border=0><tr><td valign=top class=chat2_color><table width=100% cellspacing=0 cellpadding=0 border=0><tr><td class=chat2_bg><table width=100% cellspacing=1 cellpadding=1 border=0><tr><td width=3% align=left><img width=28 height=27 src=../images/agent/chat_pic2.jpg></td><td width=97% class=greycolor>&nbsp;&nbsp;[[USER_DATE]]</td></tr><tr><td class=blackcolor colspan=2>[[CONTENT]]</td></tr></table></td></tr></table></td></tr></table></td><td class=rr_border_11>&nbsp;</td></tr></table><table width=100% cellspacing=0 cellpadding=0 border=0><tr><td width=10 valign=top align=left class=bottom_11><img width=8 height=15 src=../images/agent/chat_corner3_1.jpg></td><td width=1196 height=5 class=bottom_11>&nbsp;</td><td width=13 valign=top align=right class=bottom_11><img width=8 height=15 src=../images/agent/chat_corner4_1.jpg></td></tr></table></td></tr></table>';
var oriState = "3";
var finishedState = "1";
var processingState = "2";
function cleanSearch() {
	isSearch = false;
	Ext.get('search-key').dom.value = "";
	Ext.get('search-user').dom.value = "";
	Ext.get('dateBegin').dom.value = "";
	Ext.get('dateEnd').dom.value = "";
	ds.proxy.conn.url = './agent.action';
	ds.reload( {
		params : {
			start : 0,
			limit : 20
		}
	});
}

Ext.onReady(function() {
	Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
	var cm = new Ext.grid.ColumnModel( [ new Ext.grid.RowNumberer(), {
		header : 'ID',
		dataIndex : 'q_id',
		hidden : 'true'
	}, {
		header : '��ѯ����',
		dataIndex : 'q_content',
		width : 150
	}, {
		header : '������',
		dataIndex : 'q_user',
		renderer : function(value, cellMeta, record, rowIndex, columnIndex, store) {
			var tel = record.data['user_tel'];
			return tel ? tel : value;
		}
	}, {
		header : '����',
		dataIndex : 'q_date',
		renderer : Ext.util.Format.dateRenderer('Y-m-d H:i:s')
	}, {
		header : '״̬',
		dataIndex : 'q_state',
		width : 60,
		renderer : function(value) {
			if (value == 1) {
				return "�Ѵ���";
			} else if (value == 2) {
				return "������";
			} else {
				return "δ����";
			}
		}
	} ]);
	cm.defaultSortable = true;

	isSearch = false;

	var proxy = new Ext.data.HttpProxy( {
		url : './agent.action'
	});

	proxy.on('beforeload', function(p, params) {
		if (isSearch) {
			params.searchKey = encodeURIComponent(Ext.get('search-key').dom.value);
			params.searchUser = Ext.get('search-user').dom.value;
			var db = Ext.get('dateBegin');
			var de = Ext.get('dateEnd');
			if (db.getValue() || de.getValue()) {
				var b = db.getValue() ? db.getValue() : " ";
				var e = de.getValue() ? de.getValue() : " ";
				params.searchDateRange = b + "|" + e;
			}
		}
	});

	ds = new Ext.data.Store( {
		proxy : proxy,
		reader : new Ext.data.JsonReader( {
			totalProperty : 'totalCount',
			root : 'questions',
			id : 'q_id'
		}, [ {
			name : 'q_id'
		}, {
			name : 'q_content'
		}, {
			name : 'q_user'
		}, {
			name : 'q_date',
			type : 'date',
			mapping : 'q_date.time',
			dateFormat : 'time'
		}, {
			name : 'q_state'
		}, {
			name : 'user_tel'
		} ])
	});
	ds.setDefaultSort('q_date', 'DESC');

	function doSearch() {
		var sk = Ext.get('search-key');
		var su = Ext.get('search-user');

		var db = Ext.get('dateBegin');
		var de = Ext.get('dateEnd');

		if (Ext.util.Format.trim(sk.dom.value).length < 1 && Ext.util.Format.trim(su.dom.value).length < 1
				&& Ext.util.Format.trim(db.dom.value).length < 1 && Ext.util.Format.trim(de.dom.value).length < 1
				&& !db.getValue() && !de.getValue()) {
			alert("�������ѯ����.");
			sk.focus();
			return false;
		}

		isSearch = true;
		ds.proxy.conn.url = './search.action';
		ds.reload( {
			params : {
				start : 0,
				limit : 20
			}
		});
	}

	var searchPanel = new Ext.FormPanel( {
		frame : true,
		border : false,
		layout : 'form',
		labelAlign : 'right',
		labelWidth : 50,
		items : [ {// 1st row
			layout : 'column',
			border : false,
			items : [ {
				layout : 'form',
				columnWidth : .5,
				border : false,
				items : [ {
					xtype : "textfield",
					fieldLabel : '�ؼ���',
					name : 'search-key',
					id : 'search-key',
					anchor : '98%'
				} ]
			}, {
				layout : 'form',
				columnWidth : .5,
				border : false,
				items : [ {
					xtype : "textfield",
					fieldLabel : '������',
					name : 'search-user',
					id : 'search-user',
					anchor : '98%'
				} ]
			} ]
		}, {// 2nd row
			layout : 'column',
			border : false,
			items : [ {
				layout : 'form',
				columnWidth : .5,
				border : false,
				items : [ {
					xtype : "datefield",
					fieldLabel : 'ʱ���',
					format : 'Y-m-d',
					name : 'dateBegin',
					id : 'dateBegin',
					readOnly : true,
					anchor : '98%',
					menuListeners : {
						'select' : function(menu, val) {
							this.setValue(val);
							var end = Ext.getCmp('dateEnd');
							if (end.getValue() && val > end.getValue()) {
								end.setValue(val);
							}
						}
					}
				} ]
			}, {
				layout : 'form',
				columnWidth : .5,
				border : false,
				items : [ {
					xtype : "datefield",
					format : 'Y-m-d',
					readOnly : true,
					fieldLabel : '��',
					name : 'dateEnd',
					id : 'dateEnd',
					anchor : '98%',
					menuListeners : {
						'select' : function(menu, val) {
							this.setValue(val);
							var bg = Ext.getCmp('dateBegin');
							if (bg.getValue() && val <= bg.getValue()) {
								this.setValue(bg.getValue());
							}
						}
					}
				} ]
			} ]
		} ],
		buttons : [ {
			text : '��ѯ',
			handler : doSearch
		}, {
			text : '���',
			handler : cleanSearch
		} ]
	});

	var grid = new Ext.grid.GridPanel( {
		region : 'center',
		el : gridId,
		ds : ds,
		cm : cm,
		loadMask : true,
		viewConfig : {
			forceFit : true
		},
		listeners : {
			'rowdblclick' : showHistory
		},
		bbar : new Ext.PagingToolbar( {
			pageSize : 20,
			store : ds,
			displayInfo : true,
			displayMsg : "",
			emptyMsg : "No record",
			items : [ '-', {
				pressed : true,
				text : '�鿴',
				cls : 'x-btn-text',
				handler : showHistory
			}, '-', {
				pressed : true,
				text : '�ظ�',
				cls : 'x-btn-text',
				handler : openToAnswer
			} ]
		})
	});
	ds.load( {
		params : {
			start : 0,
			limit : 20
		}
	});
	var gridListPanel = new Ext.Panel( {
		border : false,
		frame : false,
		layout : 'border',
		items : [ {
			border : false,
			region : 'north',
			height : 95,
			items : searchPanel
		}, {
			region : 'center',
			border : false,
			layout : 'fit',
			items : grid
		} ]
	});

	function setHistory(day) {
		var his = Ext.get("history");
		var r = grid.getSelectionModel().getSelected();
		his.dom.innerHTML = "";
		if (day == 0) {
			var ud = r.data.q_user + "&nbsp;&nbsp;" + r.data.q_date.format('Y-m-d H:i:s');
			his.dom.innerHTML = userAnswerTmp.replace(userDateKey, ud).replace(contentKey,
					htmlConvert(r.data.q_content));
		}
		var qid = r.data.q_id;
		Ext.Ajax.request( {
			url : './viewAnswers.action',
			sync : true,
			params : {
				qid : qid,
				days : day
			},
			method : 'GET',
			success : function(result, request) {
				var jsonData = Ext.util.JSON.decode(result.responseText);
				if (jsonData.answers) {
					var astr = "";
					for (i = 0; i < jsonData.answers.length; i++) {
						var ud = jsonData.answers[i].a_user + "&nbsp;&nbsp;"
								+ new Date(jsonData.answers[i].a_date.time).format('Y-m-d H:i:s');
						if (jsonData.answers[i].a_responser == "ROBOT" || jsonData.answers[i].a_responser == "AGENT") {
							astr = astr
									+ robotAnswerTmp.replace(userDateKey, ud).replace(contentKey,
											htmlConvert(jsonData.answers[i].a_content));
						} else {
							astr = astr
									+ userAnswerTmp.replace(userDateKey, ud).replace(contentKey,
											htmlConvert(jsonData.answers[i].a_content));
						}
					}
					his.dom.innerHTML = his.dom.innerHTML + astr;
				}
			},
			failure : function(result, request) {
				Ext.MessageBox.alert('Failed', '���ػظ���Ϣ����,������!');
			}
		});
	}

	function initChat() {
		dayInt = 3;
		Ext.getCmp("btnAnswersHis").setText(dayInt + '��ǰ��¼');
	}

	function showHistory(day) {
		Ext.getCmp('btnAnswer').disable();
		if (day != 3 && day != 7 && day != 30) {
			initChat();
			setHistory(0);
		} else {
			setHistory(day);
		}
	}
	function openToAnswer() {
		var r = grid.getSelectionModel().getSelected();
		if (!r) {
			Ext.MessageBox.alert('��ʾ', '��ѡ���¼�����!');
		} else {
			var qid = r.data.q_id;
			initChat();
			Ext.Ajax.request( {
				url : './lockQuestion.action',
				sync : true,
				params : {
					qid : qid
				},
				method : 'GET',
				success : function(result, request) {
					if (result.responseText == "1") {
						setHistory(0);
						ds.getById(qid).set('q_state', processingState);
						Ext.getCmp('btnAnswer').enable();
						Ext.getCmp('btnUnlock').enable();
					} else {
						Ext.MessageBox.alert('��ʾ', '�����ѱ�������ϯ����,��ѡ������������Ժ�����!');
					}
				},
				failure : function(result, request) {
					Ext.MessageBox.alert('��ʾ', '�����������,������!');
				}
			});
		}
	}

	function unlockQuestion() {
		Ext.getCmp('btnAnswer').disable();
		var r = grid.getSelectionModel().getSelected();
		if (!r) {
			Ext.MessageBox.alert('��ʾ', '��ѡ���¼�����!');
			return false;
		}
		if (r.data.q_state != "2") {
			Ext.MessageBox.alert('��ʾ', '��ѡ���������ļ�¼�����!');
			return false;
		}
		var qid = r.data.q_id;
		Ext.Ajax.request( {
			url : './unlockQuestion.action',
			sync : true,
			params : {
				qid : qid
			},
			method : 'GET',
			success : function(result, request) {
				if (result.responseText == "1") {
					ds.getById(qid).set('q_state', oriState);
					Ext.getCmp('btnUnlock').disable();
				} else {
					Ext.MessageBox.alert('��ʾ', '��������ѱ�ϵͳ�Զ��������,��ˢ�������б�!');
				}
			},
			failure : function(result, request) {
				Ext.MessageBox.alert('��ʾ', '��������������,������!');
			}
		});
	}

	function submitAnswer(answer) {
		var qid = "-1";
		var uMsn = "";
		var r = grid.getSelectionModel().getSelected();
		if (r) {
			qid = r.data.q_id;
			uMsn = r.data.q_user;
		}
		Ext.Ajax.request( {
			url : './answer.action',
			params : {
				qid : qid,
				agent : agentName,
				userMsn : uMsn,
				answer : encodeURIComponent(answer)
			},
			method : 'POST',
			success : function(result, request) {
				ds.getById(qid).set('q_state', finishedState);
				Ext.getCmp('btnAnswer').disable();
			},
			failure : function(result, request) {
				Ext.MessageBox.alert('��ʾ', '�ύ�ظ����ݳ���,������!');
			}
		});
	}

	function answer() {
		var answerCont = Ext.get("resContent");
		var a = Ext.util.Format.trim(answerCont.dom.value);
		if (a.length < 1) {
			Ext.MessageBox.alert('��ʾ', '������ظ�����!');
			answerCont.dom.focus();
			return false;
		}
		var his = Ext.get("history");
		submitAnswer(a);
		answerCont.dom.value = "";
		var ud = agentName + " " + new Date().format('Y-m-d H:i:s');
		his.dom.innerHTML = his.dom.innerHTML
				+ userAnswerTmp.replace(userDateKey, ud).replace(contentKey, htmlConvert(a));
	}

	var dayInt = 3;

	var qaCm = new Ext.grid.ColumnModel( [ new Ext.grid.RowNumberer(), {
		header : 'ID',
		dataIndex : 'questionid',
		hidden : 'true'
	}, {
		header : '����',
		dataIndex : 'question',
		width : 180
	} ]);

	var qaDs = new Ext.data.Store( {
		proxy : new Ext.data.HttpProxy( {
			url : './questionRef?act=search'
		}),
		reader : new Ext.data.JsonReader( {
			root : 'questions',
			id : 'questionid'
		}, [ {
			name : 'questionid'
		}, {
			name : 'question'
		} ])
	});
	var answerRef = "";
	var showQuestionRef = function() {
		var r = qaGrid.getSelectionModel().getSelected();
		if (r) {
			answerRef = "";
			Ext.Ajax.request( {
				url : './questionRef?act=view',
				params : {
					qid : r.data.questionid
				},
				method : 'GET',
				success : function(result, request) {
					var qr = Ext.util.JSON.decode(result.responseText);
					var v = Ext.get("west-center");
					answerRef = qr.questions[0].ANSWER;
					v.dom.innerHTML = "<div style='padding:3px'>" + answerRef + "</div>";
				},
				failure : function(result, request) {
				}
			});
		}
	};

	var qaGrid = new Ext.grid.GridPanel( {
		el : 'west-north',
		border : false,
		ds : qaDs,
		cm : qaCm,
		viewConfig : {
			forceFit : true
		},
		selModel : new Ext.grid.RowSelectionModel( {
			singleSelect : true
		}),
		listeners : {
			'rowdblclick' : showQuestionRef
		}
	});

	var requestQa = function() {
		qaDs.load( {
			params : {
				"keyWords" : encodeURIComponent(Ext.get('qaSearch-field').dom.value.trim())
			}
		});
	};

	var qaKeyListener = function(c) {
		var qaSf = Ext.get('qaSearch-field');
		var v = qaSf.dom.value.trim();
		var qaTimeout = null;
		c.getEl().on('keyup', function() {
			if (v != qaSf.dom.value.trim() && Ext.util.Format.trim(qaSf.dom.value).length > 0) {
				v = qaSf.dom.value.trim();
				clearTimeout(qaTimeout);
				qaTimeout = setTimeout(requestQa, questionRefReqDelay);
			}
		}, c);
	};

	var viewport = new Ext.Viewport( {
		layout : 'border',
		items : [ new Ext.BoxComponent( { // raw
			region : 'north',
			el : 'north',
			height : 68
		}), {
			region : 'center',
			layout : 'border',
			split : true,
			items : [ {
				region : 'center',
				contentEl : 'history',
				split : true,
				height : 100,
				minSize : 100,
				maxSize : 200,
				collapsible : false,
				autoScroll : true,
				title : '�ظ���¼',
				margins : '0 0 0 1',
				bbar : [ '->', {
					id : 'btnAnswersHis',
					pressed : true,
					text : dayInt + '��ǰ��¼',
					handler : function() {
						var r = grid.getSelectionModel().getSelected();
						if (!r) {
							Ext.MessageBox.alert('��ʾ', '��ѡ���¼�����!');
							return;
						}
						showHistory(dayInt);
						if (dayInt == 3) {
							dayInt = 7;
						} else if (dayInt == 7) {
							dayInt = 30;
						} else if (dayInt == 30) {
							dayInt = 3;
						}
						this.setText(dayInt + '��ǰ��¼');
					}
				} ]
			}, {
				region : 'south',
				contentEl : 'response',
				layout : 'fit',
				split : true,
				height : 150,
				minSize : 100,
				maxSize : 200,
				collapsible : false,
				title : '�ظ�����',
				margins : '0 0 3 1',
				bbar : [ '->', {
					pressed : true,
					text : '���',
					handler : function() {
						var answerCont = Ext.get("resContent");
						answerCont.dom.value = "";
					}
				}, '-', {
					id : 'btnAnswer',
					pressed : true,
					disabled : true,
					text : '��',
					handler : answer
				} ]
			} ]
		}, {
			region : 'east',
			title : '�����б�',
			layout : 'fit',
			split : true,
			width : 450,
			minSize : 400,
			maxSize : 500,
			items : [ gridListPanel ]
		}, {
			region : 'west',
			title : '���ٻظ�',
			split : true,
			width : 260,
			minSize : 175,
			maxSize : 400,
			collapsible : true,
			collapsed : true,
			margins : '0 0 1 1',
			layout : 'border',
			items : [ {
				region : 'north',
				autoScroll : true,
				height : 300,
				layout : 'fit',
				items : [ qaGrid ],
				tbar : [ '�����ѯ:', ' ', new Ext.form.TextField( {
					"id" : 'qaSearch-field',
					"width" : 200,
					listeners : {
						'render' : qaKeyListener
					}
				}) ]
			}, {
				title : '����',
				region : 'center',
				contentEl : 'west-center',
				bbar : [ '->', {
					pressed : true,
					text : '����ճ��',
					handler : function() {
						var answerCont = Ext.get("resContent");
						answerCont.dom.value = answerRef;
					}
				} ]
			} ]
		} ]
	});
});

/*
 * Ext.Ajax.on('beforerequest', function(connection,options){
 * Ext.getBody().mask('Loading...'); });
 * 
 * Ext.Ajax.on('requestcomplete', function(connection,options){
 * Ext.getBody().unmask(); });
 * 
 * Ext.Ajax.on('requestexception', function(connection,options){
 * Ext.getBody().unmask(); });
 * 
 */