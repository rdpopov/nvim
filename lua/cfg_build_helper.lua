build_helper = require("utils/build_helper")

local data = {
    cmd = "Make",
    -- args =  { ["/home/godrosko/exercism/rust/short-fibonacci"] = "test -- --ignored" }, -- specific folders with commands as a table
    args =  {}, -- specific folders with commands as a table
    patterns =  { ["/exercism/rust/"] = "test -- --ignored" }, -- specific folders with commands as a table
}

build_helper.setup(data)

