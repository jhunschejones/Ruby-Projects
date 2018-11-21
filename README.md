# Ruby Projects

I have spent time studying several different technology stacks and software tools, but Ruby will always have a special place in my heart as it was the language that really got me hooked on coding. Without any prior OOP experience I was able to put together a console app that played out a choose-your-own-adventure game, complete with character health and items. In the time since those early days, I have come back to Ruby several times as my coding knowledge has grown. This repository houses a representative summary of the types of Ruby coding projects I've built during this time. Feel free to contact me with any feedback you have, I'm always happy to receive input!

## Repo Contents:

* Ruby The Hard Way: This folder holds the practice files from my most recent pass through this incredibly helpful book. I'd recommend checking out `ex43.rb` as an example of a fun, class-based console adventure game.
* Ruby Essentials: I built these console apps while refreshing my Ruby knowledge in preparation for an interview. It was fun to see how much of the development knowledge I had gained in the .NET and Node spaces helped me retain more of my learning this time around!
  * Food Finder: A console app that uses a plain text datastore to house restaurant information, allowing users to add and search amongst available data.
  * `file_review.rb`: A console app that a user can run in a folder to set a timespan and archive old files in a new directory of their choosing.
    * I really enjoyed the way this application challenged me to parse user input in a way that feels intuitive to the user, but handles as many common edge-cases as possible. A good example is some internet downloads can be automatically named simply, like `photo.png`. If a user were to use this tool twice in the same directory, selecting the same archive directory each time, I had to create a way to modify duplicate file names so that the program does now write over the first files put in the archive folder.
* Sinatra Blog: A web app that uses a SQLite database and active record to implement full CRUD functionality for plain-text blog posts.
* Sinatra Blog 2: This is a more fully-featured blog application that uses an AWS-hosted Postgres database along with Sinatra and Active Record. Still under construction!