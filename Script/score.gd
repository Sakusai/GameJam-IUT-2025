extends CanvasLayer
class_name Score

static var score: int = 0
static var ammunition: int = 6
static var reloading = ""
func _ready():
	reset_score()
	show()
	update()
	
func _process(delta):
	update()
	
func update():
	$score/score_label.text = str(score)
	$ammunition/ammunition_label.text = str(ammunition)
	$ammunition/reloading.text = reloading
static func _shoot():
	ammunition -=1
	
static func _reload():
	ammunition = 6
	reloading = "Reloading..."

static func _kill_goblin(minus):
	score += 55 - minus

static func _kill_archer(minus):
	score += 110 - minus
	
static func _kill_Knight(minus):
	score += 220 - minus

static func get_score():
	return score

static func reset_score():
	score = 0
	ammunition = 6

func _on_pirate_reloading() -> void:
	reloading = ""


func _on_pirate_death() -> void:
	hide()
