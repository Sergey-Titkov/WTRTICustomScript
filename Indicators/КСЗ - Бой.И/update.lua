
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
  local crit_combat_flaps_spd = getVehicleData("crit_combat_flaps_spd")
  local IAS = getStateValue("IAS, km/h")
  local result = 0
  local gap = 150
  
  if crit_combat_flaps_spd - gap <= IAS and IAS <= crit_combat_flaps_spd then
    result = 1
  end 

  if IAS > crit_combat_flaps_spd then
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
    