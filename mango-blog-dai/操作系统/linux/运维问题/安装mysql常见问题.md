#运维过程中常见的问题总结
##1. linux环境安装中常见的问题
###1.1 linux中安装mysql问题
* 在ubuntu的环境中我们通常会使用apt-get install mysql-server，在种安装的方式安装的时候会默认给你配置好环境变量，但是由于/etc/mysql/my.cnf文件不完整，而且这种的安装方式默认绑定在本机中，也就是只能够本机进行访问。
* 在手动安装mysql的时候，遇到了依赖的包的版本过低，解决办法，在网址为：(https://packages.ubuntu.com/yakkety/amd64/libmecab2/download "ubuntu deb包网址") 中搜索对应的deb包，并且安装。