FROM debian
RUN apt-get update
RUN apt-get install -y php-cli php-dom php-curl php-mysql
RUN apt-get install -y git
RUN apt-get install -y composer
RUN useradd -ms /bin/bash -d /home/laravel laravel
WORKDIR /home/laravel
USER laravel
RUN composer create-project laravel/laravel booking-sdk
WORKDIR /home/laravel/booking-sdk
RUN cp .env.example .env
RUN composer install
RUN composer require xandrman/booking-sdk
RUN php artisan vendor:publish --tag=booking-sdk-config
ENV BOOKING_URL=http://booking-api:8000
RUN php artisan key:generate
CMD /usr/bin/php artisan serve --host=0.0.0.0 --port=8001;