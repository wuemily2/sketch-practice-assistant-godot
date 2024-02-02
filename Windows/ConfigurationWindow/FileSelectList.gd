extends ItemList
# Need to maintain a one to one list with this with item list entries and 
# TODO: We could add more robust error checking or define or own types for that here
# https://docs.godotengine.org/en/stable/tutorials/best_practices/what_are_godot_classes.html
var file_objects_list:Array = [] # each element in the form Array[string, int]

# Called when the node enters the scene tree for the first time.
func _ready():
	self.clear() # Remove any existing entries added in viewport or something
	# Get previously stored selections, if any
	file_objects_list = SettingsManager.file_array
	for entry in file_objects_list:
		add_entry_to_list_view(entry[0], entry[1])

func add_entry(file:String, type:int):
	if !file.is_absolute_path(): # File Dialog selects absolute paths
		return # Don't do anything if trying to add the wrong entries
	file_objects_list.append([file, type])
	add_entry_to_list_view(file, type)
	
func add_entry_to_list_view(verified_file:String, type:int):
	var representation_string = ""
	var format_string = "({object_type}) - {end_name} - {path}"
	if type == SettingsManager.DIR: #a Directory
		representation_string = \
		format_string.format({"object_type": "Dir", 
							"end_name":verified_file.get_file(),
							"path": verified_file})
	else: # a File
		representation_string = \
		format_string.format({"object_type": "File", 
							"end_name":verified_file.get_file(),
							"path": verified_file})
	self.add_item(representation_string)

func remove_entry(index: int):
	file_objects_list.remove_at(index)
	self.remove_item(index)
	
func remove_entries(index_array):
	#Just in case we get an Array instead of PackedInt32Array
	index_array = PackedInt32Array(index_array)
	index_array.sort() # Sort ascending
	# Remove objects while accounting for shifts in index
	for i in range(index_array.size()):
		remove_entry(index_array[i] - i)
		
func get_entries():
	return file_objects_list

func _on_file_dialog_file_selected(path):
	add_entry(path, SettingsManager.FILE)


func _on_file_dialog_dir_selected(dir):
	add_entry(dir, SettingsManager.DIR)
