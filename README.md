# CustomerService
◦ 実装に費やした時間
17:13:22
（togglタイマーで計測）

◦ 実装する上で悩んだところ
1.そもそもSwift、Xcodeで実装するのが初めてで、実機デバッグでHello Worldするところから始めましたが、
文法の理解、UIの作り方を把握するのに時間がかかりました。

２.CocoaPodsのバージョン管理方法をどうすべきか悩みました。
（結局は手持ちのMacbookAirに初期インストール済みのRubyのバージョンに合わせて導入しました）

3.1日３０分レベルの細切れの時間しか取ることが出来ずに、開発効率が悪かったです。


◦ 実装する上で工夫したところ、よく作れたと思うところ
下記改善点の 1.入力フォームの改善点 を除いて、概ね仕様通りに実装できたと思います。


◦ 改善点
1.入力フォームの字数制限について、半角英数の場合は仕様通りの挙動をしますが、
日本語の場合の挙動が仕様通りとは言えない可能性があるので改善する必要があります

2.MVCモデルで実装しようとしましたが、結局ViewControllerにModelのコードを書いてしまいました。
簡単なアプリなので、現状はこれで良いかもしれませんが、MVCで実装することが改善点です。

3.送信ボタンを押した後に、各フォームにデータが残っているので、消すようにしたいです。

3.Git管理すべきファイルがどれかまだはっきりとわかっていませんので過剰なファイル数が含まれている可能性があります。

４.エラー処理を入れていないので、想定していないデータを入れた場合の挙動のテストをしていません

５.testプロジェクトを活用できていないので自動テストなどの学習をして、
開発に活かせるようにしてみたいです。


◦ どのような動作テストを行ったか
手持ちのiPadでの検証、simulatorでiPhone12 miniでの検証を行いました。
 ・課題通りの挙動をするか
 ・デバイスを回転させても使用に差し支えないか
という観点で動作テストをしました。
（できればiPhoneでも実機デバッグを行いたかったのですが、なかったのでsimulatorで行いました）

◦ 参考にした資料・サイト
1.資料
詳解Swift 第５版

2.サイト
実機デバッグする方法
  https://qiita.com/natsumo/items/3f1dd0e7f5471bd4b7d9
GitHubの使い方
  https://qiita.com/sakamotoyuya/items/fd6c30e672860ba89759
CocoaPods公式サイト
  https://cocoapods.org/
CocoaPodsの導入の仕方
  https://pursue.fun/tech/how-to-cocoapods/
Realm公式サイト
  https://realm.io/
Realmの導入方法
  https://qiita.com/chan_naruwo/items/798e30d840bdca3edd8c
StoryBoadの使い方の基本
  https://satoriku.com/app-dev-step7/#storyboard
UUIDの使用方法
  https://qiita.com/addson/items/57e960a556161230de74
その他多数


◦ 他、アピールしたい事があれば記入
感想となりますが、iOSアプリは初めてでしたが、課題を与えられて、それを実現するために実装していく、ということは楽しかったです。
今回は就業中、かつ、子育て中という状況だったため、1日のうちで取れる時間が少なく苦労したのですが、
まとまった時間が取れれば、もう少し効率よく実装できるかと思います。

