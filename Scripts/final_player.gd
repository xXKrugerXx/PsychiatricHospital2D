extends KinematicBody2D

var motion : Vector2
var speed : float = 0

signal the_end

func _physics_process(delta):
	motion.y += 10
	motion.x = speed
	
	motion = move_and_slide(motion,Vector2(0,-1))
	

func _on_VisibilityEnabler2D_screen_entered():
	self.set_physics_process(true)


func _on_VisibilityEnabler2D_screen_exited():
	self.set_physics_process(false)
	emit_signal('the_end')
