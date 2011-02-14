dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "root"
	password = "root"
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = true
	cache.provider_class ='com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			// one of 'create', 'create-drop','update'
			dbCreate = "update"
			// NOTE: the JDBC connection string should be
			// all on the same line.
			url = "jdbc:mysql://localhost:3306/menumanager?autoreconnect=true"
		}
	}
	
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost:3306/menumanager?autoreconnect=true"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost:3306/menumanager?autoreconnect=true"
		}
	}
}