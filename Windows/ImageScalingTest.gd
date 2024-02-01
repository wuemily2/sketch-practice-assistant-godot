extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var vwindow:Window = get_window()
	print('_ready(): connecting size_changed to on_size_changed')
	vwindow.size_changed.connect(on_size_changed)

func on_size_changed():
	print("size changed!")

func _notification(what):
	if what == NOTIFICATION_WM_SIZE_CHANGED:
		print("Main Node can receive it!")
		
