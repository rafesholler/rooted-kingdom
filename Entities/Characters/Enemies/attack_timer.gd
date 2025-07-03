@tool
extends Timer
class_name AttackTimer

enum AttackModes {
	SIMPLE,
	RANDOM_RANGE
}

@export var attack_mode: AttackModes :
	get:
		return attack_mode
	set(value):
		attack_mode = value
		notify_property_list_changed()

var simple_time: float

var range_floor: float
var range_ceiling: float


func run() -> void:
	if not is_stopped():
		return
	
	match attack_mode:
		AttackModes.SIMPLE:
			start(simple_time)
		
		AttackModes.RANDOM_RANGE:
			start(randf_range(range_floor, range_ceiling))


func _get_property_list() -> Array[Dictionary]:
	var arr: Array[Dictionary] = []
	
	match attack_mode:
		AttackModes.SIMPLE:
			arr.append({
				"name": "Time",
				"type": TYPE_FLOAT,
				"hint": PROPERTY_HINT_RANGE,
				"hint_string": "0,10,or_greater"
			})
	
		AttackModes.RANDOM_RANGE:
			arr.append({
				"name": "Floor",
				"type": TYPE_FLOAT,
				"hint": PROPERTY_HINT_RANGE,
				"hint_string": "0,10,or_greater"
			})
			
			arr.append({
				"name": "Ceiling",
				"type": TYPE_FLOAT,
				"hint": PROPERTY_HINT_RANGE,
				"hint_string": "0,10,or_greater"
			})
	
	return arr

func _get(property: StringName) -> Variant:
	match property:
		"Time":
			return simple_time
			
		"Floor":
			return range_floor
		
		"Ceiling":
			return range_ceiling
			
	return null

func _set(property: StringName, value: Variant) -> bool:
	var found = true
	
	match property:
		"Time":
			simple_time = value
		
		"Floor":
			range_floor = value
		
		"Ceiling":
			range_ceiling = value
		
		_:
			found = false
			
	return found
