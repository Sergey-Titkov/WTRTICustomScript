
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Возвращает тектовое представление того, где находятся закрылки :)
--- Если закрылки не выпущенны возвращает пробелы
--- Функция предназанчена для использования в качестве метки
--- 0<--->Б
---   БОЙ  
--- Б<--->В
---  ВЗЛЁТ
--- В<--->П
--- ПОСАДКА
--- 
--- 0<--->В
---  ВЗЛЁТ 
--- В<--->П
--- ПОСАДКА
--- 
--- 0<--->Б
---   БОЙ
--- Б<--->П
--- ПОСАДКА
function value_proc(in_value, value_idx)
  local value = math.floor(getStateValue("flaps, %"))
  local cmbt = math.floor(getVehicleData("combat_flaps_pos")*100)
  local tkff = math.floor(getVehicleData("takeoff_flaps_pos")*100)
  
    local exact_value = {}
    local range_value = {}
    local prev_value = 1
    local prev_marker = "0"
    if cmbt ~= 0 then
        table.insert(exact_value,{cmbt,"  БОЙ  "})
        table.insert(range_value,{prev_value, cmbt ,prev_marker.."<--->Б"})
        prev_value = cmbt+1
        prev_marker = "Б"
    end
    
    if tkff ~= 0 then
        table.insert(exact_value,{tkff," ВЗЛЁТ "})
        table.insert(range_value,{prev_value, tkff ,prev_marker.."<--->В"})
        prev_value = tkff+1
        prev_marker = "В"
    end
    
    table.insert(exact_value,{100,"ПОСАДКА"})
    table.insert(range_value,{prev_value, 100 ,prev_marker.."<--->П"})
    
    -- Проверям что попали вот точно в точку
    for ind, row in ipairs(exact_value) do
        if row[1] == value then
            return row[2], true
        end
    end
    
    -- Проверям что попали в диапазон
    for ind, row in ipairs(range_value) do
        if row[1]<= value and value < row[2] then
        -- Проверям что попали в диапазон
            for ind, row in ipairs(range_value) do
                if row[1]<= value and value < row[2] then
--                    local percent = 100*(value - row[1] )/((row[2] - row[1] ))
                    local result_str = row[3]
--                    if percent < 33 then
--                        result_str = row[3]:sub(utf8.offset(row[3],1),utf8.offset(row[3],2)).."|"..row[3]:sub(utf8.offset(row[3],4),utf8.offset(row[3],8))
--                    else 
--                        if percent < 66 then
--                            result_str = row[3]:sub(utf8.offset(row[3],1),utf8.offset(row[3],3)).."|"..row[3]:sub(utf8.offset(row[3],5),utf8.offset(row[3],8))
--                        else    
--                           result_str = row[3]:sub(utf8.offset(row[3],1),utf8.offset(row[3],4)).."|"..row[3]:sub(utf8.offset(row[3],6),utf8.offset(row[3],8))
--                        end    
--                    end
                    return result_str, true
                end
            end
        end
    end
return "          ", true
end
    