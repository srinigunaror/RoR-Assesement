json.set! :task do 
  json.(@task, *Task.column_names)
end