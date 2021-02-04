@pokemon.each do |poke|
    json.set! poke.id do # explicitly set the key to pokeman's id
      json.extract! poke, :id, :name # grab pokeman's id, nam, image url
      json.image_url asset_path("pokemon_snaps/#{poke.image_url}")
    end
  end