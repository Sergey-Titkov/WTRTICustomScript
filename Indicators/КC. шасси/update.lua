
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
  local value = 0
  local crit_gear_spd = getVehicleData("crit_gear_spd")
  local gear = getStateValue("gear, %")
  local TAS = getStateValue("TAS, km/h")
  
  -- У некоторых самолетов критическая скорость ВЫПУСКА шасси большая, например 700
  -- А скорость когда шасси сломаются на земле, намного меньше, пока поставил 450
  if crit_gear_spd > 450 and gear > 0 then
    crit_gear_spd = 450
  end
  
  -- Если шасси выпущены то показываем процент от критической скорости
  if gear > 0 then
    value = 100*TAS/crit_gear_spd
  else
    value = crit_gear_spd
  end 
  
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
    