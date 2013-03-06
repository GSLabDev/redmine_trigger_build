class Build < ActiveRecord::Base
  unloadable
  belongs_to :build_type

  def project
    build_type.project
  end
end
