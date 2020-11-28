# [FROM] 使用するイメージとバージョン
FROM ruby:2.7.1
# [RUN] コマンドの実行。railsに必要なnodejsとpostgeqsqlをインストールしています
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# yarnパッケージ管理ツールをインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
      apt update && apt install -y yarn
# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
apt-get install nodejs

RUN mkdir /illustration
# [WORKDIR] 作業ディレクトリを設定
WORKDIR /illustration
# [COPY] ローカルのファイルをコンテナへコピー
COPY Gemfile /illustration/Gemfile
COPY Gemfile.lock /illustration/Gemfile.lock
RUN bundle install
COPY . /illustration

# コンテナが起動するたびに実行されるスクリプトを追加します
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
# [ENTRYPOINT] 一番最初に実行するコマンド（ここではentrypoint.shを参照）
ENTRYPOINT ["entrypoint.sh"]
# [EXPOSE] コンテナがリッスンするport番号
EXPOSE 3000

# メインプロセスを開始します
# [CMD] イメージ内部のソフトウェア実行（ここではRailsを指す）
CMD ["rails", "server", "-b", "0.0.0.0"]