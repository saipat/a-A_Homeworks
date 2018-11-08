class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence()
    require_sequence()
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      sleep 0.50
      puts color
      sleep 0.50
    end
  end

  def require_sequence
    @seq.each do |sequence|
      p "Please enter a color from red, blue, green and yellow)"
      @user_input = gets.chmop
      unless sequence[0] == @user_input
        @game_over = true
        game_over_message
        break
      end
    end
    sleep 0.50
  end

  def add_random_color
    # @sequence_length
    @seq << COLORS.sample
  end

  def round_success_message
    "Completed the round successfully! Good job!"
  end

  def game_over_message
    "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
