#!/bin/bash

#my.cnfファイルが存在するか
Pass(){
	FILE="my.cnf"
	if [[ -f $FILE ]]; then
		Connect
	else
		echo "my.cnfファイルを新規作成"
		echo "[client]" > $FILE
		read -p "UserName : " UserName
		echo "user = $UserName" >> $FILE
		read -s -p "Password : " Password
		echo "password = $Password" >> $FILE
		echo
		read -p "HostName : " HostName
		echo "host = $HostName" >> $FILE
		echo "my.cnfファイル新規作成完了"
		Connect
	fi
}

#MYSQL接続テスト
Connect(){
	echo "MYSQLへ接続中..."
	mysql --defaults-extra-file=./my.cnf -e"\q"
	if [ $? -eq 1 ]; then
		echo "MYSQL接続 : False"
	     	echo "my.cnfFile内を確認"
		exit 1
	else
		echo "MYSQL接続 : Done"
	fi
}

#DBが存在するか
Createtest(){
	CreateDB
	if [ $? -eq 1 ]; then
		echo "既存のDWHを削除"
		DeleteDB
		echo "DWHを再作成中..."
		CreateDB
		if [ $? -eq 1 ]; then
			echo "DWH再作成 : False"
			exit 1
		else
			echo "DWH再作成 : Done"
		fi
	else
		echo "DWH作成 : Done"
	fi
}
#DB作成
CreateDB(){
	mysql --defaults-extra-file=./my.cnf -e "source ./Create_Database.sql"
}
#DB削除
DeleteDB(){
	mysql --defaults-extra-file=./my.cnf -e "source ./Delete_Database.sql"
}

#DWHの構築
DWH(){
	echo "DWHを構築中..."
	mysql --defaults-extra-file=./my.cnf <<EOF
begin;
use Kimball_DWH;
source ./DWH_Table/Category.sql
source ./DWH_Table/Date.sql
source ./DWH_Table/Official_tweet.sql
source ./DWH_Table/Stories.sql
source ./DWH_Table/Sale.sql
commit;
source ./DWH_Data/Category.sql
source ./DWH_Data/Date.sql
source ./DWH_Data/Official_tweet.sql
source ./DWH_Data/Stories.sql
source ./DWH_Data/Sale.sql
commit;
EOF
if [ $? -eq 1 ]; then
	echo "DWH構築 : False"
	exit 1
else
	echo "DWH構築 : Done"
fi
}


Main(){
echo "DWHをKimballモデルで構築..."
Pass
Createtest
DWH
echo "構築完了"
}

Main

