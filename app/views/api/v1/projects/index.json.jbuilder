json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description
  json.url api_project_url(project)
end
