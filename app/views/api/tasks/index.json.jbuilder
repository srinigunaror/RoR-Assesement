json.set! :tasks do
  json.array! @tasks.each do |task|
  	json.(task, *Task.column_names)
  end
end