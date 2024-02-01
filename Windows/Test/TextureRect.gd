extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	# Place at 10% down the screen y length, and 0% from the screen x length
	self.position.x = 0
	self.position.y = get_viewport().size.y * 0.1
	# Expand size to fit screen, and fill 80% of the height
	self.size.x = get_viewport().size.x
	self.size.y = get_viewport().size.y * 0.8
	# This binds correctly but is only called once...
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	self.position.x = 0
	self.position.y = get_viewport().size.y * 0.1
	# Expand size to fit screen, and fill 80% of the height
	self.size.x = get_viewport().size.x
	self.size.y = get_viewport().size.y * 0.8

func _notification(what):
	if what == NOTIFICATION_WM_SIZE_CHANGED:
		print("yes")
		self.position.x = 0
		self.position.y = get_viewport().size.y * 0.1
		# Expand size to fit screen, and fill 80% of the height
		self.size.x = get_viewport().size.x
		self.size.y = get_viewport().size.y * 0.8

