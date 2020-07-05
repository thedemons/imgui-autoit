
#include <WinAPI.au3>
#include <WinAPIDiag.au3>

Global $IMGUI_DLL = DllOpen("imgui.dll")
If $IMGUI_DLL = -1 Then
	MsgBox(16, "Error", "Cannot load imgui.dll")
	Exit
EndIf

Func _GetStructArrayValue($struct, $index, $index_array)
	Return DllStructGetData($struct, $index, $index_array + 1)
EndFunc
Func _SetStructArrayValue($struct, $index, $index_array, $value)
	Return DllStructSetData($struct, $index, $value, $index_array + 1)
EndFunc

Global Const $ImGuiWindowFlags_None                   =  0
Global Const $ImGuiWindowFlags_NoTitleBar             = BitShift(1, -0)
Global Const $ImGuiWindowFlags_NoResize               = BitShift(1, -1)
Global Const $ImGuiWindowFlags_NoMove                 = BitShift(1, -2)
Global Const $ImGuiWindowFlags_NoScrollbar            = BitShift(1, -3)
Global Const $ImGuiWindowFlags_NoScrollWithMouse      = BitShift(1, -4)
Global Const $ImGuiWindowFlags_NoCollapse             = BitShift(1, -5)
Global Const $ImGuiWindowFlags_AlwaysAutoResize       = BitShift(1, -6)
Global Const $ImGuiWindowFlags_NoBackground           = BitShift(1, -7)
Global Const $ImGuiWindowFlags_NoSavedSettings        = BitShift(1, -8)
Global Const $ImGuiWindowFlags_NoMouseInputs          = BitShift(1, -9)
Global Const $ImGuiWindowFlags_MenuBar                = BitShift(1, -10)
Global Const $ImGuiWindowFlags_HorizontalScrollbar    = BitShift(1, -11)
Global Const $ImGuiWindowFlags_NoFocusOnAppearing     = BitShift(1, -12)
Global Const $ImGuiWindowFlags_NoBringToFrontOnFocus  = BitShift(1, -13)
Global Const $ImGuiWindowFlags_AlwaysVerticalScrollbar= BitShift(1, -14)
Global Const $ImGuiWindowFlags_AlwaysHorizontalScrollbar= BitShift(1, -15)
Global Const $ImGuiWindowFlags_AlwaysUseWindowPadding = BitShift(1, -16)
Global Const $ImGuiWindowFlags_NoNavInputs            = BitShift(1, -18)
Global Const $ImGuiWindowFlags_NoNavFocus             = BitShift(1, -19)
Global Const $ImGuiWindowFlags_UnsavedDocument        = BitShift(1, -20)
Global Const $ImGuiWindowFlags_NoDocking              = BitShift(1, -21)
Global Const $ImGuiWindowFlags_NoNav                  = BitOr( $ImGuiWindowFlags_NoNavInputs, $ImGuiWindowFlags_NoNavFocus)
Global Const $ImGuiWindowFlags_NoDecoration           = BitOr( $ImGuiWindowFlags_NoTitleBar, $ImGuiWindowFlags_NoResize, $ImGuiWindowFlags_NoScrollbar, $ImGuiWindowFlags_NoCollapse)
Global Const $ImGuiWindowFlags_NoInputs               = BitOr( $ImGuiWindowFlags_NoMouseInputs, $ImGuiWindowFlags_NoNavInputs, $ImGuiWindowFlags_NoNavFocus)
Global Const $ImGuiWindowFlags_NavFlattened           = BitShift(1, -23)
Global Const $ImGuiWindowFlags_ChildWindow            = BitShift(1, -24)
Global Const $ImGuiWindowFlags_Tooltip                = BitShift(1, -25)
Global Const $ImGuiWindowFlags_Popup                  = BitShift(1, -26)
Global Const $ImGuiWindowFlags_Modal                  = BitShift(1, -27)
Global Const $ImGuiWindowFlags_ChildMenu              = BitShift(1, -28)
Global Const $ImGuiWindowFlags_DockNodeHost           = BitShift(1, -29)

Global Const $ImGuiInputTextFlags_None                = 0
Global Const $ImGuiInputTextFlags_CharsDecimal        = BitShift(1, 0)
Global Const $ImGuiInputTextFlags_CharsHexadecimal    = BitShift(1, -1)
Global Const $ImGuiInputTextFlags_CharsUppercase      = BitShift(1, -2)
Global Const $ImGuiInputTextFlags_CharsNoBlank        = BitShift(1, -3)
Global Const $ImGuiInputTextFlags_AutoSelectAll       = BitShift(1, -4)
Global Const $ImGuiInputTextFlags_EnterReturnsTrue    = BitShift(1, -5)
Global Const $ImGuiInputTextFlags_CallbackCompletion  = BitShift(1, -6)
Global Const $ImGuiInputTextFlags_CallbackHistory     = BitShift(1, -7)
Global Const $ImGuiInputTextFlags_CallbackAlways      = BitShift(1, -8)
Global Const $ImGuiInputTextFlags_CallbackCharFilter  = BitShift(1, -9)
Global Const $ImGuiInputTextFlags_AllowTabInput       = BitShift(1, -10)
Global Const $ImGuiInputTextFlags_CtrlEnterForNewLine = BitShift(1, -11)
Global Const $ImGuiInputTextFlags_NoHorizontalScroll  = BitShift(1, -12)
Global Const $ImGuiInputTextFlags_AlwaysInsertMode    = BitShift(1, -13)
Global Const $ImGuiInputTextFlags_ReadOnly            = BitShift(1, -14)
Global Const $ImGuiInputTextFlags_Password            = BitShift(1, -15)
Global Const $ImGuiInputTextFlags_NoUndoRedo          = BitShift(1, -16)
Global Const $ImGuiInputTextFlags_CharsScientific     = BitShift(1, -17)
Global Const $ImGuiInputTextFlags_CallbackResize      = BitShift(1, -18)
Global Const $ImGuiInputTextFlags_Multiline           = BitShift(1, -20)
Global Const $ImGuiInputTextFlags_NoMarkEdited        = BitShift(1, -21)

Global Const $ImGuiTreeNodeFlags_None                 =  0
Global Const $ImGuiTreeNodeFlags_Selected             = BitShift(1, -0)
Global Const $ImGuiTreeNodeFlags_Framed               = BitShift(1, -1)
Global Const $ImGuiTreeNodeFlags_AllowItemOverlap     = BitShift(1, -2)
Global Const $ImGuiTreeNodeFlags_NoTreePushOnOpen     = BitShift(1, -3)
Global Const $ImGuiTreeNodeFlags_NoAutoOpenOnLog      = BitShift(1, -4)
Global Const $ImGuiTreeNodeFlags_DefaultOpen          = BitShift(1, -5)
Global Const $ImGuiTreeNodeFlags_OpenOnDoubleClick    = BitShift(1, -6)
Global Const $ImGuiTreeNodeFlags_OpenOnArrow          = BitShift(1, -7)
Global Const $ImGuiTreeNodeFlags_Leaf                 = BitShift(1, -8)
Global Const $ImGuiTreeNodeFlags_Bullet               = BitShift(1, -9)
Global Const $ImGuiTreeNodeFlags_FramePadding         = BitShift(1, -10)
Global Const $ImGuiTreeNodeFlags_SpanAvailWidth       = BitShift(1, -11)
Global Const $ImGuiTreeNodeFlags_SpanFullWidth        = BitShift(1, -12)
Global Const $ImGuiTreeNodeFlags_NavLeftJumpsBackHere = BitShift(1, -13)
Global Const $ImGuiTreeNodeFlags_CollapsingHeader     = BitOr($ImGuiTreeNodeFlags_Framed, $ImGuiTreeNodeFlags_NoTreePushOnOpen, $ImGuiTreeNodeFlags_NoAutoOpenOnLog)

Global Const $ImGuiPopupFlags_None                    =  0
Global Const $ImGuiPopupFlags_MouseButtonLeft         =  0
Global Const $ImGuiPopupFlags_MouseButtonRight        =  1
Global Const $ImGuiPopupFlags_MouseButtonMiddle       =  2
Global Const $ImGuiPopupFlags_MouseButtonMask_        =  0x1F
Global Const $ImGuiPopupFlags_MouseButtonDefault_     =  1
Global Const $ImGuiPopupFlags_NoOpenOverExistingPopup = BitShift(1, -5)
Global Const $ImGuiPopupFlags_NoOpenOverItems         = BitShift(1, -6)
Global Const $ImGuiPopupFlags_AnyPopupId              = BitShift(1, -7)
Global Const $ImGuiPopupFlags_AnyPopupLevel           = BitShift(1, -8)
Global Const $ImGuiPopupFlags_AnyPopup                = BitOr($ImGuiPopupFlags_AnyPopupId, $ImGuiPopupFlags_AnyPopupLevel)

Global Const $ImGuiSelectableFlags_None               =  0
Global Const $ImGuiSelectableFlags_DontClosePopups    = BitShift(1, -0)
Global Const $ImGuiSelectableFlags_SpanAllColumns     = BitShift(1, -1)
Global Const $ImGuiSelectableFlags_AllowDoubleClick   = BitShift(1, -2)
Global Const $ImGuiSelectableFlags_Disabled           = BitShift(1, -3)
Global Const $ImGuiSelectableFlags_AllowItemOverlap   = BitShift(1, -4)

Global Const $ImGuiComboFlags_None                    =  0
Global Const $ImGuiComboFlags_PopupAlignLeft          = BitShift(1, -0)
Global Const $ImGuiComboFlags_HeightSmall             = BitShift(1, -1)
Global Const $ImGuiComboFlags_HeightRegular           = BitShift(1, -2)
Global Const $ImGuiComboFlags_HeightLarge             = BitShift(1, -3)
Global Const $ImGuiComboFlags_HeightLargest           = BitShift(1, -4)
Global Const $ImGuiComboFlags_NoArrowButton           = BitShift(1, -5)
Global Const $ImGuiComboFlags_NoPreview               = BitShift(1, -6)
Global Const $ImGuiComboFlags_HeightMask_             = BitOr($ImGuiComboFlags_HeightSmall, $ImGuiComboFlags_HeightRegular, $ImGuiComboFlags_HeightLarge, $ImGuiComboFlags_HeightLargest)

