FROM php:8.3-apache

# 啟用 Apache mod_rewrite
RUN a2enmod rewrite

# 修改 Apache 監聽 8080 埠
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf && \
    sed -i 's/:80/:8080/' /etc/apache2/sites-available/000-default.conf

# 設定工作目錄
WORKDIR /var/www/html

# 複製應用程式檔案
COPY . /var/www/html/

# 設定 Apache 文件根目錄權限
RUN chown -R www-data:www-data /var/www/html

# 暴露 8080 埠
EXPOSE 8080

CMD ["apache2-foreground"]
