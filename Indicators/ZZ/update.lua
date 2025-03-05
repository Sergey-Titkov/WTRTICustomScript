
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
    local res = setStateValue("new_key", 3.14)
    local new_key = 0
    local new_key_1 = 0
    
    if res then
        new_key = 1
    else
        new_key = 2
    end

    local res = setStateValue("new_key_1", 3)
    if res then
        new_key_1 = 10
    else
        new_key_1 = 20
    end

   return new_key+new_key_1, true
end
    