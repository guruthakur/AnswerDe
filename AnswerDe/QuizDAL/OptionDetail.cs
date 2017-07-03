using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuizDAL
{
    public class OptionDetail
    {
        public int OptionId { get; set; }
        public QuestionDetail OptionQuestionId { get; set; }
        public string OptionValue { get; set; }
        public bool IsCorrect { get; set; }
    }
}
