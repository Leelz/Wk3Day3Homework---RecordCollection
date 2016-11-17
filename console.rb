require('pry-byebug')
require_relative('models/collectors')
require_relative('models/albums')
require_relative('models/artists')

collector1 = Collector.new({
  "name"  =>  "Stephanie",
  })

collector1.save()

artist1 = Artist.new({
  "artist"  =>  "The Eagles",
  })

artist1.save()

album1 = Album.new({
  "title" =>  "Take it Easy",
  "genre" =>  "Country",
  "collector_id"  => collector1.id
  })

album1.save()

binding.pry
nil