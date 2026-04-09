using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Get, "Task")]
    [OutputType(typeof(NumberedTask))]
    public class GetTask : PSCmdlet
    {
        [Parameter(
            Mandatory = true,
            Position = 0)]
        public string SourcePath { get; set; }

        [Parameter(
            Mandatory = false,
            Position = 1)]
        public string SearchTerm { get; set; }

        // This method gets called once for each cmdlet in the pipeline when the pipeline starts executing
        protected override void BeginProcessing()
        {

        }

        // This method will be called for each input received from the pipeline to this cmdlet; if no input is received, this method is not called
        protected override void ProcessRecord()
        {
            var list = new TaskList(SourcePath);
            
            var filteredList = string.IsNullOrEmpty(SearchTerm)
                ? list
                : list.Search(SearchTerm);

            foreach (var numberedTask in filteredList)
            {
                WriteObject(numberedTask);
            }
        }

        // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {

        }
    }

    [Cmdlet(VerbsCommon.Get, "PriorityTask")]
    [OutputType(typeof(NumberedTask))]
    public class GetPriorityTaskCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string SourcePath { get; set; }

        [ValidateRange('A', 'Z')]   
        [Parameter(Mandatory = false, Position = 1)]
        public char? Priority { get; set; } = null;
    
        protected override void ProcessRecord()
        {
            var list = new TaskList(SourcePath);
            
            foreach (var numberedTask in list.GetPriority(Priority))
            {
                WriteObject(numberedTask);
            }
        }
    }

    [Cmdlet(VerbsCommon.Get, "Project")]
    [OutputType(typeof(string))]
    public class GetProject : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string SourcePath { get; set; }
    
        protected override void ProcessRecord()
        {
            var list = new TaskList(SourcePath);
            
            foreach (var project in list.GetProjects())
            {
                WriteObject(project);
            }
        }
    }

    [Cmdlet(VerbsCommon.Get, "Context")]
    [OutputType(typeof(string))]
    public class GetContext : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string SourcePath { get; set; }
    
        protected override void ProcessRecord()
        {
            var list = new TaskList(SourcePath);
            
            foreach (var context in list.GetContexts())
            {
                WriteObject(context);
            }
        }
    }

    [Cmdlet(VerbsCommon.Add, "Task")]
    public class AddTask : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string SourcePath { get; set; }

        [Parameter(Mandatory = true, Position = 1, ValueFromPipeline = true)]
        public string Task { get; set; }

        [Parameter()]
        public SwitchParameter EnsureCreatedDate
        {
            get; set;
        }

        private TaskList _list;

        protected override void BeginProcessing()
        {
            _list = new TaskList(SourcePath);
        }
    
        protected override void ProcessRecord()
        {
            var newTask = _list.Create(Task, EnsureCreatedDate);

            WriteVerbose(newTask.Task.ToString());
            WriteVerbose($"{newTask.Number} added.");
        }

        protected override void EndProcessing()
        {
            _list.Save(SourcePath);
        }
    }


    [Cmdlet(VerbsCommon.Remove, "Task", SupportsShouldProcess = true)]
    public class RemoveTask : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string SourcePath { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public int Number { get; set; }

        [Parameter()]
        public SwitchParameter PreserveLineNumbers
        {
            get; set;
        }

        private TaskList _list;

        protected override void BeginProcessing()
        {
            _list = new TaskList(SourcePath);
        }

        protected override void ProcessRecord()
        {
            var oldTask = _list.GetTask(Number);

            if (ShouldProcess(verboseDescription: $"Deleting task '{oldTask.Body}'",
                verboseWarning: $"Delete task '{oldTask.Body}'?", 
                caption: "Delete Task", out ShouldProcessReason reason))
            {

                _list.RemoveTask(Number, PreserveLineNumbers);

                WriteVerbose($"{Number} {oldTask}");
                WriteVerbose($"{Number} deleted.");
            }
            else
            {
                WriteVerbose($"No tasks were deleted.");
            }
        }

        protected override void EndProcessing()
        {
            _list.Save(SourcePath);
        }
    }

    public enum EditAction
    {
        Append,
        Prepend,
        Replace
    }

    [Cmdlet(VerbsData.Edit, "Task")]
    public class EditTask : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "Append")]
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "Prepend")]
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "Replace")]
        public string SourcePath { get; set; }

        [Parameter(Mandatory = true, Position = 1, ParameterSetName = "Append")]
        [Parameter(Mandatory = true, Position = 1, ParameterSetName = "Prepend")]
        [Parameter(Mandatory = true, Position = 1, ParameterSetName = "Replace")]
        public int Number { get; set; }

        [Parameter(Position = 2, Mandatory = true, ParameterSetName = "Append")]
        public string Append {get; set;}

        [Parameter(Position = 2, Mandatory = true, ParameterSetName = "Prepend")]
        public string Prepend {get; set;}

        [Parameter(Position = 2, Mandatory = true, ParameterSetName = "Replace")]
        public string Replace {get; set;}

        [Parameter(Position = 3, Mandatory = true, ParameterSetName = "Replace")]
        public string ReplaceWith {get; set;}

        protected override void ProcessRecord()
        {
            var list = new TaskList(SourcePath);

            if (!string.IsNullOrEmpty(Append))
            {
                list.AppendToTask(Number, Append);
            }
            
            if (!string.IsNullOrEmpty(Prepend))
            {
                list.PrependToTask(Number, Prepend);
            }

            if (!string.IsNullOrEmpty(Replace) && !string.IsNullOrEmpty(ReplaceWith))
            {
                list.ReplaceInTask(Number, Replace, ReplaceWith);
            }

            list.Save(SourcePath);
            
            var newTask = list.GetTask(Number);
            WriteVerbose($"{Number} {newTask}");
        }
    }
}
