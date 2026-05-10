#import "模板.typ": *
#show: template-style
= a<subsec:tags_common_to_all_block_entities>
?<data:item_data>?<data:tags_common_to_all_entities>
#heading(level: 4, numbering: none, [所有种类旗帜（`banner`）#footnote[括号内为该方块实体的命名空间ID，`minecraft` 的命名空间前缀已省略。此值被存储在方块实体共通标签中的 #icon("nbt-string") `id` 中。]])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 可选，该旗帜的自定义名称，需要为文本组件。]),
  (1, [#icon("nbt-list") *patterns*: 可选，按顺序使用的旗帜图案。列表中复合标签的次序越靠前，其对应的图案在旗帜上的层级就越往下。]),
  (2, [#icon("nbt-compound") 一个单独的旗帜图案。]),
  (3, [#icon("nbt-string") *#underline[color]*: 图案的颜色。有效值有 `black`（黑色）、`blue`（蓝色）、`brown`（棕色）、`cyan`（青色）、`gray`（灰色）、`green`（绿色）、`light_blue`（淡蓝色）、`light_gray`（淡灰色）、`lime`（黄绿色）、`magenta`（品红色）、`orange`（橙色）、`pink`（粉红色）、`purple`（紫色）、`red`（红色）、`white`（白色）、`yellow`（黄色）。]),
  (3, [#icon("nbt-string")#icon("nbt-compound") *#underline[pattern]*: 图案的类型，当使用 #icon("nbt-string") 字符串形式时，值为图案的命名空间ID。旗帜图案可由数据包自定义，在数据包内的相应文件为 #icon("json") `data > <命名空间> > banner_pattern > <ID>.json`。也可以以内联SNBT的形式直接在此处定义一个图案类型，此时使用 #icon("nbt-compound") 复合标签形式。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则以下字段：*], false),
  (4, [#icon("nbt-string") *asset_id*: 资源包内旗帜图案纹理的命名空间ID，文件路径为 #icon("png") `assets > <命名空间> > textures > entity > banner > <路径>.png`。]),
  (4, [#icon("nbt-string") *translation_key*: 该旗帜图案的翻译标识符前缀，游戏解析时会加上 #icon("nbt-string") `color` 字段的值作为后缀。])
)
#heading(level: 4, numbering: none, [木桶（`barrel`）、箱子和所有种类铜箱子（`chest`）、发射器（`dispenser`）、投掷器（`dropper`）、潜影盒（`shulker_box`）、陷阱箱（`trapped_chest`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 该方块实体的名称，即该容器在GUI上显示的名称。使用文本组件。]),
  (1, [#icon("nbt-list") *Items*: 箱子内的物品。列表中每个元素都是一个物品堆叠。]),
  (2, [#icon("nbt-compound") 一个物品。]),
  (3, link(<data:item_data>)[带槽位物品格式]),
  (1, [#icon("nbt-compound") *lock*: 玩家可以用于打开该容器的物品，使用物品堆叠谓词来判断。]),
  (2, [#icon("nbt-compound") *components*: 检查物品的堆叠组件，只有当物品堆叠组件完全相同时才匹配成功。]),
  (3, [*\<组件名称>*: 一项组件及匹配的内容。]),
  (2, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品的堆叠数量，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个数量区间。]),
  (3, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
  (3, [#icon("nbt-int") *max*: 最大值。]),
  (3, [#icon("nbt-int") *min*: 最小值。]),
  (2, [#icon("nbt-string")#icon("nbt-list") *items*: 匹配的物品，可以是 #icon("nbt-string") 命名空间ID或物品数据包标签。也可以使用 #icon("nbt-list") 列表形式以尝试匹配列表中任意物品。]),
  (3, [*若使用 #icon("nbt-list") 列表形式，则有以下字段：*], false),
  (3, [#icon("nbt-string") 一项物品，可以是命名空间ID或物品数据包标签。]),
  (2, [#icon("nbt-compound") *predicates*: 检查该物品是否匹配指定的数据组件谓词。]),
  (3, [*\<数据组件谓词ID>*: 一项数据组件谓词及匹配的内容。]),
  (1, [#icon("nbt-string") *LootTable*: 在此容器第一次被打开时为生成战利品所使用的战利品表，需要是战利品表的命名空间ID。战利品生成后此标签被删除。]),
  (1, [#icon("nbt-long") *LootTableSeed*: 生成战利品使用的种子，如果不存在该标签或值为 `0l` 则使用随机序列。战利品生成后此标签被删除。])
)
#heading(level: 4, numbering: none, [信标（`beacon`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 该方块实体的名称，即该信标在GUI上显示的名称。使用文本组件。]),
  (1, [#icon("nbt-int") *Levels*: 金字塔的可用等级，无法被 `/data` 修改。]),
  (1, [#icon("nbt-compound") *lock*: 玩家可以用于打开该信标的物品，使用物品堆叠谓词来判断。]),
  (2, [#icon("nbt-compound") *components*: 检查物品的堆叠组件，只有当物品堆叠组件完全相同时才匹配成功。]),
  (3, [*\<组件名称>*: 一项组件及匹配的内容。]),
  (2, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品的堆叠数量，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个数量区间。]),
  (3, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
  (3, [#icon("nbt-int") *max*: 最大值。]),
  (3, [#icon("nbt-int") *min*: 最小值。]),
  (2, [#icon("nbt-string")#icon("nbt-list") *items*: 匹配的物品，可以是 #icon("nbt-string") 命名空间ID或物品数据包标签。也可以使用 #icon("nbt-list") 列表形式以尝试匹配列表中任意物品。]),
  (3, [*若使用 #icon("nbt-list") 列表形式，则有以下字段：*], false),
  (3, [#icon("nbt-string") 一项物品，可以是命名空间ID或物品数据包标签。]),
  (2, [#icon("nbt-compound") *predicates*: 检查该物品是否匹配指定的数据组件谓词。]),
  (3, [*\<数据组件谓词ID>*: 一项数据组件谓词及匹配的内容。]),
  (1, [#icon("nbt-string") *primary_effect*: 信标主效果的命名空间ID。]),
  (1, [#icon("nbt-string") *secondary_effect*: 信标辅助效果的命名空间ID。])
)
#heading(level: 4, numbering: none, [床（`bed`）、钟（`bell`）、阳光探测器（`daylight_detector`）、末地传送门（`end_portal`）、末影箱（`ender_chest`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签])
)
#heading(level: 4, numbering: none, [蜂巢和蜂箱（`beehive`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-list") *#underline[bees]*: 蜂巢或蜂箱内的蜜蜂信息。]),
  (2, [#icon("nbt-compound") 一只蜜蜂的数据。该实体必须为具有数据包标签 `#beehive_inhabitors` 的实体。]),
  (3, [#icon("nbt-compound") *entity_data*: 此蜜蜂的部分实体数据。]),
  (4, [#link(<data:tags_common_to_all_entities>)[实体格式]，其中不含以下标签：#icon("nbt-short") `Air`、#icon("nbt-compound") `Brain`、#icon("nbt-int") `CannotEnterHiveTicks`、#icon("nbt-bool") `CanPickUpLoot`、#icon("nbt-int") `CropsGrownSincePollination`、#icon("nbt-short") `DeathTime`、#icon("nbt-compound") `drop_chances`、#icon("nbt-compound") `equipment`、#icon("nbt-float") `FallDistance`、#icon("nbt-bool") `FallFlying`、#icon("nbt-short") `Fire`、#icon("nbt-int_array") `hive_pos`、#icon("nbt-int") `HurtByTimestamp`、#icon("nbt-short") `HurtTime`、#icon("nbt-int_array")#icon("nbt-compound") `leash`、#icon("nbt-bool") `LeftHanded`、#icon("nbt-list") `Motion`、#icon("nbt-bool") `NoGravity`、#icon("nbt-bool") `OnGround`、#icon("nbt-list") `Passengers`、#icon("nbt-int") `PortalCooldown`、#icon("nbt-list") `Pos`、#icon("nbt-list") `Rotation`、#icon("nbt-int_array") `sleeping_pos`、#icon("nbt-int") `TicksSincePollination`、#icon("nbt-int_array") `UUID`。]),
  (3, [#icon("nbt-int") *#underline[min_ticks_in_hive]*: 蜜蜂在巢内停留的最短时间。]),
  (3, [#icon("nbt-int") *#underline[ticks_in_hive]*: 蜜蜂在巢内已经停留的时间。]),
  (1, [#icon("nbt-int_array") *flower_pos*: 花的位置，以供蜜蜂寻花，数组中元素依次为$x$、$y$、$z$坐标。])
)
#heading(level: 4, numbering: none, [高炉（`blast_furnace`）、熔炉（`furnace`）、烟熏炉（`smoker`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-short") *#underline[cooking_time_spent]*: 当前物品已被烧炼的时间。当该值达到 #icon("nbt-short") `cooking_total_time` 时，烧炼完毕，此值重置为 `0s`；当 `lit_time_remaining` 为 `0s` 时，此值每游戏刻减少 `2s`。当该值大于 #icon("nbt-short") `cooking_total_time` 时，无法完成烧炼。]),
  (1, [#icon("nbt-short") *#underline[cooking_total_time]*: 当前物品烧炼完成需要花费的总时间。]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 该方块实体的名称，即该容器在GUI上显示的名称。使用文本组件。]),
  (1, [#icon("nbt-list") *#underline[Items]*: 熔炉内的物品。列表中每个元素都是一个物品堆叠。]),
  (2, [#icon("nbt-compound") 一个物品。]),
  (3, link(<data:item_data>)[带槽位物品格式]),
  (1, [#icon("nbt-short") *#underline[lit_time_remaining]*: 当前燃料离耗尽的时间。]),
  (1, [#icon("nbt-short") *#underline[lit_total_time]*: 高炉、熔炉或烟熏炉应燃烧的总时长。]),
  (1, [#icon("nbt-compound") *lock*: 玩家可以用于打开该容器的物品，使用物品堆叠谓词来判断。]),
  (2, [#icon("nbt-compound") *components*: 检查物品的堆叠组件，只有当物品堆叠组件完全相同时才匹配成功。]),
  (3, [*\<组件名称>*: 一项组件及匹配的内容。]),
  (2, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品的堆叠数量，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个数量区间。]),
  (3, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
  (3, [#icon("nbt-int") *max*: 最大值。]),
  (3, [#icon("nbt-int") *min*: 最小值。]),
  (2, [#icon("nbt-string")#icon("nbt-list") *items*: 匹配的物品，可以是 #icon("nbt-string") 命名空间ID或物品数据包标签。也可以使用 #icon("nbt-list") 列表形式以尝试匹配列表中任意物品。]),
  (3, [*若使用 #icon("nbt-list") 列表形式，则有以下字段：*], false),
  (3, [#icon("nbt-string") 一项物品，可以是命名空间ID或物品数据包标签。]),
  (2, [#icon("nbt-compound") *predicates*: 检查该物品是否匹配指定的数据组件谓词。]),
  (1, [#icon("nbt-compound") *RecipesUsed*: 熔炉从最后一次成品被玩家取出到现在已经完成的配方数，用于计算经验值。]),
  (2, [#icon("nbt-int") *\<配方命名空间ID>*: 此配方烧炼成功的次数。])
)
#heading(level: 4, numbering: none, [酿造台（`brewing_stand`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-short") *#underline[BrewTime]*: 药水酿造完成还需的时间，为 `0s` 时酿造完成，不为 `0s` 时该值每游戏刻减少1。]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 该方块实体的名称，即该酿造台在GUI上显示的名称。使用文本组件。]),
  (1, [#icon("nbt-compound") *lock*: 玩家可以用于打开该酿造台的物品，使用物品堆叠谓词来判断。]),
  (2, [#icon("nbt-compound") *components*: 检查物品的堆叠组件，只有当物品堆叠组件完全相同时才匹配成功。]),
  (3, [*\<组件名称>*: 一项组件及匹配的内容。]),
  (2, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品的堆叠数量，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个数量区间。]),
  (3, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
  (3, [#icon("nbt-int") *max*: 最大值。]),
  (3, [#icon("nbt-int") *min*: 最小值。]),
  (2, [#icon("nbt-string")#icon("nbt-list") *items*: 匹配的物品，可以是 #icon("nbt-string") 命名空间ID或物品数据包标签。也可以使用 #icon("nbt-list") 列表形式以尝试匹配列表中任意物品。]),
  (3, [*若使用 #icon("nbt-list") 列表形式，则有以下字段：*], false),
  (3, [#icon("nbt-string") 一项物品，可以是命名空间ID或物品数据包标签。]),
  (2, [#icon("nbt-compound") *predicates*: 检查该物品是否匹配指定的数据组件谓词。]),
  (1, [#icon("nbt-byte") *#underline[Fuel]*: 酿造台的剩余能量，每次酿造该值就减少1，小于 `0b` 时会消耗燃料，且此值会被重置为 `20b`。]),
  (1, [#icon("nbt-list") *#underline[Items]*: 熔炉内的物品。列表中每个元素都是一个物品堆叠。]),
  (2, [#icon("nbt-compound") 一个物品。]),
  (3, link(<data:item_data>)[带槽位物品格式])
)
#heading(level: 4, numbering: none, [可疑的沙砾和可疑的沙子（`brushable_block`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-int") *hit_direction*: 清刷的方向，用于决定物品渲染的位置，此值无法被 `/data` 修改。可用值区间为 `0` 和 `5` 之间（含），从 `0` 到 `5` 分别为下、上、北、南、西、东方。]),
  (1, [#icon("nbt-compound") *item*: 可疑的方块内含有的物品。]),
  (2, link(<data:item_data>)[无槽位物品格式]),
  (1, [#icon("nbt-string") *LootTable*: 在此方块第一次被清刷时为生成战利品所使用的战利品表，需要是战利品表的命名空间ID。战利品生成后此标签被删除。]),
  (1, [#icon("nbt-long") *LootTableSeed*: 生成战利品使用的种子，如果不存在该标签或值为 `0l` 则使用随机序列。战利品生成后此标签被删除。])
)
#heading(level: 4, numbering: none, [校频幽匿感测体（`calibrated_sculk_sensor`）、幽匿感测体（`sculk_sensor`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-int") *#underline[last_vibration_frequency]*: 上次触发的振动频率。]),
  (1, [#icon("nbt-compound") *listener*: 振动监听器的数据。]),
  (2, [#icon("nbt-compound") *event*: 振动监听器正在监听的游戏事件。无监听内容时该标签不存在。]),
  (3, [#icon("nbt-float") *#underline[distance]*: 振动监听器与振动源的距离。]),
  (3, [#icon("nbt-string") *#underline[game_event]*: 该游戏事件的命名空间ID。]),
  (3, [#icon("nbt-list") *#underline[pos]*: 振动源的位置。列表内元素依次为$x$、$y$、$z$坐标。]),
  (4, [#icon("nbt-double") 一个坐标。]),
  (3, [#icon("nbt-int_array") *projectile_owner*: 若产生振动的实体是弹射物，则此标签为弹射物的UUID。]),
  (3, [#icon("nbt-int_array") *source*: 产生振动的实体的UUID。]),
  (2, [#icon("nbt-int") *event_delay*: 离振动到达还需的时间。]),
  (2, [#icon("nbt-compound") *#underline[selector]*: 振动选择器的数据。]),
  (3, [#icon("nbt-long") *#underline[tick]*: 振动发生时的游戏时间，如果没有振动可供选择则为 `-1l`。]),
  (3, [#icon("nbt-compound") *event*: 候选游戏事件，与上文所述 #icon("nbt-compound") `event` 的结构完全一致。])
)
#heading(level: 4, numbering: none, [营火和灵魂营火（`campfire`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-int_array") *CookingTimes*: 每个物品已被烹饪多长时间，一共有4个元素，依次对应槽位0 \~ 4。]),
  (1, [#icon("nbt-int_array") *CookingTotalTimes*: 每个物品需要被烹饪的时间，一共有4个元素，依次对应槽位0 \~ 4。]),
  (1, [#icon("nbt-list") *#underline[Items]*: 此营火上的物品。列表中每个元素都是一个物品堆叠。]),
  (2, [#icon("nbt-compound") 一个物品。]),
  (3, link(<data:item_data>)[带槽位物品格式])
)
#heading(level: 4, numbering: none, [雕纹书架（`chiseled_bookshelf`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-list") *#underline[Items]*: 此雕纹书架上的物品。列表中每个元素都是一个物品堆叠。]),
  (2, [#icon("nbt-compound") 一个物品。]),
  (3, link(<data:item_data>)[带槽位物品格式]),
  (1, [#icon("nbt-int") *#underline[last_interacted_slot]*: 最后一次交互的槽位编号，可用范围为 `0` 至 `5`（含），槽位顺序为自左上角从左到右、从上到下。若雕纹书架从未使用过则为 `-1`。])
)
#heading(level: 4, numbering: none, [所有种类命令方块（`command_block`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-bool") *#underline[auto]*: 该命令方块是否保持开启。]),
  (1, [#icon("nbt-string") *#underline[Command]*: 命令方块控制台内的命令。]),
  (1, [#icon("nbt-bool") *#underline[conditionMet]*: 如果此命令方块为条件制约，用布尔值表示此命令方块是否满足条件，即指向它的命令方块是否成功执行命令。如果此命令方块为不受制约，则此值为 `false`。]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 该命令方块的名称，使用文本组件。默认名称为 `@`。]),
  (1, [#icon("nbt-long") *LastExecution*: 上一条命令执行的时间戳，若 #icon("nbt-bool") `UpdateLastExecution` 为 `false` 时该标签不存在。]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *LastOutput*: 上一条命令的输出，是一个文本组件。若 #icon("nbt-bool") `TrackOutput` 为 `false` 时该标签不存在。]),
  (1, [#icon("nbt-bool") *#underline[powered]*: 该命令方块是否被激活。]),
  (1, [#icon("nbt-int") *#underline[SuccessCount]*: 命令执行的成功次数。]),
  (1, [#icon("nbt-bool") *TrackOutput*: 是否存储上一条命令的输出。]),
  (1, [#icon("nbt-bool") *UpdateLastExecution*: 是否存储上一条命令执行的时间戳。])
)
#heading(level: 4, numbering: none, [红石比较器（`comparator`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-int") *#underline[OutputSignal]*: 此红石比较器输出的信号强度。])
)
#heading(level: 4, numbering: none, [潮涌核心（`conduit`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-int_array") *Target*: 此潮涌核心正在攻击的生物的UUID。])
)
#heading(level: 4, numbering: none, [所有种类铜傀儡像（`copper_golem_statue`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[除 #icon("nbt-compound") `components` 以外的方块实体共通标签]),
  (1, [#icon("nbt-compound") *components*: 使用此方块实体对应的物品放置此方块实体时，如果物品带有非默认的且不会被继承处理的数据组件，则数据会被复制存储入此标签内。]),
  (2, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *minecraft:custom_name*: 该铜傀儡像的自定义名称，使用文本组件。])
)
#heading(level: 4, numbering: none, [合成器（`crafter`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-int") *#underline[crafting_ticks_remaining]*: 合成器取消合成状态倒计时。当合成器成功合成物品后，此值被设置为6 gt（0.3秒），并将方块属性 `crafting` 设置为 `true`。当此值降低为 `0` 时，`crafting` 设置为 `false`。]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 该合成器的名称，即该合成器在GUI上显示的名称。需要为文本组件。]),
  (1, [#icon("nbt-int_array") *#underline[disabled_slots]*: 合成器内禁用的槽位，使用槽位编号。]),
  (1, [#icon("nbt-list") *Items*: 此合成器内的物品。列表中每个元素都是一个物品堆叠。]),
  (2, [#icon("nbt-compound") 一个物品。]),
  (3, link(<data:item_data>)[带槽位物品格式]),
  (1, [#icon("nbt-compound") *lock*: 玩家可以用于打开该容器的物品，使用物品堆叠谓词来判断。]),
  (2, [#icon("nbt-compound") *components*: 检查物品的堆叠组件，只有当物品堆叠组件完全相同时才匹配成功。]),
  (3, [*\<组件名称>*: 一项组件及匹配的内容。]),
  (2, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品的堆叠数量，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个数量区间。]),
  (3, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
  (3, [#icon("nbt-int") *max*: 最大值。]),
  (3, [#icon("nbt-int") *min*: 最小值。]),
  (2, [#icon("nbt-string")#icon("nbt-list") *items*: 匹配的物品，可以是 #icon("nbt-string") 命名空间ID或物品数据包标签。也可以使用 #icon("nbt-list") 列表形式以尝试匹配列表中任意物品。]),
  (3, [*若使用 #icon("nbt-list") 列表形式，则有以下字段：*], false),
  (3, [#icon("nbt-string") 一项物品，可以是命名空间ID或物品数据包标签。]),
  (2, [#icon("nbt-compound") *predicates*: 检查该物品是否匹配指定的数据组件谓词。]),
  (3, [*\<数据组件谓词ID>*: 一项数据组件谓词及匹配的内容。]),
  (1, [#icon("nbt-string") *LootTable*: 在此合成器第一次被打开时为生成战利品所使用的战利品表，需要是战利品表的命名空间ID。战利品生成后此标签被删除。]),
  (1, [#icon("nbt-long") *LootTableSeed*: 生成战利品使用的种子，如果不存在该标签或值为 `0l` 则使用随机序列。战利品生成后此标签被删除。]),
  (1, [#icon("nbt-int") *triggered*: 合成器是否被红石信号激活。`1` 代表是，其他值均代表否。])
)
#heading(level: 4, numbering: none, [嘎吱之心（`creaking_heart`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-int_array") *creaking*: 此嘎吱之心正在绑定的嘎吱的UUID。])
)
#heading(level: 4, numbering: none, [饰纹陶罐（`decorated_pot`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-compound") *item*: 饰纹陶罐内存储的物品。]),
  (2, link(<data:item_data>)[无槽位物品格式]),
  (1, [#icon("nbt-string") *LootTable*: 在此饰纹陶罐被打破时为生成战利品所使用的战利品表，需要是战利品表的命名空间ID。战利品生成后此标签被删除。]),
  (1, [#icon("nbt-long") *LootTableSeed*: 生成战利品使用的种子，如果不存在该标签或值为 `0l` 则使用随机序列。战利品生成后此标签被删除。]),
  (1, [#icon("nbt-list") *sherds*: 饰纹陶罐各个面的陶片样式，列表内四个元素分别存储后、左、右、前面。]),
  (2, [#icon("nbt-string") 一个面陶片样式的命名空间ID。若此面没有陶片样式，则值为 `minecraft:brick`。])
)
#heading(level: 4, numbering: none, [附魔台（`enchanting_table`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 可选，该附魔台的自定义名称，需要为文本组件。])
)
#heading(level: 4, numbering: none, [末地折跃门（`end_gateway`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-long") *#underline[Age]*: 末地折跃门方块的年龄，用于控制光柱的产生。当低于200 gt时，代表此时折跃门刚刚生成，它会发出一束品红色光柱；当此值可以被2400整除时，折跃门会产生40 gt传送冷却，并发出一束紫色光柱。]),
  (1, [#icon("nbt-bool") *ExactTeleport*: 是否把实体准确传送到 #icon("nbt-int_array") `exit_portal` 指定的坐标而不是传送到这个坐标附近的位置。]),
  (1, [#icon("nbt-int_array") *exit_portal*: 实体传送的目的坐标，数组内元素依次为$x$、$y$、$z$坐标。])
)
#heading(level: 4, numbering: none, [所有种类悬挂式告示牌（`hanging_sign`）、所有种类告示牌（`sign`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-compound") *back_text*: 告示牌背面的文本信息。]),
  (2, [#icon("nbt-string") *color*: 文本的颜色，相当于用染料为告示牌文本染色。]),
  (2, [#icon("nbt-list") *filtered_messages*: 告示牌被过滤的文字，含有四个元素，按顺序分别存储告示牌第一行、第二行、第三行和第四行的文本。]),
  (3, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") 一行文本，必须使用文本组件。]),
  (2, [#icon("nbt-bool") *has_glowing_text*: 告示牌文本是否发光。]),
  (2, [#icon("nbt-list") *#underline[messages]*: 告示牌的文字，含有四个元素，按顺序分别存储告示牌第一行、第二行、第三行和第四行的文本。]),
  (3, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") 一行文本，必须使用文本组件。]),
  (1, [#icon("nbt-compound") *front_text*: 告示牌正面的文本信息。]),
  (2, [#icon("nbt-string") *color*: 文本的颜色，相当于用染料为告示牌文本染色。]),
  (2, [#icon("nbt-list") *filtered_messages*: 告示牌被过滤的文字，含有四个元素，按顺序分别存储告示牌第一行、第二行、第三行和第四行的文本。]),
  (3, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") 一行文本，必须使用文本组件。]),
  (2, [#icon("nbt-bool") *has_glowing_text*: 告示牌文本是否发光。]),
  (2, [#icon("nbt-list") *#underline[messages]*: 告示牌的文字，含有四个元素，按顺序分别存储告示牌第一行、第二行、第三行和第四行的文本。]),
  (3, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") 一行文本，必须使用文本组件。]),
  (1, [#icon("nbt-bool") *#underline[is_waxed]*: 告示牌是否被涂蜡。被涂蜡后告示牌文本不能修改，但交互事件中的命令仍可以执行。])
)
#heading(level: 4, numbering: none, [漏斗（`hopper`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 该漏斗的名称，即该漏斗在GUI上显示的名称。使用文本组件。]),
  (1, [#icon("nbt-list") *Items*: 箱子内的物品。列表中每个元素都是一个物品堆叠。]),
  (2, [#icon("nbt-compound") 一个物品。]),
  (3, link(<data:item_data>)[带槽位物品格式]),
  (1, [#icon("nbt-compound") *lock*: 玩家可以用于打开该容器的物品，使用物品堆叠谓词来判断。]),
  (2, [#icon("nbt-compound") *components*: 检查物品的堆叠组件，只有当物品堆叠组件完全相同时才匹配成功。]),
  (3, [*\<组件名称>*: 一项组件及匹配的内容。]),
  (2, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品的堆叠数量，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个数量区间。]),
  (3, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
  (3, [#icon("nbt-int") *max*: 最大值。]),
  (3, [#icon("nbt-int") *min*: 最小值。]),
  (2, [#icon("nbt-string")#icon("nbt-list") *items*: 匹配的物品，可以是 #icon("nbt-string") 命名空间ID或物品数据包标签。也可以使用 #icon("nbt-list") 列表形式以尝试匹配列表中任意物品。]),
  (3, [*若使用 #icon("nbt-list") 列表形式，则有以下字段：*], false),
  (3, [#icon("nbt-string") 一项物品，可以是命名空间ID或物品数据包标签。]),
  (2, [#icon("nbt-compound") *predicates*: 检查该物品是否匹配指定的数据组件谓词。]),
  (3, [*\<数据组件谓词ID>*: 一项数据组件谓词及匹配的内容。]),
  (1, [#icon("nbt-string") *LootTable*: 在此容器第一次被打开时为生成战利品所使用的战利品表，需要是战利品表的命名空间ID。战利品生成后此标签被删除。]),
  (1, [#icon("nbt-long") *LootTableSeed*: 生成战利品使用的种子，如果不存在该标签或值为 `0l` 则使用随机序列。战利品生成后此标签被删除。]),
  (1, [#icon("nbt-int") *#underline[TransferCooldown]*: 传输物品的冷却时间。此值为 `0` 时物品会被传输，并将此值设置为 `8`，单位为游戏刻。默认值为 `-1`。])
)
#heading(level: 4, numbering: none, [拼图方块（`jigsaw`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-string") *#underline[name]*: 拼图方块的名称。]),
  (1, [#icon("nbt-string") *#underline[final_state]*: 该拼图方块即将转变为的方块。]),
  (1, [#icon("nbt-string") *#underline[joint]*: 拼接类型，可用值为 `rollable`（可旋转）和 `aligned`（固定）。]),
  (1, [#icon("nbt-int") *#underline[placement_priority]*: 放置优先级。当放置拼图方块所对应的结构时，以放置优先级从大到小的顺序依次放置各个结构。如果两个结构具有相同的放置优先级，则以默认顺序放置。]),
  (1, [#icon("nbt-string") *#underline[pool]*: 拼图方块的目标池。]),
  (1, [#icon("nbt-string") *#underline[target]*: 当结构从目标池中生成时要对接的拼图方块名称。]),
  (1, [#icon("nbt-int") *#underline[selection_priority]*: 选择优先级。当父级结构生成时，决定子级拼图方块的选择次序，按选择优先级从大到小排序依次选择。])
)
#heading(level: 4, numbering: none, [唱片机（`jukebox`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-compound") *RecordItem*: 唱片机内的唱片。]),
  (2, link(<data:item_data>)[无槽位物品格式]),
  (1, [#icon("nbt-long") *ticks_since_song_started*: 唱片已经播放的时间，单位为游戏刻。如果唱片机没有播放唱片，则该标签不存在。])
)
#heading(level: 4, numbering: none, [讲台（`lectern`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-compound") *Book*: 讲台上的书。]),
  (2, link(<data:item_data>)[无槽位物品格式]),
  (1, [#icon("nbt-int") *Page*: 讲台上的书目前翻开的页数，从 `0` 开始。])
)
#heading(level: 4, numbering: none, [刷怪笼（`mob_spawner`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-short") *#underline[Delay]*: 距离下次生成的时间。如果此值为 `-1s`，则玩家接近时此值会重置为一个随机的生成延迟；如果此值不大于 `0s`，则玩家接近时立刻生成。]),
  (1, [#icon("nbt-short") *MaxNearbyEntities*: 生成实体的范围内具有与刷怪笼生成实体类型相同的实体的最大数量。如果附近符合条件的实体数量超过此值则刷怪笼不再生成实体，默认为 `6s`。]),
  (1, [#icon("nbt-short") *MaxSpawnDelay*: 随机生成延迟的上限，默认为800 gt。]),
  (1, [#icon("nbt-short") *MinSpawnDelay*: 随机生成延迟的上限，默认为200 gt。]),
  (1, [#icon("nbt-short") *RequiredPlayerRange*: 玩家激活刷怪笼时与其之间的距离，默认为 `16s`。]),
  (1, [#icon("nbt-short") *SpawnCount*: 每次尝试生成的实体数量，默认为 `4s`。]),
  (1, [#icon("nbt-compound") *SpawnData*: 下一次生成实体的数据。此项的数据来源是 #icon("nbt-list") `SpawnPotentials`。]),
  (2, [#icon("nbt-compound") *custom_spawn_rules*: 自定义生成规则。]),
  (3, [#icon("nbt-int")#icon("nbt-list")#icon("nbt-compound") *block_light_limit*: 方块光照限制。若使用 #icon("nbt-int") 整型形式，则指定一个精确的光照等级；若使用 #icon("nbt-list") 列表形式，则指定光照等级的区间，数组内有2个元素，第0个元素为下限，第1个元素为上限。若使用 #icon("nbt-compound") 复合标签形式，则也可以指定光照等级的区间。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-int") *#underline[max_inclusive]*: 匹配的最大值。]),
  (4, [#icon("nbt-int") *#underline[min_inclusive]*: 匹配的最小值。]),
  (3, [#icon("nbt-int")#icon("nbt-list")#icon("nbt-compound") *sky_light_limit*: 天空光照限制。若使用 #icon("nbt-int") 整型形式，则指定一个精确的光照等级；若使用 #icon("nbt-list") 列表形式，则指定光照等级的区间，数组内有2个元素，第0个元素为下限，第1个元素为上限。若使用 #icon("nbt-compound") 复合标签形式，则也可以指定光照等级的区间。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-int") *#underline[max_inclusive]*: 匹配的最大值。]),
  (4, [#icon("nbt-int") *#underline[min_inclusive]*: 匹配的最小值。]),
  (2, [#icon("nbt-compound") *#underline[entity]*: 要生成的实体。]),
  (3, link(<data:tags_common_to_all_entities>)[实体格式]),
  (2, [#icon("nbt-compound") *equipment*: 实体生成时带有的装备。]),
  (3, [#icon("nbt-string") *#underline[loot_table]*: 设置实体生成时身上装备的来源为战利品表，此值为战利品表的命名空间ID。]),
  (3, [#icon("nbt-float")#icon("nbt-compound") *slot_drop_chances*: 各槽位上物品的掉落概率，默认为 `0f`。如果使用 #icon("nbt-float") 单精度浮点数形式，则所有槽位上的物品均以此概率掉落，如果使用 #icon("nbt-compound") 复合标签形式，则按槽位指定各自的掉落概率。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-float") *\<装备槽位>*: 该槽位上物品的掉落概率。]),
  (1, [#icon("nbt-list") *SpawnPotentials*: 可用生成项目的列表。每次决定生成实体时 #icon("nbt-compound") `SpawnData` 的数据就从此列表内加权随机选择。如果该标签不存在，则尝试从 #icon("nbt-compound") `SpawnData` 获取数据。]),
  (2, [#icon("nbt-compound") 一个可用的生成项目。]),
  (3, [#icon("nbt-compound") *#underline[data]*: 此生成项的生成信息，与 #icon("nbt-compound") `SpawnData` 结构相同。]),
  (3, [#icon("nbt-int") *#underline[weight]*: 该生成项的权重。值越大，该生成项越有可能被选择。]),
  (1, [#icon("nbt-short") *SpawnRange*: 生成实体的范围，默认为 `4s`。])
)
#heading(level: 4, numbering: none, [移动的活塞（`piston`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-compound") *#underline[blockState]*: 被移动的方块的数据。]),
  (2, [#icon("nbt-string") *#underline[Name]*: 方块的命名空间ID。]),
  (2, [#icon("nbt-compound") *Properties*: 可选，由若干方块属性组成的方块状态。]),
  (3, [#icon("nbt-string") *\<方块属性>*: 标签名为方块状态的属性，值使用字符串表示。]),
  (1, [#icon("nbt-bool") *#underline[extending]*: 移动的活塞是否是由推出的活塞移动而被创建的。]),
  (1, [#icon("nbt-int") *#underline[facing]*: 创建移动的活塞的活塞的方向。有以下可用值：`0`（下）、`1`（上）、`2`（北）、`3`（南）、`4`（西）、`5`（东）。]),
  (1, [#icon("nbt-float") *#underline[progress]*: 活塞已经移动的进度，介于 `0f` 和 `1f` 之间（含），以 `1f` 为移动到位。]),
  (1, [#icon("nbt-bool") *#underline[source]*: 移动的活塞是否为引发移动的活塞或活塞头。])
)
#heading(level: 4, numbering: none, [幽匿催发体（`sculk_catalyst`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-list") *#underline[cursors]*: 蔓延信号的列表。]),
  (2, [#icon("nbt-compound") 一个蔓延信号。]),
  (3, [#icon("nbt-int") *charge*: 该信号拥有的能量，介于 `0` 和 `1000` 之间（含）。]),
  (3, [#icon("nbt-int") *decay_delay*: 信号经过了幽匿块或幽匿脉络后为 `1`，否则为 `0`。为 `1` 时，信号可以自由蔓延；为 `0` 时，若蔓延至非幽匿类方块，则信号中的所有能量丢失。非 `0` 和 `1` 的值会被校准为 `0` 或 `1`。]),
  (3, [#icon("nbt-int_array") *#underline[pos]*: 信号所在的坐标，数组内元素依次为$x$、$y$、$z$坐标。]),
  (3, [#icon("nbt-int") *update_delay*: 距离下一次蔓延的时间。]),
  (3, [#icon("nbt-list") *facings*: 如果目前要转化的方块是空气或水，信号会尝试把这个方块转化为幽匿脉络，并储存幽匿脉络所有的面。如果要转化的方块不是空气或水，或者此列表为空时，信号会尝试向毗邻方块蔓延幽匿脉络。]),
  (4, [一个方向。可用值 `north`、`south`、`east`、`west`、`up` 和 `down`。])
)
#heading(level: 4, numbering: none, [幽匿尖啸体（`sculk_shrieker`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-compound") *listener*: 振动监听器的数据。]),
  (2, [#icon("nbt-compound") *event*: 振动监听器正在监听的游戏事件。无监听内容时该标签不存在。]),
  (3, [#icon("nbt-float") *#underline[distance]*: 振动监听器与振动源的距离。]),
  (3, [#icon("nbt-string") *#underline[game_event]*: 该游戏事件的命名空间ID。]),
  (3, [#icon("nbt-list") *#underline[pos]*: 振动源的位置。列表内元素依次为$x$、$y$、$z$坐标。]),
  (4, [#icon("nbt-double") 一个坐标。]),
  (3, [#icon("nbt-int_array") *projectile_owner*: 若产生振动的实体是弹射物，则此标签为弹射物的UUID。]),
  (3, [#icon("nbt-int_array") *source*: 产生振动的实体的UUID。]),
  (2, [#icon("nbt-int") *event_delay*: 离振动到达还需的时间。]),
  (2, [#icon("nbt-compound") *#underline[selector]*: 振动选择器的数据。]),
  (3, [#icon("nbt-compound") *event*: 候选游戏事件，与上文所述 #icon("nbt-compound") `event` 的结构完全一致。]),
  (3, [#icon("nbt-long") *#underline[tick]*: 振动发生时的游戏时间，如果没有振动可供选择则为 `-1l`。]),
  (1, [#icon("nbt-int") *warning_level*: 警告等级。])
)
#heading(level: 4, numbering: none, [所有种类生物头颅（`skull`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 可选，该生物头颅的自定义名称，需要为文本组件。]),
  (1, [#icon("nbt-string") *note_block_sound*: 该生物头颅使用的音符盒声音的命名空间ID。]),
  (1, [#icon("nbt-string")#icon("nbt-compound") *profile*: 玩家头颅使用的玩家游戏档案。有 #icon("nbt-string") 字符串和 #icon("nbt-compound") 复合标签两种格式。]),
  (2, [*当使用 #icon("nbt-string") 字符串形式时，需要为玩家名称，格式要求与 #icon("nbt-compound") 形式中的 #icon("nbt-string") `name` 一致。*], false),
  (2, [*当使用 #icon("nbt-compound") 复合标签形式时，具有以下字段：*], false),
  (2, [#icon("nbt-int_array") *id*: 玩家的UUID。]),
  (2, [#icon("nbt-string") *name*: 玩家名称，不能超过16个字符。若此项不使用，则按 #icon("nbt-int_array") `id` 字段确定玩家。]),
  (2, [#icon("nbt-list")#icon("nbt-compound") *properties*: 玩家游戏档案。]),
  (3, [*若使用 #icon("nbt-list") 列表/  数组形式，则可用带签名的游戏档案，并具有以下字段：*], false),
  (3, [#icon("nbt-compound") 一项游戏档案属性。]),
  (4, [#icon("nbt-string") *#underline[name]*: 该属性的名称。]),
  (4, [#icon("nbt-string") *#underline[value]*: 该属性的值，是Base64编码的JSON数据。]),
  (4, [#icon("nbt-string") *signature*: 该属性的签名。]),
  (3, [*若使用 #icon("nbt-compound") 复合标签形式，则具有以下字段：*], false),
  (3, [#icon("nbt-list") *\<游戏档案属性名称>*: 一个游戏档案属性。]),
  (4, [#icon("nbt-string") 该属性的值，是Base64编码的JSON数据。]),
  (2, [*以下字段均可选，若填写了则会在上述玩家档案数据的基础上进行修改，用于定制玩家皮肤。其中的纹理均可用资源包指定，对客户端有效。*], false),
  (2, [#icon("nbt-string") *cape*: 披风的纹理，使用命名空间ID，地址从 #icon("folder") `assets\<命名空间>\textures` 开始计。]),
  (2, [#icon("nbt-string") *elytra*: 鞘翅的纹理，使用命名空间ID，地址从 #icon("folder") `assets\<命名空间>\textures` 开始计。]),
  (2, [#icon("nbt-string") *model*: 玩家模型的类型，有效值 `wide`（宽型）和 `slim`（纤细型）。]),
  (2, [#icon("nbt-string") *texture*: 皮肤的纹理，使用命名空间ID，地址从 #icon("folder") `assets\<命名空间>\textures` 开始计。])
)
#heading(level: 4, numbering: none, [结构方块（`structure_block`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-string") *#underline[author]*: 结构方块的放置者。]),
  (1, [#icon("nbt-bool") *#underline[ignoreEntities]*: 实体是否会被忽略。]),
  (1, [#icon("nbt-float") *#underline[integrity]*: 结构完整度。]),
  (1, [#icon("nbt-string") *#underline[metadata]*: 元数据，用于数据模式。]),
  (1, [#icon("nbt-string") *#underline[mirror]*: 结构镜像的方式，有效值 `NONE`（无）、`LEFT_RIGHT`（`←→`）和 `FRONT_BACK`（`↑↓`）。]),
  (1, [#icon("nbt-string") *#underline[mode]*: 结构方块的模式，有效值 `SAVE`（保存）、`LOAD`（加载）、`CORNER`（角落）和 `DATA`（数据）。]),
  (1, [#icon("nbt-string") *#underline[name]*: 结构的命名空间ID。]),
  (1, [#icon("nbt-int") *#underline[posX]*: 结构起始位置的$x$坐标。不能小于0，也不能大于48。]),
  (1, [#icon("nbt-int") *#underline[posY]*: 结构起始位置的$y$坐标。不能小于0，也不能大于48。]),
  (1, [#icon("nbt-int") *#underline[posZ]*: 结构起始位置的$z$坐标。不能小于0，也不能大于48。]),
  (1, [#icon("nbt-bool") *#underline[powered]*: 结构方块是否被激活。]),
  (1, [#icon("nbt-string") *#underline[rotation]*: 结构旋转的方式，有效值 `NONE`（无）、`CLOCKWISE_90`（`90`）、`CLOCKWISE_180`（`180`）或 `COUNTERCLOCKWISE_90`（`270`）。]),
  (1, [#icon("nbt-long") *#underline[seed]*: 加载结构使用的种子，用于结构完整度。]),
  (1, [#icon("nbt-int") *#underline[sizeX]*: 结构在$x$方向的大小。不能小于0，也不能大于48。]),
  (1, [#icon("nbt-int") *#underline[sizeY]*: 结构在$y$方向的大小。不能小于0，也不能大于48。]),
  (1, [#icon("nbt-int") *#underline[sizeZ]*: 结构在$z$方向的大小。不能小于0，也不能大于48。]),
  (1, [#icon("nbt-bool") *#underline[showair]*: 是否显示隐形方块。]),
  (1, [#icon("nbt-bool") *#underline[showboundingbox]*: 是否在创造模式显示边框。]),
  (1, [#icon("nbt-bool") *#underline[strict]*: 是否禁用方块更新。])
)
#heading(level: 4, numbering: none, [测试方块（`test_block`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-string") *#underline[message]*: 测试方块中的信息。]),
  (1, [#icon("nbt-string") *#underline[mode]*: 测试方块的模式，有效值 `accept`（接受）、`fail`（失败）、`log`（日志输出）、`start`（启动）。]),
  (1, [#icon("nbt-bool") *#underline[powered]*: 测试方块是否被激活。])
)
#heading(level: 4, numbering: none, [测试实例方块（`test_instance_block`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-compound") *#underline[data]*: 测试实例的数据。]),
  (2, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *error_message*: 测试完成后的错误信息，在 #icon("nbt-string") `status` 为 `finished` 时使用。是一个文本组件。]),
  (2, [#icon("nbt-bool") *#underline[ignoreEntities]*: 实体是否会被忽略。]),
  (2, [#icon("nbt-string") *#underline[rotation]*: 测试结构旋转的方式，有效值 `none`（无）、`clockwise_90`（`90`）、`clockwise_180`（`180`）或 `counterclockwise_90`（`270`）。]),
  (2, [#icon("nbt-int_array") *#underline[size]*: 测试结构的大小，数组内依次为结构在$x$、$y$、$z$方向上的大小。]),
  (2, [#icon("nbt-string") *#underline[status]*: 测试实例方块的状态，有效值 `cleared`（无任务）、`finished`（已完成）和 `running`（正在运行）。]),
  (2, [#icon("nbt-string") *test*: 测试实例的命名空间ID。]),
  (1, [#icon("nbt-list") *error*: 测试实例的错误标记。]),
  (2, [#icon("nbt-compound") 一个错误标记。]),
  (3, [#icon("nbt-int_array") *#underline[pos]*: 错误标记的位置，数组内依次为$x$、$y$、$z$坐标。]),
  (3, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *text*: 错误标记的内容，使用文本组件。])
)
#heading(level: 4, numbering: none, [试炼刷怪笼（`trial_spawner`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-long") *cooldown_ends_at*: 冷却的结束时间。]),
  (1, [#icon("nbt-list") *current_mobs*: 当前还存活的由试炼刷怪笼生成的生物列表，如果不存在这些生物，则该标签不存在。]),
  (2, [#icon("nbt-int_array") 一个生物的UUID。]),
  (1, [#icon("nbt-string") *ejecting_loot_table*: 试炼刷怪笼喷出战利品时使用的战利品表的命名空间ID。]),
  (1, [#icon("nbt-long") *next_mob_spawns_at*: 下一个生物生成的最早时间。]),
  (1, [#icon("nbt-string")#icon("nbt-compound") *normal_config*: 普通试炼刷怪笼配置。可以使用 #icon("nbt-string") 字符串形式，此时值需要是炼刷怪笼配置的命名空间ID；也可以使用 #icon("nbt-compound") 复合标签形式以内联定义一个炼刷怪笼配置。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
  (2, [#icon("nbt-string") *items_to_drop_when_ominous*: 不祥变种的试炼刷怪笼激活状态时随机在周围生成的不祥之物生成器实体内的物品。需要是一个战利品表的命名空间ID，默认值 `spawners/trial_chamber/items_to_drop_when_ominous`。]),
  (2, [#icon("nbt-list") *loot_tables_to_eject*: 在试炼刷怪笼生成的所有生物被杀死后喷出物品所用的战利品表。]),
  (3, [#icon("nbt-compound") 一项战利品。]),
  (4, [#icon("nbt-string") *#underline[data]*: 此项所用战利品表的命名空间ID。]),
  (4, [#icon("nbt-int") *#underline[weight]*: 该项的权重。值越大，该项越有可能被选择。]),
  (2, [#icon("nbt-float") *simultaneous_mobs*: 必须大于0，默认为 `2f`。存储同时存活的由此试炼刷怪笼生成的生物最少数量，即在一个玩家加入试炼时同时存活的生物数量。]),
  (2, [#icon("nbt-float") *simultaneous_mobs_added_per_player*: 必须大于0，默认为 `1f`。存储每增加一个加入试炼玩家，同时存活生物数量的增加值。]),
  (2, [#icon("nbt-list") *spawn_potentials*: 可用生成项目的列表。每次决定生成实体时 #icon("nbt-compound") `spawn_data` 的数据就从此列表内加权随机选择。如果该标签不存在，则尝试从 #icon("nbt-compound") `spawn_data` 获取数据。]),
  (3, [#icon("nbt-compound") 一个可用的生成项目。]),
  (4, [#icon("nbt-compound") *#underline[data]*: 此生成项的生成信息，与 #icon("nbt-compound") `spawn_data` 结构相同。]),
  (4, [#icon("nbt-int") *#underline[weight]*: 该生成项的权重。值越大，该生成项越有可能被选择。]),
  (2, [#icon("nbt-int") *spawn_range*: 生成实体的范围，默认为 `4`。]),
  (2, [#icon("nbt-int") *ticks_between_spawn*: 两次尝试生成生物的最小间隔时间，默认为40 gt。]),
  (2, [#icon("nbt-list") *total_mobs*: 必须大于0，默认为 `6f`。存储生成生物的最少总数量，即在一个玩家加入试炼时生成的总生物数量。]),
  (2, [#icon("nbt-list") *total_mobs_added_per_player*: 必须大于0，默认为 `2f`。每增加一个加入试炼玩家，生成生物总数量的增加值。]),
  (1, [#icon("nbt-string")#icon("nbt-compound") *ominous_config*: 不详变种试炼刷怪笼配置。可以使用 #icon("nbt-string") 字符串形式，此时值需要是炼刷怪笼配置的命名空间ID；也可以使用 #icon("nbt-compound") 复合标签形式以内联定义一个炼刷怪笼配置，数据格式与 #icon("nbt-compound") `normal_config` 一致。]),
  (1, [#icon("nbt-list") *registered_players*: 加入试炼的玩家列表。]),
  (2, [#icon("nbt-int_array") 一个玩家的UUID。]),
  (1, [#icon("nbt-int") *required_player_range*: 介于 `1` 和 `128` 之间（含），默认为 `4`。存储玩家距离试炼刷怪笼多少距离时触发试炼。]),
  (1, [#icon("nbt-compound") *spawn_data*: 下一次生成实体的数据。此项的数据来源是 #icon("nbt-list") `spawn_potentials`。]),
  (2, [#icon("nbt-compound") *custom_spawn_rules*: 自定义生成规则。]),
  (3, [#icon("nbt-int")#icon("nbt-list")#icon("nbt-compound") *block_light_limit*: 方块光照限制。若使用 #icon("nbt-int") 整型形式，则指定一个精确的光照等级；若使用 #icon("nbt-list") 列表形式，则指定光照等级的区间，数组内有2个元素，第0个元素为下限，第1个元素为上限。若使用 #icon("nbt-compound") 复合标签形式，则也可以指定光照等级的区间。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-int") *#underline[max_inclusive]*: 匹配的最大值。]),
  (4, [#icon("nbt-int") *#underline[min_inclusive]*: 匹配的最小值。]),
  (3, [#icon("nbt-int")#icon("nbt-list")#icon("nbt-compound") *sky_light_limit*: 天空光照限制。若使用 #icon("nbt-int") 整型形式，则指定一个精确的光照等级；若使用 #icon("nbt-list") 列表形式，则指定光照等级的区间，数组内有2个元素，第0个元素为下限，第1个元素为上限。若使用 #icon("nbt-compound") 复合标签形式，则也可以指定光照等级的区间。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-int") *#underline[max_inclusive]*: 匹配的最大值。]),
  (4, [#icon("nbt-int") *#underline[min_inclusive]*: 匹配的最小值。]),
  (2, [#icon("nbt-compound") *#underline[entity]*: 要生成的实体。]),
  (3, link(<data:tags_common_to_all_entities>)[实体格式]),
  (2, [#icon("nbt-compound") *equipment*: 实体生成时带有的装备。]),
  (3, [#icon("nbt-string") *#underline[loot_table]*: 设置实体生成时身上装备的来源为战利品表，此值为战利品表的命名空间ID。]),
  (3, [#icon("nbt-float")#icon("nbt-compound") *slot_drop_chances*: 各槽位上物品的掉落概率，默认为 `0f`。如果使用 #icon("nbt-float") 单精度浮点数形式，则所有槽位上的物品均以此概率掉落，如果使用 #icon("nbt-compound") 复合标签形式，则按槽位指定各自的掉落概率。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-float") *\<装备槽位>*: 该槽位上物品的掉落概率。]),
  (1, [#icon("nbt-int") *target_cooldown_length*: 必须大于 `0`，默认为36000 gt。从试炼刷怪笼生成的所有生物被杀死开始，到下一次可以进行试炼的冷却时间。]),
  (1, [#icon("nbt-int") *total_mobs_spawned*: 从试炼开始到现在生成的总生物数量，必须大于 `0`。])
)
#heading(level: 4, numbering: none, [宝库（`vault`）])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-compound") *config*: 宝库的配置数据。]),
  (2, [#icon("nbt-double") *activation_range*: 默认为 `4d`，激活宝库的玩家检测范围。]),
  (2, [#icon("nbt-double") *deactivation_range*: 默认为 `4.5d`，不得小于 #icon("nbt-double") `activation_range`，取消激活宝库的玩家检测范围。]),
  (2, [#icon("nbt-compound") *key_item*: 用于解锁宝库的物品，若不存在则此宝库无法被解锁。]),
  (3, link(<data:item_data>)[无槽位物品格式]),
  (2, [#icon("nbt-string") *loot_table*: 此宝库使用的战利品表的命名空间ID。]),
  (2, [#icon("nbt-string") *override_loot_table_to_display*: 宝库中展示战利品所使用的战利品表的命名空间ID。]),
  (1, [#icon("nbt-compound") *server_data*: 服务端用于计算宝库行为的数据。]),
  (2, [#icon("nbt-list") *items_to_eject*: 将要喷出的奖励物品。]),
  (3, [#icon("nbt-compound") 一项奖励物品。]),
  (4, link(<data:item_data>)[无槽位物品格式]),
  (2, [#icon("nbt-list") *rewarded_players*: 已经接受奖励的玩家列表，总长度不超过128。]),
  (3, [#icon("nbt-int_array") 一个玩家的UUID。]),
  (2, [#icon("nbt-long") *state_updating_resumes_at*: 下一次更新宝库状态的时间。]),
  (2, [#icon("nbt-int") *total_ejections_needed*: 本次奖励中将要喷出的奖励物品总数。]),
  (1, [#icon("nbt-compound") *shared_data*: 客户端用于渲染宝库的数据。]),
  (2, [#icon("nbt-double") *connected_particles_range*: 在此范围内与宝库相关联的玩家可以渲染相应的粒子，默认为 `4.5d`。]),
  (2, [#icon("nbt-list") *connected_players*: 与此宝库相关联的玩家。]),
  (3, [#icon("nbt-int_array") 一个玩家的UUID。]),
  (2, [#icon("nbt-compound") *display_item*: 宝库内渲染的物品。]),
  (3, link(<data:item_data>)[无槽位物品格式])
)