Global Const $ImGuiTabBarFlags_None                           =  0
Global Const $ImGuiTabBarFlags_Reorderable                    = BitShift(1, -0)
Global Const $ImGuiTabBarFlags_AutoSelectNewTabs              = BitShift(1, -1)
Global Const $ImGuiTabBarFlags_TabListPopupButton             = BitShift(1, -2)
Global Const $ImGuiTabBarFlags_NoCloseWithMiddleMouseButton   = BitShift(1, -3)
Global Const $ImGuiTabBarFlags_NoTabListScrollingButtons      = BitShift(1, -4)
Global Const $ImGuiTabBarFlags_NoTooltip                      = BitShift(1, -5)
Global Const $ImGuiTabBarFlags_FittingPolicyResizeDown        = BitShift(1, -6)
Global Const $ImGuiTabBarFlags_FittingPolicyScroll            = BitShift(1, -7)
Global Const $ImGuiTabBarFlags_FittingPolicyMask_             = BitOr($ImGuiTabBarFlags_FittingPolicyResizeDown, $ImGuiTabBarFlags_FittingPolicyScroll)
Global Const $ImGuiTabBarFlags_FittingPolicyDefault_          = $ImGuiTabBarFlags_FittingPolicyResizeDown

Global Const $ImGuiTabItemFlags_None                          =  0
Global Const $ImGuiTabItemFlags_UnsavedDocument               = BitShift(1, -0)
Global Const $ImGuiTabItemFlags_SetSelected                   = BitShift(1, -1)
Global Const $ImGuiTabItemFlags_NoCloseWithMiddleMouseButton  = BitShift(1, -2)
Global Const $ImGuiTabItemFlags_NoPushId                      = BitShift(1, -3)
Global Const $ImGuiTabItemFlags_NoTooltip                     = BitShift(1, -4)

Global Const $ImGuiFocusedFlags_None                          =  0
Global Const $ImGuiFocusedFlags_ChildWindows                  = BitShift(1, -0)
Global Const $ImGuiFocusedFlags_RootWindow                    = BitShift(1, -1)
Global Const $ImGuiFocusedFlags_AnyWindow                     = BitShift(1, -2)
Global Const $ImGuiFocusedFlags_RootAndChildWindows           = BitOr($ImGuiFocusedFlags_RootWindow, $ImGuiFocusedFlags_ChildWindows)


Global Const $ImGuiHoveredFlags_None                          =  0
Global Const $ImGuiHoveredFlags_ChildWindows                  = BitShift(1, -0)
Global Const $ImGuiHoveredFlags_RootWindow                    = BitShift(1, -1)
Global Const $ImGuiHoveredFlags_AnyWindow                     = BitShift(1, -2)
Global Const $ImGuiHoveredFlags_AllowWhenBlockedByPopup       = BitShift(1, -3)
Global Const $ImGuiHoveredFlags_AllowWhenBlockedByActiveItem  = BitShift(1, -5)
Global Const $ImGuiHoveredFlags_AllowWhenOverlapped           = BitShift(1, -6)
Global Const $ImGuiHoveredFlags_AllowWhenDisabled             = BitShift(1, -7)
Global Const $ImGuiHoveredFlags_RectOnly                      = BitOr($ImGuiHoveredFlags_AllowWhenBlockedByPopup, $ImGuiHoveredFlags_AllowWhenBlockedByActiveItem, $ImGuiHoveredFlags_AllowWhenOverlapped)
Global Const $ImGuiHoveredFlags_RootAndChildWindows           = BitOr($ImGuiHoveredFlags_RootWindow, $ImGuiHoveredFlags_ChildWindows)


Global Const $ImGuiDockNodeFlags_None                         =  0
Global Const $ImGuiDockNodeFlags_KeepAliveOnly                = BitShift(1, -0)
Global Const $ImGuiDockNodeFlags_NoDockingInCentralNode       = BitShift(1, -2)
Global Const $ImGuiDockNodeFlags_PassthruCentralNode          = BitShift(1, -3)
Global Const $ImGuiDockNodeFlags_NoSplit                      = BitShift(1, -4)
Global Const $ImGuiDockNodeFlags_NoResize                     = BitShift(1, -5)
Global Const $ImGuiDockNodeFlags_AutoHideTabBar               = BitShift(1, -6)

Global Const $ImGuiDragDropFlags_None                         =  0
Global Const $ImGuiDragDropFlags_SourceNoPreviewTooltip       = BitShift(1, -0)
Global Const $ImGuiDragDropFlags_SourceNoDisableHover         = BitShift(1, -1)
Global Const $ImGuiDragDropFlags_SourceNoHoldToOpenOthers     = BitShift(1, -2)
Global Const $ImGuiDragDropFlags_SourceAllowNullID            = BitShift(1, -3)
Global Const $ImGuiDragDropFlags_SourceExtern                 = BitShift(1, -4)
Global Const $ImGuiDragDropFlags_SourceAutoExpirePayload      = BitShift(1, -5)
Global Const $ImGuiDragDropFlags_AcceptBeforeDelivery         = BitShift(1, -10)
Global Const $ImGuiDragDropFlags_AcceptNoDrawDefaultRect      = BitShift(1, -11)
Global Const $ImGuiDragDropFlags_AcceptNoPreviewTooltip       = BitShift(1, -12)
Global Const $ImGuiDragDropFlags_AcceptPeekOnly               = BitOr($ImGuiDragDropFlags_AcceptBeforeDelivery, $ImGuiDragDropFlags_AcceptNoDrawDefaultRect)

Global Const $ImGuiDataType_S8 = 0
Global Const $ImGuiDataType_U8 = 1
Global Const $ImGuiDataType_S16 = 2
Global Const $ImGuiDataType_U16 = 3
Global Const $ImGuiDataType_S32 = 4
Global Const $ImGuiDataType_U32 = 5
Global Const $ImGuiDataType_S64 = 6
Global Const $ImGuiDataType_U64 = 7
Global Const $ImGuiDataType_Float = 8
Global Const $ImGuiDataType_Double = 9
Global Const $ImGuiDataType_COUNT = 10

Global Const $ImGuiDir_None    =  -1
Global Const $ImGuiDir_Left    =  0
Global Const $ImGuiDir_Right   =  1
Global Const $ImGuiDir_Up      =  2
Global Const $ImGuiDir_Down    =  3

Global Const $ImGuiKey_Tab = 0
Global Const $ImGuiKey_LeftArrow = 1
Global Const $ImGuiKey_RightArrow = 2
Global Const $ImGuiKey_UpArrow = 3
Global Const $ImGuiKey_DownArrow = 4
Global Const $ImGuiKey_PageUp = 5
Global Const $ImGuiKey_PageDown = 6
Global Const $ImGuiKey_Home = 7
Global Const $ImGuiKey_End = 8
Global Const $ImGuiKey_Insert = 9
Global Const $ImGuiKey_Delete = 10
Global Const $ImGuiKey_Backspace = 11
Global Const $ImGuiKey_Space = 12
Global Const $ImGuiKey_Enter = 13
Global Const $ImGuiKey_Escape = 14
Global Const $ImGuiKey_KeyPadEnter = 15
Global Const $ImGuiKey_A = 16
Global Const $ImGuiKey_C = 17
Global Const $ImGuiKey_V = 18
Global Const $ImGuiKey_X = 19
Global Const $ImGuiKey_Y = 20
Global Const $ImGuiKey_Z = 21

Global Const $ImGuiKeyModFlags_None       =  0
Global Const $ImGuiKeyModFlags_Ctrl       = BitShift(1, -0)
Global Const $ImGuiKeyModFlags_Shift      = BitShift(1, -1)
Global Const $ImGuiKeyModFlags_Alt        = BitShift(1, -2)
Global Const $ImGuiKeyModFlags_Super      = BitShift(1, -3)
Global Const $ImGuiNavInput_Activate = 0
Global Const $ImGuiNavInput_Cancel = 1
Global Const $ImGuiNavInput_Input = 2
Global Const $ImGuiNavInput_Menu = 3
Global Const $ImGuiNavInput_DpadLeft = 4
Global Const $ImGuiNavInput_DpadRight = 5
Global Const $ImGuiNavInput_DpadUp = 6
Global Const $ImGuiNavInput_DpadDown = 7
Global Const $ImGuiNavInput_LStickLeft = 8
Global Const $ImGuiNavInput_LStickRight = 9
Global Const $ImGuiNavInput_LStickUp = 10
Global Const $ImGuiNavInput_LStickDown = 11
Global Const $ImGuiNavInput_FocusPrev = 12
Global Const $ImGuiNavInput_FocusNext = 13
Global Const $ImGuiNavInput_TweakSlow = 14
Global Const $ImGuiNavInput_TweakFast = 15

Global Const $ImGuiNavInput_KeyMenu_ = 16
Global Const $ImGuiNavInput_KeyLeft_ = 17
Global Const $ImGuiNavInput_KeyRight_ = 18
Global Const $ImGuiNavInput_KeyUp_ = 19
Global Const $ImGuiNavInput_KeyDown_ = 20
Global Const $ImGuiNavInput_COUNT = 21
Global Const $ImGuiNavInput_InternalStart_ =  $ImGuiNavInput_KeyMenu_


Global Const $ImGuiConfigFlags_None                   =  0
Global Const $ImGuiConfigFlags_NavEnableKeyboard      = BitShift(1, -0)
Global Const $ImGuiConfigFlags_NavEnableGamepad       = BitShift(1, -1)
Global Const $ImGuiConfigFlags_NavEnableSetMousePos   = BitShift(1, -2)
Global Const $ImGuiConfigFlags_NavNoCaptureKeyboard   = BitShift(1, -3)
Global Const $ImGuiConfigFlags_NoMouse                = BitShift(1, -4)
Global Const $ImGuiConfigFlags_NoMouseCursorChange    = BitShift(1, -5)
Global Const $ImGuiConfigFlags_DockingEnable          = BitShift(1, -6)

Global Const $ImGuiConfigFlags_ViewportsEnable        = BitShift(1, -10)
Global Const $ImGuiConfigFlags_DpiEnableScaleViewports= BitShift(1, -14)
Global Const $ImGuiConfigFlags_DpiEnableScaleFonts    = BitShift(1, -15)
Global Const $ImGuiConfigFlags_IsSRGB                 = BitShift(1, -20)
Global Const $ImGuiConfigFlags_IsTouchScreen          = BitShift(1, -21)

Global Const $ImGuiBackendFlags_None                  =  0
Global Const $ImGuiBackendFlags_HasGamepad            = BitShift(1, -0)
Global Const $ImGuiBackendFlags_HasMouseCursors       = BitShift(1, -1)
Global Const $ImGuiBackendFlags_HasSetMousePos        = BitShift(1, -2)
Global Const $ImGuiBackendFlags_RendererHasVtxOffset  = BitShift(1, -3)
Global Const $ImGuiBackendFlags_PlatformHasViewports  = BitShift(1, -10)
Global Const $ImGuiBackendFlags_HasMouseHoveredViewport= BitShift(1, -11)
Global Const $ImGuiBackendFlags_RendererHasViewports  = BitShift(1, -12)

