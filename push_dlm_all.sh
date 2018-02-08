#!/bin/bash
git checkout master 
git rebase dlm
git push --force daiqiaobing master
git push --force gitee master
git checkout dlm