extends Camera2D
#
#@export var randomStrength: float = 30.0
#@export var shakeFade: float = 5.0
#
#var rng = RandomNumberGenerator.new()
#
#var shake_strength: float = 0.0
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#func applyShake():	shake_strength = randomStrength;
	#return
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
#
#func randomOffset() -> Vector2:
	#return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
