
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
  local result = 0
  local crit_gear_spd = getVehicleData("crit_gear_spd")
  local TAS = getStateValue("TAS, km/h")
  
  if crit_gear_spd > TAS then
    result = 1
  else	
    result = 2
  end 

  return result, true
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
    