using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuizDAL
{
    public class QuizLog
    {
        public int LogId { get; set; }
        public QuizDetail Quiz { get; set; }
        public QuestionDetail Question { get; set; }
        public OptionDetail QuestionOption { get; set; }
        public bool IsCorrect { get; set; }
    }
}
