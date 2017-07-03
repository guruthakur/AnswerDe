using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuizDAL
{
    public class QuestionDetail
    {
        public int QuestionId { get; set; }
        public string Question { get; set; }
        public UserDetails QUserId { get; set; }
        public Category QCategory { get; set; }
        public string QuestionRef { get; set; }
        public DateTime QuestionCreated { get; set; }
        public bool IsActive { get; set; }
    }
}
