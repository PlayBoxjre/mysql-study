---
typora-root-url: images\sql-result
---

## 注释

> \# 单行注释
>
>  -- 单行注释
>
>  /**/ 多行注释

## 锁

>  **行级锁只在存储引擎上实现**
>
>  **表锁是最基本的所策略，并且是开销最小的策略**

## 事务

>  ACID
>
>  A atomicity 	原子性
>
>  C consistency 一致性
>
>  I isolation 隔离性
>
>  D durability 持久性

```mysql
	START TRANSACTION;

	SELECT * FROM xiaochi;

	INSERT INTO xiaochi (username,password,age) VALUE ("kong","123",12);

	COMMIT;					 # 不写，也可以insert语句也可以插入成功
	
	rollback;				 # 回滚（也就是insert 语句没有生效）
```

## 隔离级别

|      隔离级别       | 脏读可能性 | 不可重复读可能性 | 幻读可能性 | 加锁读  |
| :-------------: | :---: | :------: | :---: | :--: |
| READ UNCOMMITED |  YES  |   YES    |  YES  |  NO  |
|  READ COMMITED  |  NO   |   YES    |  YES  |  NO  |
| REPEATABLE READ |  NO   |    NO    |  YES  |  NO  |
|  SERIALIZABLE   |  NO   |    NO    |  NO   | YES  |

## 事务日志

>  MySQL提供了两种事务引擎 ：InnoDB 和 NDB Cluster.

- *自动提交(AUTOCOMMIT)*

  > MySQL默认采用自动提交(AUTOCOMMIT)模式，`如果不是显示开启一个事务，则么个查询都被当作一个事务执行提交操作`.

  ```mysql
  mysql>SHOW VARIABLES LIKE 'AUTOCOMMIT';
  ```

![autocommit_show](/autocommit_show.png)

### 多版本并发控制 （MVCC multiversion Concurrency Control)

> 非阻塞的读操作，写操作只锁定必要的行
>
> 乐观并发控制和悲观并发控制

InnoDB的mvcc式通过在每行记录后面保存两个隐藏的列来实现的。一个保存行的创建时间，一个保存行的过期时间（或删除时间）。但存储的并不是实际的时间值，而是系统版本号（system version number）。没开启一个新事务，系统版本号增1。事务开始时刻的版本号回作为事务的版本号，用来和查询到的每行记录的版本号进行比较

**NOTE**: mvcc 只在REPEATABLE READ 和 READ COMMITED 两个隔离级别下工作

