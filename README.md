##设计思路
`提交名为“final design”`

####tables
* messages 记录每次操作的信息，如：新建了PDO，删除了PDO...
	* message varchar(100) 存储信息
	* messageTime timestamp 操作发生的时间
	* userName varchar(100) 操作所属的用户

* users 各种用户信息 
	* userName varchar(100) 用户名
	* userPasswd varchar(100) 用户密码
	* userEmail varchar(100) 用户邮箱
	* createTime timestamp 创建用户的时间

* pdos 各个pdo的简短信息
	* PDOName varchar(100) PDO的名字
	* PDOTime timestamp PDO创建的时间
	* userName varchar(100) PDO所属的用户
	* counts int(11) 记录该PDO中事件的数量
	* tag varchar(100) 一个3位的二进制数(用字符串存储)，每位对应着时间、地点、人物这三个维度是否选中

* 每创建一个PDO，都会创建一个PDO，例如：chester的用户创建了test的PDO，有header1,header2,header3三个表头，而且带有时间和人物属性，即tag为101，则会创建名字为chester\_test的table:
	* eventID int(11) auto\_increment 用于锁定每个事件的ID，以便查找或者与其他事件关联
	* header1 varchar(100) 
	* header2 varchar(100)
	* header3 varchar(100)
	* 时间 date
	* 人物 varchar(100)
	* link varchar(100) 用于存储与当前事件有关的其他事件

####复杂性分析

`假设总pdo数量为n，每个PDO平均事件为m，每个时间平均关联d个事件，平均关联事件数量为t`
* 时间复杂性
	* 搜索某具体事件，O(m)
	* 添加单个事件或者新建PDO，O(1)
	* 添加关联事件，O(t\*d)
	* 删除某个事件，O(d)
	* 删除一个PDO，O(m\*d)

`假设总pdo数量为n，每个PDO平均事件为m，每个PDO平均表头数量为k`	
* 空间复杂性
	* 由于这个设计的数据库的table数量总在不断增长，其消耗的存储与PDO数量和它的表头和事件数有关，所以其空间复杂度为O(n\*m\*k)
   	