Global Const $ImGuiCol_Text = 0
Global Const $ImGuiCol_TextDisabled = 1
Global Const $ImGuiCol_WindowBg = 2
Global Const $ImGuiCol_ChildBg = 3
Global Const $ImGuiCol_PopupBg = 4
Global Const $ImGuiCol_Border = 5
Global Const $ImGuiCol_BorderShadow = 6
Global Const $ImGuiCol_FrameBg = 7
Global Const $ImGuiCol_FrameBgHovered = 8
Global Const $ImGuiCol_FrameBgActive = 9
Global Const $ImGuiCol_TitleBg = 10
Global Const $ImGuiCol_TitleBgActive = 11
Global Const $ImGuiCol_TitleBgCollapsed = 12
Global Const $ImGuiCol_MenuBarBg = 13
Global Const $ImGuiCol_ScrollbarBg = 14
Global Const $ImGuiCol_ScrollbarGrab = 15
Global Const $ImGuiCol_ScrollbarGrabHovered = 16
Global Const $ImGuiCol_ScrollbarGrabActive = 17
Global Const $ImGuiCol_CheckMark = 18
Global Const $ImGuiCol_SliderGrab = 19
Global Const $ImGuiCol_SliderGrabActive = 20
Global Const $ImGuiCol_Button = 21
Global Const $ImGuiCol_ButtonHovered = 22
Global Const $ImGuiCol_ButtonActive = 23
Global Const $ImGuiCol_Header = 24
Global Const $ImGuiCol_HeaderHovered = 25
Global Const $ImGuiCol_HeaderActive = 26
Global Const $ImGuiCol_Separator = 27
Global Const $ImGuiCol_SeparatorHovered = 28
Global Const $ImGuiCol_SeparatorActive = 29
Global Const $ImGuiCol_ResizeGrip = 30
Global Const $ImGuiCol_ResizeGripHovered = 31
Global Const $ImGuiCol_ResizeGripActive = 32
Global Const $ImGuiCol_Tab = 33
Global Const $ImGuiCol_TabHovered = 34
Global Const $ImGuiCol_TabActive = 35
Global Const $ImGuiCol_TabUnfocused = 36
Global Const $ImGuiCol_TabUnfocusedActive = 37
Global Const $ImGuiCol_DockingPreview = 38
Global Const $ImGuiCol_DockingEmptyBg = 39
Global Const $ImGuiCol_PlotLines = 40
Global Const $ImGuiCol_PlotLinesHovered = 41
Global Const $ImGuiCol_PlotHistogram = 42
Global Const $ImGuiCol_PlotHistogramHovered = 43
Global Const $ImGuiCol_TextSelectedBg = 44
Global Const $ImGuiCol_DragDropTarget = 45
Global Const $ImGuiCol_NavHighlight = 46
Global Const $ImGuiCol_NavWindowingHighlight = 47
Global Const $ImGuiCol_NavWindowingDimBg = 48
Global Const $ImGuiCol_ModalWindowDimBg = 49

Global Const $ImGuiStyleVar_Alpha = 0
Global Const $ImGuiStyleVar_WindowPadding = 1
Global Const $ImGuiStyleVar_WindowRounding = 2
Global Const $ImGuiStyleVar_WindowBorderSize = 3
Global Const $ImGuiStyleVar_WindowMinSize = 4
Global Const $ImGuiStyleVar_WindowTitleAlign = 5
Global Const $ImGuiStyleVar_ChildRounding = 6
Global Const $ImGuiStyleVar_ChildBorderSize = 7
Global Const $ImGuiStyleVar_PopupRounding = 8
Global Const $ImGuiStyleVar_PopupBorderSize = 9
Global Const $ImGuiStyleVar_FramePadding = 10
Global Const $ImGuiStyleVar_FrameRounding = 11
Global Const $ImGuiStyleVar_FrameBorderSize = 12
Global Const $ImGuiStyleVar_ItemSpacing = 13
Global Const $ImGuiStyleVar_ItemInnerSpacing = 14
Global Const $ImGuiStyleVar_IndentSpacing = 15
Global Const $ImGuiStyleVar_ScrollbarSize = 16
Global Const $ImGuiStyleVar_ScrollbarRounding = 17
Global Const $ImGuiStyleVar_GrabMinSize = 18
Global Const $ImGuiStyleVar_GrabRounding = 19
Global Const $ImGuiStyleVar_TabRounding = 20
Global Const $ImGuiStyleVar_ButtonTextAlign = 21
Global Const $ImGuiStyleVar_SelectableTextAlign = 22

Global Const $ImGuiColorEditFlags_None            =  0
Global Const $ImGuiColorEditFlags_NoAlpha         = BitShift(1, -1)
Global Const $ImGuiColorEditFlags_NoPicker        = BitShift(1, -2)
Global Const $ImGuiColorEditFlags_NoOptions       = BitShift(1, -3)
Global Const $ImGuiColorEditFlags_NoSmallPreview  = BitShift(1, -4)
Global Const $ImGuiColorEditFlags_NoInputs        = BitShift(1, -5)
Global Const $ImGuiColorEditFlags_NoTooltip       = BitShift(1, -6)
Global Const $ImGuiColorEditFlags_NoLabel         = BitShift(1, -7)
Global Const $ImGuiColorEditFlags_NoSidePreview   = BitShift(1, -8)
Global Const $ImGuiColorEditFlags_NoDragDrop      = BitShift(1, -9)
Global Const $ImGuiColorEditFlags_NoBorder        = BitShift(1, -10)
Global Const $ImGuiColorEditFlags_AlphaBar        = BitShift(1, -16)
Global Const $ImGuiColorEditFlags_AlphaPreview    = BitShift(1, -17)
Global Const $ImGuiColorEditFlags_AlphaPreviewHalf= BitShift(1, -18)
Global Const $ImGuiColorEditFlags_HDR             = BitShift(1, -19)
Global Const $ImGuiColorEditFlags_DisplayRGB      = BitShift(1, -20)
Global Const $ImGuiColorEditFlags_DisplayHSV      = BitShift(1, -21)
Global Const $ImGuiColorEditFlags_DisplayHex      = BitShift(1, -22)
Global Const $ImGuiColorEditFlags_Uint8           = BitShift(1, -23)
Global Const $ImGuiColorEditFlags_Float           = BitShift(1, -24)
Global Const $ImGuiColorEditFlags_PickerHueBar    = BitShift(1, -25)
Global Const $ImGuiColorEditFlags_PickerHueWheel  = BitShift(1, -26)
Global Const $ImGuiColorEditFlags_InputRGB        = BitShift(1, -27)
Global Const $ImGuiColorEditFlags_InputHSV        = BitShift(1, -28)

Global Const $ImGuiColorEditFlags__OptionsDefault = BitOr($ImGuiColorEditFlags_Uint8, $ImGuiColorEditFlags_DisplayRGB, $ImGuiColorEditFlags_InputRGB, $ImGuiColorEditFlags_PickerHueBar)
Global Const $ImGuiColorEditFlags__DisplayMask    = BitOr($ImGuiColorEditFlags_DisplayRGB, $ImGuiColorEditFlags_DisplayHSV, $ImGuiColorEditFlags_DisplayHex)
Global Const $ImGuiColorEditFlags__DataTypeMask   = BitOr($ImGuiColorEditFlags_Uint8, $ImGuiColorEditFlags_Float)
Global Const $ImGuiColorEditFlags__PickerMask     = BitOr($ImGuiColorEditFlags_PickerHueWheel, $ImGuiColorEditFlags_PickerHueBar)
Global Const $ImGuiColorEditFlags__InputMask      = BitOr($ImGuiColorEditFlags_InputRGB, $ImGuiColorEditFlags_InputHSV)

Global Const $ImGuiMouseButton_Left =  0
Global Const $ImGuiMouseButton_Right =  1
Global Const $ImGuiMouseButton_Middle =  2
Global Const $ImGuiMouseButton_COUNT =  5

Global Const $ImGuiMouseCursor_None =  -1
Global Const $ImGuiMouseCursor_Arrow =  0
Global Const $ImGuiMouseCursor_TextInput = 0
Global Const $ImGuiMouseCursor_ResizeAll = 1
Global Const $ImGuiMouseCursor_ResizeNS = 2
Global Const $ImGuiMouseCursor_ResizeEW = 3
Global Const $ImGuiMouseCursor_ResizeNESW = 4
Global Const $ImGuiMouseCursor_ResizeNWSE = 5
Global Const $ImGuiMouseCursor_Hand = 6
Global Const $ImGuiMouseCursor_NotAllowed = 7


Global Const $ImGuiCond_None          =  0
Global Const $ImGuiCond_Always        = BitShift(1, -0)
Global Const $ImGuiCond_Once          = BitShift(1, -1)
Global Const $ImGuiCond_FirstUseEver  = BitShift(1, -2)
Global Const $ImGuiCond_Appearing     = BitShift(1, -3)


Global Const $ImDrawCornerFlags_None      =  0
Global Const $ImDrawCornerFlags_TopLeft   = BitShift(1, -0)
Global Const $ImDrawCornerFlags_TopRight  = BitShift(1, -1)
Global Const $ImDrawCornerFlags_BotLeft   = BitShift(1, -2)
Global Const $ImDrawCornerFlags_BotRight  = BitShift(1, -3)
Global Const $ImDrawCornerFlags_Top       = BitOr($ImDrawCornerFlags_TopLeft, $ImDrawCornerFlags_TopRight)
Global Const $ImDrawCornerFlags_Bot       = BitOr($ImDrawCornerFlags_BotLeft, $ImDrawCornerFlags_BotRight)
Global Const $ImDrawCornerFlags_Left      = BitOr($ImDrawCornerFlags_TopLeft, $ImDrawCornerFlags_BotLeft)
Global Const $ImDrawCornerFlags_Right     = BitOr($ImDrawCornerFlags_TopRight, $ImDrawCornerFlags_BotRight)
Global Const $ImDrawCornerFlags_All       =  0xF

Global Const $ImDrawListFlags_None             =  0
Global Const $ImDrawListFlags_AntiAliasedLines = BitShift(1, -0)
Global Const $ImDrawListFlags_AntiAliasedFill  = BitShift(1, -1)
Global Const $ImDrawListFlags_AllowVtxOffset   = BitShift(1, -2)



Func _ImGui_GUICreate($title, $w, $h, $x = -1, $y = -1)

	Local $result = DllCall($IMGUI_DLL, "hwnd:cdecl", "GUICreate", "wstr", $title, "int", $w, "int", $h, "int", $x, "int", $y)
	If @error Then Return False

	Return $result[0]
EndFunc

Func _ImGui_PeekMsg()
	Local $result = DllCall($IMGUI_DLL, "boolean:cdecl", "PeekMsg")
	If @error Then Return False
	Return $result[0]
EndFunc

Func _ImGui_Begin($title, $close_btn = False, $flags = $ImGuiWindowFlags_None)
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

Func _ImGui_BeginChild($text, $w = 0, $h = 0, $border = False, $flags = $ImGuiWindowFlags_None)

	Local $result = DllCall($IMGUI_DLL, "boolean:cdecl", "BeginChild", "wstr", $text, "float", $w, "float", $h, "bool", $border, "int", $flags)
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_End()
	DllCall($IMGUI_DLL, "none:cdecl", "End")
