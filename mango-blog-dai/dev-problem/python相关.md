## Python



## Django

1. 启动web的时候的错误为：‘’‘解决：CentOS下的 error while loading shared libraries: libmysqlclient.so.16: cannot open shared object file: No such file or dir’

   - 原因：

     - 缺少共享库libmysqlclient.so.20，般都是ldconfig 没有找到共享库的位置，或者 软链接的问题

   - 解决办法：

     - 先找到对应的libmysqlclient.so文件，或者下载（如果下载则忽略这一步骤）

       ```shell
       updatedb
       locate libmysqlclient.so
       ```

     -  到libmysqlclient.so 文件下做一个软连接到/usr/lib

       ```shell
       ln -s /usr/local/mysql/lib/libmysqlclient.so.20 /usr/lib/libmysqlclient.so.20
       ```

2. django中save()无法立即保存？

   * 在进行数据库的配置的时候，在数据库的设置了`ATOMIC_REQUESTS`为True，代码如下所示：

     ```python
       DATABASES = {
           'default': {
               'ENGINE': 'django.db.backends.postgresql_psycopg2',
               'NAME': '',
               'USER': '',
               'PASSWORD': '',
               'HOST': '',
               'PORT': '',
               'ATOMIC_REQUESTS': True,
           }
       }
     ```

   * 设置了`ATOMIC_REQUESTS`为True，则表示每个view都会开启事务。

   * 解决办法，在对应的view中使用修饰器`@transaction.non_atomic_requests` 修饰，表示不是用事务


