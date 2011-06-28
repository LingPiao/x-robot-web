var win;
Ext.onReady( function() {

	Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
	var button = Ext.get('showAgents');
	button.on('click', function() {
		var agentsCm = new Ext.grid.ColumnModel( [ new Ext.grid.RowNumberer(), {
			header : '坐席',
			dataIndex : 'agentName',
			width : 150
		}, {
			header : '类型',
			dataIndex : 'agentType',
			width : 60,
			renderer : function(value) {
				if (value == 1) {
					return "客户经理";
				} else {
					return "普通坐席";
				}
			}
		}, {
			header : '状态',
			dataIndex : 'agentName',
			renderer : function(value) {
				return "在线";
			}
		} ]);

		agentsCm.defaultSortable = true;

		var aentsDs = new Ext.data.Store( {
			proxy : new Ext.data.HttpProxy( {
				url : './agentServer?act=status'
			}),
			reader : new Ext.data.JsonReader( {
				root : 'agents'
			}, [ {
				name : 'agentName'
			}, {
				name : 'agentType'
			} ])
		});

		var agentsGrid = new Ext.grid.GridPanel( {
			region : 'center',
			ds : aentsDs,
			cm : agentsCm,
			loadMask : true
		});
		aentsDs.load();
		if (win) {
			win.close();
		}
		win = new Ext.Window( {
			title : '在线坐席列表',
			closable : true,
			width : 320,
			height : 200,
			plain : true,
			layout : 'border',
			items : [ agentsGrid ]
		});
		win.show(this);
	});
});