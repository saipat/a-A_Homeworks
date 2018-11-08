class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
    next if idx == 6 || idx == 13
    4.times do
      cup << :stone
    end
  end
  end

  def valid_move?(start_pos)

    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?

  end

  def make_move(start_pos, current_player_name)
    stones  = @cups[start_pos]
    @cups[start_pos] = []
   # stones
    cup_index = start_pos
    # until start_pos.empty?
    #   cup_index += 1
    #   cup_index = 0 if cup_index > 13
    #
    # end
    render
    next_turn(cup_index)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if @cups[ending_cup_idx].count == 1
      :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count != 0
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
