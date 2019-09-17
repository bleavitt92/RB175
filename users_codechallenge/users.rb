require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @users = YAML.load_file("users.yaml")
end

get "/" do 
  erb :users
end

get "/:user_name" do
  @user_name = params[:user_name].to_sym
  @info = @users[@user_name]

  erb :user
end

helpers do
  def count_interests
    total = 0
    @users.each do |name, info|
      total += info[:interests].size
    end
    total
  end
end