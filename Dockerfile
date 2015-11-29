from ruby

run mkdir /app

add . /app

volume /var/vo

expose 8080

workdir /app

run bundle install

run ln -s /home /var/vo

cmd ["ruby","/app/myapp.rb"]
