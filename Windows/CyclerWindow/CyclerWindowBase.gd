extends VBoxContainer

var images_to_cycle = [] # Todo, get this from SettingsManager in the ready func

func _ready():
	var vwindow:Window = get_window()
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

func _on_back_button_pressed():
	# Make sure windows are normal
	set_opaque_window()
	get_window().always_on_top = false

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


