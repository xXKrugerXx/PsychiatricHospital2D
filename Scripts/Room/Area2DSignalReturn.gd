extends Area2D

export(int) var index := 0
export(int) var size_x := 50
export(int) var size_y := 100

signal signalstairs

func _ready():
	var Rect2d : RectangleShape2D = RectangleShape2D.new()
	$CollisionShape.shape = Rect2d
	Rect2d.extents = Vector2(size_x,size_y)

func _on_Area2DSignalReturn_body_entered(body):
	if body.is_in_group('player'):
		emit_signal('signalstairs', index)






