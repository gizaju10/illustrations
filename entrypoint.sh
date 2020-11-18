#!/bin/bash
# set -e ：　「エラーが発生するとスクリプトを終了する」の意
set -e

# 既存の可能性があるRailsのserver.pidを削除します
# rm ...　：　「railsのpidが存在している場合に削除する」処理
rm -f /guminoki/tmp/pids/server.pid

# 次に、コンテナのメインプロセス（DockerfileでCMDとして設定されているもの）を実行します
# exec "$@"　：　DockerfileのCMDで渡されたコマンド（→Railsのサーバー起動）を実行
exec "$@"