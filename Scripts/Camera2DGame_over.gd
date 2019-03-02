extends Camera2D

const sceneready : String = "res://Screens/Maps/Room023.tscn"


func init(pos):
	self.global_position = pos

func _ready():
	$CanvasLayer/ColorRect/LabelGameOver.text = tr('Game_over')
	$CanvasLayer/ColorRect/VBoxContainer/Buttonready.text = tr('Ready_game')
	$CanvasLayer/ColorRect/VBoxContainer/Buttonexitgame.text = tr('Exit_game')
	$AnimationPlayer.play("start")

func _on_Buttonready_pressed():
	$AnimationPlayer.play("ready")
	yield($AnimationPlayer,"animation_finished")
	s_globals.posPlayer[15] = true
	s_globals.is_ready_pos_player = true
	get_tree().change_scene(sceneready)

func _on_Buttonexitgame_pressed():
	get_tree().quit()




