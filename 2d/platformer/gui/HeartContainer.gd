extends HBoxContainer

var HeartGuiClass = preload("res://gui/HeartGui.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_max_hearts(max):
	for i in max:
		var heart = HeartGuiClass.instantiate()
		add_child(heart)
