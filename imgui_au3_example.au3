
#include <WinAPI.au3>
#include "imgui.au3"


$hwnd = _ImGui_GUICreate("AutoIt ImGui", 1024, 768)
_WinAPI_ShowWindow($hwnd)
;~ MsgBox(0,"",$hwnd)

Local $b_show_window = True
Local $b_show_text = False
Local $b_show_demo_window = True
Local $b_show_another_window = True
Local $f_value = 10
Local $i_count = 0

While 1
	if Not _ImGui_PeekMsg() Then Exit
	_ImGui_BeginFrame()

	_ImGui_Begin("A Window")

	_ImGui_Text("Hỗ trợ Tiếng Việt")
	_ImGui_CheckBox("Show demo window", $b_show_demo_window)
	_ImGui_CheckBox("Show another window", $b_show_another_window)
;~ 	If $b_show_another_window Then Exit

	If _ImGui_Button("Click Me") Then $i_count += 1
	_ImGui_SameLine()
	_ImGui_Text("count: " & $i_count)


	_ImGui_SliderFloat("Slider", $f_value, 5, 30)
	_ImGui_End()

	If $b_show_another_window Then
		$b_show_another_window = _ImGui_Begin("Another Window", True)
		_ImGui_Text("Hello....")
		If _ImGui_Button("Close Me") Then $b_show_another_window = False
		_ImGui_End()
	EndIf

	If $b_show_demo_window Then DllCall($IMGUI_DLL, "none:cdecl", "ShowDemoWindow")

	_ImGui_EndFrame()

WEnd