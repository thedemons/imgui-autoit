# imgui-autoit

### Info
- ImGui is an open source library that make fancy User Interfaces, it's based on DirectX drawing. You can check it [here](https://github.com/ocornut/imgui)
- It render frame by frame, of course, this is an advantage, it's more flexible to use.
- The hardest part I thought when I started writing this is: How am I gonna make it FAST?
- When i finally put the code to work, suprisingly, it runs at max fps, you can create a thousands of items and it's still fine.

### Feature
- This UDF has more than +260 functions converted from ImGui (compiled dll).
- Most of the rest that haven't been converted are because of AutoIt's limitation.

### Preview

<img src="https://i.imgur.com/gc6xjWf.png" width="48">

### Usage
```autoit
#include <WinAPI.au3>
#include "ImGui.au3"

; Create a window
Local $hwnd = _ImGui_GUICreate("AutoIt ImGui", 1024, 768)
_WinAPI_ShowWindow($hwnd)

; Set style color
_ImGui_StyleColorsLight()
;~ _ImGui_StyleColorsDark()

Local $f_value = 5
While 1

	; when the user click close button on the window, this will return false
	if Not _ImGui_PeekMsg() Then Exit

	; must call
	_ImGui_BeginFrame()

  _ImGui_Begin("Another window")
  
  _ImGui_Text("Hello there..")
  
  If _ImGui_Button("click me") Then $f_value = 5
  
  _ImGui_SliderFloat("slider", $f_value, 2, 20)
  If _ImGui_IsItemHovered() Then _ImGui_ToolTip("what r u doing?")
  
	_ImGui_End()
  
	; must call
	_ImGui_EndFrame()
Wend

```
