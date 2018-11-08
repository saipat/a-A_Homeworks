require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :name, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_name(name)
    find_by_name = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        plays
      WHERE
        name = ?
    SQL
    return nil if find_by_name.length < 0
    Play.new(find_by_name.first)
  end

  def self.find_by_playwright(name)
    playwright_name = Playwright.find_by_name(name)
    raise "#{name} not found" unless playwright_name

    play = PlayDBConnection.instance.execute(<<-SQL, playwright_id)
      SELECT
        *
      FROM
        PLAY
      WHERE
        playwright_id = ?
    SQL
    return nil unless play

    Play.new(play.first)

  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def insert
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.year, self.playwright_id)
      INSERT INTO
        plays (name, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        name = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end


class Playwright

  attr_accessor :name, :birth_year
  attr_reader :id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map {|datum| Playwright.new(datum)}
  end

  def self.find_by_name(name)
    f_name = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL
    return nil unless f_name.length > 0
    Playwright.new(f_name.first)
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def insert
    return "#{self} already in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
      INSERT INTO
        playwrights(name, birth_year)
      VALUES
       (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    return "#{self} not found in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    return "#{self} not found in database" unless self.id
    get_data = PlayDBConnection.instance.execute(<<-SQL, self.id)
      SELECT
        *
      FROM
        plays
      WHERE
        id = ?
    SQL
    get_data.map {|d| Play.new(play)}
  end

end
