extends Node


var file_array = []
enum {FILE, DIR} # Enums are ints. 
var timer_base_time = 300 + 1
var depth = 10
var accepted_image_extensions = [".jpg", ".jpeg", ".webp", ".png"]

func set_base_time(time:int):
	timer_base_time = time + 1 # spend 1 second showing the actual {time}

func is_valid_image(filename:String):
	return accepted_image_extensions.has(filename.get_extension().to_lower())

func get_all_images_by_depth(directory:String, depth:int):
	var dir_list = []
	var images_list = []
	var dir = DirAccess.open(directory)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				dir_list.append(directory + "/" + file_name)
			else:
				if is_valid_image(file_name):
					images_list.append(directory + "/" + file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		return []
		
	if depth > 0:
		for nested_dir in dir_list:
			images_list.append_array(
				get_all_images_by_depth(nested_dir, depth - 1))
	
	return images_list
	

func get_all_images():
	var images_list = []
	for file_object_tuple in file_array:
		var type = file_object_tuple[1]
		var file_path = file_object_tuple[0]
		if type == FILE and is_valid_image(file_path.get_file()):
			images_list.append(file_path)
		else:
			images_list.append_array(get_all_images_by_depth(file_path, depth))
	return images_list
