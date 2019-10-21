require 'gossip'

class ApplicationController < Sinatra::Base

  # Création de la route pour le GET de index //
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  # Créer la route pour le GET de /gossips/new/
  get '/gossips/new/' do
  erb :new_gossip
  end

  post '/gossips/new/' do
  erb :new_gossip          #ouvrir le formulaire new gossip avec zones de texte pour la saisie
  puts "contenu de la saisie :"
  Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save #créer un gossip puis l'enregistrer dans bdd
  redirect '/'  #param = gets.chomp. redirect = retourner au debut de la page
  end

end
