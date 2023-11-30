extends CanvasLayer

class_name UI

@onready var lifes_label = %LifesLabel
@onready var game_lost_container = $GameLostContainer
@onready var level_won_container = $LevelWonContainer

#Audio
@onready var game_lost_sound = $"../GameLostSound"
@onready var game_won_sound = $"../GameWonSound"
@onready var background_sound = $"../BackgroundSound"
@onready var level_passed_sound = $"../LevelPassedSound"


func set_lifes(lifes: int):
	lifes_label.text = "Lifes: %d" % lifes

func game_over():
	game_lost_container.show()
	background_sound.stop()
	game_lost_sound.play()
	

func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()

func on_level_won():
	level_won_container.show()
	background_sound.stop()
	level_passed_sound.play()

func _on_level_won_button_pressed():
	LevelDefinitions.current_level = 2
	get_tree().reload_current_scene()
	background_sound.stop()
	game_won_sound.play()
