extends Node

const WalkToBtn = 0b100000000
const OpenBtn   = 0b010000000
const PushBtn   = 0b001000000
const LookAtBtn = 0b000100000
const CloseBtn  = 0b000010000
const PullBtn   = 0b000001000
const TalkToBtn = 0b000000100
const GiveBtn   = 0b000000010
const OperateBtn= 0b000000001

var current_verb = ""

func set_current_verb(value):
	current_verb = value
	
func get_current_verb():
	return current_verb

func can_use_verb(verb,verblist):
	var LogicOk = (verb & verblist) / verblist
	print("Verb: %s, VerbList: %s, LogicOk: %s" % [verb, verblist, str(LogicOk)])
