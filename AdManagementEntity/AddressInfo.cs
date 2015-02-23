using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdManagementEntity
{
    public class AddressInfo
    {
        public int AddressId { get; set; }
        public string EmailId { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string State { get; set; }
        public string CountryId { get; set; }
        public bool  MainAddress { get; set; }

    }
}
