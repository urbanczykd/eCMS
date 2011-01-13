module ApplicationHelper
  
    def tab_link(name, path)
          content_tag :div, :class => (/^#{path}/ =~ "/#{controller_path}" ? "selected" : nil) do
          link_to name, path, :class => "current"
        end
    end
  
end
