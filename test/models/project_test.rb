require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "create project" do
    assert_difference "Project.count" do
    	Project.create(name: "Lorem Ipsum project", estimated_finish: "2015-06-30 00:00:00", completed_at: nil, 
    		archived: false, concept: concepts(:four), customer_id: users(:customer1).id, employee_id: users(:employee1).id)

    end
  end

  test "check validations" do
  	assert_difference "Project.count" do
	  	a = Project.new
	  	a.concept = concepts(:one)
	  	assert !a.valid?
	  	assert a.errors.messages.include?(:name)
	  	assert a.errors.messages.include?(:concept_id)
	  	a.name = "Test project"
	  	a.concept = concepts(:four)
	  	assert a.valid?
	  	assert a.save
	  	assert_equal concepts(:four).user.id, a.customer.id
	  end
  end

  test "check project progress" do
  	p = projects(:one)
  	assert_equal 19.99, p.estimated_price
  	assert_equal 22, p.estimated_time
  	assert_equal 5, p.progress
  	assert !p.completed?
  end


end
