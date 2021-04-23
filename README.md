# daily reports (日報の新規ファイルを自動生成するコマンド!)

## 使い方
ディレクトリ```daily_reports```の中の```copy_format.bash```を実行することでその日の日報を書くためのファイルを
生成出来ます。
- format.md
    - この中に好きなフォーマットの日報のテンプレートを作成します。
    - ただし, 一行目のXXXX年YY月ZZ日の箇所を改変すると正常に動作しないため, する際には```copy_format.bash```の<br/>```sed "s/月日/..."の一行をコメントアウト, または改変する必要があります。
- copy_format.bash
    - この中の```SOURCE_PATH```変数の値をdaily_reportをクローンした場所(パス)に設定する
    - この中の```FILE_PATH```変数を変更することで好きな場所 (パス) に日報を作成することが出来る
    - 生成される日報のテンプレートのファイルは```YYZZ.md (YYが月ZZが日)```となる
    - ```FILENAME```変数の中の.mdを好みの拡張子 (.txtなどの自分が書くもの (pdfなど機械が生成するものは不可)) に<br/>変更にすることで, 好みの拡張子の日報のテンプレートの生成が可能
1. 日報のテンプレートを生成するには, ```daily_reports```の中の```copy_format.bash```を実行するだけ
```./copy_format.bash```
    - おすすめとしては使用しているシェルのdotfileにaliasを設定する (bashの場合は$HOME/.bashrc)
    - これによって簡単になる

## aliasの設定方法
1. ```daily_reports```のディレクトリに入る
    - ```cd daily_reports```
2. aliasを登録する
    - ```echo alias=copy_format=". $(pwd)/copy_format.bash" | tee -a ~/.bashrc```
3. .bashrcを読み込む
    - ```source ~/.bashrc```
> 上記の方法はbashを使っている人向けです
