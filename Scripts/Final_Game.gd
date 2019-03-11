extends Node

const main_game : = preload("res://Screens/Main.tscn")


func _ready():
	$CanvasLayer/ColorRect/Label.text = tr('Final_game')
	$AnimationPlayer.play("game_stop")
	yield(get_tree().create_timer(1.0),"timeout")
	$AnimationPlayer.play('game_start')


func move_player():
	$final_player.speed = -380.0

func _on_final_player_the_end():
	$AnimationPlayer.play("game_the_end")

func main_game():
	ProjectSettings.set('main',true)
	get_tree().change_scene_to(main_game)