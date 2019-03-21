extends CanvasLayer

func _ready():
	
	$ColorRect/LabelPause.text = tr('Pause_G_0')
	$ColorRect/NinePatchRect/Control/LabelSettings.text = tr('Settings_G_0')
	$ColorRect/NinePatchRect/Control/VBoxContainerLabel/LabelGhost.text = tr('Sounds_G_0')
	
	if s_globals.is_ready_setting_sound:
		readySounds(-45)
		s_globals.is_ready_setting_sound = false
	else:
		loadSounds()
	


func readySounds(value):
	$ColorRect/NinePatchRect/Control/VBoxContainer/HSlider_bgm.value = value
	$ColorRect/NinePatchRect/Control/VBoxContainer/HSlider_sfx.value = value
	$ColorRect/NinePatchRect/Control/VBoxContainer/HSlider_ghost.value = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('BGM'), value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('SFX'), value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Ghosts'), value)

func loadSounds():
	$ColorRect/NinePatchRect/Control/VBoxContainer/HSlider_bgm.value = AudioServer.get_bus_volume_db(1)
	$ColorRect/NinePatchRect/Control/VBoxContainer/HSlider_sfx.value = AudioServer.get_bus_volume_db(2)
	$ColorRect/NinePatchRect/Control/VBoxContainer/HSlider_ghost.value = AudioServer.get_bus_volume_db(3)


#func _process(delta):
#	print(AudioServer.get_bus_volume_db(1))




func _on_HSlider_bgm_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('BGM'), value)


func _on_HSlider_sfx_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('SFX'), value)


func _on_HSlider_ghost_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Ghosts'), value)


func _on_TextureButton_accept_pressed():
	get_tree().paused = false
	$ColorRect.hide()
