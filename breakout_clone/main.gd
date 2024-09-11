extends Node2D

@export var random_strength: float = 30.0
@export var noise_decay: float = 5.0
@export var noise_speed: float = 30.0

var rng = RandomNumberGenerator.new()
var noise_strength: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func applyShake():
	noise_strength = random_strength;
	
func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-noise_strength, noise_strength), rng.randf_range(-noise_strength, noise_strength))
