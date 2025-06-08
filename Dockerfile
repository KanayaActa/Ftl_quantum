FROM python:3.10-slim

# OSの基本パッケージをインストール
RUN apt-get update && apt-get install -y git build-essential

# pipを最新化して依存ライブラリをインストール
COPY requirements.txt /tmp/
RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt

# 作業ディレクトリ
WORKDIR /app

# Jupyter Notebookをポート8888で起動
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''", "--notebook-dir=/app"]