EndFunc
Func _ImGui_EndChild()
	DllCall($IMGUI_DLL, "none:cdecl", "EndChild")
EndFunc

Func _ImGui_Button($text, $w = 0, $h = 0)
	Local $result = DllCall($IMGUI_DLL, "boolean:cdecl", "Button", "wstr", $text, "float", $w, "float", $h)
	If @error Then Return False
	Return $result[0]
EndFunc

Func _ImGui_InputText($label, ByRef $buf, $flags = $ImGuiInputTextFlags_None, $buf_size = 128000)


	Local $struct_buf = DllStructCreate('wchar value[' & $buf_size & '];')
	$struct_buf.value = $buf

	Local $result = DllCall($IMGUI_DLL, "boolean:cdecl", "InputText", "wstr", $label, "ptr", DllStructGetPtr($struct_buf), "int", $buf_size, "int", $flags, "ptr", 0, "ptr", 0)
	If @error Then Return False

	$buf = $struct_buf.value
	Return $result[0]
EndFunc

Func _ImGui_InputTextMultiline($label, ByRef $buf, $size_x = 0, $size_y = 0, $flags = $ImGuiInputTextFlags_None, $buf_size = 128000)

	Local $struct_buf = DllStructCreate('wchar value[' & $buf_size & '];')
	$struct_buf.value = $buf

	Local $result = DllCall($IMGUI_DLL, "boolean:cdecl", "InputTextMultiline", "wstr", $label, "ptr", DllStructGetPtr($struct_buf), "int", $buf_size, "float", $size_x, "float", $size_y, "int", $flags, "ptr", 0, "ptr", 0)

	If @error Then Return False

	$buf = $struct_buf.value
	Return $result[0]
EndFunc

Func _ImGui_InputTextWithHint($label, $hint, ByRef $buf, $flags = $ImGuiInputTextFlags_None, $buf_size = 128000)

	Local $struct_buf = DllStructCreate('wchar value[' & $buf_size & '];')
	$struct_buf.value = $buf

	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "InputTextWithHint", "wstr", $label, "wstr", $hint, "ptr", DllStructGetPtr($struct_buf), "int", $buf_size, "int", $flags)
	If @error Then Return False
	$buf = $struct_buf.value
	Return $result[0]
EndFunc


Func _ImGui_Text($text)
	DllCall($IMGUI_DLL, "none:cdecl", "Text", "wstr", $text)
EndFunc

Func _ImGui_SliderFloat($text, ByRef $value, $v_min, $v_max, $format = "%.3f", $power = 1)

	Local $struct = DllStructCreate("float value;")
	$struct.value = $value
	Local $result = DllCall($IMGUI_DLL, "boolean:cdecl", "SliderFloat", "wstr", $text, "ptr", DllStructGetPtr($struct), "float", $v_min, "float", $v_max, "str", $format, "float", $power)
	If @error Then Return False
	$value = $struct.value
	Return $result[0]
EndFunc

Func _ImGui_CheckBox($text, ByRef $active)
	Local $b_active = DllStructCreate("bool value;")
	$b_active.value = $active

	Local $result = DllCall($IMGUI_DLL, "boolean:cdecl", "Checkbox", "wstr", $text, "ptr", DllStructGetPtr($b_active))
	If @error Then Return False
	$active = $b_active.value
	Return $result[0]
EndFunc

Func _ImGui_BeginFrame()
	DllCall($IMGUI_DLL, "none:cdecl", "BeginFrame")
	DllCall($IMGUI_DLL, "none:cdecl", "DrawTest")
EndFunc
Func _ImGui_EndFrame($clear_color = 0xFF738C99)
	DllCall($IMGUI_DLL, "none:cdecl", "EndFrame", "uint", $clear_color)
EndFunc







Func _ImGui_StyleColorsDark()
	DllCall($IMGUI_DLL, "none:cdecl", "StyleColorsDark")
EndFunc
Func _ImGui_StyleColorsLight()
	DllCall($IMGUI_DLL, "none:cdecl", "StyleColorsLight")
EndFunc
Func _ImGui_StyleColorsClassic()
	DllCall($IMGUI_DLL, "none:cdecl", "StyleColorsClassic")
EndFunc

Func _ImGui_IsWindowAppearing()
	Local $result = DllCall($IMGUI_DLL, "boolean:cdecl", "IsWindowAppearing")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_IsWindowCollapsed()
	Local $result = DllCall($IMGUI_DLL, "boolean:cdecl", "IsWindowCollapsed")

	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_IsWindowFocused($flags = $ImGuiFocusedFlags_None)
	Local $result = DllCall($IMGUI_DLL, "boolean:cdecl", "IsWindowFocused", "int", $flags)

	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_IsWindowHovered($flags = $ImGuiFocusedFlags_None)
	Local $result = DllCall($IMGUI_DLL, "boolean:cdecl", "IsWindowHovered", "int", $flags)

	If @error Then Return False
	Return $result[0]
EndFunc




Func _ImGui_GetWindowDrawList()
	Local $result = DllCall($IMGUI_DLL, "ptr:cdecl", "GetWindowDrawList")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetOverlayDrawList()
	Local $result = DllCall($IMGUI_DLL, "ptr:cdecl", "GetOverlayDrawList")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetBackgroundDrawList()
	Local $result = DllCall($IMGUI_DLL, "ptr:cdecl", "GetBackgroundDrawList")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetForegroundDrawList()
	Local $result = DllCall($IMGUI_DLL, "ptr:cdecl", "GetForegroundDrawList")
	If @error Then Return False
	Return $result[0]
EndFunc

Func _ImGui_GetWindowPos()
	Return ___ImGui_RecvImVec2("none:cdecl", "GetWindowPos")
EndFunc
Func _ImGui_GetWindowSize()
	Return ___ImGui_RecvImVec2("none:cdecl", "GetWindowSize")
EndFunc
Func _ImGui_SetNextWindowPos($x, $y, $cond = 0, $pivot_x = 0, $pivot_y = 0)
	DllCall($IMGUI_DLL, "none:cdecl", "SetNextWindowPos", "float", $x, "float", $y, "int", $cond, "float", $pivot_x, "float", $pivot_y)
EndFunc
Func _ImGui_SetNextWindowSize($x, $y, $cond = 0)
	DllCall($IMGUI_DLL, "none:cdecl", "SetNextWindowSize", "float", $x, "float", $y, "int", $cond)
EndFunc
Func _ImGui_SetNextWindowSizeConstraints($size_min_x, $size_min_y, $size_max_x, $size_max_y)
	DllCall($IMGUI_DLL, "none:cdecl", "SetNextWindowSizeConstraints", "float", $size_min_x, "float", $size_min_y, "float", $size_max_x, "float", $size_max_y)
EndFunc

Func _ImGui_SetNextWindowContentSize($size_x, $size_y)
	DllCall($IMGUI_DLL, "none:cdecl", "SetNextWindowContentSize", "float", $size_x, "float", $size_y)
EndFunc
Func _ImGui_SetNextWindowCollapsed($collapsed, $cond = 0)
	DllCall($IMGUI_DLL, "none:cdecl", "SetNextWindowCollapsed", "bool", $collapsed, "int", $cond)
EndFunc
Func _ImGui_SetNextWindowFocus()
	DllCall($IMGUI_DLL, "none:cdecl", "SetNextWindowFocus")
EndFunc
Func _ImGui_SetNextWindowBgAlpha($alpha)
	DllCall($IMGUI_DLL, "none:cdecl", "SetNextWindowBgAlpha", "float", $alpha)

EndFunc
Func _ImGui_SetWindowPos($pos_x, $pos_y, $cond=0)
	DllCall($IMGUI_DLL, "none:cdecl", "SetWindowPosition", "float", $pos_x, "float", $pos_y, "int", $cond)
EndFunc
Func _ImGui_SetWindowSize($size_x, $size_y, $cond=0)
	DllCall($IMGUI_DLL, "none:cdecl", "SetWindowSize", "float", $size_x, "float", $size_y, "int", $cond)
EndFunc

Func _ImGui_SetWindowCollapsed($collapsed, $cond = 0)
	DllCall($IMGUI_DLL, "none:cdecl", "SetWindowCollapsed", "bool", $collapsed, "int", $cond)
EndFunc

Func _ImGui_SetWindowFocus()
	DllCall($IMGUI_DLL, "none:cdecl", "SetWindowFocus")
EndFunc

Func _ImGui_SetWindowFontScale($scale)
	DllCall($IMGUI_DLL, "none:cdecl", "SetWindowFontScale", "float", $scale)
EndFunc
Func _ImGui_SetWindowPosByName($name, $pos_x, $pos_y, $cond = 0)
	DllCall($IMGUI_DLL, "none:cdecl", "SetWindowPosByName", "wstr", $name, "float", $pos_x, "float", $pos_y, "int", $cond)
EndFunc

Func _ImGui_SetWindowSizeByName($name, $size_x, $size_y, $cond = 0)
	DllCall($IMGUI_DLL, "none:cdecl", "SetWindowSizeByName", "wstr", $name, "float", $size_x, "float", $size_y, "int", $cond)
EndFunc

Func _ImGui_SetWindowCollapsedByName($name, $collapsed, $cond = 0)
	Local $result = DllCall($IMGUI_DLL, "none:cdecl", "SetWindowCollapsedByName", "wstr", $name, "bool", $collapsed, "int", $cond)

	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_SetWindowFocusByName($name)
	DllCall($IMGUI_DLL, "none:cdecl", "SetWindowFocus", "wstr", $name)
EndFunc

Func ___ImGui_RecvImVec2($return_type, $func_name)

	Local $struct_x = DllStructCreate("float value;")
	Local $struct_y = DllStructCreate("float value;")
	Local $result = DllCall($IMGUI_DLL, $return_type, $func_name, "ptr", DllStructGetPtr($struct_x), "ptr", DllStructGetPtr($struct_y))

	If @error Then Return False
	Local $ret[2] = [$struct_x.value, $struct_y.value]
	Return $ret

EndFunc

Func _ImGui_GetContentRegionMax()
	Return ___ImGui_RecvImVec2("none:cdecl", "GetContentRegionMax")
EndFunc
Func _ImGui_GetContentRegionAvail()
	Return ___ImGui_RecvImVec2("none:cdecl", "GetContentRegionAvail")
EndFunc

Func _ImGui_GetWindowContentRegionMin()
	Return ___ImGui_RecvImVec2("none:cdecl", "GetWindowContentRegionMin")
EndFunc

Func _ImGui_GetWindowContentRegionMax()
	Return ___ImGui_RecvImVec2("none:cdecl", "GetWindowContentRegionMax")
EndFunc


