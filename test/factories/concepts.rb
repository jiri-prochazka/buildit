FactoryGirl.define do
	factory :concept_one, class: Concept do
		name "Lorem ipsum"
		price 190.00
		start_at "2015-02-03 00:00:00"
		end_at "2015-02-17 00:00:00"
		description "Lorem ipsum dolor sit amet consectetur adipisicin..."
		archived false
		created_at "2015-02-15 16:54:30"
		updated_at "2015-02-16 19:13:57"
		association :user, factory: :customer2, strategy: :build
	end

	factory :concept_two, class: Concept do
		name "Lorem ipsum 2"
		price 700.00
		start_at "2015-02-03 00:00:00"
		end_at "2015-02-17 00:00:00"
		description "Lorem ipsum dolor sit amet consectetur adipisicin..."
		archived true
		created_at "2015-02-15 16:54:30"
		updated_at "2015-02-16 19:13:57"
		association :user, factory: :customer1, strategy: :build
	end

	factory :concept_three, class: Concept do
		name "Lorem ipsum 3"
		price 700.00
		start_at "2015-02-03 00:00:00"
		end_at "2015-02-17 00:00:00"
		description "Lorem ipsum dolor sit amet consectetur adipisicin..."
		archived true
		created_at "2015-02-15 16:54:30"
		updated_at "2015-02-16 19:13:57"
		association :user, factory: :employee1, strategy: :build
	end

	factory :concept_four, class: Concept do
		name "Lorem ipsum 4"
		price 700.00
		start_at "2015-02-03 00:00:00"
		end_at "2015-02-17 00:00:00"
		description "Lorem ipsum dolor sit amet consectetur adipisicin..."
		archived false
		created_at "2015-02-15 16:54:30"
		updated_at "2015-02-16 19:13:57"
		association :user, factory: :customer2, strategy: :build
	end

	factory :concept_five, class: Concept do
		name "Lorem ipsum 5"
		price 700.00
		start_at "2015-02-03 00:00:00"
		end_at "2015-02-17 00:00:00"
		description "Lorem ipsum dolor sit amet consectetur adipisicin..."
		archived true
		created_at "2015-02-15 16:54:30"
		updated_at "2015-02-16 19:13:57"
		association :user, factory: :admin, strategy: :build
	end

end