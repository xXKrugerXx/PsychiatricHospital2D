extends TextureButton

signal indexlg

export(int) var clickindex = 0

func _ready() -> void:
	self.connect('pressed',self,'fclick')


func fclick():
	print(clickindex)
	emit_signal('indexlg', clickindex)