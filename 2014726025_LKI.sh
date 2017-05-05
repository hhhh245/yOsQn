#!/bin/bash

info()   ###현재디렉토리 파일정보 함수
{
i=`expr $i + 1 `
ty="`stat $name -c %F`"
echo "[$i] $name "
echo "-----------------INFORMATION------------------"
if [ -d $name ]                      #######현재 디렉토리 파일색 지정
then
echo "[34mfile type : $ty"
elif [ -f $name ]
then
echo "file type : $ty"
else
echo "[32mfile type : $ty "   
fi
echo "[0mfile size : `stat $name -c %s`"  ##디렉토리 파일색 여기까지
echo "modified time : `stat $name -c %y`"
echo "permission : `stat $name -c %a`"
echo "absolute path : `pwd $name`/$name"
echo "relative path : ./$name"
echo "----------------------------------------------" #현재디렉 파일정보 여까지
}

inf()    #####하위디렉토리 파일정보 함수
{
j=`expr $j + 1 `
t="`stat $name/$nam -c %F`"
echo "	-[$j] $name/$nam"
echo "	|-------------------INFORMATION------------------"
if [ -d $name/$nam ]                  ######하위디렉토리 파일색지정
then
echo "	|[34m file type : $t"
elif [ -f $name/$nam ]
then
echo "	| file type : $t"
else
echo "	|[32m file type : $t" 
fi
echo "	[0m| file size : `stat $rudfh/$nam -c %s`" ###하위디렉 파일색 여기까지
echo "	| modified time : `stat $rudfh/$nam -c %y`"
echo "	| permission : `stat $rudfh/$nam -c %a`"
echo "	| absolute path : `pwd $name`/$name/$nam "
echo "	| relative path : ./$name/$nam "
echo "	|------------------------------------------------"
}
ele="`ls | wc -l`"
echo "=== print file information ==="  ### 현재디렉토리 경로, 파일수
echo "current directory : `pwd project.sh`"
echo "the number of elements : $ele"   ### 현재디렉토리 경로, 파일수 여기까지
i=0

for name in `ls | sort`   ############### 디렉토리 파일정렬
do
if [ -d $name ]
then
{
info
###########################          하위디렉토리 파일 정렬

rudfh="`pwd`/$name"
for nam in `ls $rudfh | sort`
do
if [ -d $name/$nam ]
then

inf

fi
done

for nam in `ls $rudfh | sort`
do

if [ -f $name/$nam ]
then

inf

fi
done

for nam in `ls $rudfh | sort`
do

if [ ! -d $name/$nam ] && [ ! -f $name/$nam ]
then

inf

fi
done

j=0
}
########################### 하위디렉토리 파일 정렬 여기까지
fi
done
for name in `ls | sort`
do
if [ -f $name ]
then

info

fi
done
for name in `ls | sort`
do
if [ ! -d $name ] && [ ! -f $name ]
then

info

fi
done             ################## 디렉토리 파일정렬 여기까지



