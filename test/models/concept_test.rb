require 'test_helper'

class ConceptTest < ActiveSupport::TestCase
  setup do
    delete_factories
  end

  test "create concept" do
    assert_difference "Concept.count" do
    	Concept.create(name: "Lorem ipsum", price: 90000, start_at: "1.1.2015", end_at: "18.2.2015", description: "Lorem ipsum dolor sit amet, consectetur adipisicin...")
    end
  end

  test "check validations" do
  	assert_difference "Concept.count" do
	  	a = Concept.new
	  	assert !a.valid?
	  	assert a.errors.messages.include?(:name)
	  	assert a.errors.messages.include?(:description)
	  	a.name = "Garden"
	  	a.description = "long text text texxt"
	  	assert a.valid?
	  	assert a.save
	  end
  end

  test "has project" do
    p = create(:project_one)
  	a = create(:concept_one)
  	b = create(:concept_four)
    a.project = p
    p.save
  	assert a.has_project?
  	assert !b.has_project?
  end
end
