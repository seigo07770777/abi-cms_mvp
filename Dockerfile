# 使用するPHPイメージを指定（例：PHP 8.3）
FROM php:8.3-fpm

# 必要な依存関係をインストール
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    git \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql zip

# 権限設定（必要に応じて）
RUN chown -R www-data:www-data /var/www

# ポート80を公開
EXPOSE 80

# コンテナ起動時のコマンド（通常は PHP-FPM）
CMD ["php-fpm"]
