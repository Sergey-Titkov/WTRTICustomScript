
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Возвращает позиционно номерное представление того, где находятся закрылки :)
--- Если закрылки не выпущенны 0
--- 0<--->Б 12
---   БОЙ    2
--- Б<--->В 23 
---  ВЗЛЁТ   3
--- В<--->П 34 
--- ПОСАДКА  4
--- 
--- 0<--->В 13 
---  ВЗЛЁТ   3
--- В<--->П 23 
--- ПОСАДКА  4
--- 
--- 0<--->Б 12 
---   БОЙ    2
--- Б<--->П 24 
--- ПОСАДКА  4
function value_proc(in_value, value_idx)
  local value = math.floor(getStateValue("flaps, %"))
  local cmbt = math.floor(getVehicleData("combat_flaps_pos")*100)
  local tkff = math.floor(getVehicleData("takeoff_flaps_pos")*100)
  
    local exact_value = {}
    local range_value = {}
    local prev_value = 1
    local prev_marker = 10
    if cmbt ~= 0 then
        table.insert(exact_value,{cmbt,2})
        table.insert(range_value,{prev_value, cmbt ,prev_marker+2})
        prev_value = cmbt+1
        prev_marker = 20
    end
    
    if tkff ~= 0 then
        table.insert(exact_value,{tkff,3})
        table.insert(range_value,{prev_value, tkff ,prev_marker+3})
        prev_value = tkff+1
        prev_marker = 30
    end
    
    table.insert(exact_value,{100,4})
    table.insert(range_value,{prev_value, 100 ,prev_marker+4})
    
    -- Проверям что попали вот точно в точку
    for ind, row in ipairs(exact_value) do
        if row[1] == value then
            return row[2], true
        end
    end
    
    -- Проверям что попали в диапазон
    for ind, row in ipairs(range_value) do
        if row[1]<= value and value < row[2] then
            return row[3], true
        end
    end
return 0, true
end
    