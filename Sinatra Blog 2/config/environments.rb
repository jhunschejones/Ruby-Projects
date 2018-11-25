configure :production, :development do
  # db = URI.parse(ENV["DATABASE_URL"] || "postgres://sinatrablog2master:TTApass*2018@sinatra-blog-2.c4pkqdxvwjmw.us-east-2.rds.amazonaws.com:5432/sinatra_blog_2")
  
  # ActiveRecord::Base.establish_connection(
  #   :adapter => db.scheme == "postgres" ? "postgresql" : db.scheme,
  #   :host => db.host,
  #   :username => db.user,
  #   :password => db.password,
  #   :database => db.path[1..-1],
  #   :encoding => "utf8"
  # )

  # db = URI.parse(ENV['DATABASE_URL'] || 'postgres://sinatrablog2master:TTApass*2018@sinatra-blog-2.c4pkqdxvwjmw.us-east-2.rds.amazonaws.com:5432/sinatra_blog_2')
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/sinatra_blog_2')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end