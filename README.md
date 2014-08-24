
Milemarker
========
TODO: Something cool about the app.


##Setup
* * *

### Dependency management

Dependency management is split into two concerns, front-end and server side. Bundler is used to manage the server side rails application code, while bower is used to manage front-end dependencies.

####Bundler
Install dependencies and run the migrations

    bundle
    rake db:migrate

####Bower (rails-bower)
Install dependencies via rake task.

    rake bower:install

Refer to the  [Github Documentation](https://github.com/42dev/bower-rails/) for more information.

### Documentation

Documentation is automatically generated via rdoc, but ignored from git. To generate documentation run:

    rake doc:app

Which will create static HTML files in `/doc/app`.