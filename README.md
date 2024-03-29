
# README

# StudyTimeCount App

## コンセプト　～勉強中のアプリわき見抑制～
勉強中に他のアプリに気をとられる事を抑制する目的で  
このアプリはフォーカス状態が外れると時間カウンターが止まるようになっています。 

## アプリURL  
  https://studytimecount-app.onrender.com


### ・利用方法
1.　ユーザー登録：Topページヘッダーから登録できます。  
　　　　　　　　登録すると累積時間を保存できます。  
2.　勉強時間を計測：「開始」ボタンで時間計測を開始し、「終了」ボタンで計測停止  。  
　　　　　　　　　　途中で休憩したい場合は「休憩」ボタンで計測を一時停止できます。  
　　　　　　　　　　「再開」で計測をリスタートできます。  
3.　各種設定：Topページヘッダーで休憩時間、累積時間、BGMの設定、確認ができます。  




### ・機能
~アプリわき見抑制機能~  
　フォーカス状態が外れると時間カウンターが止まります。  
　何時間勉強した！  
　という達成感を味わうこともカウント系アプリを使用する理由と推測し  
　他のアプリを見る事によるペナルティを作り、誘惑への抑制を狙っています。  

~ユーザー管理機能~  
　・ニックネーム  
　・Eメール  
　・パスワード  
　勉強時間の累積、各種設定を保存する為です。  

~ストップウォッチ機能~  
・開始ボタン(終了ボタン)  
　時間計測開始する、押すと表示が「終了」になります。  
　終了ボタンを押すと計測した時間を保存します。  

・休憩ボタン  
　押すとカウンターが止まり、休憩時間の表示がされます。  
　休憩時間はカウントダウン方式で時間は設定できます。  

~各種設定~  
・休憩時間設定  
　休憩時間の設定が出来ます。

・勉強時間記録機能  
　これまでの勉強時間の累積を確認できます  
　リセットボタンでリセットできます  

・BGM機能  
　無音、環境音を含め5種類から選択可能  
　集中力がなかなか上がらない人はルーティーンを決める  
　集中できる環境を作ると良いと言われているので  
　それを配慮しての機能です。



### ・作成した背景  
　弟が勉強中にSNSが気になって気が散ると言っていた事から  
「勉強中スマホを触ってしまう、別の事が気になる」と言う課題を見つけました。  
いざ、取り掛かることが出来ても途中で手が離れてしまっては有意義な勉強にならず  
これを解決できれば誘惑に負けない、もっと時間を有効に使えると思い   
他のアプリへ手が伸びてしまう抑止力として  
アプリがフォーカス状態でないとカウンターが止まる  機能を考えました。  
  
### ~要件定義~  
URL  
https://docs.google.com/spreadsheets/d/1ptxiyLg4S5ImzEIbil3VLD9RnU6PJ8Pt/edit#gid=798740072






## usersテーブル
| Column              | Type       | Options                  |
| ------------------- | ---------- | ------------------------ |
| nickname            | string     | null: false              |
| email               | string     | null: false,unique: true |
| encrypted_password  | string     | null: false              |

### Association
belongs_to :time
belongs_to :usersettings

## timesテーブル
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| user_id             | references | null: false,foreign_key: true |
| duration_seconds    | integer    |                               |

### Association
belongs_to :user

## usersettingsテーブル
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| user_id             | references | null: false,foreign_key: true |
| breaktyp            | enum       | null: false                   |
| breaduration        | datetime   |                               |
| bgmenabled          | enum       | null: false                   |

### Association
belongs_to :user

