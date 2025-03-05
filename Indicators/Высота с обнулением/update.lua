
------------------------------------------------------------------------------
--- Init
function init_proc()
  base_level = 0
end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
   
   -- Набор переменных для  упрвления
   -- Использовать джойстик 0,1
   local use_joystick  = 0
   
   -- Да, да по именам будет правильно, но что имеем то имеем
   -- Номерация идет с НУЛЯ!
   -- У меня настроено по умолчанию на РУД и его кнопки 3 и 4
   -- Номер джойстика на котором нажимается кнопка для установки поправки
   local set_base_level_joy = 1
   -- Номер кнопки на джойстике на котором нажимается кнопка для установки поправки
   local set_base_level_joy_button = 12 
   
   -- Номер джойстика на котором нажимается кнопка для сброса поправки
   local set_zero_base_level_joy = 1
   -- Номер кнопки на джойстике на котором нажимается кнопка для сброса поправки
   local set_zero_base_level_joy_button = 13
   
   -- Устанавливаем базовый уровень
   local set_base_level_key      = "PageUp"
   -- Сбрасываем базовый уровень на ноль
   local set_zero_base_level_key = "PageDown"
   
   --  Получаем высоту
   local value      = getStateValue("altitude, m")
   
   -- Проверям поправку на высоту местности.
   -- Если переменная не определена, явно присваиваем 0
   if base_level == nil then
     base_level = 0
   end 
    
   -- Вычисляем выстоту, из барометрической вычитаем нашу поправку    
   local result = value - base_level
   if use_joystick == 1 then

     if getJoystickButton(set_base_level_joy, set_base_level_joy_button) then
       -- Устанавливаем текущую высоту как поправку
       base_level = value
     end

     if getJoystickButton(set_zero_base_level_joy, set_zero_base_level_joy_button) then
       -- Сбрасываем поправку высоты на 0
       base_level = 0
     end

   else
     if keyIsDown(set_base_level_key) then
       -- Устанавливаем текущую высоту как поправку
       base_level = value
     end

     if keyIsDown(set_zero_base_level_key) then
       -- Сбрасываем поправку высоты на 0
       base_level = 0
     end
   end
   return result, true
end
    