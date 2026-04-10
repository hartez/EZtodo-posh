using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Get, "Project")]
    [OutputType(typeof(string))]
    public class GetProject : ReadTaskListCmdLet
    {
        protected override void ProcessRecord()
        {
            foreach (var project in TaskList.GetProjects())
            {
                WriteObject(project);
            }
        }
    }
    
}
