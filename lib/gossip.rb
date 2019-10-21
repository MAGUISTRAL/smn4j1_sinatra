require 'pry'
require 'csv'

class Gossip
attr_accessor :author, :content

  def initialize (author,content)
    @author = author
    @content = content
  end

  def save #une méthode #save qui enregistrera dans une base de données tous les potins, et puis y'aura juste à aller les chercher quand nécessaire.
    CSV.open("./db/gossip.csv", "ab") do |csv|  #ab c'est pour indiquer que tu vas modifier le fichier que tu ouvres. (le CSV a le path db/gossip.csv).
    csv << [@author ,@content] # Nous insérons dedans une ligne avec deux colonnes. La première colonne a pour entrée le string Mon super auteur et la seconde colonne a le string Ma super description
    end
    #On n'oublie pas de fermer le fichier sinon il y'a des interférences avec shotgun
   #f.close
  end

  def self.all
    all_gossips = [] #on initialise un array vide
    CSV.read("./db/gossip.csv").each do |csv_line| # va chercher chacune des lignes du csv do
    all_gossips << Gossip.new(csv_line[0], csv_line[1]) # crée un gossip avec les infos de la ligne
    # all_gossips << gossip qui vient d'être créé
    end
  return all_gossips #on retourne un array rempli d'objets Gossip
  end

end
