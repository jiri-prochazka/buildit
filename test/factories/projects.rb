FactoryGirl.define do
	factory :project_one, class: Project do
	  name "Lorem Ipsum project"
	  estimated_finish "2015-06-30 00:00:00"
	  archived false
	  created_at "2015-02-17 17:31:09"
	  updated_at "2015-02-17 17:31:09"
	  association :concept, factory: :concept_one, strategy: :build
	  association :customer, factory: :customer1, strategy: :build
	  association :employee, factory: :employee1, strategy: :build
	end

	factory :project_two, class: Project do
	  name "Lorem Ipsum project 2"
	  estimated_finish "2015-06-30 00:00:00"
	  archived true
	  created_at "2015-02-17 17:31:09"
	  updated_at "2015-02-17 17:31:09"
	  association :concept, factory: :concept_two, strategy: :build
	  association :customer, factory: :customer2, strategy: :build
	  association :employee, factory: :employee1, strategy: :build
	end

	factory :project_three, class: Project do
	  name "Lorem Ipsum project 3"
	  estimated_finish "2015-06-30 00:00:00"
	  archived false
	  created_at "2015-02-17 17:31:09"
	  updated_at "2015-02-17 17:31:09"
	  completed_at "2015-02-17 17:31:09"
	  association :concept, factory: :concept_three, strategy: :build
	  association :customer, factory: :customer2, strategy: :build
	  association :employee, factory: :employee1, strategy: :build
	end
end