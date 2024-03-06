extends CharacterBody2D

signal _player_hit

var playerNode
var speed = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	playerNode = get_node("/root/main/player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = (playerNode.position - position).normalized() * delta * speed
	var collided = move_and_collide(velocity)
	if collided != null:
		if collided.get_collider().name == "player":
			emit_signal("_player_hit")
			print("player hit!")
