# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Genre.delete_all
Artist.delete_all
Album.delete_all
Review.delete_all
Post.delete_all
User.delete_all
ArtistGenre.delete_all
Song.delete_all
genres = Genre.create([
    {name: 'Heavy Metal'},
    {name: 'Rock'},
    {name: 'Pop'},
    {name: 'Ambient'},
    {name: 'Death Metal'},
    {name: 'Grindcore'},
    {name: 'Reggae'},
    {name: 'Hip-hop'},
    {name: 'Jazz'},
    {name: 'Blues'},
    {name: 'Classical'}
                      ])
seeds_path = File.dirname(__FILE__)
admin_user = AdminUser.create(email: 'admin@example.com',
                              password: 'password',
                              password_confirmation: 'password')
art_names = ""
File.open(File.join(seeds_path,'seeds/artists.txt'), 'r') {
    |file|
  art_names += file.read
}
art_names = art_names.split(',')
alb_names = ""
File.open(File.join(seeds_path,'seeds/albums.txt'), 'r') {
    |file|
  alb_names += file.read
}
alb_names = alb_names.split(',')
artists = []

250.times do
  a = Artist.new(name: art_names[rand(art_names.count - 1)],
                           description: "description#{rand} #{rand}",
                            )
  a.photo = File.open(File.join(seeds_path, "seeds/artists/#{rand(50)}.jpg"))
  a.save
  artists << a
  (rand(5) + 1).times do

    al = Album.new(name: alb_names[rand(alb_names.count - 1)],
                           artist_id: a.id)
    al.cover = File.open(File.join(seeds_path, "seeds/albums/#{rand(141)}.jpg"))
    al.save
  end
end
genres.each do |g|
  artists.each do |a|
    if rand(160) % 8 == 0
      a.genres << g
    end
  end
end
User.create({user_name: 'hell', email: 'hell@mail.com', password: 'password123',
             password_confirmation: 'password123'})