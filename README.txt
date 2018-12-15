##これ
DWHをKimballモデルで構築する&&構築時間測定&&クエリ実行時間測定&&DBサイズ測定　できます。

##確認済動作環境
OS : Ubuntu 18.04.1 LTS
MYSQL : MYSQL 5.7.24-0ubuntu0.18.04.1

##使い方
$ sudo git clone https://github.com/shironatan/DWH_Kimball

１．DB構築と構築時間を測定
$ pwd
 ...../DWH_Kimball/Kimball
$ cd CreateDir
$ sudo ./Main.sh
 DWHをKimballモデルで構築...
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
 SQLファイル名 : ファイル名を入力(1.sqlなど)
 ユーザーを新規作成・変更
 ユーザー名 : MYSQLのユーザアカウントを入力
 パスワード : 対応するパスワードを入力
 ホスト名 : ホスト名を入力(localhostなど)
 変更完了
 /* ログインユーザー */
 hoge
 ユーザー名を指定[変更:change] : hoge
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

[ほかにも]
ここでつくられるデータベースは2017年のアニメ作品の売上数値を、原作情報、放送日情報、公式ツイート情報、話数情報から分析できるように構築されています。

/* データベース構造 */

・Saleテーブル（売上数値）
Date_key : Dateテーブルへの外部キーであり、主キーです。
Category_key : Categoryテーブルへの外部キーであり、主キーです。
Stories_key : Storiesテーブルへの外部キーであり、主キーです。
Official_tweet_key : Official_tweetテーブルへの外部キーであり、主キーです。
Sale_number : 作品数
Sale_number_count : 売上数値合計

・Categoryテーブル（原作情報）
Category_key : 主キーです。
Category1_code : 原作大分類コード
Category1_name : 原作大分類名（漫画，ラノベ，アニオリなど）
Category2_code : 原作小分類オード
Category2_name : 原作小分類名（講談社，電撃文庫，小説など）

・Dateテーブル（放送日情報）
Date_key : 主キーです。
Month : 放送年
Day : 放送月
Day_week : 放送曜日
Term : クール（冬，春など）

・Official_tweetテーブル（公式ツイート情報）
Official_tweet_key : 主キーです。
Official_tweet_number : 公式ツイート数
Tweet : 公式ツイート数端数

・Storiesテーブル（話数情報）
Stories_key : 主キーです。
Stories_number : 話数
Term_number : クール数（１，２など）

☆☆例えばクールと原作大分類ごとのアニメの作品数と売上数値平均を分析し、売上数値平均の降順で表示したい場合
$ pwd
~/kimball/Query

##分析できるようなSQLをつくります
$ sudo ./Inner_join.sh
（入力以外の表示は省略）
ファイル名を入力：hoge
ユーザー名を指定[変更:change]：任意
データベース名を入力：Kimball_DWH
メインテーブルを入力：Sale
Saleテーブル結合条件項目名[無し/終了:q]：q
結合テーブルを入力：Date
Saleテーブル結合項目名：Date_key
Dateテーブル結合項目名：Date_key
Dateテーブル結合条件項目名[無し/終了:q]：q
結合テーブルを入力：Category
Saleテーブル結合項目名：Category_key
Categoryテーブル結合項目名：Category_key
Categoryテーブル結合条件項目名[無し/終了:q]：q
結合テーブルを入力：q
Saleテーブル抽出項目名[終了:q]:SUM(Sale_number)
SUM(Sale_number)項目の表示名[項目名と同一:q]：作品数
Saleテーブル抽出項目名[終了:q]：TRUNCATE(AVG(Sale_number_count),0)
TRUNCATE(AVG(Sale_number_count),0)項目の表示名[項目名と同一:q]：売上数値平均
Saleテーブル抽出項目名[終了:q]：q
Dateテーブル抽出項目名[終了:q]：Term
Term項目の表示名[項目名と同一:q]：クール
Dateテーブル抽出項目名[終了:q]：q
Categoryテーブル抽出項目名[終了:q]：Category1_name
Category1_name項目の表示名[項目名と同一:q]：原作大分類
Categoryテーブル抽出項目名[終了:q]：q

#売上数値平均の降順で表示させるようにsqlをかえます。
$ sudo ./Sort.sh
（入力以外の表示は省略）
ファイル名を指定(拡張子あり)：hoge.sql
ORDER BYに指定する項目を優先度が高いものから選んでください[終了:q]：売上数値平均
DESC/ASC：DESC
ORDER BYに指定する項目を優先度が高いものから選んでください[終了:q]：q

#SQLを実行します。
$ sudo ./Query.sh
（入力以外の表示は省略）
SQLFile名：hoge.sql
（（クエリの実行結果が表示されます））

こんな感じで簡単に（？）分析と表示ができます。

