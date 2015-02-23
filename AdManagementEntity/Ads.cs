using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdManagementEntity
{
    class Ads
    {
        public int AdId { get; set; }
        public string Language { get; set; }
        public string BannerSize { get; set; }
        public string ImageUrl { get; set; }
        public int CategoryId { get; set; }
        public int Clicks { get; set; }
        public string ClickUrl { get; set; }

    }
}
