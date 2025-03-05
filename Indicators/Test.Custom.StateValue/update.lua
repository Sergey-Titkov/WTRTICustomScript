
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Value
-- Check how to send value to another indicator
-- I try to store value
function value_proc(in_value, value_idx)
    local value = in_value
    
    local ret = setStateValue("new_key", 3.14)
    
    return 12345, ret
--    local res = setStateValue("new_key", 3.14)
--    local new_key = 0
--    local new_key_1 = 0
--   
--    if res then
--        new_key = 1 -- success
--    else
--        new_key = 2 -- nope
--    end
--
--    local res = setStateValue("new_key_1", 3)
--    if res then
--        new_key_1 = 10
--    else
--        new_key_1 = 20
--    end

--   return new_key+new_key_1, true
end
    