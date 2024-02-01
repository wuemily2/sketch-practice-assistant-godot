extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	# Adjust window based on screen size for any device
	var window = get_window()
	var screen_size = DisplayServer.screen_get_size()
	var screen_width = screen_size.x
	var screen_height = screen_size.y
	window.set_position(Vector2i(screen_width * 0.1, screen_height * 0.1))
	window.set_size(Vector2i(screen_width * 0.8, screen_height * 0.8))
