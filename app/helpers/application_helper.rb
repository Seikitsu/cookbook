module ApplicationHelper
	def title(pageTitle)
		title = "MFF Cookbook"
		if pageTitle.empty?
			title
		else
			title + " | " + pageTitle
		end
	end
end
