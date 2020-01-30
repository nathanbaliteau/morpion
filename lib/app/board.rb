class Board
  
  attr_accessor :board_cases_array, :round_count

  def initialize
    
    @board_cases_array = []
    @round_count = 0

    #remplir l'array de 9 cases de A1 jusqu'à C3
    ['A','B','C'].each do |letter|
      (1..3).each do |number|
        @board_cases_array << BoardCase.new("#{letter}#{number}", '')
      end
    end

  end

  def change_state(position_to_change, symbol)

    #établir l'index de la case à modifier dans @board_cases_array
    array_of_cases = ['A1','A2','A3','B1','B2','B3','C1','C2','C3']
    index_case = array_of_cases.index(position_to_change).to_i
    
    #modifier le contenu de la case en question si elle est vide
    if @board_cases_array[index_case].content.empty?
      @board_cases_array[index_case].content = symbol
      puts "\nTu as joué la case #{position_to_change} !"
      @round_count += 1
      return true
    else
      return false
    end

  end

  def is_game_over?

    #liste des cas où un joueur réussit à aligner 3 de ses symboles
    win_scenarios = [
      ['A1','A2','A3'], ['B1','B2','B3'], ['C1','C2','C3'], ['A1','B1', 'C1'], 
      ['A2','B2','C2'], ['A3','B3','C3'], ['A1','B2','C3'], ['A3','B2','C1']
    ]

    #création et remplissage de deux arrays contenant les cases occupées 
    #par x et par o
    x_board_cases_array = []
    o_board_cases_array = []
    @board_cases_array.each do |board_case|
      if board_case.content == 'x'
        x_board_cases_array << board_case.position
      elsif board_case.content == 'o'
        o_board_cases_array << board_case.position
      end
    end

    #évaluation du plateau pour savoir si 9 coups ont déjà été joués
    #ou si un scénario de victoire a été atteint
    if @round_count == 9 
      return "full"
    elsif win_scenarios.any? { |win_scenario| win_scenario.all? { |ref| x_board_cases_array.include?(ref) } }
      return "x"
    elsif win_scenarios.any? { |win_scenario| win_scenario.all? { |ref| o_board_cases_array.include?(ref) } }
      return "o"
    else
      return "continue"
    end

  end

end