extends VBoxContainer


# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_time_selected():
	if $TimeSelections.is_anything_selected():
		# Note that this selection box only allows one thing
		var selected_index = $TimeSelections.get_selected_items()[0]
		var selected_time:String = $TimeSelections.get_item_text(selected_index)
		match selected_time:
			"10s":
				return 10
			"30s":
				return 30
			"60s":
				return 60
			"2m":
				return 120
			"5m":
				return 300
			"10m":
				return 600
			"30m":
				return 1800
	# Nothing selected, or CUSTOM selected
	return $CustomTimeBox.get_time()

func _on_time_box_value_changed(_value):
	$TimeSelections.select(0)
