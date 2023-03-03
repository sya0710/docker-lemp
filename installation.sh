echo -e "\e[1;42m \e[1;37m Begin install Application for Docker \e[0m \e[0m"
ip=$(ip route get 8.8.8.8 | grep -oP 'src \K[^ ]+')
docker-compose run --rm laravel cp .env.example .env
docker-compose run --rm laravel composer install
docker-compose run --rm laravel php artisan migrate
docker-compose run --rm laravel chown www-data:www-data -R storage/
docker-compose run --rm laravel mkdir public/uploads
docker-compose run --rm laravel chown www-data:www-data -R public/uploads/
echo -e "\e[1;42m \e[1;37m End install Application for Docker \e[0m \e[0m"
echo -e "\e[1;42m \e[1;37m Run application backend with link uri: http://$ip \e[0m \e[0m"
