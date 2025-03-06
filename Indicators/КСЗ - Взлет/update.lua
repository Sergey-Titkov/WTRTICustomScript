
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
   local value = "●🗙"
   local value = getVehicleData("crit_takeoff_flaps_spd")
   return value, true
end

------------------------------------------------------------------------------
-- arguments: in_value:   number
--            value_idx:  multi-value index (0 - based)
---
-- return: string
---
-- function value_str_proc(in_value, value_idx)
--   local str = string.format("%.2f", in_value)
--
--   return str
-- end
    