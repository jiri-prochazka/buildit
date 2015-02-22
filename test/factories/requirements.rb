FactoryGirl.define do
	factory :req_one, class: Requirement do
	  content "text text 1"
	  association :project, factory: :project_one, strategy: :build
	end

	factory :req_two, class: Requirement do
	  content "MyText"
	  association :project, factory: :project_two, strategy: :build
	end
end