
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Возвращаем три значения
--- 0 - скрыть индикатор
--- 1 - закрылки стали на позицию
function value_proc(in_value, value_idx)
   local value = math.floor(getStateValue("flaps, %"))
   local tkff = math.floor(getVehicleData("takeoff_flaps_pos")*100 + 0.5)

   -- Закрылок нет выходим
   if cmbt == 0 then
     return 0, true
   end
   
   local result = 0
   if value == tkff then
       result = 1
    end
  return result, true	   
end
    