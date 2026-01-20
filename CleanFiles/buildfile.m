function plan = buildfile

% import necessary classes from the Build Tool
import matlab.buildtool.tasks.CodeIssuesTask
import matlab.buildtool.tasks.TestTask
import matlab.buildtool.Task

% Create a plan using local functions
plan = buildplan(localfunctions);

% Add tasks to the build plan
plan("check") = CodeIssuesTask;
plan("test") = TestTask;

% Make the "archive" task the default task in the plan
plan.DefaultTasks = "archive";

% Add the dependencies to the "archive" task
plan("archive").Dependencies = ["check" "test"];
end

function archiveTask(~)
% Create a ZIP file with timestamp to ensure uniqueness
filename = "souce_" + ...
    string(datetime("now", Format = "yyyyMMdd'T'HHmmss"));
zip(filename, "*")
end