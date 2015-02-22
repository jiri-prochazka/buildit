require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    delete_factories
  end

  test "create project" do
    assert_difference "Project.count" do
    	Project.create(name: "Lorem Ipsum project", estimated_finish: "2015-06-30 00:00:00", completed_at: nil, 
    		archived: false, concept: create(:concept_four), customer_id: create(:customer1).id, employee_id: create(:employee1).id)

    end
  end

  test "check validations" do
    c1 = create(:concept_one)
    c4 = create(:concept_four)
    c1.project = create(:project_one)
  	assert_difference "Project.count" do
	  	a = Project.new
	  	a.concept = c1
	  	assert !a.valid?
	  	assert a.errors.messages.include?(:name)
	  	assert a.errors.messages.include?(:concept_id)
	  	a.name = "Test project"
	  	a.concept = c4
	  	assert a.valid?
	  	assert a.save
	  	assert_equal c4.user.id, a.customer.id
	  end
  end

  test "check project progress" do
  	p = create(:project_one)
    p.jobs = [create(:job_one), create(:job_two)]
  	assert_equal 19, p.estimated_price
  	assert_equal 22, p.estimated_time
  	assert_equal 5, p.progress
  	assert !p.completed?
  end

  test "set completed" do
    p = create(:project_one)
    p.jobs = [create(:job_one)]
    p.save
    assert p.completed_at.nil?
    job = p.jobs.first
    job.progress = 100
    job.save
    p.save
    assert_not_nil p.completed_at
  end


end
