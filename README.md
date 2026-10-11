# BERT による感情分析

第8章のノートブックです。BERT の基本モデルを実装し、IMDb のレビューをポジティブ / ネガティブに分類します。

| ノートブック | 内容 |
| --- | --- |
| `make_folders_and_data_downloads.ipynb` | 語彙、学習済み BERT、IMDb データの取得 |
| `8-2-3_bert_base.ipynb` | BERT 本体、Masked Language Model、単語ベクトル |
| `8-4_bert_IMDb.ipynb` | IMDb でのファインチューニングと Self-Attention の可視化 |

## 起動

Docker Desktop を起動してから、このディレクトリで次を実行します。

```bash
docker compose up -d --build
```

ブラウザで http://127.0.0.1:8888 を開きます。トークンは不要です。ノートブックの保存先はこのディレクトリです。

最初に `make_folders_and_data_downloads.ipynb` を最後まで実行してください。学習済みモデルと IMDb をダウンロードし、`vocab/`、`weights/`、`data/` を作ります。その後に `8-2-3_bert_base.ipynb`、`8-4_bert_IMDb.ipynb` の順で実行します。

止めるときは次を実行します。

```bash
docker compose down
```

## 環境

コンテナは Apple Silicon 上で動く次の組み合わせです。ノートブックが使う `torchtext.data.Field` などの API に合わせています。

- Python 3.9
- PyTorch 1.10.2（CPU）
- torchtext 0.11.2

BERT のファインチューニングは CPU では時間がかかります。
