# Give transformation item
give @s minecraft:nether_star{display:{Name:'{"text":"Gon\'s Covenant","color":"red","italic":false}',Lore:['{"text":"Sneak for 5 seconds while holding","color":"gray","italic":false}','{"text":"to transform at the cost of energy","color":"gray","italic":false}','{"text":" ","color":"gray","italic":false}','{"text":"\\"I don\'t care if this is the end...\\"","color":"dark_red","italic":true}']},GonTransformation:1b,Enchantments:[{id:"minecraft:unbreaking",lvl:1}]} 1

# Give instructions
tellraw @s [{"text":"You received ","color":"green"},{"text":"Gon's Covenant","color":"red","bold":true}]
tellraw @s [{"text":"Hold it and sneak for 5 seconds to transform!","color":"yellow"}]
