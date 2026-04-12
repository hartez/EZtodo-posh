using System;

namespace EZtodo
{
    public record NumberedTask(int Number, Task Task, Func<NumberedTask, string> Format)
    {
        public override string ToString()
        {
            return Format(this);
        }

        public char? Priority => Task.Priority;
        public bool IsPriority => Task.IsPriority;
        public bool Completed => Task.Completed;
    }
}