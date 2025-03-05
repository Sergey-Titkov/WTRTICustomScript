
------------------------------------------------------------------------------
--- Init
function init_proc()
  timer_value = 0
  last_tick_value = 0
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
   local start_timer_joy = 1
   -- Номер кнопки на джойстике на котором нажимается кнопка для установки поправки
   local start_timer_joy_button = 12 
   
   -- Устанавливаем базовый уровень
   local start_timer_key      = "PageUp"

   if use_joystick == 1 then

      if getJoystickButton(start_timer_joy, start_timer_joy_button) then
       -- Устанавливаем текущую высоту как поправку
       timer_value = 900
       last_tick_value = getTime()
     end

   else
     if keyIsDown(start_timer_key) then
       -- Устанавливаем таймен на 15 минут
       timer_value = 900
       last_tick_value = getTime()
     end

   end
   
    if timer_value > 0 then
        local current_tick = getTime()
        local delta = current_tick - last_tick_value
        last_tick_value = current_tick
        timer_value = timer_value - delta
        if timer_value < 0 then
            timer_value = 0
        end
    end 
    
    local minutes = math.modf(timer_value/60)
    local seconds = math.modf(timer_value) - minutes*60

   return string.format("%02d",minutes)..":"..string.format("%02d",seconds), true
end
    