extends SpinBox


# Called when the node enters the scene tree for the first time.
func _ready():
	# Get any existing settings
	self.value = SettingsManager.depth


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
