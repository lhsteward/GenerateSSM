
#MySQL
# driverClassName  根据url自动识别  这一项可配可不配，如果不配置druid会根据url自动识别dbType，然后选择相应的driverClassName
jdbc.driver=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/test?allowMultiQueries=true&autoReconnect=true&characterEncoding=utf-8
jdbc.username=root
jdbc.password=root


# 初始化时建立物理连接的个数。初始化发生在显示调用init方法，或者第一次getConnection时
initialSize=0

# 最大连接池数量
maxActive=1000

#定义最小空闲
minIdle=1

# 获取连接时最大等待时间，单位毫秒。配置了maxWait之后， 
# 缺省启用公平锁，并发效率会有所下降， 
# 如果需要可以通过配置useUnfairLock属性为true使用非公平锁。
maxWait=60000

# druid 监控
# 属性类型是字符串，通过别名的方式配置扩展插件， 
# 常用的插件有： 
# 监控统计用的filter:stat  
# 日志用的filter:log4j 
# 防御sql注入的filter:wall
filters=stat,log4j

# 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒
timeBetweenEvictionRunsMillis=60000

# 配置一个连接在池中最小生存的时间，单位是毫秒
minEvictableIdleTimeMillis=300000

# 建议配置为true，不影响性能，并且保证安全性。 
# 申请连接的时候检测，如果空闲时间大于 
# timeBetweenEvictionRunsMillis， 
# 执行validationQuery检测连接是否有效。
testWhileIdle=true

# 申请连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能。
testOnBorrow=false

# 归还连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能
testOnReturn=false

# 是否缓存preparedStatement，也就是PSCache。
# PSCache对支持游标的数据库性能提升巨大，比如说oracle。 
# 在mysql5.5以下的版本中没有PSCache功能，建议关闭掉。
# 作者在5.5版本中使用PSCache，通过监控界面发现PSCache有缓存命中率记录， 
# 该应该是支持PSCache。
poolPreparedStatements=false

# 要启用PSCache，必须配置大于0，当大于0时， 
# poolPreparedStatements自动触发修改为true。 
# 在Druid中，不会存在Oracle下PSCache占用内存过多的问题， 
# 可以把这个数值配置大一些，比如说100
maxOpenPreparedStatements=-1

