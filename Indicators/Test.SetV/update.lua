
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
   -- А вот тут получаем уже правильное значение
   local value = getStateValue("x_id_art_joy_sec")
   
   -- Попытка установить его ни к чему не приводит
   setStateValue("x_id_art_joy_sec", "Значение")
    if keyIsDown("PageUp") then
        setStateValue("x_id_art_joy_sec", "Кнопку нажалаи")
        setStateValue("x_id_art_joy_sec_1", 7)
        setStateValue("x_id_art_joy_sec_1", 4)
        setStateValue("x_id_art_joy_sec_1", 5)
        
    else    
        setStateValue("x_id_art_joy_sec_1", 3)
    end
   
   return value, true
end
    