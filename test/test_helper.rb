require 'simplecov'
SimpleCov.start 'rails'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'




class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all
  include FactoryGirl::Syntax::Methods

  def delete_factories
  	User.all.each {|u| u.destroy}
  	Attachment.all.each {|u| u.destroy}
  	Job.all.each {|u| u.destroy}
  	Concept.all.each {|u| u.destroy}
  	Project.all.each {|u| u.destroy}
  	Requirement.all.each {|u| u.destroy}
  	Address.all.each {|u| u.destroy}
  end

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
end
