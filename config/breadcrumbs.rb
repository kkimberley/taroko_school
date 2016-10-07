crumb :root do
  link "Home", root_path
end

crumb :paths do
  link "Paths", paths_path
end
crumb :path do |path|
  link path.title, path_path(path)
  parent :paths
end


crumb :course do |path, course|
  # byebug
  link "Course/#{course.title}", path_course_path(path,course)
  parent path
end

crumb :mission do |path, course, mission|
  link "Mission/#{mission.title}", path_course_mission_path(path,course,mission)
  parent :course ,path , course
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
