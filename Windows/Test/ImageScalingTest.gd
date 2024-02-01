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
	# Container classes queue sort is called automatically on resize, wow
	$HBoxContainer.size.y = self.size.y * 0.5 
	$HBoxContainer.size.x = self.size.x * 0.5
	#for child in get_children():
		#if child is Container:
			#child.queue_sort()
	
	

func _notification(what):
	if what == NOTIFICATION_WM_SIZE_CHANGED:
		print("Main Node can receive it!")
		


func _on_button_pressed():
	$FileDialog.show()


func _on_file_dialog_files_selected(paths):
	pass


func _on_file_dialog_file_selected(path):
	#var image = ResourceLoader.load(path)
	print(path)
	var image = Image.load_from_file(path)
	if image != null:
		$TextureRect.texture = ImageTexture.create_from_image(image)
	else:
		$SadLabel.text = "This cannot be loaded!"
	
	
