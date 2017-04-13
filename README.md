# Shift Scheduler

I'm building Shift Scheduler to generate schedules for volunteers. We can't be too demanding
so we're doing our best to work around their availability; but, with dozens of volunteers, there's
just too much to keep track of. 

To get started it's a good idea to use an environment manager like Ruby Version Manager (RVM)

Run the following commands

```
git clone https://github.com/iarambula/shiftscheduler
cd shiftscheduler
gem install bundler
bundle install
rails db:setup
```

After that, you should be good to go! Now run, `rails server` and go to `http://localhost:3000`.