Func _ImGui_GetWindowContentRegionWidth()
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetWindowContentRegionWidth")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetScrollX()
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetScrollX")

	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetScrollY()
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetScrollY")

	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetScrollMaxX()
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetScrollMaxX")

	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetScrollMaxY()
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetScrollMaxY")

	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_SetScrollX($scroll_x)
	DllCall($IMGUI_DLL, "none:cdecl", "SetScrollX", "float", $scroll_x)
EndFunc
Func _ImGui_SetScrollY($scroll_y)
	DllCall($IMGUI_DLL, "none:cdecl", "SetScrollY", "float", $scroll_y)
EndFunc
Func _ImGui_SetScrollHereX($center_x_ratio = 0.5)
	DllCall($IMGUI_DLL, "none:cdecl", "SetScrollHereX", "float", $center_x_ratio)
EndFunc
Func _ImGui_SetScrollHereY($center_y_ratio)
	DllCall($IMGUI_DLL, "none:cdecl", "SetScrollHereY", "float", $center_y_ratio)
EndFunc
Func _ImGui_SetScrollFromPosX($local_x, $center_x_ratio = 0.5)
	DllCall($IMGUI_DLL, "none:cdecl", "SetScrollFromPosX", "float", $local_x, "float", $center_x_ratio)
EndFunc
Func _ImGui_SetScrollFromPosY($local_y, $center_y_ratio = 0.5)
	DllCall($IMGUI_DLL, "none:cdecl", "SetScrollFromPosY", "float", $local_y, "float", $center_y_ratio)
EndFunc

Func _ImGui_PushFont($font)
	DllCall($IMGUI_DLL, "none:cdecl", "PushFont", "ptr", $font)
EndFunc
Func _ImGui_PushStyleColor($idx, $col)
	DllCall($IMGUI_DLL, "none:cdecl", "PushStyleColor", "int", $idx, "uint", $col)
EndFunc
Func _ImGui_PopStyleColor($count = 1)
	DllCall($IMGUI_DLL, "none:cdecl", "PopStyleColor", "int", $count)
EndFunc
Func _ImGui_PushStyleVar($idx, $val)
	DllCall($IMGUI_DLL, "none:cdecl", "PushStyleVar", "int", $idx, "float", $val)
EndFunc
Func _ImGui_PushStyleVarPos($idx, $val_x, $val_y)
	DllCall($IMGUI_DLL, "none:cdecl", "PushStyleVarPos", "int", $idx, "float", $val_x, "float", $val_y)
EndFunc
Func _ImGui_PopStyleVar($count = 1)
	DllCall($IMGUI_DLL, "none:cdecl", "PopStyleVar", "int", $count)
EndFunc
Func _ImGui_GetFont()
	Local $result = DllCall($IMGUI_DLL, "ptr:cdecl", "GetFont")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetFontSize()
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetFontSize")

	If @error Then Return False
	Return $result[0]
EndFunc

Func _ImGui_GetFontTexUvWhitePixel()
	Return ___ImGui_RecvImVec2("none:cdecl", "GetFontTexUvWhitePixel")
EndFunc


Func _ImGui_GetColorU32($idx, $alpha_mul = 1)
	Local $result = DllCall($IMGUI_DLL, "ImU32:cdecl", "GetColorU32", "int", $idx, "float", $alpha_mul)
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_PushItemWidth($item_width)
	DllCall($IMGUI_DLL, "none:cdecl", "PushItemWidth", "float", $item_width)
EndFunc
Func _ImGui_PopItemWidth()
	DllCall($IMGUI_DLL, "none:cdecl", "PopItemWidth")
EndFunc
Func _ImGui_SetNextItemWidth($item_width)
	DllCall($IMGUI_DLL, "none:cdecl", "SetNextItemWidth", "float", $item_width)
EndFunc
Func _ImGui_CalcItemWidth()
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "CalcItemWidth")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_PushTextWrapPos($wrap_pos_x = 0)
	DllCall($IMGUI_DLL, "none:cdecl", "PushTextWrapPos", "float", $wrap_pos_x)
EndFunc
Func _ImGui_PopTextWrapPos()
	DllCall($IMGUI_DLL, "none:cdecl", "PopTextWrapPos")
EndFunc
Func _ImGui_PushAllowKeyboardFocus($allow_keyboard_focus)
	DllCall($IMGUI_DLL, "none:cdecl", "PushAllowKeyboardFocus", "bool", $allow_keyboard_focus)
EndFunc
Func _ImGui_PopAllowKeyboardFocus()
	DllCall($IMGUI_DLL, "none:cdecl", "PopAllowKeyboardFocus")
EndFunc
Func _ImGui_PushButtonRepeat($repeat)
	DllCall($IMGUI_DLL, "none:cdecl", "PushButtonRepeat", "bool", $repeat)
EndFunc
Func _ImGui_PopButtonRepeat()
	DllCall($IMGUI_DLL, "none:cdecl", "PopButtonRepeat")
EndFunc
Func _ImGui_Separator()
	DllCall($IMGUI_DLL, "none:cdecl", "Separator")
EndFunc
Func _ImGui_SameLine($offset_from_start_x = 0, $spacing_w = -1)
	DllCall($IMGUI_DLL, "none:cdecl", "SameLine", "float", $offset_from_start_x, "float", $spacing_w)
EndFunc
Func _ImGui_NewLine()
	DllCall($IMGUI_DLL, "none:cdecl", "NewLine")
EndFunc
Func _ImGui_Spacing()
	DllCall($IMGUI_DLL, "none:cdecl", "Spacing")
EndFunc
Func _ImGui_Dummy($size_x, $size_y)
	DllCall($IMGUI_DLL, "none:cdecl", "Dummy", "float", $size_x, "float", $size_y)
EndFunc
Func _ImGui_Indent($indent_w = 0)
	DllCall($IMGUI_DLL, "none:cdecl", "Indent", "float", $indent_w)
EndFunc
Func _ImGui_Unindent($indent_w = 0)
	DllCall($IMGUI_DLL, "none:cdecl", "Unindent", "float", $indent_w)
EndFunc
Func _ImGui_BeginGroup()
	DllCall($IMGUI_DLL, "none:cdecl", "BeginGroup")
EndFunc
Func _ImGui_EndGroup()
	DllCall($IMGUI_DLL, "none:cdecl", "EndGroup")
EndFunc
Func _ImGui_GetCursorPos()
	Return ___ImGui_RecvImVec2("none:cdecl", "GetCursorPosition")
EndFunc
Func _ImGui_SetCursorPos($local_pos_x, $local_pos_y)
	DllCall($IMGUI_DLL, "none:cdecl", "SetCursorPosition", "float", $local_pos_x, "float", $local_pos_y)
EndFunc

Func _ImGui_GetCursorStartPos()
	Return ___ImGui_RecvImVec2("none:cdecl", "GetCursorStartPos")
EndFunc
Func _ImGui_GetCursorScreenPos()
	Return ___ImGui_RecvImVec2("none:cdecl", "GetCursorScreenPos")
EndFunc
Func _ImGui_SetCursorScreenPos($pos_x, $pos_y)
	DllCall($IMGUI_DLL, "none:cdecl", "SetCursorScreenPos", "float", $pos_x, "float", $pos_y)
EndFunc
Func _ImGui_AlignTextToFramePadding()
	DllCall($IMGUI_DLL, "none:cdecl", "AlignTextToFramePadding")
EndFunc
Func _ImGui_GetTextLineHeight()
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetTextLineHeight")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetTextLineHeightWithSpacing()
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetTextLineHeightWithSpacing")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetFrameHeight()
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetFrameHeight")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetFrameHeightWithSpacing()
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetFrameHeightWithSpacing")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_PushID($str_id)
	DllCall($IMGUI_DLL, "none:cdecl", "PushID", "wstr", $str_id)
EndFunc
Func _ImGui_PopID()
	DllCall($IMGUI_DLL, "none:cdecl", "PopID")
EndFunc
Func _ImGui_GetID($str_id)
	Local $result = DllCall($IMGUI_DLL, "uint:cdecl", "GetID", "wstr", $str_id)
	If @error Then Return False
	Return $result[0]
EndFunc

Func _ImGui_TextColored($text, $color = 0xFFFFFFFF)
	DllCall($IMGUI_DLL, "none:cdecl", "TextColored", "uint", $color, "wstr", $text)
EndFunc
Func _ImGui_TextDisabled($text)
	DllCall($IMGUI_DLL, "none:cdecl", "TextDisabled", "wstr", $text)
EndFunc
Func _ImGui_TextWrapped($text)
	DllCall($IMGUI_DLL, "none:cdecl", "TextWrapped", "wstr", $text)
EndFunc
Func _ImGui_LabelText($label, $text)
	DllCall($IMGUI_DLL, "none:cdecl", "LabelText", "wstr", $label, "wstr", $text)
EndFunc
Func _ImGui_BulletText($text)
	DllCall($IMGUI_DLL, "none:cdecl", "BulletText", "wstr", $text)
EndFunc
Func _ImGui_SmallButton($label)
	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "SmallButton", "wstr", $label)
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_InvisibleButton($str_id, $size_x, $size_y)
	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "InvisibleButton", "wstr", $str_id, "float", $size_x, "float", $size_y)
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_ArrowButton($str_id, $dir = $ImGuiDir_Up)
	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "ArrowButton", "wstr", $str_id, "int", $dir)
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_Image($user_texture_id, $size_x, $size_y, $uv0_x = 0, $uv0_y = 0, $uv1_x = 1, $uv1_y = 1, $tint_col = 0xFFFFFFFF, $border_col = 0)
	DllCall($IMGUI_DLL, "none:cdecl", "Image", "int", $user_texture_id, "float", $size_x, "float", $size_y, "float", $uv0_x, "float", $uv0_y, "float", $uv1_x, "float", $uv1_y, "uint", $tint_col, "uint", $border_col)
EndFunc

Func _ImGui_ImageButton($user_texture_id, $size_x, $size_y, $uv0_x = 0, $uv0_y = 0, $uv1_x = 1, $uv1_y = 1, $frame_padding = -1, $bg_col = 0, $tint_col = 0xFFFFFFFF)
	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "ImageButton", "int", $user_texture_id, "float", $size_x, "float", $size_y, "float", $uv0_x, "float", $uv0_y, "float", $uv1_x, "float", $uv1_y, "int", $frame_padding, "uint", $bg_col, "uint", $tint_col)
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_CheckboxFlags($label, ByRef $flags, $flags_value)
	Local $struct_flags = DllStructCreate('uint value;')
	$struct_flags.value = $flags
	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "CheckboxFlags", "wstr", $label, "ptr", DllStructGetPtr($struct_flags), "uint", $flags_value)
	$flags = $struct_flags.value
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_RadioButton($label, ByRef $v, $v_button)
	Local $struct_v = DllStructCreate('int value;')
	$struct_v.value = $v
	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "RadioButton", "wstr", $label, "ptr", DllStructGetPtr($struct_v), "int", $v_button)
	$v = $struct_v.value
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_ProgressBar($fraction, $size_arg_x = -1, $size_arg_y = 0, $overlay = "")
	DllCall($IMGUI_DLL, "none:cdecl", "ProgressBar", "float", $fraction, "float", $size_arg_x, "float", $size_arg_y, "wstr", $overlay)
