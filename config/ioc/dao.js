var ioc = {
	dataSource : {
		type : "org.apache.commons.dbcp2.BasicDataSource",
		events : {
			depose : 'close'
		},
		fields : {
			driverClassName : 'com.mysql.jdbc.Driver',
			url : 'jdbc:mysql://localhost:3306/enong?useUnicode=true&amp;characterEncoding=utf8',
			username : 'gaojh',
			password : 'gaojh'
		}
	},
	dao : {
		type : "org.nutz.dao.impl.NutDao",
		args : [ {
			refer : 'dataSource'
		} ]
	}
};