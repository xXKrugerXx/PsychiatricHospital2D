extends TextureButton

signal indexlg

export(int) var clickindex = 0

func fclick():
	emit_signal('indexlg', clickindex)

func _on_TButtonLanguages_pressed():
	fclick()