EndFunc
Func _ImGui_Bullet()
	DllCall($IMGUI_DLL, "none:cdecl", "Bullet")
EndFunc
Func _ImGui_BeginCombo($label, $preview_value, $flags = $ImGuiComboFlags_None)
	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "BeginCombo", "wstr", $label, "wstr", $preview_value, "int", $flags)
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_EndCombo()
	DllCall($IMGUI_DLL, "none:cdecl", "EndCombo")
EndFunc
Func _ImGui_AddLine($draw_list, $p1_x, $p1_y, $p2_x, $p2_y, $col = 0xFFFFFFFF, $thickness = 1)
	DllCall($IMGUI_DLL, "none:cdecl", "AddLine", "ptr", $draw_list, "float", $p1_x, "float", $p1_y, "float", $p2_x, "float", $p2_y, "uint", $col, "float", $thickness)
EndFunc
Func _ImGui_AddRect($draw_list, $p_min_x, $p_min_y, $p_max_x, $p_max_y, $col = 0xFFFFFFFF, $rounding = 0, $rounding_corners = $ImDrawCornerFlags_None, $thickness = 1)
	DllCall($IMGUI_DLL, "none:cdecl", "AddRect",  "ptr", $draw_list, "float", $p_min_x, "float", $p_min_y, "float", $p_max_x, "float", $p_max_y, "uint", $col, "float", $rounding, "int", $rounding_corners, "float", $thickness)
EndFunc
Func _ImGui_AddRectFilled($draw_list, $p_min_x, $p_min_y, $p_max_x, $p_max_y, $col = 0xFFFFFFFF, $rounding = 0, $rounding_corners = $ImDrawCornerFlags_None)
	DllCall($IMGUI_DLL, "none:cdecl", "AddRectFilled", "ptr", $draw_list, "float", $p_min_x, "float", $p_min_y, "float", $p_max_x, "float", $p_max_y, "uint", $col, "float", $rounding, "int", $rounding_corners)
EndFunc
Func _ImGui_AddBezierCurve($draw_list, $p1_x, $p1_y, $p2_x, $p2_y, $p3_x, $p3_y, $p4_x, $p4_y, $col = 0xFFFFFFFF, $thickness = 1, $num_segments = 30)
	DllCall($IMGUI_DLL, "none:cdecl", "AddBezierCurve", "ptr", $draw_list, "float", $p1_x, "float", $p1_y, "float", $p2_x, "float", $p2_y, "float", $p3_x, "float", $p3_y, "float", $p4_x, "float", $p4_y, "uint", $col, "float", $thickness, "int", $num_segments)
EndFunc
Func _ImGui_AddCircle($draw_list, $center_x, $center_y, $radius, $col = 0xFFFFFFFF, $num_segments = 30, $thickness = 1)
	DllCall($IMGUI_DLL, "none:cdecl", "AddCircle", "ptr", $draw_list, "float", $center_x, "float", $center_y, "float", $radius, "uint", $col, "int", $num_segments, "float", $thickness)
EndFunc
Func _ImGui_AddCircleFilled($draw_list, $center_x, $center_y, $radius, $col = 0xFFFFFFFF, $num_segments = $radius/3+10)
	DllCall($IMGUI_DLL, "none:cdecl", "AddCircleFilled", "ptr", $draw_list, "float", $center_x, "float", $center_y, "float", $radius, "uint", $col, "int", $num_segments)
EndFunc

Func _ImGui_AddConvexPolyFilled($draw_list, $points, $col = 0xFFFFFFFF)
	If not IsArray($points) Then Return False

	Local $points_count = UBound($points)
	Local $tag = ""
	For $i = 0 To $points_count*2
		$tag &= "float;"
	Next

	Local $struct_points = DllStructCreate($tag)
	for $i = 0 To $points_count - 1
		DllStructSetData($struct_points, $i*2 + 1,  $points[$i][0])
		DllStructSetData($struct_points, $i*2+1 + 1, $points[$i][1])
	Next


	DllCall($IMGUI_DLL, "none:cdecl", "AddConvexPolyFilled", "ptr", $draw_list, "ptr", DllStructGetPtr($struct_points), "int", $points_count, "uint", $col)
EndFunc

Func _ImGui_AddImage($draw_list, $user_texture_id, $p_min_x, $p_min_y, $p_max_x, $p_max_y, $uv_min_x = 0, $uv_min_y = 0, $uv_max_x = 1, $uv_max_y = 1, $col = 0xFFFFFFFF)
	DllCall($IMGUI_DLL, "none:cdecl", "AddImage", "ptr", $draw_list, "int", $user_texture_id, "float", $p_min_x, "float", $p_min_y, "float", $p_max_x, "float", $p_max_y, "float", $uv_min_x, "float", $uv_min_y, "float", $uv_max_x, "float", $uv_max_y, "uint", $col)
EndFunc
Func _ImGui_AddImageQuad($draw_list, $user_texture_id, $p1_x, $p1_y, $p2_x, $p2_y, $p3_x, $p3_y, $p4_x, $p4_y, $uv1_x = 0, $uv1_y = 0, $uv2_x = 1, $uv2_y = 0, $uv3_x = 1, $uv3_y = 1, $uv4_x = 0, $uv4_y = 1, $col = 0xFFFFFFFF)
	DllCall($IMGUI_DLL, "none:cdecl", "AddImageQuad", "ptr", $draw_list, "int", $user_texture_id, "float", $p1_x, "float", $p1_y, "float", $p2_x, "float", $p2_y, "float", $p3_x, "float", $p3_y, "float", $p4_x, "float", $p4_y, "float", $uv1_x, "float", $uv1_y, "float", $uv2_x, "float", $uv2_y, "float", $uv3_x, "float", $uv3_y, "float", $uv4_x, "float", $uv4_y, "uint", $col)
EndFunc
Func _ImGui_AddImageRounded($draw_list, $user_texture_id, $p_min_x, $p_min_y, $p_max_x, $p_max_y, $uv_min_x = 0, $uv_min_y = 0, $uv_max_x = 1, $uv_max_y = 1, $col = 0xFFFFFFFF, $rounding = 5, $rounding_corners = $ImDrawCornerFlags_None)
	DllCall($IMGUI_DLL, "none:cdecl", "AddImageRounded", "ptr", $draw_list, "int", $user_texture_id, "float", $p_min_x, "float", $p_min_y, "float", $p_max_x, "float", $p_max_y, "float", $uv_min_x, "float", $uv_min_y, "float", $uv_max_x, "float", $uv_max_y, "uint", $col, "float", $rounding, "int", $rounding_corners)
EndFunc
Func _ImGui_AddNgon($draw_list, $center_x, $center_y, $radius, $col = 0xFFFFFFFF, $num_segments = 5, $thickness = 1)
	DllCall($IMGUI_DLL, "none:cdecl", "AddNgon", "ptr", $draw_list, "float", $center_x, "float", $center_y, "float", $radius, "uint", $col, "int", $num_segments, "float", $thickness)
EndFunc
Func _ImGui_AddNgonFilled($draw_list, $center_x, $center_y, $radius, $col = 0xFFFFFFFF, $num_segments = 5)
	DllCall($IMGUI_DLL, "none:cdecl", "AddNgonFilled", "ptr", $draw_list, "float", $center_x, "float", $center_y, "float", $radius, "uint", $col, "int", $num_segments)
EndFunc
Func _ImGui_AddPolyline($draw_list, $points, $col = 0xFFFFFFFF, $closed = True, $thickness = 1)

	If not IsArray($points) Then Return False

	Local $points_count = UBound($points)
	Local $tag = ""
	For $i = 0 To $points_count*2
		$tag &= "float;"
	Next

	Local $struct_points = DllStructCreate($tag)
	for $i = 0 To $points_count - 1
		DllStructSetData($struct_points, $i*2 + 1,  $points[$i][0])
		DllStructSetData($struct_points, $i*2+1 + 1, $points[$i][1])
	Next


	DllCall($IMGUI_DLL, "none:cdecl", "AddPolyline", "ptr", $draw_list, "ptr", DllStructGetPtr($struct_points), "int", $points_count, "uint", $col, "bool", $closed, "float", $thickness)
EndFunc
Func _ImGui_AddQuad($draw_list, $p1_x, $p1_y, $p2_x, $p2_y, $p3_x, $p3_y, $p4_x, $p4_y, $col = 0xFFFFFFFF, $thickness = 1)
	DllCall($IMGUI_DLL, "none:cdecl", "AddQuad", "ptr", $draw_list, "float", $p1_x, "float", $p1_y, "float", $p2_x, "float", $p2_y, "float", $p3_x, "float", $p3_y, "float", $p4_x, "float", $p4_y, "uint", $col, "float", $thickness)
EndFunc
Func _ImGui_AddQuadFilled($draw_list, $p1_x, $p1_y, $p2_x, $p2_y, $p3_x, $p3_y, $p4_x, $p4_y, $col = 0xFFFFFFFF)
	DllCall($IMGUI_DLL, "none:cdecl", "AddQuadFilled", "ptr", $draw_list, "float", $p1_x, "float", $p1_y, "float", $p2_x, "float", $p2_y, "float", $p3_x, "float", $p3_y, "float", $p4_x, "float", $p4_y, "uint", $col)
EndFunc
Func _ImGui_AddRectFilledMultiColor($draw_list, $p_min_x, $p_min_y, $p_max_x, $p_max_y, $col_upr_left, $col_upr_right, $col_bot_right, $col_bot_left)
	DllCall($IMGUI_DLL, "none:cdecl", "AddRectFilledMultiColor", "ptr", $draw_list, "float", $p_min_x, "float", $p_min_y, "float", $p_max_x, "float", $p_max_y, "uint", $col_upr_left, "uint", $col_upr_right, "uint", $col_bot_right, "uint", $col_bot_left)
EndFunc
Func _ImGui_AddText($draw_list, $text, $font, $font_size, $pos_x, $pos_y, $col = 0xFFFFFFFF, $wrap_width = 0)
	DllCall($IMGUI_DLL, "none:cdecl", "AddText", "ptr", $draw_list, "ptr", $font, "float", $font_size, "float", $pos_x, "float", $pos_y, "uint", $col, "wstr", $text, "float", $wrap_width)
EndFunc


Global Const $__tagImVec2 = "float x; float y;"


;//------------------------------------------------------------------
;// Configuration (fill once)                // Default value
;//------------------------------------------------------------------

