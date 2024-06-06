
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Value
--- Возвращаем три значения
--- 0 - скрыть индикатор
--- 1 - закрылки стали на позицию
function value_proc(in_value, value_idx)
   local value = math.floor(getStateValue("flaps, %"))
   local result = 0
   if value == 100 then
       result = 1
    end
  return result, true	   
end
    