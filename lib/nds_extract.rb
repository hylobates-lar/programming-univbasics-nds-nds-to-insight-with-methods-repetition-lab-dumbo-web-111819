$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  # Write this implementation
  array_of_directors = []
  director_index = 0
  while director_index < source.length do
    director_name = source[director_index][:name]
    array_of_directors << director_name
    director_index += 1
  end
  array_of_directors
end

def total_gross(source)
  grand_total = 0
  directors_gross_hash = directors_totals(source)
  directors = list_of_directors(source)
  # visit each key/director names in list of directors
  director_index = 0
  while director_index < directors.length do
    # look up the value for each in directors totals
    # add totals to the grand total
    grand_total += directors_gross_hash[directors[director_index]]
    director_index += 1
  end
  grand_total
end
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total

