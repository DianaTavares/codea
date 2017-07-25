get '/tags' do
  @tags = Tag.all
  @posts = Post.all
  erb :tags
end 

get '/tags/:tag' do
  @tags = Tag.all
  tag = Tag.find_by_name(params[:tag])
  @posts = tag.posts if tag
  erb :tags
end