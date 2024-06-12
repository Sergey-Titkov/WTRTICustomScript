
------------------------------------------------------------------------------
--- Init
function init_proc()
  -- setStateValue("weapon74", 0)
  global_var = 0
end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
   -- setStateValue("weapon74", 3.14)
   
   -- local zbz = setStateValue("weapon74", 3.14)
   
   local value      = getStateValue("altitude, m")
   --local base_level = getStateValue("weapon74")
   --if base_level == nil then
     --base_level = -100
   --end 
   
   if global_var == nil then
     global_var = 0
   end 
   
   
   -- local result = value + base_level
   local result = value - global_var
   --result = global_var
   
   if keyIsDown("PageUp") then
     --result = 5000
     --local zbz = setStateValue("weapon74", 14)
     --if zbz then 
       -- result = 4000
     --else
       -- result = 3000
     --end
     global_var = value
   end

   if keyIsDown("PageDown") then
     global_var = 0
   end

   return result, true
end
    