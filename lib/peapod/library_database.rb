require 'sequel'

module Peapod
  # An object providing a connection to the URY podcast library
  class LibraryDatabase
    [ #  CONSTANT     SCHEMA    TABLE
      %i(PODCAST      uryplayer podcast                ),
    ].each { |id, *db_name| const_set(id, Sequel.qualify(*db_name)) }

    # Constructs a new LibraryDatabase
    def initialize(db)
      @db = db
    end

    # Constructs a ScheduleDatabase from a local 'dbpasswd' file
    def self.from_dbpasswd
      dbpasswd = IO.read(ENV.fetch('DBPASSWD_LOC', 'dbpasswd')).chomp
      LibraryDatabase.new(Sequel.connect(dbpasswd))
    end

    # Toggles whether a podcast is suspended
    #
    # 'true' means a podcast is suspended; 'false' makes it available to the
    # general public.
    def set_suspended!(pod_id, is_suspended)
      query_podcast_with_id(pod_id).update(suspended: is_suspended)
    end

    # Asks whether a podcast is suspended
    def suspended?(pod_id)
      query_podcast_with_id(pod_id).get(:suspended)
    end

    # Creates a query selecting the podcast with the given ID
    def query_podcast_with_id(pod_id)
      @db[PODCAST].where(podcast_id: pod_id)
    end
  end
end
