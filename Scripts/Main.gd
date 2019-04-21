extends Node

onready var clicklg : Array = [$HUDclickLE/Panel/VBoxContainer/TButtonLanguages,
		$HUDclickLE/Panel/VBoxContainer/TButtonLanguages2]

const start_game_sc : = preload("res://Screens/Maps/RoomReadyStart.tscn")

func _ready() -> void:
	$HUDclickLE/exitgame/Button.connect('pressed',self,'exit_game')
	for i in clicklg:
		i.connect('indexlg',self,'fclicklg')
	
	$HUDclickLE/AnimationPlayer.play('mhstopst')
	$ScreenColor/AnimationPlayer.play("screen_stop")
	yield(get_tree().create_timer(1.0),"timeout")
	$ScreenColor/AnimationPlayer.play('screen_st')
	$HUDclickLE/ControlLgshow.hide()
	$HUDclickLE/ControlLgshow/Panel/TButtonAcceptLg.connect("pressed",self,'fButtonAcLg')
	

	yield($ScreenColor/AnimationPlayer,"animation_finished")
	if ProjectSettings.get('main'):
		$HUDclickLE/exitgame.show()


func anim_screen_st_time_end():
	$HUDclickLE/AnimationPlayer.play('mhstart')

func fclicklg(indexlg : int):
	if indexlg == 0:
		TranslationServer.set_locale('en')
	else:
		TranslationServer.set_locale('ru')
	$HUDclickLE/ControlLgshow.show()
	$HUDclickLE/ControlLgshow/Panel2/RichTextLabel.bbcode_text = tr('Main_Menu_0')

func fButtonAcLg():
	$HUDclickLE/AnimationPlayer.play('mhend')

func _on_HUDclickLE_animPsHeng():
	$ScreenColor/AnimationPlayer.play('screen_end')
	yield($ScreenColor/AnimationPlayer,"animation_finished")
	get_tree().change_scene_to(start_game_sc)

func exit_game():
	get_tree().quit()

