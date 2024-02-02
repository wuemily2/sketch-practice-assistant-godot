extends VBoxContainer

func _ready():
	pass

# Called when the node enters the scene tree for the first time.
func get_file_object_list():
	return $FileSelectList.get_entries()

func _on_file_dialog_pop_up_button_pressed():
	$FileDialog.show()

func _on_removal_button_pressed():
	$FileSelectList.remove_entries($FileSelectList.get_selected_items())
