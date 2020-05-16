extends Area2D

func _ready():
	pass

func _on_Sierra_body_entered(body):
	if body.name == "Jugador":
		$AnimationPlayer.play("activated")

func _on_DamageArea2D_body_entered(body):
	if body.name == "Jugador":
		body.hurt_sierra()
