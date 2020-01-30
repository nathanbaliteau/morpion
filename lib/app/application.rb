class Application

  def perform
    puts "\n  ----------------------------------------"
    puts " | Bienvenue dans ce MORPION de l'enfer ! |"
    puts "  ----------------------------------------"

    game = Game.new
    view = Show.new

    while game.game_status == "game_on"
      view.show_board(game.board)
      game.launch_the_game
      game.game_end
      if game_status = "finished"
        view.show_board(game.board)
      end
      game.whose_turn_is_it?
    end   
  end

end