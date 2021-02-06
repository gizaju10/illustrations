FROM ruby:2.7.1

# RUN apt-get update -qq && \
#   apt-get install -y apt-utils \
#   build-essential \
#   libpq-dev \
#   nodejs \
#   vim

# [RUN] コマンドの実行。railsに必要なnodejsとpostgeqsqlをインストールしています
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# yarnパッケージ管理ツールをインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
      apt update && apt install -y yarn
# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
apt-get install nodejs

#各自のアプリ名に変更する
ENV RAILS_ROOT /illustrations

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler:2.1.4
RUN bundle install

#プロジェクトフォルダ内のすべてのファイルをRailsコンテナ内にコピーする
COPY . .

#ソケット通信のためのディレクトリを作成
RUN mkdir -p tmp/sockets