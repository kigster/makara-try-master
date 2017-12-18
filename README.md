# Makara::TryMaster

This is a plugin for the ruby gem  [`Makara`](https://github.com/taskrabbit/makara/) that aims to improve the performance of Maraka-driven application that are tuned to maintain a very short replication delay. For such applicaiton, **TryMaster** offers an alternative solution to the concept of "stickiness". 

## FAQ

### What is Makara?

 * Makara offers a reliable and battle-tested read/write splitting solution for all ActiveRecord-based Ruby application.

 * Makara has a concept of **stickiness**, which has been [hotly debated recently](https://github.com/taskrabbit/makara/issues/178). The discussion and the corresponding [gist](https://gist.github.com/kigster/ffb9b3437890f9a3ead77a78bbb1b226) provided the basis for this gem.

### What is Stickiness?

Makara [defines stickiness](https://github.com/taskrabbit/makara#context) as a mechanism for getting consistent results across multiple web requests coming from the same user, where an update is involved at the beginning of this interaction. Makara will use `memcached` or any other available Rails Cache Store in order to store a small "cookie", *per user session*. If an update is performed to a record, user's session becomes "sticky" and sticks to the master for a certain duration to ensure that fetches would work. 

### Why is it All Necessary?

Short answer? **Damn Replica Lag**. 

> __Uncle DOB Answers__ 
>
> Basically, in any distributed architecture there will always be a delay (which can be measured in bytes, or time, such as seconds) between when the data is committed on the master database (and synced to disk, at least the WAL disk), and the time the update is available for fetching on a given replica. Databases have dozens of configuration parameters to tune this behavior, and depending on the parameters our replica may be behind by 30-60 seconds, or even more! 
>
> Imagine creating an account in the application, and upon signup getting a 404 "your account has not been found, because you see, our replica is behind by 40 seconds, so start your timer, yo!" Well, wouldn't that be lovely? :)


## Usage

TBD.
  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'makara-try_master'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install makara-try_master

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/makara-try_master.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
