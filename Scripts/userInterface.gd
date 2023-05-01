extends CanvasLayer


func updateShots():
	$BurgersLaunched.text = str(int($BurgersLaunched.text)+1)

func _on_start_button_pressed():
	toggleUI()

func _on_restart_button_pressed():
	toggleUI()
	get_tree().reload_current_scene()
	
func toggleUI():
	$BurgersLaunched.visible = not $BurgersLaunched.visible
	$BurgersLaunchedMessage.visible = not $BurgersLaunchedMessage.visible
	$MainSplash.visible = not $MainSplash.visible
	$StartButton.visible = not $StartButton.visible
	$RestartButton.visible = not $RestartButton.visible

func _on_player_food_launched():
	updateShots()

func _on_level_deliveries_complete():
	$WinButton.visible = true
