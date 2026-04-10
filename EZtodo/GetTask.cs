using System.Management.Automation;

namespace EZtodo     
{
    [Cmdlet(VerbsCommon.Get, "Task")]
    [OutputType(typeof(NumberedTask))]
    public class GetTask : ReadTaskListCmdLet
    { 
        [Parameter(Mandatory = false, Position = 1)]
        public string SearchTerm { get; set; }

        protected override void ProcessRecord()
        {
            var filteredList = string.IsNullOrEmpty(SearchTerm)
                ? TaskList
                : TaskList.Search(SearchTerm);

            foreach (var numberedTask in filteredList)
            {
                WriteObject(numberedTask);
            }
        }
    }
}
