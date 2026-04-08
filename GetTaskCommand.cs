using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Get, "Task")]
    [OutputType(typeof(NumberedTask))]
    public class GetTaskCommand : PSCmdlet
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
            var list = new TaskList();
            list.LoadTasks(SourcePath);

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
}
