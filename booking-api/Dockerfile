FROM debian
RUN apt-get update
RUN apt-get install -y php-cli php-dom php-curl php-mysql
RUN apt-get install -y git
RUN apt-get install -y composer
RUN useradd -ms /bin/bash -d /home/laravel laravel
WORKDIR /home/laravel
COPY booking-api/first_run.sh first_run.sh
USER laravel
RUN git clone https://github.com/xandrman/booking-api.git
WORKDIR /home/laravel/booking-api
RUN cp .env.example .env
RUN composer install
RUN php artisan key:generate
ENV DB_HOST=mysql
ENV DB_USERNAME=laravel
ENV DB_PASSWORD=laravel
RUN touch /tmp/first_run
CMD /bin/bash /home/laravel/first_run.sh; /usr/bin/php artisan serve --host=0.0.0.0 --port=8000;