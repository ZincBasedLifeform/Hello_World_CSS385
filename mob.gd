extends RigidBody2D
var collided = false
# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if collided:
		set_modulate(lerp(get_modulate(), Color(1,1,1,0), 0.2))

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	$CollisionShape2D.set_deferred("disabled", true)
	collided = true
	
