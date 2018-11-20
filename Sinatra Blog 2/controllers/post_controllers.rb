get "/posts/create" do
  @title = "Create Post"
  @post = Post.new
  erb :"posts/create"
end
    
post "/posts" do
  @post = Post.new(params[:post])
  # user = User.find(@post.user_id)
  # @post.user = user

  if @post.save
    redirect "posts/#{@post.id}", :notice => 'Congrats! Love the new post. (This message will   disapear in 4 seconds.)'
  else
    erb :"posts/create", :error => 'Something went wrong. Try again. (This message will disapear in 4 seconds.)'
  end
end