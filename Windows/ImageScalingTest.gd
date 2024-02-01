extends Control


# Solved window resize signaling issue with 
# https://github.com/godotengine/godot/issues/79336#issuecomment-1631627181
func _ready():
	var vwindow:Window = get_window()
	print('_ready(): connecting size_changed to on_size_changed')
	vwindow.size_changed.connect(on_size_changed)
	self.position.x = 0
	self.position.y = 0

func on_size_changed():
	print("size changed!")
	# Expand size to fit screen, and fill 80% of the height
	self.size.x = get_viewport().size.x
	self.size.y = get_viewport().size.y
	#$HBoxContainer.size.y = self.size.y * 0.5
	#$HBoxContainer.size.x = self.size.x * 0.5
	#for child in get_children():
		#if child is Container:
			#child.queue_sort()
	
	

func _notification(what):
	if what == NOTIFICATION_WM_SIZE_CHANGED:
		print("Main Node can receive it!")
		
