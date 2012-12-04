# 言語処理100本ノックのデータ復元ツール

## ツールについて

[岡崎直観](http://www.chokkan.org/)が作られた[言語処理100本ノック](http://www.cl.ecei.tohoku.ac.jp/index.php?言語処理100本ノック)のための下記のデータファイルを復元するツールです。

* `address.txt`: [日本郵便の郵便番号データ](http://www.post.japanpost.jp/zipcode/dl/readme.html)の全データ（`KEN_ALL.CSV`）に`prepare/address.py`を適用し，都道府県市町村名を取り出したもの
* `inflection.table.txt`: [UMLS SPECIALIST Lexicon](http://www.nlm.nih.gov/pubs/factsheets/umlslex.html)で配布されているもの

## 使い方

	$ cd prepare
	$ bash make_data.sh
	$ ls data/
	address.txt	inflection.table.txt
	$ rm -rf tmp/

## TO-DO

下記のファイルの復元。

* `tweets.txt.gz`: 日本語のツイートをクロールしたもの（非公開なので無理なのか？）
* `medline.txt`: [MEDLINE](http://www.nlm.nih.gov/pubs/factsheets/medline.html)の論文抄録をスクリプトで抽出したもの
* `japanese.txt`: Wikipediaの中で[長いページ](http://ja.wikipedia.org/wiki/特別:長いページ)から適当に本文を抽出したもの
