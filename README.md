# imgui-autoit

### Introduction
- ImGui is an open source library that make fancy User Interfaces running on DirectX or OpenGL, you can check it [here](https://github.com/ocornut/imgui)
- The hardest part I thought when I started writing this is: How am I gonna make it FAST? Because AutoIt is... you know, slow.
- When i finally put the code to work, suprisingly, i got it runs at max fps, you can create thousands of items and it's still fine.
- So I decided to convert the whole ImGui library to AutoIt, function by function.

### Requirements
- This library requires you to have [DirectX](https://www.microsoft.com/en-us/download/confirmation.aspx?id=35) installed.

### Features
- Has more than +270 functions converted from ImGui (compiled dll).
- Has 90% of the capability of what you can do in C++.
- Usable ImGuiIO and ImGuiStyle as a struct.

### Preview

<img src="https://i.imgur.com/u1XKVkY.png" width="505">

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

### Donation
This project is under development, it still has a lot of features being developed, it's a very big help of your donation to keep the project running, please contact me anytime you feel like it!<br/>
Discord: [thedemons#8671](https://discord.com/users/269920976236576769)
