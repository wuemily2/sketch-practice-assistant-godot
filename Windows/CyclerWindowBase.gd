extends VBoxContainer


func _ready():
	var vwindow:Window = get_window()
	print('_ready(): connecting size_changed to on_size_changed')
	vwindow.size_changed.connect(on_size_changed)
	resize_self()

func on_size_changed():
	#print("size changed!")
	# Expand size to fit screen, and fill 80% of the height
	resize_self()

func resize_self():
	self.position.x = 0
	self.position.y = 0
	self.size.x = get_viewport().size.x
	self.size.y = get_viewport().size.y
