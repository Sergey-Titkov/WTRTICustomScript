
------------------------------------------------------------------------------
--- Init
function init_proc()
  counter = 0
  delay   = 0
end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
    local number_delay = 2
    
    local up_value_joy = 1
    local up_value_joy_button = 12 
   
    local down_value_joy = 1
    local down_value_joy_button = 13 

    if counter == nil then
        counter = 0
    end

    if delay == nil then
        delay = 0
    end

    if delay <= 0 then
        delay = 0
        if getJoystickButton(up_value_joy, up_value_joy_button) then
            counter = counter + 1
            delay = number_delay
        end

        if getJoystickButton(down_value_joy, down_value_joy_button) then
            counter = counter - 1
            delay = number_delay
        end
    else  
        delay = delay - 1
    end    

   return ">"..counter.."<", true
end
    