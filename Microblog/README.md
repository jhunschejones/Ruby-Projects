# Sample Micropost App

## Overview

This app is based on Michael Hartl's [*Ruby on Rails Tutorial: Learn Web Development with Rails*](http://www.railstutorial.org/), and represents my learning progress using Ruby, Rails, and Active Record to build and deploy fully-featured web applications.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```