Global Const $__tagImGuiIO = "int ConfigFlags;" & _             ; = 0              // See ImGuiConfigFlags_ enum. Set by user/application. Gamepad/keyboard navigation options, etc.
	"int BackendFlags;" & _            ; = 0              // See ImGuiBackendFlags_ enum. Set by back-end (imgui_impl_xxx files or custom back-end) to communicate features supported by the back-end.
	"float DisplaySize_x;" & _			; <unset>          ; Main display size, in pixels. This is for the default viewport.
	"float DisplaySize_y;" & _
	"float DeltaTime;" & _						; = 1.0f/60.0f     ; Time elapsed since last frame, in seconds.
	"float IniSavingRate;" & _					; = 5.0f           ; Minimum time between saving positions/sizes to .ini file, in seconds.
	"ptr IniFilename;" & _						; = "imgui.ini"    ; Path to .ini file. Set NULL to disable automatic .ini loading/saving, if e.g. you want to manually load/save from memory.
	"ptr LogFilename;" & _						; = "imgui_log.txt"; Path to .log file (default parameter to ImGui::LogToFile when no file is specified).
	"float MouseDoubleClickTime;" & _			; = 0.30f          ; Time for a double-click, in seconds.
	"float MouseDoubleClickMaxDist;" & _		; = 6.0f           ; Distance threshold to stay in to validate a double-click, in pixels.
	"float MouseDragThreshold;" & _				; = 6.0f           ; Distance threshold before considering we are dragging.
	"int KeyMap[22];" & _						; <unset>          ; Map of indices into the KeysDown[512] entries array which represent your "native" keyboard state.
	"float KeyRepeatDelay;" & _					; = 0.250f         ; When holding a key/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).
	"float KeyRepeatRate;" & _					; = 0.050f         ; When holding a key/button, rate at which it repeats, in seconds.
	"ptr UserData;" & _							; = NULL           ; Store your own data for retrieval by callbacks.
	""& _
	"ptr Fonts;" & _							; <auto>           ; Font atlas: load, rasterize and pack one or more fonts into a single texture.
	"float FontGlobalScale;" & _				; = 1.0f           ; Global scale all fonts
	"boolean FontAllowUserScaling;" & _			; = false          ; Allow user scaling text of individual window with CTRL+Wheel.
	"ptr FontDefault;" & _						; = NULL           ; Font to use on NewFrame(). Use NULL to uses Fonts->Fonts[0].
	"float DisplayFramebufferScale_x;" & _		; = (1, 1)         ; For retina display or other situations where window coordinates are different from framebuffer coordinates. This generally ends up in ImDrawData::FramebufferScale.
	"float DisplayFramebufferScale_y;" & _
	""& _
	""& _ ; Docking options (when ImGuiConfigFlags_DockingEnable is set)
	"boolean ConfigDockingNoSplit;" & _ 			; = false          ; Simplified docking mode: disable window splitting, so docking is limited to merging multiple windows together into tab-bars.
	"boolean ConfigDockingWithShift;" & _			; = false          ; Enable docking with holding Shift key (reduce visual noise, allows dropping in wider space)
	"boolean ConfigDockingAlwaysTabBar;" & _		; = false          ; [BETA] [FIXME: This currently creates regression with auto-sizing and general overhead] Make every single floating window display within a docking node.
	"boolean ConfigDockingTransparentPayload;" & _	; = false          ; [BETA] Make window or viewport transparent when docking and only display docking boxes on the target viewport. Useful if rendering of multiple viewport cannot be synced. Best used with ConfigViewportsNoAutoMerge.
	""& _
	""& _ ; Viewport options (when ImGuiConfigFlags_ViewportsEnable is set)
	"boolean ConfigViewportsNoAutoMerge;" & _		; = false;         ; Set to make all floating imgui windows always create their own viewport. Otherwise, they are merged into the main host viewports when overlapping it. May also set ImGuiViewportFlags_NoAutoMerge on individual viewport.
	"boolean ConfigViewportsNoTaskBarIcon;" & _		; = false          ; Disable default OS task bar icon flag for secondary viewports. When a viewport doesn't want a task bar icon, ImGuiViewportFlags_NoTaskBarIcon will be set on it.
	"boolean ConfigViewportsNoDecoration;" & _		; = true           ; [BETA] Disable default OS window decoration flag for secondary viewports. When a viewport doesn't want window decorations, ImGuiViewportFlags_NoDecoration will be set on it. Enabling decoration can create subsequent issues at OS levels (e.g. minimum window size).
	"boolean ConfigViewportsNoDefaultParent;" & _	; = false          ; Disable default OS parenting to main viewport for secondary viewports. By default, viewports are marked with ParentViewportId = <main_viewport>, expecting the platform back-end to setup a parent/child relationship between the OS windows (some back-end may ignore this). Set to true if you want the default to be 0, then all viewports will be top-level OS windows.
	""& _
	"boolean MouseDrawCursor;" & _ 					; = false          ; Request ImGui to draw a mouse cursor for you (if you are on a platform without a mouse cursor). Cannot be easily renamed to 'io.ConfigXXX' because this is frequently used by back-end implementations.
	"boolean ConfigMacOSXBehaviors;" & _			; = defined(__APPLE__) ; OS X style: Text editing cursor movement using Alt instead of Ctrl, Shortcuts using Cmd/Super instead of Ctrl, Line/Text Start and End using Cmd+Arrows instead of Home/End, Double click selects by word instead of selecting whole text, Multi-selection in lists uses Cmd/Super instead of Ctrl (was called io.OptMacOSXBehaviors prior to 1.63)
	"boolean ConfigInputTextCursorBlink;" & _		; = true           ; Set to false to disable blinking cursor, for users who consider it distracting. (was called: io.OptCursorBlink prior to 1.63)
	"boolean ConfigWindowsResizeFromEdges;" & _		; = true           ; Enable resizing of windows from their edges and from the lower-left corner. This requires (io.BackendFlags & ImGuiBackendFlags_HasMouseCursors) because it needs mouse cursor feedback. (This used to be a per-window ImGuiWindowFlags_ResizeFromAnySide flag)
	"boolean ConfigWindowsMoveFromTitleBarOnly;" & _; = false       ; [BETA] Set to true to only allow moving windows when clicked+dragged from the title bar. Windows without a title bar are not affected.
	"float ConfigWindowsMemoryCompactTimer;" & _	; = 60.0f          ; [BETA] Compact window memory usage when unused. Set to -1.0f to disable.
	""& _
	"ptr BackendPlatformName;" & _		; = NULL
	"ptr BackendRendererName;" & _		; = NULL
	"ptr BackendPlatformUserData;" & _	; = NULL           ; User data for platform back-end
	"ptr BackendRendererUserData;" & _	; = NULL           ; User data for renderer back-end
	"ptr BackendLanguageUserData;" & _	; = NULL           ; User data for non C++ programming language back-end
	""& _
	"ptr GetClipboardTextFn;" & _
	"ptr SetClipboardTextFn;" & _
	"ptr ClipboardUserData;" & _
	"ptr RenderDrawListsFnUnused;" & _
	"float MousePos_x;" & _					; Mouse position, in pixels. Set to ImVec2(-FLT_MAX, -FLT_MAX) if mouse is unavailable (on another screen, etc.)
	"float MousePos_y;" & _					; = NULL           ; User data for non C++ programming language back-end
	"boolean MouseDown[5];" & _				; Mouse buttons: 0=left, 1=right, 2=middle + extras (ImGuiMouseButton_COUNT == 5). Dear ImGui mostly uses left and right buttons. Others buttons allows us to track if the mouse is being used by your application + available to user as a convenience via IsMouse** API.
	"float MouseWheel;" & _					; Mouse wheel Vertical: 1 unit scrolls about 5 lines text.
	"float MouseWheelH;" & _				; Mouse wheel Horizontal. Most users don't have a mouse with an horizontal wheel, may not be filled by all back-ends.
	"uint MouseHoveredViewport;" & _		; (Optional) When using multiple viewports: viewport the OS mouse cursor is hovering _IGNORING_ viewports with the ImGuiViewportFlags_NoInputs flag, and _REGARDLESS_ of whether another viewport is focused. Set io.BackendFlags |= ImGuiBackendFlags_HasMouseHoveredViewport if you can provide this info. If you don't imgui will infer the value using the rectangles and last focused time of the viewports it knows about (ignoring other OS windows).
	"boolean KeyCtrl;" & _					; Keyboard modifier pressed: Control
	"boolean KeyShift;" & _					; Keyboard modifier pressed: Shift
	"boolean KeyAlt;" & _					; Keyboard modifier pressed: Alt
	"boolean KeySuper;" & _					; Keyboard modifier pressed: Cmd/Super/Windows
	"boolean KeysDown[512];" & _			; Keyboard keys that are pressed (ideally left in the "native" order your engine has access to keyboard keys, so you can use your own defines/enums for keys).
	"float NavInputs[21];" & _				; Gamepad inputs. Cleared back to zero by EndFrame(). Keyboard keys will be auto-mapped and be written here by NewFrame().
	""& _
	""& _ ; mouse and keyboard
	"boolean WantCaptureMouse;" & _			; Set when Dear ImGui will use mouse inputs, in this case do not dispatch them to your main game/application (either way, always pass on mouse inputs to imgui). (e.g. unclicked mouse is hovering over an imgui window, widget is active, mouse was clicked over an imgui window, etc.).
	"boolean WantCaptureKeyboard;" & _		; Set when Dear ImGui will use keyboard inputs, in this case do not dispatch them to your main game/application (either way, always pass keyboard inputs to imgui). (e.g. InputText active, or an imgui window is focused and navigation is enabled, etc.).
	"boolean WantTextInput;" & _			; Mobile/console: when set, you may display an on-screen keyboard. This is set by Dear ImGui when it wants textual keyboard input to happen (e.g. when a InputText widget is active).
	"boolean WantSetMousePos;" & _			; MousePos has been altered, back-end should reposition mouse on next frame. Rarely used! Set only when ImGuiConfigFlags_NavEnableSetMousePos flag is enabled.
	"boolean WantSaveIniSettings;" & _		; When manual .ini load/save is active (io.IniFilename == NULL), this will be set to notify your application that you can call SaveIniSettingsToMemory() and save yourself. Important: clear io.WantSaveIniSettings yourself after saving!
	"boolean NavActive;" & _				; Keyboard/Gamepad navigation is currently allowed (will handle ImGuiKey_NavXXX events) = a window is focused and it doesn't use the ImGuiWindowFlags_NoNavInputs flag.
	"boolean NavVisible;" & _				; Keyboard/Gamepad navigation is visible and allowed (will handle ImGuiKey_NavXXX events).
	"float Framerate;" & _					; Application framerate estimate, in frame per second. Solely for convenience. Rolling average estimation based on io.DeltaTime over 120 frames.
	"int MetricsRenderVertices;" & _		; Vertices output during last call to Render()
	"int MetricsRenderIndices;" & _			; Indices output during last call to Render() = number of triangles * 3
	"int MetricsRenderWindows;" & _			; Number of visible windows
	"int MetricsActiveWindows;" & _			; Number of active windows
	"int MetricsActiveAllocations;" & _		; Number of active allocations, updated by MemAlloc/MemFree based on current context. May be off if you have multiple imgui contexts.
	"float MouseDelta_x;" & _				; Mouse delta. Note that this is zero if either current or previous position are invalid (-FLT_MAX,-FLT_MAX), so a disappearing/reappearing mouse won't have a huge delta.
	"float MouseDelta_y;" & _				; Gamepad inputs. Cleared back to zero by EndFrame(). Keyboard keys will be auto-mapped and be written here by NewFrame().
	""& _
	""& _
	"int KeyMods;" & _								; Key mods flags (same as io.KeyCtrl/KeyShift/KeyAlt/KeySuper but merged into flags), updated by NewFrame()
	"float MousePosPrev_x;" & _						; Previous mouse position (note that MouseDelta is not necessary == MousePos-MousePosPrev, in case either position is invalid)
	"float MousePosPrev_y;" & _
	"float MouseClickedPos[10];" & _				; Position at time of clicking
	"double MouseClickedTime[5];" & _				; Time of last click (used to figure out double-click)
	"boolean MouseClicked[5];" & _					; Mouse button went from !Down to Down
	"boolean MouseDoubleClicked[5];" & _			; Has mouse button been double-clicked?
	"boolean MouseReleased[5];" & _					; Mouse button went from Down to !Down
	"boolean MouseDownOwned[5];" & _				; Track if button down was a double-click
	"boolean MouseDownWasDoubleClick[5];" & _		; Track if button was clicked inside a dear imgui window. We don't request mouse capture from the application if click started outside ImGui bounds.
	"float MouseDownDuration[5];" & _				; Duration the mouse button has been down (0.0f == just clicked)
	"float MouseDownDurationPrev[5];" & _			; Previous time the mouse button has been down
	"float MouseDragMaxDistanceAbs[10];" & _		; Maximum distance, absolute, on each axis, of how much mouse has traveled from the clicking point
	"float MouseDragMaxDistanceSqr[5];" & _			; Squared maximum distance of how much mouse has traveled from the clicking point
	"float KeysDownDuration[512];" & _				; Duration the keyboard key has been down (0.0f == just pressed)
	"float KeysDownDurationPrev[512];" & _			; Previous duration the key has been down
	"float NavInputsDownDuration[21];" & _
	"float NavInputsDownDurationPrev[21];" & _
	"float PenPressure;" & _						; Touch/Pen pressure (0.0f to 1.0f, should be >0.0f only when MouseDown[0] == true). Helper storage currently unused by Dear ImGui.
	"ushort InputQueueSurrogate;"					; For AddInputCharacterUTF16

