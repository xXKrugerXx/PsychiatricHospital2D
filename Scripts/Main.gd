extends Node

onready var clicklg : Array = [$HUDclickLE/Panel/VBoxContainer/TButtonLanguages,
		$HUDclickLE/Panel/VBoxContainer/TButtonLanguages2]

func _ready() -> void:
	$ScreenColor/AnimationPlayer.play('screen_st')
	$HUDclickLE/AnimationPlayer.play('mhstopst')
	
	for i in clicklg:
		i.connect('indexlg',self,'fclicklg')




func anim_screen_st_time_end():
	$HUDclickLE/AnimationPlayer.play('mhstart')


func fclicklg(indexlg):
	print('click ',indexlg)


func new_game():
	pass