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
				header : '内容',
				dataIndex : 'answer',
				width : 280
			}, {
				header : '排序',
				dataIndex : 'disp_order',
				width : 50
			}, {
				header : '添加日期',
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
					text : '删除',
					tooltip : '删除选定条目',
					iconCls : 'remove',
					handler : removeShortcutAnswer
				}, '-', {
					xtype : 'label',
					text : '内容：'
				}, {
					xtype : 'textfield',
					id : 'answer',
					width : 220
				}, {
					xtype : 'label',
					text : ' 排序：'
				}, {
					xtype : 'textfield',
					id : 'dispOrder',
					width : 30
				}, {
					id : 'btnSaAdd',
					text : '添加',
					iconCls : 'add',
					handler : addShortcutAnswer
				}, {
					id : 'btnSaUpdate',
					text : '更新',
					iconCls : 'update',
					handler : updateShortcutAnswer,
					hidden : true
				}, {
					text : '清除',
					iconCls : 'clean',
					handler : clean
				} ]
			});
			var statusbar = new Ext.Toolbar( {
				items : [ '双击记录可进行更新操作; 更新状态下可点击[清除]切换到添加状态!' ]
			});
			win = new Ext.Window( {
				title : '快捷回复列表',
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
					alert("请输入内容!");
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
							Ext.MessageBox.alert('提示', '更新快捷回复失败请重试!');
						}
					},
					failure : function(result, request) {
						Ext.MessageBox.alert('提示', '更新快捷回复失败请重试!');
					}
				});
			}

			function addShortcutAnswer() {
				var a = Ext.get('answer');
				var of = Ext.get('dispOrder');
				var o = 0;

				if (Ext.util.Format.trim(a.dom.value).length < 1) {
					alert("请输入内容!");
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
							Ext.MessageBox.alert('提示', '添加快捷回复失败请重试!');
						}
					},
					failure : function(result, request) {
						Ext.MessageBox.alert('提示', '添加快捷回复失败请重试!');
					}
				});
			}
			function removeShortcutAnswer() {
				var rows = saGrid.getSelectionModel().getSelections();
				if (rows.length < 1) {
					Ext.Msg.alert("提示信息", "您没有选中行!");
					return false;
				}
				var ids = "";
				for ( var i = 0; i < rows.length; i++) {
					ids = ids + rows[i].data.id;
					if (i < rows.length - 1) {
						ids = ids + ",";
					}
				}
				var c = window.confirm("确认删除所选择条目吗?");
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
								Ext.MessageBox.alert('提示', '删除客户失败请重试!');
							}
						},
						failure : function(result, request) {
							Ext.MessageBox.alert('提示', '删除客户失败请重试!');
						}
					});
				}
			}
		});
	}
});