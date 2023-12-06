extends ItemData
class_name ItemDataEquip


@export var max_hp: int # Increases max HP by this value -- try to keep HP as low as possible
@export var max_mp: int # Increases max MP -- MP is used to cast spells and refills slowly
@export var max_sp: int # Increases max SP -- SP is used when blocking and attacking and refills quickly

@export var hp_regen: int # HP regen ticks every 30 seconds - this is a rare bonus that makes the game much easier
@export var mp_regen: int # MP regen ticks every 3 seconds - very important for anyone who likes magic
@export var sp_regen: int # SP regen ticks every 0.3 seconds - this can be easily broken so don't tamper too much

@export var attack: int # how much damage your melee attacks do -> Good for fighters
@export var defense: int # affects incoming physical damage -- swords, rocks, arrows, bites, claws, etc are all physical

@export var magic_attack: int # how much damage your magic does -> Good for sorcerers
@export var magic_defense: int # affects incoming magic damage -- fire, ice, electric, dark, holy, etc are all magic

@export var evasion: int # All enemies have a baked in 'Accuracy' stat. For each point that your evasion exceeds their Accuracy, you gain a 1% chance to evade incoming damage

@export var life_steal: int # for melee attacks, restore a % of damage dealt as HP
@export var mana_steal: int # for melee attacks, restore a % of damage dealt as MP

@export var minion_attack: int # how much damage your minions do -- a flat bonus -> VERY GOOD for summoners
@export var minion_hp: int # when summoned, your minions gain a flat bonus to HP
@export var minion_duration: int # For summons that have a duration, increases that duration for 1s per point
