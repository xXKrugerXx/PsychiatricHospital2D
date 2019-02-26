extends Button

signal indexlg

export(int) var clickindex = 0

func _on_TButtonLanguages_pressed():
	emit_signal('indexlg', clickindex)
