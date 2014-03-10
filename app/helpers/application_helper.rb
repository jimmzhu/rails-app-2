module ApplicationHelper
    # Returns the full title on a per-page basis.
    def full_title(page_title = nil)
        base_title = 'Super Duper Rails Sample App'
        if page_title.empty?
            base_title
        else
            "#{base_title} | #{page_title}"
        end
    end
end
