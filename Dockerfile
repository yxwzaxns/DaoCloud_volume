from ruby

run mkdir /app

add . /app

workdir /app

volume /var/vo

run ln -s /app /var/vo/app

expose 8080

run bundle install

cmd ["ruby","/app/myapp.rb"]
