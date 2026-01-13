FROM php:8.3-apache

# 啟用 Apache mod_rewrite
RUN a2enmod rewrite

# 設定工作目錄
WORKDIR /var/www/html

# 複製應用程式檔案
COPY . /var/www/html/

# 設定 Apache 文件根目錄權限
RUN chown -R www-data:www-data /var/www/html

# 暴露 80 埠
EXPOSE 80

CMD ["apache2-foreground"]
