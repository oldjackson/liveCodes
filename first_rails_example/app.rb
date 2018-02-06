require_relative "config/application"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

set :database, { adapter: "sqlite3", database: "db/development.sqlite3" }
set :views, Proc.new { File.join(root, "app/views") }

# Routes + Controller

get '/about' do
  erb :about # Embedded Ruby -> renders about.erb from the views folder
end

get '/' do
  # get all restaurants from DB and save it in @restaurants
  @restaurants = Restaurant.all

  erb :index
end

get '/restaurants/new' do
  erb :new
end

post '/restaurants/create' do
  # get name and description from the params hash

  # build a new restaurant object with the saved name and description
  new_rest = Restaurant.new({name: params[:name], description: params[:description]})
  # save the object into the DB
  new_rest.save!
  # redirect to the list of restaurants
  redirect to("/")
end

get '/restaurants/:id' do
  # get id from the params hash
  @restaurant = Restaurant.find(params[:id])
  # find the restaurant object from the DB and save it in @restaurant

  erb :show
end
