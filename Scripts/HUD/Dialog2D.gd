extends Node2D

export(Array) var indextext
export(bool) var is_exit_end_dialog = false
export(float, 0 , 4, 0.1) var timespeed = 1
export(float, 0 , 4, 0.1) var st_tweenspeed = 1
export(float, 0 , 4, 0.1) var end_tweenspeed = 1

var timenexttext : int



func _ready() -> void:
	self.modulate = Color(1,1,1,0)
#	textready()



func textready() -> void:
	if indextext != null:
		$Timer.wait_time = timespeed
		timenexttext = 0
		$TextureRect/Label.text = ''
		$Tween.interpolate_property(self,'modulate', Color(1,1,1,0), Color(1,1,1,1), st_tweenspeed,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
		$Tween.start()
		yield($Tween,"tween_completed")
		$TextureRect/Label.show()
		$Timer.start()

func textend() -> void:
	if indextext != null:
		$TextureRect/Label.hide()
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
