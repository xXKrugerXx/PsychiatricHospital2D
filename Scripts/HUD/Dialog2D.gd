extends Node2D

export(Array) var indextext
export(bool) var is_exit_end_dialog = false
export(float, 0 , 4, 0.1) var timespeed = 1
export(float, 0 , 4, 0.1) var st_tweenspeed = 1
export(float, 0 , 4, 0.1) var end_tweenspeed = 1

export(bool) var is_dialog_l_r = false

var timenexttext : int

const img : Array = [preload("res://Textures/texdialog_l.png"),
				preload("res://Textures/texdialog_r.png")]

const img_light : Array = [preload("res://Textures/texdialog_l_light.png"),
				preload("res://Textures/texdialog_r_light.png")]

func _ready() -> void:
	self.modulate = Color(1,1,1,0)
	$Light2D.enabled = false
	if is_dialog_l_r:
		$TextureRect.texture = img[1]
		$Light2D.texture = img_light[1]
		$TextureRect.margin_left = 0
		$Light2D.position = Vector2(128,-64)
		$TextureRect/Label.margin_left = -85
		$TextureRect/Label.margin_right = 99
	else:
		$TextureRect.texture = img[0]
		$Light2D.texture = img_light[0]
		$TextureRect.margin_left = -256
		$Light2D.position = Vector2(-128,-64)
		$TextureRect/Label.margin_left = -95
		$TextureRect/Label.margin_right = 89

func textready() -> void:
	if indextext != null:
		$Timer.wait_time = timespeed
		timenexttext = 0
		$TextureRect/Label.text = ''
		$Tween.interpolate_property(self,'modulate', Color(1,1,1,0), Color(1,1,1,1), st_tweenspeed,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
		$Tween.start()
		yield($Tween,"tween_completed")
		$TextureRect/Label.show()
		$Light2D.enabled = true
		$Timer.start()

func textend() -> void:
	if indextext != null:
		$TextureRect/Label.hide()
		$Light2D.enabled = false
		$Tween.interpolate_property(self,'modulate', Color(1,1,1,1), Color(1,1,1,0), end_tweenspeed,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
		$Tween.start()

func _on_Timer_timeout():
	if indextext != null:
		if timenexttext < indextext.size():
			$TextureRect/Label.text = str(tr(indextext[timenexttext]))
		else:
			if is_exit_end_dialog:
				$Timer.stop()
				textend()
		timenexttext +=1




