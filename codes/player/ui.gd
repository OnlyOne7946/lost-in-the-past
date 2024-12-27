extends Control



func _on_return_pressed():
	Global.health = 100
	$CanvasLayer/dead_menu.hide()
	$"..".position = Vector2.ZERO
	$"..".show()


func _on_quit_pressed():
	if $AnimationPlayer.current_animation != "quit":
		$ColorRect.visible = true
		$ColorRect.top_level = true
		$AnimationPlayer.play("quit")
		get_tree().quit()                       
