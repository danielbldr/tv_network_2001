class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    found_characters = []
    @shows.find_all do |show|
      show.characters.find_all do |character|
        found_characters << character if character.salary > 500_000 && character.name == character.name.upcase
      end
    end
    found_characters
  end

  def actors_by_show
    shows = {}
    @shows.map do |show|
      shows[show] = show.characters.map {|character| character.actor}
    end
    shows
  end

  def shows_by_actor
    actors = {}
    @shows.each do |show|
      show.characters.each do |character|
        if actors.has_key?(character.actor)
          actors[character.actor] << [show]
        else
          actors[character.actor] = [show]
        end
      end
    end
    actors
  end
end
