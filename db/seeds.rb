# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
LocationType.destroy_all
MusicType.destroy_all

LocationType.create(location: "extérieur")
LocationType.create(location: "intérieur")
LocationType.create(location: "non-indiqué")

MusicType.create(style: "Blues")
MusicType.create(style: "Chanson française")
MusicType.create(style: "Dance")
MusicType.create(style: "Drum and bass")
MusicType.create(style: "Easy listening")
MusicType.create(style: "Electronica")
MusicType.create(style: "Funk")
MusicType.create(style: "Gospel")
MusicType.create(style: "Jazz")
MusicType.create(style: "Heavy metal")
MusicType.create(style: "Musique classique")
MusicType.create(style: "Musique country")
MusicType.create(style: "Musique électronique")
MusicType.create(style: "Musique expérimental")
MusicType.create(style: "Musique folk")
MusicType.create(style: "Musique instrumental")
MusicType.create(style: "Musique latine")
MusicType.create(style: "Musique soul")
MusicType.create(style: "Musiques du monde")
MusicType.create(style: "New age")
MusicType.create(style: "Pop")
MusicType.create(style: "Rap")
MusicType.create(style: "Reggae")
MusicType.create(style: "Rock")
MusicType.create(style: "RnB contemporain")
MusicType.create(style: "Dubstep")

Fest.create(title: "EUROCKÉENNES", start_date: DateTime.new(2019,7,4), end_date: DateTime.new(2019,7,7),address: "Belfort", description: "Fidèles à leur esprit d’éternelle jeunesse, les Eurockéennes de Belfort, nichées sur la presqu’île du Malsaucy, n’ont pas pris une ride à l’aube de leur quatrième décennie. Indépendant, 100 % associatif et attaché à ses valeurs citoyennes et artistiques, le festival promet pour 2019 : énergie, expérience et engagement ! Les 17 premiers artistes et groupes annoncés sont un mélange bouillonnant entre futures révélations internationales, artistes francophones les plus influents du moment et retours jouissifs de groupes cultes.
" , website: "https://www.eurockeennes.fr/")
Fest.create(title: "Art Rock", start_date: DateTime.new(2019,6,7), end_date: DateTime.new(2019,6,9),address: "Saint-Brieuc", description: "Charlotte Gainsbourg, Angèle, Lomepal ou encore Delgres vous attendent à Saint-Brieuc, les vendredi 7, samedi 8 et dimanche 9 juin 2019, à l'occasion de la nouvelle édition Bretonne du Festival Art Rock." , website: "https://www.artrock.org/")
Fest.create(title: "Papillons de nuit", start_date: DateTime.new(2019,6,7), end_date: DateTime.new(2019,6,9),address: "Saint-Laurent-De-Cuves", description: "Ne manquez pas l'édition 2019 du Festival Papillons de Nuit qui se déroule à Saint-Laurent-de-Cuves, du vendredi 7 au dimanche 9 juin prochain. Au menu ? Maître Gims, Kendji Girac, Zazie, Trois Cafés Gourmands ou encore Hoshi." , website: "https://papillonsdenuit.com/")