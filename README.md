The task is to implement a "text translation pipeline": a backend and a web interface for a system in which translators take tasks from a list and translate the text specified in the task details. Translated tasks are then reviewed by Quality Assurance employees and are either sent to the client or returned back to the translator.

There are 3 roles in this system:

* **Administrators** can create and modify users and tasks (specifying the original text and, optionally, the date by which the task must be sent to the client)
* **Translators** can take a task from the list of available tasks, provide a translation, then send it to quality control (with an optional comment), or return it back into "available" tasks
* **Quality Assurance (QA)**  can take a task from the list of "translated" tasks, return it back to the (same) translator with a comment (in this case, when the translator subsequently submits the task for quality control again, the system will automatically send it to the same QA employee), return it back into the list of "translated" tasks, or send the results to the client

It is necessary to prohibit translators and QA from taking on tasks via the UI if they already have at least one active task.

There can be numerous users with "translator" and "quality control" roles in the system; it is necessary to make sure 2 users won't take on the same task simultaneously, or change tasks that are taken on by another user or have been sent to the client - with the exception that the administrator can change anything at at any time.

A detailed log of every change of every task has to be maintained automatically.

Visual design is not a priority.

There is no need to implement delivering results to the client "for real" - it is enough to call a mock that represents a function which is supposed to send a message to the client or throw an exception.

The whole system should be brought up using a docker-compose file. The source code must be uploaded to github.com.

Bonus points:

* Test coverage
* Using JS to refresh available tasks without reloading the page
* REST API for adding tasks, and implementing client apps (as an alternative to the web UI described above) for translators and QA staff
* Admin web pages with statistics on translators and QA across arbitrary time periods: how long do people spend on tasks, how often translators get returns from QA, how many tasks were overdue (if the deadline for sending to the client was specified for the task) for the period
