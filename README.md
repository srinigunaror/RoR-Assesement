# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
	3.2.2

* Database initialization
	rake db:create
	rake db:migrate
	rake db:seed

* API
	1) GET ALL TASKS
	   GET http://localhost:3001/api/tasks

	2) CREATE TASK
		POST http://localhost:3001/api/tasks
		BODY 
			{
			    "task":{
			        "title": "Task Title",
			        "description": "Task Description",
			        "due_date": "2024-03-03",
			        "priority": "Low"
			    }
			}

	3) UPDATE TASK
		POST http://localhost:3001/api/tasks/11
		BODY 
			{
			    "task":{
			        "title": "Task Title",
			        "description": "Task Description",
			        "due_date": "2024-03-03",
			        "status": 2,
			        "priority": "High"
			    }
			}

	4) DELETE TASK
		DELETE http://localhost:3001/api/tasks/10

	5) ASSIGN TASK
		POST http://localhost:3001/api/tasks/11/assign
		BODY
			{
			    "task":{
			        "assigned_to_id": 1
			    }
			}

	6) GET USER ASSIGNED TASK
		GET http://localhost:3001/api/users/2/tasks


	7) SET TASK PROGRESS
		PUT http://localhost:3001/api/tasks/10/progress
		BODY
			{
			    "task":{
			        "progess_percentage": 44
			    }
			}

	8) GET OVERDUE TASKS
		GET http://localhost:3001/api/tasks/overdue

	9) GET TASK BY STATUS
		GET http://localhost:3001/api/tasks/status/started
		GET http://localhost:3001/api/tasks/status/completed

	10) COMPLETED TASK BY DATE RANGE
		GET http://localhost:3001/api/tasks/completed?start_date=2024-01-01&end_date=2024-03-31

	11) GET TASK STATISTICS
		GET http://localhost:3001/api/tasks/statistics