Dir[File.join("./", "**/*.rb")].each do |f|
    require f
  end

game = Game.new()
game.update()