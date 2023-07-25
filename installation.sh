echo -e "\e[1;42m \e[1;37m Begin install Application for Docker \e[0m \e[0m"
ip=$(ip route get 8.8.8.8 | grep -oP 'src \K[^ ]+')
docker-compose run --rm laravel composer dump
docker-compose run --rm laravel chown www-data:www-data -R storage/
docker-compose run --rm laravel php artisan clear-compiled
docker-compose run --rm laravel php artisan route:clear
docker-compose run --rm laravel php artisan view:clear
docker-compose run --rm laravel php artisan cache:clear
docker-compose run --rm laravel php artisan config:clear
echo -e "\e[1;42m \e[1;37m End install Application for Docker \e[0m \e[0m"
echo -e "\e[1;42m \e[1;37m Run application backend with link uri: http://$ip \e[0m \e[0m"
