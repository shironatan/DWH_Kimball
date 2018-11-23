##これ
DWHをKimballモデルで構築する&&構築時間測定&&クエリ実行時間測定&&DBサイズ測定　できます。

##確認済動作環境
OS : Ubuntu 18.04.1 LTS
MYSQL : MYSQL 5.7.24-0ubuntu0.18.04.1

##使い方
$ git clone https://github.com/shironatan/DWH_Kimball

１．DB構築と構築時間を測定
$ pwd
 ...../DWH_Kimball/Kimball
$ cd CreateDir
$ time sudo ./Create.sh
 DWHをInmonモデルで構築...
 my.cnfファイルを新規作成
 UserName : MYSQLのユーザアカウントを入力
 Password : 対応するパスワードを入力
 HostName : ホスト名を入力(localhostなど)
 ..

２．各クエリの実行時間を測定
$ pwd
 ...../DWH_Kimball/Kimball
$ cd Query
$ sudo ./Query.sh
 SQLFile名 : ファイル名を入力(1.sqlなど)
 my.cnfファイルを新規作成
 UserName : MYSQLのユーザアカウントを入力
 Password : 対応するパスワードを入力
 HostName : ホスト名を入力(localhostなど)
 ..
 
３．各DBのサイズを測定
$ pwd
 ...../DWH_Kimball/Kimball
$ cd Size
$ sudo ./Size.sh
 my.cnfファイルを新規作成
 UserName : MYSQLのユーザアカウントを入力
 Password : 対応するパスワードを入力
 HostName : ホスト名を入力(localhostなど)
 ..
