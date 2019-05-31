require 'yaml/store'

class MovieStore
  def initialize(file_name)
    @store = YAML::Store.new(file_name)
  end

  def save(movie)
    # transaction method prevents other programs from writing to this file
    # while this program is using it
    @store.transaction do
      unless movie.id
        highest_id = @store.roots.max || 0 # `roots` returns all ID's in the store
        movie.id = highest_id + 1
      end
      @store[movie.id] = movie
    end
  end

  def find(id)
    @store.transaction do
      @store[id]
    end
  end

  def all
    @store.transaction do
      # map over the IDs to create an array of all the values in the store
      @store.roots.map { |id| @store[id]  }
    end
  end
end
