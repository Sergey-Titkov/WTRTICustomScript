
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
    -- Тут мы всегда получаем пустое значение
    local value = getStateValue("x_id_art_joy_sec")

    if value == nil then
        setStateValue("x_id_art_joy_sec", "Пусто")
    else
       -- setStateValue("x_id_art_joy_sec", "Записали")
    end    
    
    -- Тут внезапно получили значение
    value = getStateValue("x_id_art_joy_sec")
    
return ">"..value.."<", true

end