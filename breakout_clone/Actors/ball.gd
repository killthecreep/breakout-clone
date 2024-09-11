extends CharacterBody2D

@export var SPEED = 600.0
@export var max_speed: float = 1800.0
@export var paddle_particle: CPUParticles2D
@export var score_label: RichTextLabel
@export var lifes_label: RichTextLabel
@export var start_text: RichTextLabel


var forward = Vector2(1,1).normalized()
const PADDLE_WIDTH: float = 100.0
var current_score: int = 0
var is_running: bool = false
var gameOver: bool = false

var lifes: int = 3
#func _ready() -> void:
#velocity - Vector2(1,1).normalized()

func _physics_process(delta: float) -> void:
	if (not is_running):
		if (Input.is_action_just_pressed("click_window")):
			is_running = true
			start_text.visible = false
			visible = true 
		return
	
	var collision: KinematicCollision2D = move_and_collide(forward * SPEED * delta)
	
	if (collision):
		forward = forward.bounce(collision.get_normal())
		SPEED = clamp(SPEED + 0.5, 1, max_speed)
		
		
		if (collision.get_collider().is_in_group("Bricks")):
			collision.get_collider().queue_free()
			current_score += 10
			
			
			score_label.text = ("SCORE: " + str(current_score))
		
		if (collision.get_collider().is_in_group("SlowMoPowerUp")):
			Engine.time_scale = 0.5;
			$SlowMo.start(5.0)
			
		if (collision.get_collider().is_in_group("SpeedoPowerUp")):
			Engine.time_scale = 1.5;
			$SlowMo.start(8.0)
		
		if (collision.get_collider().is_in_group("Paddle")):
			
			var paddle_x = collision.get_collider().position.x - 50
			var pos_on_paddle = (position.x - paddle_x) / PADDLE_WIDTH
			print("Hit the paddle!" + str(pos_on_paddle))
			paddle_particle.emitting = true;
			var bounce_angle = lerp(-PI * 0.8, -PI * 0.2, pos_on_paddle)
			forward = Vector2.from_angle(bounce_angle)
		
		if (collision.get_collider().is_in_group("GameOver")):
			gameOver = true
			is_running = false
			start_text.visible = true
			lifes -= 1
			print("LIFES: " + str(lifes))
			get_tree().reload_current_scene()
			lifes_label.text = ("LIFES: " + str(lifes))
			if(lifes <= 0):
				start_text.text = "Game Over"
			
		
	



func _on_slow_mo_timeout() -> void:
	Engine.time_scale = 1
	
#func applyShake(delta):
	#noise_strength = random_strength;
	#if noise_strength > 0:
		#lerpf(noise_strength, 0, noise_decay * delta)
		## offset = randomOffset()
	#return
	
#func randomOffset() -> Vector2:
	#return Vector2(rng.randf_range(-noise_strength, noise_strength), rng.randf_range(-noise_strength, noise_strength))
