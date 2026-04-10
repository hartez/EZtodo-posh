using System.Management.Automation;

namespace EZtodo
{
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
    
}
