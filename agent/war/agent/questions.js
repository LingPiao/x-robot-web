var gridId = "question-grid";
var gridContainer = Ext.get(gridId);
var ds;
Ext.onReady( function() {
	var cm = new Ext.grid.ColumnModel( [ new Ext.grid.RowNumberer(),
	//sm,
			{
				header : 'ID',
				dataIndex : 'q_id',
				hidden : 'true'
			}, {
				header : '咨询问题',
				dataIndex : 'q_content',
				width : 150
			}, {
				header : '用户MSN',
				dataIndex : 'q_user'
			}, {
				header : '日期',
				dataIndex : 'q_date',
				renderer : Ext.util.Format.dateRenderer('Y-m-d H:i:s')
			}, {
				header : '状态',
				dataIndex : 'q_state',
				width : 60,
				renderer : function(value) {
					if (value == 1) {
						return "已处理";
					} else if (value == 2) {
						return "处理中";
					} else {
						return "未处理";
					}
				}
			} ]);
	cm.defaultSortable = true;

	ds = new Ext.data.Store( {
		proxy : new Ext.data.HttpProxy( {
			url : './agent.action'
		}),
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
		} ])
	});

	var grid = new Ext.grid.GridPanel( {
		region : 'east',
		el : gridId,
		ds : ds,
		cm : cm,
		//sm: sm,
		loadMask : true,
		split : true,
		width : 450,
		minSize : 300,
		maxSize : 700,
		title : '用户咨询',
		listeners : {
			'rowdblclick' : showHistory
		},
		bbar : new Ext.PagingToolbar( {
			pageSize : 22,
			store : ds,
			displayInfo : true,
			displayMsg : "",
			emptyMsg : "No record",
			items : [ '-', {
				pressed : true,
				text : '查看',
				cls : 'x-btn-text',
				handler : showHistory
			}, '-', {
				pressed : true,
				text : '回复',
				cls : 'x-btn-text',
				handler : openToAnswer
			} ]
		})
	});
	// grid.render();
		ds.load( {
			params : {
				start : 0,
				limit : 22
			}
		});

		Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

		function setHistory(day) {
			var his = Ext.get("history");
			var r = grid.getSelectionModel().getSelected();
			his.dom.innerHTML = "";
			if (day == 0) {
				his.dom.innerHTML = r.data.q_user + "&nbsp;&nbsp;" + r.data.q_date.format('Y-m-d H:i:s')
						+ "<br>&nbsp;&nbsp;" + htmlConvert(r.data.q_content) + "<br>";
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
							astr = astr + jsonData.answers[i].a_user + "&nbsp;&nbsp;"
									+ new Date(jsonData.answers[i].a_date.time).format('Y-m-d H:i:s')
									+ "<br>&nbsp;&nbsp;" + htmlConvert(jsonData.answers[i].a_content) + "<br>";

						}
						his.dom.innerHTML = his.dom.innerHTML + astr;
					}
				},
				failure : function(result, request) {
					Ext.MessageBox.alert('Failed', '加载回复信息出错,请重试!');
				}
			});
		}

		function initChat() {
			dayInt = 3;
			Ext.getCmp("btnAnswersHis").setText(dayInt + '天前记录');
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
			Ext.getCmp('btnAnswer').enable();
			var r = grid.getSelectionModel().getSelected();
			if (!r) {
				Ext.MessageBox.alert('提示', '请选择记录后操作!');
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
						} else {
							Ext.MessageBox.alert('提示', '问题已被其他坐席锁定,可选择其他问题或稍候重试!');
						}

					},
					failure : function(result, request) {
						Ext.MessageBox.alert('提示', '锁定问题出错,请重试!');
					}
				});
			}
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
					Ext.getCmp('btnAnswer').disable();
				},
				failure : function(result, request) {
					Ext.MessageBox.alert('提示', '提交回复内容出错,请重试!');
				}
			});
		}

		function answer() {
			var answerCont = Ext.get("resContent");
			var a = Ext.util.Format.trim(answerCont.dom.value);
			if (a.length < 1) {
				Ext.MessageBox.alert('提示', '请输入回复内容!');
				answerCont.dom.focus();
				return false;
			}
			var his = Ext.get("history");
			submitAnswer(a);
			answerCont.dom.value = "";
			his.dom.innerHTML = his.dom.innerHTML + "<font color='blue'><br>" + agentName + "&nbsp;&nbsp;"
					+ new Date().format('Y-m-d H:i:s') + "&nbsp;&nbsp;回复:<br>&nbsp;&nbsp;" + htmlConvert(a) + "</font>";

		}

		var dayInt = 3;
		var viewport = new Ext.Viewport( {
			layout : 'border',
			items : [ new Ext.BoxComponent( { // raw
						region : 'north',
						el : 'north',
						height : 32
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
					title : '回复记录',
					margins : '0 0 0 1',
					bbar : [ '->', {
						id : 'btnAnswersHis',
						pressed : true,
						text : dayInt + '天前记录',
						handler : function() {
							var r = grid.getSelectionModel().getSelected();
							if (!r) {
								Ext.MessageBox.alert('提示', '请选择记录后操作!');
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
							this.setText(dayInt + '天前记录');
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
					title : '回复内容',
					margins : '0 0 3 1',
					bbar : [ '->', {
						id : 'btnAnswer',
						pressed : true,
						disabled : true,
						text : '答复',
						handler : answer
					} ]
				} ]
			}, grid ]
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