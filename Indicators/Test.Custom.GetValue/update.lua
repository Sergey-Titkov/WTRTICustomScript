
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Value
-- Check how to send value to another indicator
-- I try to get value from mu custom state value
function value_proc(in_value, value_idx)
   local res_1 = getStateValue("new_key")
   local res_2 = getStateValue("new_key_1")
   
   if res_1 == nil then
     res_1 = 0
   end
   
   if res_2 == nil then
     res_2 = 0
   end

   return res_1+res_2, true
end
    