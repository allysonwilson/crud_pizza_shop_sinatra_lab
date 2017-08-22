require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require( './models/pizza')

  #INDEX route
  get '/pizzas' do
    @pizzas = Pizza.all()
    erb(:index)
  end

  #NEW route
  get '/pizzas/new' do
    erb(:new)
  end

  # SHOW route
  get '/pizzas/:id' do
    @pizza = Pizza.find( params[:id] )
    erb(:show)
  end

  #Create route
  post '/pizzas' do
    @pizza = Pizza.new( params )
    @pizza.save()
    erb(:create)
  end

  #Delete route
  post '/pizzas/:id/delete' do
    @pizza = Pizza.find( params[:id])
    @pizza.delete()
    redirect to '/pizzas'
  end

  #EDIT route
  get '/pizzas/:id/edit' do
    @pizza = Pizza.find( params[:id])
    @pizza.update()
    erb(:edit)
  end

#Update route
  post '/pizzas/:id' do
    puts params
    pizza = Pizza.new( params[:id] )
    pizza.update()
    redirect to "/pizzas/#{pizza.id}"
  end
