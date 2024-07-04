
------------------------------------------------------------------------------
--- Init
function init_proc()

end

------------------------------------------------------------------------------
--- Value
function value_proc(in_value, value_idx)
   local value = in_value
   local useful_alt = getStateValue("radio_altitude, m")
   local useful_alt_string = ""
   if useful_alt==nill then
     useful_alt = getStateValue("altitude, m")
	 useful_alt_string = ">"..math.modf(useful_alt)
   else		
     useful_alt_string = math.modf(useful_alt)
   end
   return useful_alt_string, true
end
    