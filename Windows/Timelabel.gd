extends Label


# Called when the node enters the scene tree for the first time.
const INFO_STRING = "Timeleft: "

func update_time_left(total_seconds:int):
	var minutes = total_seconds / 60
	var seconds = total_seconds % 60
	var time_string = str(minutes) + ":" + str(seconds).lpad(2, "0")
	self.text = INFO_STRING + time_string
