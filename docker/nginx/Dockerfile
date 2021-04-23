FROM nginx:1.19.6

# インクルード用のディレクトリ内を削除
RUN rm -f /etc/nginx/conf.d/*

# Nginxの設定ファイルをコンテナにコピー
COPY /docker/nginx/nginx.conf /etc/nginx/conf.d/illustrations.conf

# 画像などのpublicファイルはnginxに配置
RUN mkdir -p /illustrations/public
COPY ./public /illustrations/public

# ビルド完了後にNginxを起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf