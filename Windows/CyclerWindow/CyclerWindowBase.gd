extends VBoxContainer

var images_to_cycle = [] # Todo, get this from SettingsManager in the ready func
var current_image = 0

func _ready():
	var vwindow:Window = get_window()
	vwindow.size_changed.connect(on_size_changed)
	resize_self()
	images_to_cycle = SettingsManager.get_all_images()
	# Get first image
	load_image()
	
func on_size_changed():
	#print("size changed!")
	# Expand size to fit screen, and fill 80% of the height
	resize_self()

func resize_self():
	self.position.x = 0
	self.position.y = 0
	self.size.x = get_viewport().size.x
	self.size.y = get_viewport().size.y
	
func load_image():
	if images_to_cycle.size() == 0:
		$ImageStack/Label.text = "No images selected!"
		return
	var image_path:String = images_to_cycle[current_image]
	$TopBarStack/TopBar/PathLabel.text = image_path
	var image = Image.load_from_file(image_path)
	if image != null:
		$ImageStack/Label.text = ""
		$ImageStack/CycledImage.texture = ImageTexture.create_from_image(image)
	else:
		$ImageStack/CycledImage.texture = null
		$ImageStack/Label.text = \
			"This image is incompatible."

func _on_back_button_pressed():
	# Make sure windows are normal
	set_opaque_window()
	get_window().always_on_top = false
	SceneManager.goto_scene("res://Windows/ConfigurationWindow/ConfigMainWindow.tscn")

func set_transparent_window():
	get_tree().get_root().transparent_bg = true
	for node in self.find_children("ColorRect"):
		node.hide()
		
func set_opaque_window():
	get_tree().get_root().transparent_bg = false
	for node in self.find_children("ColorRect"):
		node.show()

func _on_cycler_bottom_bar_toggle_transparent_on():
	set_transparent_window()


func _on_cycler_bottom_bar_toggle_transparent_off():
	set_opaque_window()

func _on_cycler_bottom_bar_timeout():
	go_to_next()

func go_to_next():
	current_image = current_image + 1
	if current_image >= images_to_cycle.size():
		current_image = 0
	load_image()

func _on_cycler_bottom_bar_next_button_pressed():
	go_to_next()


func go_back():
	current_image = current_image - 1
	if current_image < 0:
		current_image = images_to_cycle.size() - 1
	load_image()

func _on_cycler_bottom_bar_previous_button_pressed():
	go_back()


func _on_cycler_bottom_bar_toggle_image_on():
	$ImageStack/CycledImage.hide()

func _on_cycler_bottom_bar_toggle_image_off():
	$ImageStack/CycledImage.show()
