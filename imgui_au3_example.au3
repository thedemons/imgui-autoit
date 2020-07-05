
#include <WinAPI.au3>
#include "imgui.au3"



$hwnd = _ImGui_GUICreate("AutoIt ImGui", 1024, 768)
_WinAPI_ShowWindow($hwnd)

Local $i_list_view = 0
Local $i_radio_theme = 0
Local $label_radio_theme[] = ["Light", "Dark", "Classic"]
Local $username = ""
Local $password = ""
Local $str_status = ""

Local $b_show_demo_window = False

_ImGui_StyleColorsLight()

While 1
	if Not _ImGui_PeekMsg() Then Exit
	_ImGui_BeginFrame()
	
	_ImGui_SetNextWindowSizeConstraints(300, 180, 600, 360)

	_ImGui_Begin("Demo ImGui-AutoIt")
	_ImGui_Text("Chọn theme")
	_ImGui_SameLine();
	
	Local $old_theme = $i_radio_theme
	_ImGui_RadioButton("Light", $i_radio_theme, 0)
	_ImGui_SameLine();
	_ImGui_RadioButton("Dark", $i_radio_theme, 1)
	_ImGui_SameLine();
	_ImGui_RadioButton("Classic", $i_radio_theme, 2)
	_ImGui_SameLine();

	if _ImGui_BeginCombo("##combo_theme", $label_radio_theme[$i_radio_theme]) Then
		for $i = 0 To UBound($label_radio_theme) - 1
			if _ImGui_Selectable($label_radio_theme[$i], $i_radio_theme == $i) Then
				$i_radio_theme = $i
				_ImGui_SetItemDefaultFocus()
			EndIf
		Next
		
		_ImGui_EndCombo()
	EndIf

	If $old_theme <> $i_radio_theme Then
		Switch $i_radio_theme
			Case 0
				_ImGui_StyleColorsLight()
			Case 1
				_ImGui_StyleColorsDark()
			Case 2
				_ImGui_StyleColorsClassic()
		EndSwitch
	EndIf


	Local $winSize = _ImGui_GetWindowSize()
	_ImGui_Separator()
	
	_ImGui_NewLine()
	_ImGui_CheckBox("Show demo window", $b_show_demo_window)

	_ImGui_Columns(2)
	_ImGui_SetColumnWidth(0, $winSize[0]*0.7)
	_ImGui_NewLine()
	_ImGui_InputTextWithHint("username", "username", $username, $ImGuiInputTextFlags_CharsNoBlank)
	_ImGui_InputTextWithHint("password", "password", $password, $ImGuiInputTextFlags_Password)
	_ImGui_NextColumn()
	_ImGui_NewLine()
	if _ImGui_Button("LOGIN", -1, 40) Then $str_status = "Login success"
		

	_ImGui_Columns(1)
	_ImGui_NewLine()
	_ImGui_BeginChild("##child_list_view1", $winSize*0.6, $winSize[1] *0.3, true, $ImGuiWindowFlags_ChildWindow)
	for $i = 0 To 10
		if _ImGui_Selectable("Selectable - " & $i, $i = $i_list_view) Then
			$i_list_view = $i
		EndIf
	Next
	_ImGui_EndChild()

	If $b_show_demo_window Then DllCall($IMGUI_DLL, "none:cdecl", "ShowDemoWindow")

	_ImGui_End()
	_ImGui_EndFrame()

WEnd