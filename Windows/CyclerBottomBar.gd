extends Container

signal timeout() # Timer timed out
signal next() # next button is clicked
signal previous() # previous button is clicked
var playing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	position_children()
	# TODO: this is experimental so remove later
	start_timer(SettingsManager.timer_base_time)
	playing = true
	$CyclerMenu/PausePlay.text = "Pause"

func _notification(what):
	# Sort children (queue_sort()) is always called when the size of this container node changes
	if what == NOTIFICATION_SORT_CHILDREN:
		position_children()
		
func position_children():
	var parent_width = self.size.x
	var parent_height = self.size.y
	
	# Cycler Menu
	$CyclerMenu.size.x = parent_width * 0.6
	$CyclerMenu.size.y = parent_height
	$CyclerMenu.set_position(Vector2i(parent_width * 0.2, 0))
	
	# Timer Display
	$Timelabel.set_size(Vector2i(parent_width * 0.1, parent_height))
	$Timelabel.set_position(Vector2i(parent_width * 0.9, 0))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Constantly update the time
	$Timelabel.update_time_left($Timer.get_time_left())

func start_timer(seconds):
	$Timer.start(seconds)
	
func clean_timer_stop():
	$Timer.set_paused(false)
	$Timer.stop()

func _on_pause_play_pressed():
	if playing:
		playing = false
		$CyclerMenu/PausePlay.text = "Play"
		$Timer.set_paused(true)
	else:
		playing = true
		$CyclerMenu/PausePlay.text = "Pause"
		$Timer.set_paused(false)
		
func _on_go_forward_pressed():
	# Make sure timer can start again by unpausing, and stop the timer for now
	clean_timer_stop()
	emit_signal("next")
	$Timer.start(SettingsManager.timer_base_time)
	
func _on_go_back_pressed():
	clean_timer_stop()
	emit_signal("previous")
	$Timer.start(SettingsManager.timer_base_time)

func _on_timer_timeout():
	emit_signal("timeout")






