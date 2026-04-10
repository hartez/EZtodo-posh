using System.Management.Automation;

namespace EZtodo
{
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
