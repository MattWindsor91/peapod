require 'peapod/library'
require 'peapod/library_database'
require 'peapod/version'

module Peapod
  def self.library
    ld = LibraryDatabase.from_dbpasswd
    Library.new(ld)
  end
end
