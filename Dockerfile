from ruby

run mkdir /app

add . /app

expose 8080

workdir /app

run bundle install

run chmod a+x /app/start.sh

cmd ["/app/start.sh"]
