extends VBoxContainer

# Access the time
func get_time():
	return $BottomHalf/TimeSelectMenu.get_time_selected()

# Access selected files
func get_file_object_list():
	return $TopHalf/DirOptionsVBox.get_file_object_list()

# Change the depth setting statically
func _on_depth_spin_box_value_changed(value):
	SettingsManager.depth = value

# Go to the Cycler Window!
func _on_start_button_pressed():
	if get_file_object_list() == []:
		return
	
	# Save user settings
	SettingsManager.file_array = get_file_object_list()
	SettingsManager.set_base_time(get_time())
	
	# Change scene
	SceneManager.goto_scene("res://Windows/CyclerWindow/CyclerWindowBase.tscn")

