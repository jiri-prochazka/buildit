FactoryGirl.define do
	factory :job_one, class: Job do
	  name "Job 1"
	  description "MyText"
	  confirmed_at "2015-01-31 19:37:53"
	  progress 10
	  estimated_time 10
	  estimated_price 9
	  real_price 9.99
	  association :project, factory: :project_one, strategy: :build
	end

	factory :job_two, class: Job do
	  name "Job 2"
	  description "MyText"
	  progress 0
	  estimated_time 12
	  estimated_price 10
	  real_price 9.99
	  association :project, factory: :project_one, strategy: :build
	end

	factory :job_three, class: Job do
	  name "Job 3"
	  description "MyText"
	  progress 100
	  estimated_time 12
	  estimated_price 10
	  real_price 9.99
	  association :project, factory: :project_three, strategy: :build
	end
end