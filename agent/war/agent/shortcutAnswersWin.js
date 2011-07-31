Ext.onReady(function() {
	Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
	var button = Ext.get('shortcutAnswerMan');
	var win;
	if (button) {
		button.on('click', function() {
			if (win) {
				win.close();
			}
			var sm = new Ext.grid.CheckboxSelectionModel();
			var saCM = new Ext.grid.ColumnModel( [ sm, new Ext.grid.RowNumberer(), {
				header : 'ID',
				dataIndex : 'id',
				hidden : 'true'
			}, {
				header : '����',
				dataIndex : 'answer',
				width : 280
			}, {
				header : '����',
				dataIndex : 'disp_order',
				width : 50
			}, {
				header : '�������',
				dataIndex : 'created_date',
				renderer : Ext.util.Format.dateRenderer('Y-m-d')
			} ]);

			saCM.defaultSortable = false;

			var saGrid = new Ext.grid.GridPanel( {
				region : 'center',
				ds : saDs,
				cm : saCM,
				sm : sm,
				loadMask : true,
				listeners : {
					'rowdblclick' : editShortcutAnswer
				},
				tbar : [ {
					text : 'ɾ��',
					tooltip : 'ɾ��ѡ����Ŀ',
					iconCls : 'remove',
					handler : removeShortcutAnswer
				}, '-', {
					xtype : 'label',
					text : '���ݣ�'
				}, {
					xtype : 'textfield',
					id : 'answer',
					width : 220
				}, {
					xtype : 'label',
					text : ' ����'
				}, {
					xtype : 'textfield',
					id : 'dispOrder',
					width : 30
				}, {
					id : 'btnSaAdd',
					text : '���',
					iconCls : 'add',
					handler : addShortcutAnswer
				}, {
					id : 'btnSaUpdate',
					text : '����',
					iconCls : 'update',
					handler : updateShortcutAnswer,
					hidden : true
				}, {
					text : '���',
					iconCls : 'clean',
					handler : clean
				} ]
			});
			var statusbar = new Ext.Toolbar( {
				items : [ '˫����¼�ɽ��и��²���; ����״̬�¿ɵ��[���]�л������״̬!' ]
			});
			win = new Ext.Window( {
				title : '��ݻظ��б�',
				closable : true,
				width : 500,
				height : 300,
				plain : true,
				layout : 'border',
				bbar : statusbar,
				items : [ saGrid ]
			});
			win.show(this);

			var aid = "";
			function clean() {
				aid = "";
				Ext.get('answer').dom.value = "";
				Ext.get('dispOrder').dom.value = "";
				Ext.getCmp("btnSaAdd").show();
				Ext.getCmp("btnSaUpdate").hide();
			}

			function editShortcutAnswer() {
				var rs = saGrid.getSelectionModel().getSelections();
				if (rs) {
					var r = rs[0];
					aid = r.data.id;
					Ext.get('answer').dom.value = r.data.answer;
					Ext.get('dispOrder').dom.value = r.data.disp_order;
					Ext.getCmp("btnSaAdd").hide();
					Ext.getCmp("btnSaUpdate").show();
				}
			}
			function updateShortcutAnswer() {
				var a = Ext.get('answer');
				var of = Ext.get('dispOrder');
				var od = 0;
				if (Ext.util.Format.trim(a.dom.value).length < 1) {
					alert("����������!");
					a.focus();
					return false;
				}
				if (of) {
					od = of.dom.value;
				}
				Ext.Ajax.request( {
					url : './updateShortcutAnswer.action',
					params : {
						answerId : aid,
						answer : encodeURIComponent(a.dom.value),
						dispOrder : od
					},
					method : 'POST',
					success : function(result, request) {
						if (result.responseText == "1") {
							saDs.reload( {
								callback : shortcutAnswerCallbak
							});
						} else {
							Ext.MessageBox.alert('��ʾ', '���¿�ݻظ�ʧ��������!');
						}
					},
					failure : function(result, request) {
						Ext.MessageBox.alert('��ʾ', '���¿�ݻظ�ʧ��������!');
					}
				});
			}

			function addShortcutAnswer() {
				var a = Ext.get('answer');
				var of = Ext.get('dispOrder');
				var o = 0;

				if (Ext.util.Format.trim(a.dom.value).length < 1) {
					alert("����������!");
					a.focus();
					return false;
				}
				if (of) {
					o = of.dom.value;
				}
				Ext.Ajax.request( {
					url : './addShortcutAnswer.action',
					params : {
						answer : encodeURIComponent(a.dom.value),
						dispOrder : o
					},
					method : 'POST',
					success : function(result, request) {
						if (result.responseText == "1") {
							saDs.reload( {
								callback : shortcutAnswerCallbak
							});
						} else {
							Ext.MessageBox.alert('��ʾ', '��ӿ�ݻظ�ʧ��������!');
						}
					},
					failure : function(result, request) {
						Ext.MessageBox.alert('��ʾ', '��ӿ�ݻظ�ʧ��������!');
					}
				});
			}
			function removeShortcutAnswer() {
				var rows = saGrid.getSelectionModel().getSelections();
				if (rows.length < 1) {
					Ext.Msg.alert("��ʾ��Ϣ", "��û��ѡ����!");
					return false;
				}
				var ids = "";
				for ( var i = 0; i < rows.length; i++) {
					ids = ids + rows[i].data.id;
					if (i < rows.length - 1) {
						ids = ids + ",";
					}
				}
				var c = window.confirm("ȷ��ɾ����ѡ����Ŀ��?");
				if (c) {
					Ext.Ajax.request( {
						url : './removeShortcutAnswer.action',
						params : {
							answerIds : ids
						},
						method : 'POST',
						success : function(result, request) {
							if (result.responseText >= "1") {
								saDs.reload( {
									callback : shortcutAnswerCallbak
								});
							} else {
								Ext.MessageBox.alert('��ʾ', 'ɾ���ͻ�ʧ��������!');
							}
						},
						failure : function(result, request) {
							Ext.MessageBox.alert('��ʾ', 'ɾ���ͻ�ʧ��������!');
						}
					});
				}
			}
		});
	}
});