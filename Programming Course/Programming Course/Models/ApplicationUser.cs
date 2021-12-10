﻿using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public class ApplicationUser : IdentityUser
    {
        public List<Bill> bill { get; set; }
    }
}
