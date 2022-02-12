if [ -f /tmp/first_run ]; then
    php artisan migrate --seed
    rm /tmp/first_run
fi