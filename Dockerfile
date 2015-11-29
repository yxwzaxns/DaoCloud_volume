from ruby

volume /var/vo

add . /var/vo

workdir /var/vo

expose 8080

run bundle install

cmd ["ruby","/var/vo/myapp.rb"]
