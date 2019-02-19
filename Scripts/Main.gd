extends Node

onready var clicklg : Array = [$HUDclickLE/Panel/VBoxContainer/TButtonLanguages,
		$HUDclickLE/Panel/VBoxContainer/TButtonLanguages2]

const start_game_sc : = preload("res://Screens/Maps/RoomReadyStart.tscn")

func _ready() -> void:
	$ScreenColor/AnimationPlayer.play('screen_st')
	$HUDclickLE/AnimationPlayer.play('mhstopst')
	$HUDclickLE/ControlLgshow.hide()
	$HUDclickLE/ControlLgshow/Panel/TButtonAcceptLg.connect("pressed",self,'fButtonAcLg')
	for i in clicklg:
		i.connect('indexlg',self,'fclicklg')

func anim_screen_st_time_end():
	$HUDclickLE/AnimationPlayer.play('mhstart')

func fclicklg(indexlg : int):
	if indexlg == 0:
		TranslationServer.set_locale('en')
	else:
		TranslationServer.set_locale('ru')
	$HUDclickLE/ControlLgshow.show()
	$HUDclickLE/ControlLgshow/Panel2/RichTextLabel.text = tr('Main_Menu_0')

func fButtonAcLg():
	$HUDclickLE/AnimationPlayer.play('mhend')

func _on_HUDclickLE_animPsHeng():
	$ScreenColor/AnimationPlayer.play('screen_end')
	yield($ScreenColor/AnimationPlayer,"animation_finished")
	get_tree().change_scene_to(start_game_sc)








