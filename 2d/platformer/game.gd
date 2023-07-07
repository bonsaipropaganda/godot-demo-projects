class_name Game extends Node

# node references
@onready var _pause_menu := $InterfaceLayer/PauseMenu as PauseMenu
@onready var player := $Level/Player
@onready var heart_container := $InterfaceLayer/HeartContainer

func _ready() -> void:
	heart_container.set_max_hearts(player.max_health)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"toggle_fullscreen"):
		var mode := DisplayServer.window_get_mode()
		if mode == DisplayServer.WINDOW_MODE_FULLSCREEN or \
				mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		get_tree().root.set_input_as_handled()

	elif event.is_action_pressed(&"toggle_pause"):
		var tree := get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			_pause_menu.open()
		else:
			_pause_menu.close()
		get_tree().root.set_input_as_handled()


func _on_player_player_death() -> void:
	$Level/Player.position = $StartPos.position
