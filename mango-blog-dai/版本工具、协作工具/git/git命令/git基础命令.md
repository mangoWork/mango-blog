##git中常用的命令
###1. 分支
*		查看远程分支   git branch -a
  *	查看本地分支	  git branch

###2. git pull  origin 与git fetch的区别？
* git pull 相当于从远程获取最新版本并且merge到本地

  * git pull origin master（相当于git fetch和git merge)


  * git fetch 相当于是从远程获取最新到本地，不会自动merge
  * git fetch origin
  * git merge origin/master
  * git fetch操作包含了两个关键的步骤：
  * 创建并且更新所有的远程分支的本地分支
  * 设置当前分支的FETCH_HEAD为远程服务器的分支
  * git fetch origin branch1：branch2
  * 首先执行上面的fetch操作
  * 使用远程branch1分支在本地创建branch2（不会切换到该分支）
  * 如果本地不存在branch2分支，则会自动创建一个新的branch2分支。
    * 如果本地分支存在，并且是“fast forward”，则会合并两个分支，否则，会阻止以上操作
    * git fetch origin：branch2相当于git fetch origin master：branch2

### 3. git删除已经add的文件

* 使用git rm --cached “文件路径”，该命令将不会删除物理文件，仅仅会将该文件从缓存中删除
* 使用git rm --f “文件路径”，不仅将该文件从缓存中删除，还会将物理文件删除
* tips：
  * git reset HEAD ：清空版本库内容暂存区（慎用）
  * git rm --cached "文件"：只是将特定文件从暂存区删除

### 4. git撤销提交

* 先使用git log查看commit日志，提交的commit的哈希值
* 使用命令  git reset --hard commit_id  进行回退