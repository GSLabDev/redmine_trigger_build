require 'redmine'

Redmine::Plugin.register :redmine_trigger_build do
  name 'Redmine Trigger Build'
  author 'Amol Pujari'
  description 'Executes trigger scripts, and helps create build reports'
  version '0.0.1'
  url 'https://github.com/gs-lab/redmine_trigger_build'
  author_url 'http://in.linkedin.com/in/amolnpujari'

  project_module :builds do
    permission :view_builds,    :builds => :index
    permission :trigger_builds, :builds => :trigger
  end
 
  menu :project_menu, :builds,
    { :controller => 'builds', :action => 'index' },
    :caption => :builds,
    :after => :activity,
    :param => :project_id
end

module TriggerBuildProjectPatch
  def self.included(base)
    base.class_eval do
      unloadable
      has_many :builds
    end
  end
end

Project.send(:include, TriggerBuildProjectPatch)
