using System.Management.Automation;

namespace EZtodo
{
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
    
}
