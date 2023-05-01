extends Node2D


@export var foodScene = preload("res://Scenes/food.tscn")
@export var shootForce = 500
@export var shootAngle = 60

@onready var foodContainer = $FoodContainer

var loadedFood

signal foodLaunched
	
func _unhandled_input(_event):
	if (Input.is_action_just_pressed("Shoot")):
		LoadFood()
		
	if (Input.is_action_just_released("Shoot")):
		LaunchFood()
	
	if (Input.is_action_just_pressed("Reset")):
		get_tree().reload_current_scene()
		
		
func LoadFood():
	print("Food loaded")
	var foodInstance = foodScene.instantiate()
	foodInstance.gravity_scale=0
	foodInstance.global_position = global_position
	#print(foodInstance)
	foodContainer.add_child(foodInstance)
	loadedFood = foodInstance
	

func LaunchFood():
	print("Food launched")
	loadedFood.gravity_scale=1
	var target = get_global_mouse_position()
	var directionToMouse = loadedFood.global_position.direction_to(target).normalized()
	loadedFood.fire(directionToMouse * shootForce)
	foodLaunched.emit()
	
	
	
	
