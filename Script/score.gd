extends CanvasLayer
class_name Score

static var score: int = 0

func _ready():
	update()
	
func _process(delta):
	update()
	
func update():
	$Label/Label.text = str(score)
	
static func _kill_goblin(minus):
	score += 55 - minus

static func _kill_archer(minus):
	score += 110 - minus
	
static func _kill_Knight(minus):
	score += 220 - minus
