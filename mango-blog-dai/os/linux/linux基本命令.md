## linux中常用的命令

### 1. Crontab的格式

*  第一列表示分钟： 1~59
* 第二列小时：1~23
* 第三列表示日：1~31
* 第四列表示月：1~12
* 第五列表示星期：0~6（0表示星期天）
* 第六列表示要运行的命令
* 格式：
  * 分 时 日 月 星期  运行的命令
* `30 21 * * * /usr/local/apache/bin/apachectl restart`
  * 上面的例子表示每晚的21:30重启apache
* `45 4 1,10,22 * * /usr/local/apache/bin/apachectl restart`
  * 上面的例子表示每月1、10、22日的4 : 45重启apache
* `0,30 18-23 * * * /usr/local/apache/bin/apachectl restart`
  * 上面的例子表示在每天18 : 00至23 : 00之间每隔30分钟重启apache
* `0 */1 * * * /usr/local/apache/bin/apachectl restart`
  * 每一小时重启apache
* `0 23-7/1 * * * /usr/local/apache/bin/apachectl restart`
  * 晚上11点到早上7点之间，每隔一小时重启apache
*  `0 11 4 * mon-wed /usr/local/apache/bin/apachectl restart`
  * 每月的4号与每周一到周三的11点重启apache
* `0 4 1 jan * /usr/local/apache/bin/apachectl restart`
  * 一月一号的4点重启apache
* `0 6 */2 * * /command `
  * 看到这个我们如果理解成每xx执行就是，每两天的6点钟执行命令。在这里*的范围是1-31，*/2表示任务在奇数天执行，那么在1、3、5、7、8、10、12月，月末最后一天执行后，紧接着第二天仍然后执行，那这就不是每2天执行一次。