Global $__tagImGuiStyle = _
	"float Alpha;" & _						;  Global alpha applies to everything in Dear ImGui.
	"float WindowPadding_x;" & _			;  Padding within a window.
	"float WindowPadding_y;" & _
	"float WindowRounding;" & _				;  Radius of window corners rounding. Set to 0.0f to have rectangular windows. Large values tend to lead to variety of artifacts and are not recommended.
	"float WindowBorderSize;" & _			;  Thickness of border around windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
	"float WindowMinSize_x;" & _			;  Minimum window size. This is a global setting. If you want to constraint individual windows, use SetNextWindowSizeConstraints().
	"float WindowMinSize_y;" & _
	"float WindowTitleAlign_x;" & _			;  Alignment for title bar text. Defaults to (0.0f,0.5f) for left-aligned,vertically centered.
	"float WindowTitleAlign_y;" & _
	"int WindowMenuButtonPosition;" & _		;  Side of the collapsing/docking button in the title bar (None/Left/Right). Defaults to ImGuiDir_Left.
	"float ChildRounding;" & _				;  Radius of child window corners rounding. Set to 0.0f to have rectangular windows.
	"float ChildBorderSize;" & _			;  Thickness of border around child windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
	"float PopupRounding;" & _				;  Radius of popup window corners rounding. (Note that tooltip windows use WindowRounding)
	"float PopupBorderSize;" & _			;  Thickness of border around popup/tooltip windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
	"float FramePadding_x;" & _				;  Padding within a framed rectangle (used by most widgets).
	"float FramePadding_y;" & _
	"float FrameRounding;" & _				;  Radius of frame corners rounding. Set to 0.0f to have rectangular frame (used by most widgets).
	"float FrameBorderSize;" & _			;  Thickness of border around frames. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
	"float ItemSpacing_x;" & _				;  Horizontal and vertical spacing between widgets/lines.
	"float ItemSpacing_y;" & _
	"float ItemInnerSpacing_x;" & _			;  Horizontal and vertical spacing between within elements of a composed widget (e.g. a slider and its label).
	"float ItemInnerSpacing_y;" & _
	"float TouchExtraPadding_x;" & _		;  Expand reactive bounding box for touch-based system where touch position is not accurate enough. Unfortunately we don't sort widgets so priority on overlap will always be given to the first widget. So don't grow this too much!
	"float TouchExtraPadding_y;" & _
	"float IndentSpacing;" & _				;  Horizontal indentation when e.g. entering a tree node. Generally == (FontSize + FramePadding.x*2).
	"float ColumnsMinSpacing;" & _			;  Minimum horizontal spacing between two columns. Preferably > (FramePadding.x + 1).
	"float ScrollbarSize;" & _				;  Width of the vertical scrollbar, Height of the horizontal scrollbar.
	"float ScrollbarRounding;" & _			;  Radius of grab corners for scrollbar.
	"float GrabMinSize;" & _				;  Minimum width/height of a grab box for slider/scrollbar.
	"float GrabRounding;" & _				;  Radius of grabs corners rounding. Set to 0.0f to have rectangular slider grabs.
	"float TabRounding;" & _				;  Radius of upper corners of a tab. Set to 0.0f to have rectangular tabs.
	"float TabBorderSize;" & _				;  Thickness of border around tabs.
	"float TabMinWidthForUnselectedCloseButton;" & _			;  Minimum width for close button to appears on an unselected tab when hovered. Set to 0.0f to always show when hovering, set to FLT_MAX to never show close button unless selected.
	"int ColorButtonPosition;" & _			;  Side of the color button in the ColorEdit4 widget (left/right). Defaults to ImGuiDir_Right.
	"float ButtonTextAlign_x;" & _			;  Alignment of button text when button is larger than text. Defaults to (0.5f, 0.5f) (centered).
	"float ButtonTextAlign_y;" & _
	"float SelectableTextAlign_x;" & _		;  Alignment of selectable text. Defaults to (0.0f, 0.0f) (top-left aligned). It's generally important to keep this left-aligned if you want to lay multiple items on a same line.
	"float SelectableTextAlign_y;" & _
	"float DisplayWindowPadding_x;" & _		;  Window position are clamped to be visible within the display area or monitors by at least this amount. Only applies to regular windows.
	"float DisplayWindowPadding_y;" & _
	"float DisplaySafeAreaPadding_x;" & _	;  If you cannot see the edges of your screen (e.g. on a TV) increase the safe area padding. Apply to popups/tooltips as well regular windows. NB: Prefer configuring your TV sets correctly!
	"float DisplaySafeAreaPadding_y;" & _
	"float MouseCursorScale;" & _			;  Scale software rendered mouse cursor (when io.MouseDrawCursor is enabled). We apply per-monitor DPI scaling over this scale. May be removed later.
	"boolean AntiAliasedLines;" & _			;  Enable anti-aliasing on lines/borders. Disable if you are really tight on CPU/GPU.
	"boolean AntiAliasedFill;" & _			;  Enable anti-aliasing on filled shapes (rounded rectangles, circles, etc.)
	"float CurveTessellationTol;" & _		;  Tessellation tolerance when using PathBezierCurveTo() without a specific number of segments. Decrease for highly tessellated curves (higher quality, more polygons), increase to reduce quality.
	"float CircleSegmentMaxError;"		;  Maximum error (in pixels) allowed when using AddCircle()/AddCircleFilled() or drawing rounded corner rectangles with no explicit segment count specified. Decrease for higher quality but more geometry.


Func _ImGui_GetIO()

	local $result = DllCall($IMGUI_DLL, "ptr:cdecl", "GetIO")
	If @error then return False

	Local $struct = DllStructCreate($__tagImGuiIO, $result[0])
	return $struct
EndFunc
Func _ImGui_GetStyle()

	local $result = DllCall($IMGUI_DLL, "ptr:cdecl", "GetStyle")
	If @error then return False

	Local $struct = DllStructCreate($__tagImGuiStyle, $result[0])
	return $struct
EndFunc
Func _ImGui_SetStyleColor($index, $color = 0xFFFFFFFF)
	DllCall($IMGUI_DLL, "none:cdecl", "SetStyleColor", "int", $index, "uint", $color)
EndFunc
Func _ImGui_Selectable($label, $selected = False, $flags = $ImGuiSelectableFlags_None, $size_arg_x = 0, $size_arg_y = 0)
	Local $result = DllCall($IMGUI_DLL, "bool:cdecl", "Selectable", "wstr", $label, "bool", $selected, "int", $flags, "float", $size_arg_x, "float", $size_arg_y)
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_SetItemDefaultFocus()
	DllCall($IMGUI_DLL, "none:cdecl", "SetItemDefaultFocus")
EndFunc
Func _ImGui_Columns($columns_count = 1, $id = "", $border = true)
	DllCall($IMGUI_DLL, "none:cdecl", "Columns", "int", $columns_count, "wstr", $id, "bool", $border)
EndFunc
Func _ImGui_NextColumn()
	DllCall($IMGUI_DLL, "none:cdecl", "NextColumn")
EndFunc
Func _ImGui_GetColumnIndex()
	Local $result = DllCall($IMGUI_DLL, "int:cdecl", "GetColumnIndex")
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_GetColumnWidth($column_index = -1)
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetColumnWidth", "int", $column_index)
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_SetColumnWidth($column_index, $width)
	DllCall($IMGUI_DLL, "none:cdecl", "SetColumnWidth", "int", $column_index, "float", $width)
EndFunc
Func _ImGui_GetColumnOffset($column_index = -1)
	Local $result = DllCall($IMGUI_DLL, "float:cdecl", "GetColumnOffset", "int", $column_index)
	If @error Then Return False
	Return $result[0]
EndFunc
Func _ImGui_SetColumnOffset($column_index, $offset)
	DllCall($IMGUI_DLL, "none:cdecl", "SetColumnOffset", "int", $column_index, "float", $offset)
EndFunc
Func _ImGui_GetColumnsCount()
	Local $result = DllCall($IMGUI_DLL, "int:cdecl", "GetColumnsCount")
	If @error Then Return False
	Return $result[0]
EndFunc
