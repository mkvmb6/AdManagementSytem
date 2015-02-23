using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdManagementEntity
{
    class Transaction
    {
        public int TransactionId { get; set; }
        public int CampaignId { get; set; }
        public string EmailId { get; set; }
        public DateTime TransactionDate { get; set; }
        public float Amount { get; set; }
        public string Status { get; set; }
        public float Fee { get; set; }
        public float Tax { get; set; }
        public string Method { get; set; }
        public string Invoice { get; set; }

    }
}
