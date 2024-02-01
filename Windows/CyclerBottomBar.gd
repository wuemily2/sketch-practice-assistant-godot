extends Container

signal timeout() # Timer timed out
signal next_button_pressed() # next button is clicked
signal previous_button_pressed() # previous button is clicked
signal toggle_image_on()
signal toggle_image_off()

var playing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	# TODO: this is experimental so remove later
	start_timer(SettingsManager.timer_base_time)
	playing = true
	$CyclerMenu/PausePlay.text = "Pause"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Constantly update the time
	$ToggleButtons/Timelabel.update_time_left($Timer.get_time_left())

func start_timer(seconds):
	$Timer.start(seconds)
	play_timer()
	
func clean_timer_stop():
	pause_timer()
	$Timer.stop()
	
func pause_timer():
	playing = false
	$CyclerMenu/PausePlay.text = "Play"
	$Timer.set_paused(true)

func play_timer():
	playing = true
	$CyclerMenu/PausePlay.text = "Pause"
	$Timer.set_paused(false)

func _on_pause_play_pressed():
	if playing:
		pause_timer()
	else:
		play_timer()
		
func _on_go_forward_pressed():
	# Make sure timer can start again by unpausing, and stop the timer for now
	clean_timer_stop()
	emit_signal("next_button_pressed")
	start_timer(SettingsManager.timer_base_time)
	# Trigger a toggle signal if pressed is set to new boolean
	$ToggleButtons/VisibilityButton.set_pressed(false)
	
	
func _on_go_back_pressed():
	clean_timer_stop()
	emit_signal("previous_button_pressed")
	start_timer(SettingsManager.timer_base_time)
	# Trigger a toggle signal if pressed is set to new boolean
	$ToggleButtons/VisibilityButton.set_pressed(false)

func _on_timer_timeout():
	emit_signal("timeout")

func _on_visibility_button_toggled(toggled_on):
	if toggled_on:
		# print("on!")
		emit_signal("toggle_image_on")
	else:
		# print("off!")
		emit_signal("toggle_image_off")

func _on_always_on_top_button_pressed():
	get_window().always_on_top = !get_window().always_on_top

func _on_transparent_toggle_pressed():
	# Only works if transparent = true in the project settings
	get_tree().get_root().transparent_bg = !get_tree().get_root().transparent_bg



