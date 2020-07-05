extends Area2D


func _on_Item_body_entered(body):
	if body.is_in_group("Jugadores"):
		body.mis_gemas += 1
		print('Gemas en inventario: '+ String(body.mis_gemas))
		$Tween.interpolate_property(self, "modulate",
		Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.4,
		Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.start()

func _on_Tween_tween_all_completed():
	queue_free()
