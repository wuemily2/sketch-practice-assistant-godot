extends Container


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _notification(what):
	# Sort children (queue_sort()) is always called when the size of this container node changes
	if what == NOTIFICATION_SORT_CHILDREN:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
