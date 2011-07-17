Ext.onReady( function() {
	Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
	var button = Ext.get('customerMan');
	var win;
	if (button) {
		button.on('click', function() {
			if (win) {
				win.close();
			}
			var sm = new Ext.grid.CheckboxSelectionModel();
			var custCm = new Ext.grid.ColumnModel( [ sm, {
				header : '客户号码',
				dataIndex : 'mobile',
				width : 200
			} ]);

			custCm.defaultSortable = true;

			var custDs = new Ext.data.Store( {
				proxy : new Ext.data.HttpProxy( {
					url : './viewCustomer.action'
				}),
				reader : new Ext.data.JsonReader( {
					root : 'customers'
				}, [ {
					name : 'mobile',
					convert : function(v, n) {
						return n;
					}
				} ])
			});
			custDs.load();
			var custGrid = new Ext.grid.GridPanel( {
				region : 'center',
				ds : custDs,
				cm : custCm,
				sm : sm,
				loadMask : true,
				tbar : [ {
					text : '删除',
					tooltip : '删除选定条目',
					iconCls : 'remove',
					handler : remove
				}, '-', {
					xtype : 'label',
					text : '客户号码：'
				}, {
					xtype : 'textfield',
					id : 'mobile'
				}, {
					text : '添加',
					iconCls : 'add',
					handler : add
				} ]
			});

			win = new Ext.Window( {
				title : '客户列表',
				closable : true,
				width : 320,
				height : 300,
				plain : true,
				layout : 'border',
				items : [ custGrid ]
			});
			win.show(this);

			function add() {
				var m = Ext.get('mobile');
				var r = /^13[\d]{9}$/;
				if (!r.test(m.dom.value)) {
					alert("请输入正确的手机号码!");
					m.focus();
					return false;
				}
				Ext.Ajax.request( {
					url : './addCustomer.action',
					params : {
						customerMobile : m.dom.value
					},
					method : 'GET',
					success : function(result, request) {
						if (result.responseText == "1") {
							custDs.reload();
						} else {
							Ext.MessageBox.alert('提示', '添加客户失败请重试!');
						}
					},
					failure : function(result, request) {
						Ext.MessageBox.alert('提示', '添加客户失败请重试!');
					}
				});
			}
			function remove() {
				var rows = custGrid.getSelectionModel().getSelections();
				if (rows.length < 1) {
					Ext.Msg.alert("提示信息", "您没有选中行!");
					return false;
				}
				var m = "";
				for ( var i = 0; i < rows.length; i++) {
					m = m + rows[i].data.mobile;
					if (i < rows.length - 1) {
						m = m + ",";
					}
				}
				var c = window.confirm("确认删除所选择条目吗?");
				if (c) {
					Ext.Ajax.request( {
						url : './removeCustomer.action',
						params : {
							customerMobile : m
						},
						method : 'GET',
						success : function(result, request) {
							if (result.responseText >= "1") {
								custDs.reload();
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