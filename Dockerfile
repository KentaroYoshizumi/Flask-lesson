# ベースイメージを指定する
FROM alpine:latest

# ADD/COPY、RUN実行時の作業ディレクトリを指定
WORKDIR /app

# イメージにファイルやフォルダを追加する
COPY . /app/

# イメージをビルドする際のコマンド（Alpineはapk）
RUN apk update \
  && apk add python3 \
  && apk add python3-dev \
  && apk add py3-pip \ 
  && apk add iproute2-ss \
  && apk add lsblk \
  && apk add procps

# pipでPythonライブラリをインストール
# RUN pip install -U pip
# RUN pip install -r /app/requirements.txt

# コンテナが外部と通信するポートを指定
EXPOSE 5000

# コンテナを起動するときに実行する既定のコマンドを指定
CMD ["python", "alpine_app.py"]

