extends CanvasLayer

onready var OptionButt_Sc_size : = $ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/HBoxMB/OptionB_Sc_Size as OptionButton

const option_screen_size : Array = [
		'1024 x 768',
		'1152 x 864',
		'1280 x 768',
		'1600 x 900',
		'1680 x 1050',
		'1920 x 1080',
		'1920 x 1200']

const screen_size : Array = [
		Vector2(1024,768),
		Vector2(1152,864),
		Vector2(1280,768),
		Vector2(1600,900),
		Vector2(1680,1050),
		Vector2(1920,1080),
		Vector2(1920,1200)]

var index_screen_size : int = 0

func _ready():
	update_settings_pc_labels()
	add_option_buttons()
	OptionButt_Sc_size.select(index_screen_size)
	
	if s_globals.is_ready_setting_sound:
		readySounds(-45)
		s_globals.is_ready_setting_sound = false
	else:
		loadSounds()

func add_option_buttons():
	for i in option_screen_size:
		OptionButt_Sc_size.add_item(i)

func get_screen_size(value:int):
	return screen_size[value]

func get_window_size():
	return (OS.get_screen_size(0) * 0.5) - (OS.get_window_size() * 0.5)

func OptionButt_item_disabled(value:bool):
	for i in option_screen_size.size():
		OptionButt_Sc_size.set_item_disabled(i,value)

func _on_OptionB_Sc_Size_item_selected(ID):
	OS.set_window_size(get_screen_size(ID))
	OS.window_position = get_window_size()
	index_screen_size = ID

func _on_CheckBoxFullSize_toggled(button_pressed):
	if button_pressed:
		OS.window_fullscreen = button_pressed
		OptionButt_item_disabled(true)
	else:
		OS.window_size = get_screen_size(index_screen_size)
		OS.window_position = get_window_size()
		OS.window_fullscreen = button_pressed
		OptionButt_item_disabled(false)

func update_settings_pc_labels():
	$ColorRect/LabelPause.text = tr('Pause_G_0')
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/LabelSetting.text = tr('Settings_G_0')
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/HBoxContainer/LabelScreen.text = tr('Settings_SC_0')
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/HBoxMB/LabelScreenSize.text = tr('Settings_SS_0')
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/HBoxFB/LabelFullSize.text = tr('Settings_FC_0')
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/HBoxContainer2/LabelAudio.text = tr('Settings_AO_0')
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/ReferenceRect/VBoxContainerLabel/LabelGhost.text = tr('Sounds_G_0')

func readySounds(value):
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/ReferenceRect/VBoxContainer/HSlider_bgm.value = value
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/ReferenceRect/VBoxContainer/HSlider_sfx.value = value
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/ReferenceRect/VBoxContainer/HSlider_ghost.value = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('BGM'), value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('SFX'), value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Ghosts'), value)

func loadSounds():
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/ReferenceRect/VBoxContainer/HSlider_bgm.value = AudioServer.get_bus_volume_db(1)
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/ReferenceRect/VBoxContainer/HSlider_sfx.value = AudioServer.get_bus_volume_db(2)
	$ColorRect/NinePatchRect/ScrollContainer/Control/VBoxContainer/ReferenceRect/VBoxContainer/HSlider_ghost.value = AudioServer.get_bus_volume_db(3)

func _on_HSlider_bgm_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('BGM'), value)

func _on_HSlider_sfx_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('SFX'), value)

func _on_HSlider_ghost_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Ghosts'), value)


func _on_TextureB_settings_exit_button_up():
	get_tree().paused = false
	$ColorRect.hide()
