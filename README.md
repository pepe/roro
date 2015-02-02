# RoRo

My first attempt at integrating [Roda][1] with [ROM][2] for educational
purposes. It is nothing fancy, just proof of concept.

WARNING: You can find some ugly things in the belly of the beast!

Still batteries included:
```
> git clone https//github.com/pepe/roro
> cd roro
> bundle install
..................
> bundle exec rspec # to run specs
> bundle exec irb -r ./boot.rb # to run console
> bundle roda server # to run server
```


[1]: https://github.com/jeremyevans/roda "Roda routing toolkit framework"
[2]: https://github.com/rom-rb/rom "Ruby Object Mapper"
