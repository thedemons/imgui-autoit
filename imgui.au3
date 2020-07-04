

Global $IMGUI_DLL = DllOpen("imgui.dll")
If $IMGUI_DLL = -1 Then
	MsgBox(16, "Error", "Cannot load imgui.dll")
	Exit
EndIf


Func _ImGui_GUICreate($title, $w, $h, $x = -1, $y = -1)

	Local $result = DllCall($IMGUI_DLL, "hwnd:cdecl", "GUICreate", "wstr", $title, "int", $w, "int", $h, "int", $x, "int", $y)
	If @error Then Return False

	Return $result[0]
EndFunc

Func _ImGui_PeekMsg()
	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "PeekMsg")
	If @error Then Return False
	Return $result[0]
EndFunc

Func _ImGui_Begin($title, $close_btn = False, $flags = 0)
	Local $close_ptr = 0
	If $close_btn Then
		Local $b_close = DllStructCreate("bool value;")
		$b_close.value = True
		$close_ptr = DllStructGetPtr($b_close)
	EndIf

	Local $result = DllCall($IMGUI_DLL, "none:cdecl", "Begin", "wstr", $title, "ptr", $close_ptr, "int", $flags)
	If @error Then Return False

	If $close_btn = False Then Return True
	Return $b_close.value
EndFunc
Func _ImGui_End()
	DllCall($IMGUI_DLL, "none:cdecl", "End")
EndFunc

Func _ImGui_Button($text, $w = 0, $h = 0)
	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "Button", "wstr", $text, "float", $w, "float", $h)
	If @error Then Return False
	Return $result[0]
EndFunc

Func _ImGui_Text($text)
	DllCall($IMGUI_DLL, "none:cdecl", "Text", "wstr", $text)
EndFunc

Func _ImGui_SliderFloat($text, ByRef $value, $v_min, $v_max, $format = "%.3f", $power = 1)

	Local $struct = DllStructCreate("float value;")
	$struct.value = $value
	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "SliderFloat", "wstr", $text, "ptr", DllStructGetPtr($struct), "float", $v_min, "float", $v_max, "str", $format, "float", $power)
	If @error Then Return False
	$value = $struct.value
	Return $result[0]
EndFunc

Func _ImGui_CheckBox($text, ByRef $active)
	Local $b_active = DllStructCreate("bool value;")
	$b_active.value = $active

	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "Checkbox", "wstr", $text, "ptr", DllStructGetPtr($b_active))
	If @error Then Return False
	$active = $b_active.value
	Return $result[0]
EndFunc

Func _ImGui_SameLine($offset_from_start_x = 0, $spacing = -1)
	DllCall($IMGUI_DLL, "none:cdecl", "SameLine", "float", $offset_from_start_x, "float", $spacing)
EndFunc

Func _ImGui_BeginFrame()
	DllCall($IMGUI_DLL, "none:cdecl", "BeginFrame")
	DllCall($IMGUI_DLL, "none:cdecl", "DrawTest")
EndFunc
Func _ImGui_EndFrame()
	DllCall($IMGUI_DLL, "none:cdecl", "EndFrame")
EndFunc
