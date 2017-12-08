# 单行注释
-- 单行注释
/**/ 多行注释

# 行级锁只在存储引擎上实现
# 表锁是最基本的所策略，并且是开销最小的策略

USE playboxjre;
DESC xiaochi;

-- ***事务***
# ACID 
/*
* A atomicity 	原子性
* C consistency 一致性
* I isolation 	隔离性
* D durability 	持久性
*/
START TRANSACTION;
SELECT * FROM xiaochi;
INSERT INTO xiaochi (username,`password`,age) VALUE ("kong","123",12);
COMMIT;		#不写，也可以insert语句也可以插入成功
# rollback; 	回滚（也就是insert 语句没有生效）

-- ***隔离级别***

# 隔离级别		脏读可能性	不可重复读可能性	幻读可能性	加锁读
# READ UNCOMMITED 	YES		YES			YES		NO
# READ COMMITED		NO		YES			YES		NO	
# REPEATABLE READ	NO		NO			YES		NO
# SERIALIZABLE		NO		NO			NO		YES

# 事务日志

-- MySQL提供了两种事务引擎 ：InnoDB 和 NDB Cluster.
# 自动提交(AUTOCOMMIT)






SELECT * FROM xiaochi;
