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
				header : '��ѯ����',
				dataIndex : 'q_content',
				width : 150
			}, {
				header : '�û�MSN',
				dataIndex : 'q_user'
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
		title : '�û���ѯ',
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
			Ext.getCmp('btnAnswer').enable();
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
			his.dom.innerHTML = his.dom.innerHTML + "<font color='blue'><br>" + agentName + "&nbsp;&nbsp;"
					+ new Date().format('Y-m-d H:i:s') + "&nbsp;&nbsp;�ظ�:<br>&nbsp;&nbsp;" + htmlConvert(a) + "</font>";

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
						id : 'btnAnswer',
						pressed : true,
						disabled : true,
						text : '��',
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