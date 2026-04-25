#显示logo
function leap_of_crystal_realm:animation/logo/main

#第一个玩家默认是房主
execute unless entity @a[tag=leap_of_crystal_realm.op] run tag @s add leap_of_crystal_realm.op

#调默认设置
data modify storage leap_of_crystal_realm:main settings set value {sounds:true,particle:true,animation:true}