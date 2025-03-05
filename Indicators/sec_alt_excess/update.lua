
------------------------------------------------------------------------------
--- Init
function init_proc()
  secure_level = 0
  delay2 = 0
  delay3 = 0
end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
   -- сколько запусков индикатора пропускать, один запуск по умолчанию раз 100 милисекунду
   local number_delay2 = 2
   local number_delay3 = 3
   
   -- Номерация идет с НУЛЯ!
   -- Номер джойстика и кнопки на джойстике на котором нажимается кнопка для установки и сброса безопасной высоты
   local set_secure_level_joy = 2
   local set_secure_level_joy_button = 26 
   
   -- Значение безопасного уровня по умолчанию
   local default_secure_level = 100
   -- Значение поправки
   local correction = 10
   
   -- Номер джойстика и кнопки на джойстике на котором нажимается кнопка для увеличения безопасной высоты
   local up_cor_level_joy = 2
   local up_cor_level_joy_button = 27
   
      -- Номер джойстика и кнопки на джойстике на котором нажимается кнопка для уменьшения безопасной высоты
   local down_cor_level_joy = 2
   local down_cor_level_joy_button = 25
   
   
  
   -- Проверям безопасную высоту.
   -- Если переменная не определена, явно присваиваем 0
   if secure_level == nil then
     secure_level = 0
   end 
   
   
   if delay2 == nil then
       delay2 = 0
   end
   if delay3 == nil then
       delay3 = 0
   end
   
   if delay2 <= 0 then
         delay2 = 0   
      -- Вычисляем выстоту, из барометрической вычитаем нашу поправку
      if getJoystickButton(up_cor_level_joy, up_cor_level_joy_button) then
        -- Увеличиваем высоту на correction
        secure_level = secure_level + correction
        delay2 = number_delay2
      end
      
      if getJoystickButton(down_cor_level_joy, down_cor_level_joy_button) then
        -- Уменьшаем высоту на correction
        secure_level = secure_level - correction
        delay2 = number_delay2
      end
   else  
      delay2 = delay2 - 1
   end  
   
   if delay3 <= 0 then
      delay3 = 0
      if getJoystickButton(set_secure_level_joy, set_secure_level_joy_button) then
	     if secure_level == 0 then
		    secure_level = default_secure_level
            delay3 = number_delay3
		 else
		    secure_level = 0
            delay3 = number_delay3
		 end
      end
   else  
      delay3 = delay3 - 1
   end
   
   --  Получаем высоту
   local value      = getStateValue("radio_altitude, m")
   local result = 0
    
   if (( secure_level ~= 0 ) and (value >= secure_level)) then
      result = 1
   end
   
   return result, true
end
    