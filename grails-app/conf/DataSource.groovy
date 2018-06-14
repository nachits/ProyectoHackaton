dataSource {
    logSql = false
    pooled = false
    driverClassName = "net.sourceforge.jtds.jdbc.Driver"
//    username = "app_ejecutor"
//    password = "app_ejecutor"
    username = "app_flujo"
    password = "previred_flujo"
}
hibernate {
    cache.use_second_level_cache = true 
    cache.use_query_cache = false 
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' 
    validator.apply_to_ddl = false 
    validator.autoregister_listeners = false 
}
// environment specific settings
environments {
    development {
        //modelo y negocio de procesos
        dataSource {
            dbCreate = "update"//one of 'create-drop', 'create', 'update', 'validate', ''
            url = "jdbc:jtds:sqlserver://172.26.21.21/previred_flujo;LOCK_TIMEOUT=10000"
        }
       
        
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
