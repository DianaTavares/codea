get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end

get '/new_post' do
  erb :new_post
end

post '/new_post' do
  @post = Post.create(title: params[:title], author: params[:author], body: params[:body])
  tags = params[:tag].split(',')
  tags.each do |tag|
    tag = Tag.find_or_create_by(name: tag.strip)
    TagPost.create(post_id: @post.id, tag_id: tag.id)
  end
  redirect "/post/#{@post.id}"
end

get '/post/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/edit_post' do
  @post = Post.find(params[:post_id])
  @post.update(title: params[:title], author: params[:author], body: params[:body])
  redirect "/post/#{@post.id}"
end

get '/delete_post/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end