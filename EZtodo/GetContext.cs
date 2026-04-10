using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Get, "Context")]
    [OutputType(typeof(string))]
    public class GetContext : ReadTaskListCmdLet
    {
        protected override void ProcessRecord()
        {
            foreach (var context in TaskList.GetContexts())
            {
                WriteObject(context);
            }
        }
    }
    
}
