# MySql的安装 for window zip

- 1. 下载 MySql Community Server 5.7.20 版本

  >  下载地址 [MySql Community Server 5.7.20 版本](https://dev.mysql.com/downloads/mysql/)

- 2. 解压缩到任意路径 如： D:\

- 3. 进入MySql安装路径 *D:\mysql-5.7.20-winx64*

  > 1. 创建 `data`文件夹
  >
  > 2. 创建 `my.ini`文件
  >
  >    ```bash
  >    [client]
  >    port=3306
  >    [mysqld]
  >    basedir=D://mysql-5.7.20-winx64
  >    datadir=D://mysql-5.7.20-winx64/data
  >    port=3306
  >    character-set-server=utf8
  >    [mysql]
  >    default-character-set=utf8
  >    ```

- 4. 以管理员的身份打开命令行

     >  ![cmd](images\mysql-install\cmd.gif)

- 5. 将Mysql设置成环境变量。如果不设置的话，cmd 需要进入到MySql安装目录的`bin`目录

- 6. 执行以下命令

     1. 安装

     ```mysql
     mysqld install 
     mysqld --initialize [mysql_name]
     net start mysql_name # 默认是mysql 打开mysql服务
     ```

     如果启动成功，说明安装成功

     2. 卸载mysql

        ```mysql
        net stop mysql_name # 停止mysql服务
        mysqld remove # 卸载MySql
        ```

     3. 默认情况下会创建一个 `root`账号 ，密码在 MySQL安装目录下`data`目录下的`主机名.err`文件中

        ![cmd](images\mysql-install\root_secret_location.png)

     4. 修改`root`密码和设置权限

        ```mysql
        # 修改root密码
        mysqladmin -u root password "newpass"
        # 设置root账号可以远程访问
        	1.该表
        	  mysql -u root –p
              mysql>use mysql;
              mysql>update user set host = '%' where user = 'root';
              mysql>select host, user from user;
             2.授权
              mysql>GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;
              mysql>FLUSH RIVILEGES;
        ```

  ---

  ​