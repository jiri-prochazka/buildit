module ConceptsHelper
	def concept_badge(concept)
		if concept.has_project?
			'<span class="badge pull-right">ACTIVE</span>'.html_safe
		elsif concept.archived
			'<span class="badge pull-right">ARCHIVED</span>'.html_safe
		else
			'<span class="badge pull-right">NEW</span>'.html_safe
		end
	end

def link_to_new_or_existing(concept)
	if concept.has_project?
		link_to("Show Project", project_path(concept.project) , class: "btn btn-sm btn-info")
	else
		link_to("New Project", new_concept_project_path(concept) , class: "btn btn-sm btn-info")
	end
end

end
