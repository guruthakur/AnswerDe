using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuizDAL
{
    public class QuizDetail
    {
        public int QuizId { get; set; }
        public UserDetails QuizUserId { get; set; }
        public DateTime  QuizStartDateTime { get; set; }
        public DateTime QuizEndDateTime { get; set; }
        public Category QuizCategory { get; set; }
        public int QuizMarks { get; set; }
    }
}
