﻿using System;
using System.Collections.Generic;

namespace RestApi.Entities;

public partial class Role
{
    public int RoleId { get; set; }

    public string? Name { get; set; }

    public bool? IsDeleted { get; set; }

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
