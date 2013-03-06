class BuildType < ActiveRecord::Base
  unloadable
  has_many :builds
  belongs_to :project
end
