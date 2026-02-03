// 封面
#[
  #set page(
    fill: rgb("#b34545"),
  )
  #align(center + horizon)[
    #[
      #set text(
        fill: rgb("#e9dede"),
        size: 2em,
        weight: "bold"
      )
      #[
        #set text(
          font: "Source Han Sans SC"
        )
        原版技术性开发系列教程
        #v(1em)
        第#h(10pt)1#h(10pt)册
        #v(2em)
      ]
    ]
    #[
      #set text(
        fill: rgb("#e9dede"),
        font: "Source Han Serif",
        size: 4em,
        weight: "bold"
      )
      命令系统Ciallo!
      #v(1em)
    ]
    #[
      #set text(
        fill: rgb("#e9dede"),
        font: "Source Han Sans SC",
        size: 1.5em
      )
      徐木弦#h(1em)主编\
      （急招：编写组成员）
      #v(5em)
    ]
  ]
]

#import "模板.typ": *
#show: template-style

#heading(level: 1, numbering: none, outlined: false, [第一版序言])
Minecraft拥有多种多样的玩法，生存、PVP、PVE、模组、建筑、红石电路这些为众多玩家所熟知的玩法自成体系，玩家可以自由选择其中的某一方面深入研究。在这些玩法中，比较默默无闻的一种玩法可能便是广义上的命令，即包含了MC-CMD（命令）、资源包和数据包的系统。

在没有系统地接触命令系统前，玩家对于这个系统不了解、甚至完全没有意识到这个系统的存在都是有可能的。对于一些仅对命令系统做出更新的快照版本，一些玩家可能认为它们是“无用的”，即使这些更新在大部分情况下丰富了命令系统，使得服务器的运营、冒险地图及原版模组的制作更方便。在较为早期的版本中，命令更多依靠命令方块运行，这使得一些玩家错误地认为冒险地图或原版模组中的机关是由纯粹的红石电路运行的，并将这些机关的巧妙之处完全归结于红石电路的运作而完全忽略命令的作用。

这是因为命令系统更多地呈现一种“在后台运行”的状态，玩家无法在明面上查看它们的运行逻辑，更多地只是感受它们带来的效果。其次，命令系统是一个“入门难、精通容易”的板块，学习的门槛较高，一些基本的概念，如权限等级、命名空间ID、加载等级、坐标、目标选择器、JSON、NBT、记分板等，都是难于理解而对命令学习至关重要的知识点。再者，普通玩家在接触到命令系统时，更多地是熟悉诸如 `/kill`、`/gamemode` 这类带有简单参数的命令写法，而不会深究命令中各参数的意义，浅尝辄止的行为让玩家不大可能形成命令系统是一个完备体系的认识。最后，玩家在游戏时一般不会启用命令，而大部分命令所需的权限等级较高（即需要启用命令才能使用），因此一般玩家很少会与命令产生接触。

不过，命令系统应用范围极广，它对游戏的作用也是显而易见的，服务器的运行、冒险地图的制作、原版模组的制作均需要使用命令系统。对于游戏原有内容的修改和新内容的制作，如游戏外观的修改、粒子动画效果、自定义战利品、自定义物品等，均可以由命令系统来完成。命令系统提供了一个在不修改源代码的情况下的开发环境，使得Minecraft几乎成为了一款“无限”的游戏，唯一有限的也许便是玩家的想象力。同时，命令系统也极大地丰富了游戏社区、论坛。

在历代版本更新中，命令系统也随之有过大大小小的改善。在早期的版本中，命令一般只能借由聊天栏和命令方块执行，而命令方块是一种红石元件，因此彼时命令的自动化执行对于红石电路的依赖性较强，只能将红石信号转化为命令执行的信号或条件。然而在后续的版本中，函数及数据包的问世使得命令能够脱离红石电路单独运行，并随着数据包的不断完善，命令系统的研究和应用则更加方便。一些冒险地图真正做到了零命令方块化，命令的执行全部转交给数据包完成。因此命令方块及红石电路的教程则放在了附录中，不使用数据包仅使用命令方块时可以参阅这些内容。

对于这样一个较为完备的体系，笔者在前人既有教程的基础上，理清思路，加以整理，为之编写完整的命令教程。在内容安排上，优先讲述基本概念，如权限等级、命令执行上下文、命名空间ID、数据包标签、参数、区块及加载等级等，这些概念是能够执行命令的最基本条件。在绪论之后是命令系统的五大重要基础板块：坐标、目标选择器、JSON、NBT和记分板，这些内容是需要熟练掌握的基本功。在第七章，我们主要学习命令 `/execute`，这条命令能够修改命令执行上下文，一般可以认为是整个命令系统中最强大的命令。一些零散的命令则放到了第八章中讲解。资源包和数据包则被安排到了其他教程中，这些内容是命令系统的进阶部分，一定程度上脱离了狭义的命令体系，却也是命令系统的精华部分。学有余力的读者可进行《资源包》和《数据包》两本教程的学习。

在系统学习命令系统前，读者需要了解到的一点是，其他玩法领域可能更多地追求稳定的游戏环境，因此可能会选择旧的游戏版本。而命令系统随着版本更新不断完善，使得命令玩家不自觉地追求新版本，因此有关命令的讨论一般都基于最新版游戏。一些问题，诸如“在1.8版本中这个命令怎么写”，则可能得不到答复，因为命令系统在扁平化时经历了巨大的改动，使得改动前后几乎是两个完全不同的系统。同时，不同平台的命令系统也是不互通的，本教程仅适用于Java版，部分内容与基岩版不同，因此无法作为基岩版命令教学的参考。

那么在学习命令之前需要掌握哪些预备知识呢？首先需要对原版的Minecraft有足够的了解，因为命令基本上涉及了游戏中的方方面面。其次可以适当学习一些英语，命令的参数中有大量的英语单词，如果熟悉它们的意思将会极大提升命令编写的效率。本教程在论述的过程中，会经常使用高等数学、线性代数和概率论与数理统计的语言，读者可先行了解与命令系统紧密相关的一些数学知识，如向量代数与空间解析几何、矩阵与变换、随机事件及概率分布等。计算机图形学的一些内容也包括在内。此外，大家还可以提前学习一些编程思想，建立严密的逻辑思维能力，懂得如何指挥电脑（游戏）进行工作。没有相关编程基础并不意味着完全不能学好命令，编程思维也可以在命令学习的过程中逐步建立。

本教程仅作为基础教程使用，即仅介绍命令系统中所有的基本概念，并在此基础上进行一定的应用、扩展，其中应用层面主要面向冒险地图和原版模组的制作。一些较为高级的算法则不在本教程范围之内。其中带“\*”号的是选择性学习内容，它们所述的一些是不常用的内容，一些则是《资源包》或《数据包》两本教程的相关内容，想进修《资源包》和《数据包》的读者需留意这些带“\*”号知识点。

限于笔者的知识水平，本教程必有一定疏漏之处，望广大读者斧正！
#align(end)[编者]
#align(end)[2024年1月24日]

#heading(level: 1, numbering: none, outlined: false, [第二版序言])

自2023年发布的1.19.4起，Minecraft的技术性开发板块进入了又一个新时代，这可谓是自2012年骇人更新加入命令方块、2018年水域更新扁平化以来第三次革命性的巨变。这次“巨变”的主要体现在于：逐步开放了很多API，即将很多固有注册表转为可写注册表，使得原先需要大量命令模拟的效果用数据包自定义即可，这无疑大大省去了技术性开发的成本。从这两年Minecraft Java版的更新迭代可以看出，Minecraft的开发重点逐渐地由加入新的实质性游戏内容转为对数据包、资源包的支持。新游戏内容更新的占比下降，技术性更新的占比上升。数据包、资源包的版本号更迭已由先前的一个大版本一次变为一个快照一次，迭代速度越来越快。以数据包为例，2022年数据包的版本号为10，彼时距数据包的加入仅过了四年多；而截止至2024年底，数据包的版本号已达到了61。

许多玩家对自1.17以来的Minecraft开发极不满意，有些人认为Minecraft近几年并没有革命性的更新出现，每个版本的更新内容也极少，对游戏深度的挖掘不够，“敷衍了事”。对于每个快照更新介绍中大篇幅的技术性更新内容，大量玩家则视若无睹。这个现象直接反映了普通玩家对技术性开发这一板块认识的欠缺，正如第一版序言所说，“玩家对于这个系统不了解、甚至完全没有意识到这个系统的存在”。为此，对玩家进行技术性开发板块知识的普及很有必要。

不得不承认的是，技术性开发确实是一种门槛较高的玩法，其学习成本较高，容错率低，开发周期长，且开发过程不可见，因此难于在社区中引起较大的讨论度。目前，各大社区平台仍然缺乏专门的技术性开发论坛，现有的教程也零碎且不完整。社区的讨论主要集中于原版游戏内容、Mods玩法等，鲜有技术性开发有关的资料，这使其搜索难度较大。技术性开发玩家通常“单打独斗”，缺少交流，进一步限制了有开发想法的玩家学习进步。为此，为已入门的技术性开发玩家编写系统性的、完整的教程很有必要。

原版技术性开发的命令、资源包、数据包三个板块在本系列教程中分作三部分别讲述。对于其中的一些基本概念，如注册表、坐标、目标选择器、文本组件、NBT、记分板、属性、存档格式等，为了便于教程编纂，将其放在《命令系统》一书中与命令语法一起说明。命令是数据包的一个子集，用于函数中，数据包为它提供了程序化运行的环境。在早先的版本中，命令通常是红石电路的一个子集，用于命令方块中，由红石信号控制命令的执行。虽然现在主流的开发环境是数据包，但仍有玩家使用命令方块红石电路进行开发，因此本系列教程中仍保留对命令方块红石电路的讲解，《命令系统》书中的一些例子则提供了使用数据包和使用命令方块红石电路的两种解法，但侧重于使用数据包，而在《数据包》中则仅提供使用数据包的解法。资源包是相对较独立的一个板块，其内容中仅少部分与数据包有关联，对美术设计的要求较高，部分开发资源包的玩家专注于资源包，不会去开发数据包。然而在开发实践中数据包与资源包的联系却越来越紧密，仅依靠数据包能够实现的效果有限，与资源包配合开发能得到更好的效果。

这一版的《命令系统》教程相较上一版而言，对调了一些章节使得教程整体的逻辑更合理。同时新增了一些章节，新增的内容大多拆分自原本的章节，但对这些被拆分的内容有了更详尽的叙述。原本教程中零散的内容在这一版中均尽可能地归到一类下。经过这些变动后，教程的整体章节较先前的版本有了很大的不同。产生这些变动的主要原因是文本组件的存储格式由JSON变为了SNBT，即使在数据包中文本组件仍使用JSON格式。从教程逻辑上讲，文本组件应合并至“NBT格式”一章，但上一版的“NBT格式”一章已有11个小节，内容量极其庞大，若再塞入文本组件的全部内容，只会使“NBT格式”一章显得更臃肿。况且属性、状态效果这些内容依照存储格式也归到了实体格式或物品堆叠组件格式之下，将这些归类的内容全部放入“NBT格式”一章更不适宜。于是，原本经典的的“绪论——坐标——目标选择器——原始JSON文本——NBT格式——记分板——命令 `/execute` ——杂项命令”的教程章节顺序已不适用。经过考虑，这一版的教程章节变动安排如下：

+ “绪论”、“坐标与区块”、“UUID与目标选择器”三章的顺序不变，仅调整这三章内部小节的顺序及编排。

+ 删去原本的“NBT格式”一章，并将其重命名为“NBT与JSON格式”，新的章节保留原本“NBT格式”一章的概述、NBT路径、命令 `/data` 的语法。同时将原本“原始JSON文本”一章的“JS对象表示法”一节移入新的“NBT与JSON格式”。随后将概述一节中涉及SNBT和JSON相互转换的内容移出，单独设置一个小节。

+ 将新的“NBT与JSON格式”提前至第四章，将“原始JSON文本”改名为“文本组件”并后移至第五章。“文本组件”一章将同时讲解其SNBT和JSON形式。

+ 对于从原本“NBT格式”一章中移出的其他内容，结合属性、状态效果，单独开设新的一章“存档格式”作为第六章，同时合并原本附录II“游戏文件”的内容至这一章的概述小节。新的“存档格式”包含命令存储格式、区域文件格式、方块实体格式、实体格式、属性格式、状态效果格式、标记格式、展示实体格式、交互实体格式、玩家格式和物品堆叠组件格式。

+ “记分板”、“命令的执行”、“其他分类的命令”分别顺延至第七、八、九章。“命令的执行”更名为“命令 `/execute`”。

+ 由于章节合并，“其他分类的命令”中“状态效果”、“属性”两节被删除。

+ 删除原本的附录II“游戏文件”。

受限于编者的知识水平，本教程一定有不足之处，望广大读者斧正！
#align(end)[编者]
#align(end)[2025年2月7日]

#outline(title:"目  录",indent: 2em)

#pagebreak()
#counter(page).update(1)
= 绪论
原版技术性开发，Minecraft Wiki称为“Java版可自定义内容”#cite(<minecraft_wiki>, form: none)，是由命令、资源包、数据包及相关的组件附件组合成的一个板块。技术性开发成果丰富，这些成果即是社区玩家常用的Mods、冒险地图、数据包、资源包、服务器等。Minecraft的技术性开发大致分为Mods开发和原版开发，其区别在于是否对游戏的源代码进行了修改。#cite(<minecraft_wiki_en>, form: none)

本系列教程针对的是原版技术性开发，这一部分玩家的工作方向通常为制作冒险地图、开发原版模组、制作资源包或者管理服务器。

#pagebreak()

== 注册表与数据值
Minecraft有许多不同的游戏资源，如草方块、石头、箭、铁锹、猪等，对这些游戏资源进行分类，可以将草方块、石头分为方块，箭、铁锹分为物品，猪划分至实体。方块、物品、实体显然是区分这些游戏资源的“大类”。#proper-noun(display:"注册表（Registry）","zhu4 ce4 biao3")就是对不同资源进行分类管理的机制。除分类管理外，还需要给予每种资源一个独特的“身份证”，目的是与别的资源区分开来，唯一地映射到注册表内的给定值。这些“身份证”被称为游戏资源的数据值，或称ID。
=== 注册表 \*
注册表可分为以下两类：#proper-noun(display:"固有注册表（Built-in registry）","gu4 you3 zhu4 ce4 biao3")和#proper-noun(display:"可写注册表（Writable registry）","ke3 xie3 zhu4 ce4 biao3")。无论资源位于什么类型的注册表，*游戏都只会识别已被注册的资源*。

下面列举了Minecraft中所有的资源类型：
==== 固有注册表
固有注册表存储硬编码的游戏内容，除非修改源代码，否则其中的内容不可更改。
#general-table(
  caption: [固有注册表],
  columns: (7fr, 4fr, 7fr, 2fr),
  colspan: 4,
  header:([注册表], [资源类型], [数据包路径], [默认值]),
  [`ACTIVITY`], [生物AI], [`activity`], [],
    [`ATTRIBUTE`], [属性], [`atrribute`], [],
    [`ATTRIBUTE_TYPE`], [环境属性类型], [`attribute_type`], [],
    [`BIOME_SOURCE`], [生物群系源], [`worldgen/biome_source`], [],
    [`BLOCK`], [方块], [`block`], [`air`],
    [`BLOCK_ENTITY_TYPE`], [方块实体类型], [`block_entity_type`], [`furnace`],
    [`BLOCK_PREDICATE_TYPE`], [方块谓词类型], [`block_predicate_type`], [],
    [`BLOCK_STATE_PROVIDER_TYPE`], [方块状态提供器类型], [`worldgen/block_state_provider_type`], [],
    [`BLOCK_TYPE`], [方块类型], [`block_type`], [],
    [`CARVER`], [雕刻器类型], [`worldgen/carver`], [],
    [`CHUNK_GENERATOR`], [区块生成器类型], [`worldgen/chunk_generator`], [],
    [`CHUNK_STATUS`], [区块状态], [`chunk_state`], [`empty`],
    [`COMMAND_ARGUMENT_TYPE`], [命令参数类型], [`command_argument_type`], [],
    [`CONSUME_EFFECT_TYPE`], [消耗使用效果类型], [`consume_effect_type`], [],
    [`CREATIVE_MODE_TAB`], [创造标签页], [`creative_mode_tab`], [],
    [`CUSTOM_STAT`], [统计信息], [`custom_stat`], [], 
    [`DATA_COMPONENT_PREDICATE_TYPE`], [数据组件谓词类型], [`data_component_predicate_type`], [],
    [`DATA_COMPONENT_TYPE`], [数据组件类型], [`data_component_type`], [],
    [`DEBUG_SUBSCRIPTION`], [调试订阅], [`debug_description`], [], 
    [`DECORATED_POT_PATTERN`], [饰纹陶罐图案类型], [`decorated_pot_pattern`], [], 
    [`DENSITY_FUNCTION_TYPE`], [密度函数类型], [`worldgen/density_function_type`], [],
    [`DIALOG_ACTION_TYPE`], [对话框操作类型], [`dialog_action_type`], [],
    [`DIALOG_BODY_TYPE`], [对话框主体类型], [`dialog_body_type`], [],
    [`DIALOG_TYPE`], [对话框类型], [`dialog_type`], [],
    [`ENCHANTMENT_EFFECT_COMPONENT_TYPE`], [魔咒效果组件类型], [`enchantment_effect_component_type`], [],
    [`ENCHANTMENT_ENTITY_EFFECT_TYPE`], [魔咒实体效果类型], [`enchantment_entity_effect_type`], [], 
    [`ENCHANTMENT_LEVEL_BASED_VALUE_TYPE`], [魔咒等级依赖函数类型], [`enchantment_level_based_value_type`], [],
    [`ENCHANTMENT_LOCATION_BASED_EFFECT_TYPE`], [魔咒位置依赖函数类型], [`enchantment_location_based_effect_type`], [],
    [`ENCHANTMENT_PROVIDER_TYPE`], [魔咒提供器类型], [`enchantment_provider_type`], [],
    [`ENCHANTMENT_VALUE_EFFECT_TYPE`], [魔咒值效果类型], [`enchantment_value_effect_type`], [],
    [`ENVIRONMENT_ATTRIBUTE`], [环境属性], [`environment_attribute`], [],
    [`ENTITY_SUB_PREDICATE_TYPE`], [实体子谓词类型], [`entity_sub_predicate_type`], [],
    [`ENTITY_TYPE`], [实体类型], [`entity_type`], [`pig`], 
    [`FEATURE`], [地物类型], [`worldgen/feature`], [],
    [`FEATURE_SIZE_TYPE`], [树木生成的最小空间要求类型], [`worldgen/feature_size_type`], [],
    [`FLOAT_PROVIDER_TYPE`], [浮点数提供器类型], [`float_provider_type`], [], 
    [`FLUID`], [流体类型], [`fluid`], [`empty`],
    [`FOLIAGE_PLACER_TYPE`], [树叶放置器类型], [`worldgen/foliage_placer_type`], [],
    [`GAME_EVENT`], [游戏事件], [`game_event`], [`step`],
    [`GAME_RULE`], [游戏规则], [`game_rule`], [`step`],
    [`HEIGHT_PROVIDER_TYPE`], [高度提供器类型], [`height_provider_type`], [],
    [`INCOMING_RPC_METHOD`], [服务端管理协议中的请求方法], [`incoming_rpc_methods`], [],
    [`INPUT_CONTROL_TYPE`], [对话框输入控件类型], [`	input_control_types`], [],
    [`INT_PROVIDER_TYPE`], [整数提供器类型], [`int_provider_type`], [],
    [`ITEM`], [物品], [`item`], [`air`],
    [`SLOT_SOURCE_TYPE`], [槽位源类型], [`slot_source_type`], [],
    [`LOOT_CONDITION_TYPE`], [战利品表谓词类型], [`loot_condition_type`], [],
    [`LOOT_FUNCTION_TYPE`], [物品修饰器类型], [`loot_function_type`], [],
    [`LOOT_NBT_PROVIDER_TYPE`], [战利品表相关NBT源类型], [`loot_nbt_provider_type`], [],
    [`LOOT_NUMBER_PROVIDER_TYPE`], [值提供器类型], [`loot_number_provider_type`], [],
    [`LOOT_POOL_ENTRY_TYPE`], [抽取项类型], [`loot_pool_entry_type`], [],
    [`LOOT_SCORE_PROVIDER_TYPE`], [分数提供器类型], [`loot_score_provider_type`], [],
    [`MAP_DECORATION_TYPE`], [地图图标类型], [`map_decoration_type`], [],
    [`MATERIAL_CONDITION`], [地表规则条件], [`worldgen/material_condition`], [],
    [`MATERIAL_RULE`], [地表规则], [`worldgen/material_rule`], [],
    [`MEMORY_MODULE_TYPE`], [生物记忆], [`memory_module_type`], [`dummy`],
    [`MENU`], [屏幕类型], [`menu`], [],
    [`MOB_EFFECT`], [状态效果], [`mob_effect`], [],
    [`NUMBER_FORMAT_TYPE`], [记分板分数显示样式类型], [`number_format_type`], [],
    [`OUTGOING_RPC_METHOD`], [服务端管理协议中的通知方法], [`outgoing_rpc_methods`], [],
    [`PARTICLE_TYPE`], [粒子类型], [`particle_type`], [],
    [`PLACEMENT_MODIFIER_TYPE`], [放置修饰器类型], [`worldgen/placement_modifier_type`], [],
    [`PERMISSION_CHECK_TYPE`], [命令权限检查类型], [`permission_check_type`], [],
    [`PERMISSION_TYPE`], [命令权限类型], [`permission_type`], [],
    [`POINT_OF_INTEREST_TYPE`], [兴趣点类型], [`point_of_interest_type`], [],
    [`POOL_ALIAS_BINDING`], [模板池映射], [`worldgen/pool_alias_binding`], [],
    [`POSITION_SOURCE_TYPE`], [位置源类型], [`position_source_type`], [],
    [`POS_RULE_TEST`], [位置规则测试类型], [`pos_rule_test`], [],
    [`POTION`], [药水效果], [`potion`], [],
    [`RECIPE_BOOK_CATEGORY`], [配方书分类标签], [`recipe_book_category`], [],
    [`RECIPE_DISPLAY`], [预览配方类型], [`recipe_display`], [],
    [`RECIPE_SERIALIZER`], [配方序列化/反序列化器], [`recipe_serializer`], [],
    [`RECIPE_TYPE`], [配方类型], [`recipe_type`], [],
    [`REGISTRY`], [注册表], [`root`], [],
    [`ROOT_PLACER_TYPE`], [树根放置器类型], [`worldgen/root_placer_type`], [],
    [`RULE_TEST`], [规则测试], [`rule_test`], [],
    [`RULE_BLOCK_ENTITY_MODIFIER`], [方块实体数据修饰器], [`rule_block_entity_modifier`], [],
    [`SENSOR_TYPE`], [感受器类型], [`sensor_type`], [],
    [`SLOT_DISPLAY`], [预览槽位类型], [`slot_display`], [],
    [`SOUND_EVENT`], [声音事件], [`sound_event`], [],
    [`SPAWN_CONDITION_TYPE`], [通用变种选择器类型], [`spawn_condition_type`], [],
    [`STAT_TYPE`], [统计类型], [`stat_type`], [],
    [`STRUCTURE_PIECE`], [结构片段], [`worldgen/structure_piece`], [],
    [`STRUCTURE_PLACEMENT`], [结构放置方式], [`worldgen/structure_placement`], [],
    [`STRUCTURE_POOL_ELEMENT`], [结构模板池元素], [`worldgen/structure_pool_element`], [],
    [`STRUCTURE_PROCESSOR`], [结构处理器], [`worldgen/structure_processor`], [],
    [`STRUCTURE_TYPE`], [结构类型], [`worldgen/structure_type`], [],
    [`TEST_ENVIRONMENT_DEFINITION_TYPE`], [测试环境类型], [`test_environment_definition_type`], [],
    [`TEST_FUNCTION`], [硬编码测试函数], [`test_function`], [],
    [`TEST_INSTANCE_TYPE`], [测试实例类型], [`test_instance_type`], [],
    [`TICKET_TYPE`], [加载标签及计算标签类型], [`ticket_type`], [],
    [`TREE_DECORATOR_TYPE`], [树额外装饰器类型], [`worldgen/tree_decorator_type`], [],
    [`TRIGGER_TYPE`], [触发器类型], [`trigger_type`], [],
    [`TRUNK_PLACER_TYPE`], [树干放置器类型], [`worldgen/trunk_placer_type`], [],
    [`VILLAGER_PROFESSION`], [村民职业], [`villager_profession`], [`none`],
    [`VILLAGER_TYPE`], [村民类型], [`villager_type`], [`plain`]
)
==== 可写注册表
可写注册表允许数据包通过数据反序列化器向其中添加自定义（或称数据驱动）的游戏内容。
#general-table(
  caption: [可写注册表],
  columns: (auto, auto, auto),
  colspan: 3,
  header:([注册表], [资源类型], [数据包路径]),
    [`ADVANCEMENT`], [进度], [`advancement`],
    [`BANNER_PATTERN`], [旗帜图案], [`banner_pattern`],
    [`BIOME`], [生物群系], [`worldgen/biome`],
    [`CAT_VARIANT`], [猫的变种], [`cat_variant`],
    [`CHAT_TYPE`], [聊天类型], [`chat_type`],
    [`CHICKEN_VARIANT`], [鸡的变种], [`chicken_variant`],
    [`CONFIGURED_CARVER`], [已配置的雕刻器], [`worldgen/configured_carver`],
    [`CONFIGURED_FEATURE`], [已配置的地物], [`worldgen/configured_feature`],
    [`COW_VARIANT`], [牛的变种], [`cow_variant`], 
    [`DAMAGE_TYPE`], [伤害类型], [`damage_type`],
    [`DENSITY_FUNCTION`], [密度函数], [`worldgen/density_function`],
    [`DIALOG`], [对话框], [`dialog`],
    [`DIMENSION`], [维度], [`dimension`],
    [`DIMENSION_TYPE`], [维度类型], [`dimension_type`],
    [`ENCHANTMENT`], [魔咒], [`enchantment`],
    [`ENCHANTMENT_PROVIDER`], [魔咒提供器], [`enchantment_provider`], [`FLAT_LEVEL_GENERATOR_PRESET`], [超平坦世界生成预设], [`worldgen/flat_level_generator_preset`],
    [`FROG_VARIANT`], [青蛙的变种], [`frog_variant`],
    [`INSTRUMENT`], [山羊角乐器], [`instrument`],
    [`ITEM_MODIFIER`], [物品修饰器], [`item_modifier`],
    [`JUKEBOX_SONG`], [唱片机曲目], [`jukebox_song`],
    [`LEVEL_STEM`], [维度], [`dimension`],
    [`LOOT_TABLE`], [战利品表], [`loot_table`],
    [`MULTI_NOISE_BIOME_SOURCE_PARAMETER_LIST`], [多噪声参数列表], [`worldgen/multi_noise_biome_source_parameter_list`],
    [`NOISE`], [噪声], [`worldgen/noise`],
    [`NOISE_SETTINGS`], [噪声设置], [`worldgen/noise_settings`],
    [`PAINTING_VARIANT`], [画的变种], [`painting_variant`],
    [`PIG_VARIANT`], [猪的变种], [`pig_variant`],
    [`PLACED_FEATURE`], [已放置的地物], [`worldgen/placed_feature`],
    [`PREDICATE`], [谓词], [`predicate`],
    [`PROCESSOR_LIST`], [处理器列表], [`worldgen/processor_list`],
    [`RECIPE`], [配方], [`recipe`],
    [`STRUCTURE`], [已配置的结构地物], [`worldgen/structure`],
    [`STRUCTURE_SET`], [结构集], [`worldgen/structure_set`],
    [`TEMPLATE_POOL`], [结构池], [`worldgen/template_pool`],
    [`TEST_ENVIRONMENT`], [测试环境], [`test_environment`],
    [`TEST_INSTANCE`], [测试实例], [`test_instance`],
    [`TIMELINE`], [时间线], [`timeline`],
    [`TRADE_SET`], [交易集], [`trade_set`],
    [`TRIAL_SPAWNER_CONFIG`], [试炼刷怪笼配置], [`trial_spawner`],
    [`TRIM_MATERIAL`], [盔甲纹饰材料], [`trim_material`],
    [`TRIM_PATTERN`], [盔甲纹饰图案], [`trim_pattern`],
    [`VILLAGER_TRADE`], [村民交易], [`villager_trade`],
    [`WOLF_VARIANT`], [狼的变种], [`wolf_variant`],
    [`WORLD_CLOCK`], [世界时钟], [`world_clock`],
    [`WORLD_PRESET`], [世界预设], [`worldgen/world_preset`],
    [`ZOMBIE_NAUTILUS_VARIANT`], [僵尸鹦鹉螺变种], [`zombie_nautilus_variant`]
) <tab:writable_registry>
==== 不属于任何注册表的游戏资源
有一些游戏资源不属于任何注册表，这些资源包括数据包内的函数、结构模板以及资源包内的所有内容。这些资源类型中部分都与可写注册表的性质类似，即可以自定义写入资源；部分则不能增添新的资源，但可以修改已有资源的配置文件。
#general-table(
  caption: "其他游戏资源",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([类别], [游戏资源], [说明]),
  table.cell(rowspan: 2)[数据包内容], [函数], [可写，`function` 路径下的内容],
  [结构模板], [可写，`structure` 路径下的内容],
  table.cell(fill: rgb("#fde9e9"), rowspan: 11)[资源包内容], [纹理图集], [位于资源包内路径 `atlases`],
  [方块状态], [位于 `blockstates`],
  [纹饰图案], [位于 `equipment`],
  [字体], [可写，位于 `font`],
  [物品模型映射], [位于 `items`],
  [模型], [包括方块模型和物品模型，位于 `models`],
  [粒子], [位于 `particles`],
  [着色器], [可写，位于 `shaders`],
  [后处理管线], [位于 `post_effect`],
  [声音], [可写，位于 `sounds`],
  [纹理], [可写，位于 `textures`],
  table.cell(colspan: 2)[属性修饰符], [可写，存储于所属物品的堆叠组件内],
  table.cell(colspan: 2)[Boss栏], [可写，存储于存档文件夹中的 `level.dat`],
  table.cell(colspan: 2)[命令存储], [可写，存储于存档文件夹中的 `data\command_storage_minecraft.dat`],
  table.cell(colspan: 2)[随机序列], [可写，存储于存档文件夹中各自维度的 `data\random_sequences.dat` 文件内],
)
=== 扁平化 \*
Minecraft的历次版本更新都会对某一些特定的系统进行优化和更改，比如：战斗更新对PVP机制进行了颠覆性的更改，使得1.9之前和之后的PVP是两个完全不同的系统。命令系统也经历过类似的大幅度更改，这便是随着水域更新进行的#proper-noun(display:"扁平化（The flattening）","bian3 ping2 hua4")。

在Minecraft开发之初，由于游戏资源的数量有限，只需要使用1字节就可以设置所有游戏资源的ID。在历次版本更新中，Minecraft的方块、物品数量越来越多，特别是自缤纷更新以来，方块的数量呈爆炸式增长。在扁平化之前，为了应对这些不断增多的游戏资源，一种解决办法是将一大类全部收归到某一个特定的ID中，用这个ID来表示这一类方块，然后在后面附加一个Damage值来表示这一类方块中的某一种。比如花岗岩属于石头一类，石头的数字ID为1，而花岗岩的Damage值为1，所以在旧版本中给予玩家一块花岗岩的命令为：
#codebox("give @p 1 1 1")
可以看到这条命令中有三个参数，第一个 `1` 为石头的ID，第二个 `1` 为数量，第三个 `1` 为Damage值。这种表示方式的底层逻辑是：在访问花岗岩时，必须先访问上一级的数字ID，再访问Damage值，如此才能映射至花岗岩这个值。

缤纷更新做了一个小修改：即启用了部分英文ID，于是在1.8中给予玩家一块花岗岩的命令变为：
#codebox("give @p stone 1 1")
但是缤纷更新做出的这种更改是不完全的，虽然在命令的主体部分将数字ID替换成了英文ID，但是方块的Damage值仍然存在，这种一级ID——Damage值的映射方式没有改变。

时间来到了2017年，水域更新加入了大量的游戏内容，原先的映射方式已不能适应新版本。于是，*Java版1.13的更新基本上删除了所有的数字ID，使得每一个游戏资源都有其独立的英文ID。同时也删除了用Damage值映射方块的办法，去除了中间层，使得资源的映射方式只需要一个键名即可，这一过程便被称作“扁平化”*#footnote[并非所有数字ID都被移除，至今Minecraft仍保留了部分需要使用数字ID的地方。]。比如，在1.13中给予玩家一块花岗岩的命令为：
#codebox("give @p granite 1")
其中参数 `granite` 为花岗岩的键名，`1` 为物品数量。扁平化对所有需要ID的对象都进行了修改，包括但不限于方块、物品、实体、生物群系、粒子、声音事件和画。其具体内容可分为以下几类：
===== 拆分
拆分是最能体现扁平化过程的一类。此举移除了用于指定大类下某一种方块的Damage值，使得一类方块下的每一种方块都有其独立的ID。举例：`stone` 一类共有七种不同的方块：石头、花岗岩、磨制花岗岩、闪长岩、磨制闪长岩、安山岩和磨制安山岩，分别对应0 \~ 6的Damage值。拆分后这七种方块都被给予了独立的ID：`stone`、`granite`、`polished_granite`、`diorite`、`polished_diorite`、`andesite` 和 `polished_andesite`。
===== 重命名
顾名思义，该类即对原有的英文ID进行重命名。有相当一部分重命名是为了迎合方块或物品的英文名称。举例：草方块在扁平化前的ID为 `grass`，扁平化后被重命名为 `grass_block`。
===== 重新分类
这种操作常见于台阶和由双台阶组成的完整方块。扁平化前的台阶和双台阶有两种不一样的ID，扁平化后取消双台阶的ID，并对台阶的下属分类进行拆分，同时取消相关的Damage值。举例：双木台阶被取消，统一更换为木制台阶，同时ID拆分为橡木、云杉、白桦、丛林木、金合欢和深色橡木。
===== 合并
合并常见于有不同方块状态的方块。举例：燃烧的熔炉和熔炉有不同的ID，现合并为熔炉一种，同时将是否燃烧设定为方块状态。
=== 命名空间ID
游戏资源的指定有一个前提是这些对象的ID相互之间不能混淆。数字ID及使用Damage值作区分的指定方法能够避免对象之间的冲突，但扁平化后这种指定方法便无效了。为此在当前的版本中统一使用#proper-noun(display: "（赋）命名空间ID（Namespaced identifier）", "ming4 ming2 kong1 jian1")来映射注册表内的值。

命名空间ID，又称*（赋）命名空间标识符*、#proper-noun(display: "资源路径（Resource location）", "zi1 yuan2 lu4 jing4")、#proper-noun(display: "资源标识符（Resource identifier）", "zi1 yuan2 biao1 shi2 fu2")或#proper-noun(display: "命名空间字符串（Namespaced string）", "ming4 ming2 kong1 jian1 zi4 fu2 chuan4")，是字符串化的映射方式。无论命名空间ID用于映射何种对象，它们都具有同一的表达方式：
#codebox("<namespace>:<path>")
#param-desc(
  [`<namespace>`], [命名空间。], [`<path>`], [路径。]
)
在写法上，除用于分割命名空间和路径的冒号 `:` 外，其中所有的字符都只能为合法字符。合法字符包含以下几类：
#wrap-content(
  tips(
    [大写字母在命名空间ID中为非法字符！],
    width: 7em
  ),
  [
    + 数字：`0123456789`；
    + 小写字母：`abcdefghijklmnopqrstuvwxyz`；
    + 下划线：`_`；
    + 连字符：`-`；
    + 点：`.`。
  ],
  align: right
)
除此之外所有的字符均为非法字符，包括汉字、平假名、片假名、西里尔字母、希腊字母、制表符、几何图形符、`+` 等符号。斜杠 `/` 比较特殊，它在命名空间中为非法字符，但是在路径中可用于分割目录的不同层级，以下会有详细说明。
==== 命名空间ID的实际意义
#wrap-content(
  tips(
    [原版游戏中大部分对象都使用命名空间 `minecraft`，但是六种基本命令参数类型（见小节@subsec:command_argument）却使用命名空间 `brigadier`。],
    width: 13em
  ),
  [
    
    #proper-noun(display: "命名空间（Namespace）", "ming4 ming2 kong1 jian1")是游戏资源的区界，它位于资源类型的父层级，所有来自Minecraft原版游戏的资源均位于命名空间 `minecraft`。*通过不同的自定义命名空间可以将新增的内容和原版内容区分开来，以防止新内容和原版内容、新内容和其他新内容之间产生冲突。*例如，有两个命名空间ID `minecraft:something` 和 `custom:something`，它们指定的是两个不同的对象，因为它们的命名空间不同，前者为 `minecraft`，后者为 `custom`，即使两者拥有相同的路径（名称） `something`。
  ],
  align: left
)
部分游戏资源在命名空间下有一定的文件路径，尤其是资源包、数据包内容，这时就可以使用 `/` 以表明它们的文件路径。这里命名空间实际上是一个文件夹，这个文件夹的结构一般是 `<命名空间>\<资源类型>\<文件夹1>\<文件夹2>\…\<文件名>.<后缀>`。若要映射到这个文件，则命名空间ID的写法为
#codebox("<命名空间>:<文件夹1>/<文件夹2>/…<文件名>")
注意以下几点：
+ 资源类型不作为命名空间ID的一部分；
+ 资源路径的子文件夹至文件之间的一系列路径必须完整；
+ 文件名后缀不写。
下面举两个例子以说明之：
#example(
  [
    有数据包函数文件路径为 `minecraft\function\load.mcfunction`，试用命名空间ID指定之。
  ],
  [
    这里 `function` 为资源类型，`.mcfunction` 为文件的后缀。故命名空间ID为
    #codebox("minecraft:load")
  ]
) <exa:namespaced_id_in_datapack>
#example(
  [
    有资源包纹理文件路径为 `minecraft\textures\block\command_block_front.png`，试用命名空间ID指定之。
  ],
  [
    这里 `textures` 为资源类型，`.png` 是文件后缀，依照其路径将命名空间ID写为
    #codebox("minecraft:block/command_block_front")
  ]
)
==== 命名空间ID字符串的识别与一般写法
命名空间ID是形如 `<字符串>:<字符串>` 的字符串，游戏在识别、调用相关对象时，如果冒号 `:` 存在，会将冒号前的内容视作命名空间，其中不能出现斜杠 `/`；将冒号后的内容视作路径，可以出现斜杠。为了保证识别的正确性，整个字符串中最多只能出现一个冒号，否则识别会出现错误。如果冒号不存在，字符串的形式为 `<字符串>`，则游戏会直接将整个字符串直接识别为路径，并默认命名空间为 `minecraft`，有些时候可以适当地减少书写命名空间，但省略命名空间的行为仍是不被建议的：虽然命名空间在原版大部分需要ID的地方上不是必须的，但在一些情况下命名空间是必须的，包括但不限于NBT路径中指定ID的节点。鉴于读者在实践的过程中可能会忘记必须添加命名空间的地方，或是混淆原版内容和自定义的内容，那么最好还是完整地书写命名空间ID。
#example(
  [
    下列命名空间ID的识别结果为何？
    #codebox("something") <code:namespaced_id_example_1>
    #codebox("minecraft:something") <code:namespaced_id_example_2>
    #codebox("custom:something") <code:namespaced_id_example_3>
    #codebox("minecraft/custom:something") <code:namespaced_id_example_4>
    #codebox("minecraft/something") <code:namespaced_id_example_5>
    #codebox("minecraft:Something") <code:namespaced_id_example_6>
    #codebox("minecraft:custom:something") <code:namespaced_id_example_7>
  ],
  [
    以上各命名空间ID的识别结果列于下表：
    #general-table(
      caption: [命名空间ID的识别结果],
      columns: (auto, auto, auto ,auto),
      colspan: 4,
      header:([命名空间ID], [识别的命名空间], [识别的路径], [识别结果]),
        [@code:namespaced_id_example_1], [`minecraft`], [`something`], [`minecraft:something`],
        [@code:namespaced_id_example_2], [`minecraft`], [`something`], [`minecraft:something`],
        [@code:namespaced_id_example_3], [`custom`], [`something`], [`custom:something`],
        [@code:namespaced_id_example_4], [-（含有非法字符 `/`）], [-], [识别失败],
        [@code:namespaced_id_example_5], [`minecraft`], [`minecraft/something`], [`minecraft:minecraft/something`],
        [@code:namespaced_id_example_6], [`minecraft`], [-（含有非法字符 `S`）], [识别失败],
        [@code:namespaced_id_example_7], [-（冒号数量大于1）], [-], [识别失败]
    )
  ]
)
一般而言，命名空间和路径推荐的写法是#proper-noun(display: "蛇形命名法（Snake case）", "she2 xing2 ming4 ming2 fa3")，即当名称中含有多个单字时，以下划线 `_` 取代每一个空格的写法。蛇形命名法的书写仍需遵守合法字符的规定，不能出现大写字母。例如，下面的命名空间ID在命名空间和路径上均使用了蛇形命名法：
#codebox("ancient_city:get_out")
=== 数据包标签 <subsec:tag_in_datapack>
一个单独的命名空间ID只能映射至单独的一个对象，如果要同时映射多个对象，一般的做法是将对象分类，通过映射同一种类别的对象从而映射多个对象。这种将游戏资源分类的手段被称为#proper-noun(display: "数据包标签（Tags in data packs）", "shu4 ju4 bao1 biao1 qian1")，简称#proper-noun(display: "标签（Tag）", "biao1 qian1")由于命令系统存在多个名为“标签”的概念，笔者不建议使用这样的简称以防止与其他概念的混淆。。原版游戏有一些既有数据包标签，数据包标签的名称大多拥有实际的意义：例如，数据包标签 `#fire` 映射至两种方块，即 `fire`（火焰）和 `soul_fire`（灵魂火焰）；`#mineable/axe` 映射至所有能被斧采集的方块。

数据包标签的表示方式类似于命名空间ID，但需要在前面加上井号 `#`，写法为
#codebox("#<namespace>:<id>")
例如 `#minecraft:fire`。数据包标签映射的对象可以直接是一个游戏资源，如方块、实体等，也可以是另一个数据包标签。例如，数据包标签 `#minecraft:mineable/axe` 还包含了 `#minecraft:planks`（所有种类的木板）、`#minecraft:signs`（所有种类的告示牌）等数据包标签。指定某数据包标签时，其映射的其他数据包标签下的对象也会被选择。但是同一个数据包标签映射的资源类型必须相同，不能将不同类型的对象放入一个数据包标签中，例如，猪和石头不能被放在同一个数据包标签中。

数据包标签涵盖的对象类型非常广，包括方块、实体、物品、游戏事件、生物群系等。读者可以在既有数据包标签的基础上，使用数据包添加一些自定义的数据包标签。数据包标签的定义方式见小节@subsec:tag_definition。
== 命令
#proper-noun(display: "命令（Command）", "ming4 ling4")，又称#proper-noun(display: "控制台命令（Console command）", "kong4 zhi4 tai2 ming4 ling4")、#proper-noun(display: "斜杠命令（Slash command）", "xie2 gang4 ming4 ling4")或#proper-noun("MC-CMD")，*是一种高级的、通过输入具有特定语法文本以实现控制游戏本身运行的功能*。命令文本需要讲究严格的语法，不允许任何模糊的表达。目前MC-CMD已被正式确认为一种编程语言，名称为mcfunction，与C语言、Java、Python等并列——但这是一种只适用于游戏Minecraft内部的编程语言，无法与外部环境进行交互。
=== 命令参数 <subsec:command_argument>
参数是命令的组成部分，每一条命令都由一个命令头和若干参数组成，参数之间用空格分隔，由此得到命令的通用格式：
#codebox("<命令名> [<参数1>] [<参数2>] …")
例如在下面的命令中，`say` 是该命令的命令名，`Hello World!` 是后续参数：
#codebox("say Hello World!") <code:say_hello_world>
在本教程中，为了方便解释命令中各参数的语法，会使用一系列括号或其他符号来表示这些参数的具体内容及可用性。为了使说明更加方便，本教程采用了和游戏本体、Minecraft Wiki一样的命令语法格式，如下表所示。
#general-table(
  caption: [语法指引格式],
  columns: (1fr, 3fr, 5fr),
  colspan: 3,
  header:([语法], [含义], [举例]),
  [`字面量`], [按字面量原样输入], [命令 `/locate biome` 中第2个参数 `biome` 即为字面量，编写命令时不要更改这个参数的写法。],
  [`<参数>`], [需要使用一合适的值来替换该参数], [命令 `/say <message>` 的第2个参数需要用自定的值，比如 `/say Hello World!`。],
  [`[<参数>]`], [该参数是可选的，如果使用该参数，则需要使用一合适的值替换之], [命令 `/summon <entity> [<pos>] [<nbt>]` 中第3、4个参数可选，填写这些参数时需要用自定的值。],
  [`(参数|参数)`], [（必须的）在显示的值中选择一个填写。语法介绍中这些值由竖线分隔], [命令 `/time query (daytime|gametime|day)` 的第3个参数是必填的，从 `daytime`、`gametime` 和 `day` 中选择一个填写。],
  [`[参数|参数]`], [（可选的）在显示的值中选择一个填写。语法介绍中这些值由竖线分隔], [命令 `/experience add <targets> <amount> [levels|points]` 的第5个参数虽然不是必写的，但仍可以从参数 `points` 和 `levels` 中选择一个填写。],
  [`-> 子命令`], [必须接入一条子命令], [命令 `/execute positioned <pos> -> execute` 的第6个参数是必填的，内容为命令 `/execute` 的一个子命令。],
  [`-> [子命令]`], [可以接入一条子命令], [命令 `/execute (if|unless) block <pos> <block> -> [execute]` 的第7个参数可以填写 `/execute` 的子命令，也可以不填写。]
)
下面举一实例以说明之：
#example(
  [
    命令 `/data` 的一种语法如下所示：#codebox("data get (block <targetPos>|entity <target>|storage <target>) [<path>] [<scale>]")
  ],
  [
    语法中 `data` 为命令名，`get` 是字面量，这两者必须按语法指引中的字面量原样输入命令。
    第3、4个参数必须从 `block <targetPos>`、`entity <target>` 和 `storage <target>` 中选则一种，且不得空缺。若使用 `block <targetPos>`，则 `block` 按原样输入，后续使用 `<targetPos>` 的自定义值，但不得在 `block` 后续使用 `<target>` 参数，因为 `<target>` 是 `entity` 或 `storage` 的后续参数。第5、6个参数 `[<path>]`、`[<scale>]` 可选并自定义值。使用该语法且实际可行的命令可以是：
    #codebox("data get entity @s SelectedItem") <code:grammar_guideline_example>
    命令@code:grammar_guideline_example 使用了参数 `entity`，`@s` 是 `<target>` 使用的值，`SelectedItem` 是 `[<path>]` 使用的值，参数 `[<scale>]` 未使用。
  ]
)
为了使不同的命令具有不同的功能，它们使用的参数类型各不相同。有些命令作用的对象为实体，它们则会使用指定实体的参数，有些命令作用的对象为某一个坐标，则其使用坐标参数。游戏使用的命令参数有如布尔值、整型、函数、槽位值、坐标值、目标选择器、JSON、NBT等。一些复杂参数会在本教程后文呈现，下面列举的是基本参数，即在Brigadier中使用的六种基本数据类型：
===== #proper-noun(display: "布尔值（Bool）", "bu4 er3 zhi2")
只有两种可用参数，为 `true` 和 `false`，分别代表“是”与“否”。
===== #proper-noun(display: "整数（Integer）", "zheng3 shu4")
使用32位整型数值，是介于 `-2147483648` 和 `2147483647` 之间的整数值，如 `1`、`0`、`-1` 等。不同命令中使用整型的参数规定的最大可用值和最小可用值不一致。
===== #proper-noun(display: "长整数（Long）", "chang2 zheng3 shu4")
使用64位整型数值，是介于 `-9223372036854775808` 和 `9223372036854775807` 之间的整数值。
===== #proper-noun(display: "单精度浮点数（Float）", "dan1 jing1 du4 fu2 dian3 shu4")
使用占据4字节的浮点数，范围大约介于$-3.4 times 10^38$和$3.4 times 10^38$之间，在不同命令中使用单精度浮点数的参数规定的最大可用值和最小可用值不一致。一些单精度浮点数的示例有：`0`、`1.1`、`-1`、`.5` 等，小数形式的整数部分可以省略。在命令参数中使用的浮点数暂时不支持科学计数法#footnote[参见#link("https://bugs.mojang.com/browse/MC/issues/MC-130925")[MC-130925]。]。
===== #proper-noun(display: "双精度浮点数（Double）", "shuang1 jing1 du4 fu2 dian3 shu4")
使用占据8字节的浮点数，范围大约介于$-1.8 times 10^108$和$1.8 times 10^108$之间。可以表示比单精度浮点数绝对值更大的有效数字。
===== #proper-noun(display: "字符串（String）", "zi4 fu2 chuan4")
字符串是由多个字符组成的序列，可用于表示单词、句子或其他符号组合。
====== #proper-noun(display: "单个词（Single word）", "dan1 ge4 ci2")
即不含空格的字符串，如 `word`，若单个词的内容由多个词语组成，则一般使用下划线 `_` 连接相邻词，如 `word_with_underscores`。
====== #proper-noun(display: "词组（Quotable phrase）", "ci2 zu3")
可以由双引号括起，如 `"quoted phrase"`，也可以使用单引号来定义，如 `'quoted phrase'`，此时单词之间可以有空格。
====== #proper-noun(display: "贪婪词组（Greedy phrase）", "tan1 lan2 ci2 zu3")
这种形式的词组不带引号，任意使用空格。该形式的参数通常位于命令的末尾，将命令的剩余部分全部作为字符串参数。如：`words with spaces`。上文中命令@code:say_hello_world 就使用了这种参数。

Minecraft的命令有很多，可用 `/help` 命令查询任何可用命令的语法，`/help` 本身的语法为#index(index: "command", "help")
#codebox("help [<command>]")
#param-desc(
  [`[<command>]`（字符串 `brigadier:string`）], [可选，若不指定，则在执行权限等级下列出所有可用的命令。若指定了该参数，则必须为可用的命令，比如 `help help` 会返回 `/help` 这条命令的语法指引。由于该参数是一个贪婪词组，因此也可以输入命令的多个参数，例如若要查询 `/execute` 命令下的 `if` 子命令用法，则可以输入 `help execute if`，然后会返回 `execute if` 的具体用法。]
)
=== 命令的输入
命令是一种文本输入，以下是可供命令输入的途径：
===== 使用聊天栏输入命令
为了和普通的聊天文本区分开来，在聊天栏中输入命令时会在命令前加一个前缀 `/`，此前缀必不可少。在不使用按键 `T` 召唤聊天栏时可以直接键入 `/` 输入命令，这是使玩家快速进入命令输入模式的一种办法。比如，玩家可以在聊天栏中输入 `/help` 以查询命令语法。

呼出聊天栏后，可以使用 `↑` 或 `↓` 键调用#proper-noun(display: "命令历史（Command history）", "ming4 ling4 li4 shi3")，即先前键入的命令。如果之前输入的命令有语法错误的话，切换至该命令时依旧会有语法错误，不会自动更正，更不会因为含有语法错误就不显示该命令。这种快捷键在命令方块控制台中不适用。命令历史可以跨存档调用。

在聊天栏输入命令时，`Tab` 键可用于补全命令。未输入任何命令字符的时候，使用 `Tab` 键可以看到聊天栏上出现的一个命令列表（如@fig:using_tab_when_typing_command），鼠标滚轮有助于翻找需要的命令。
#figure(
  caption: [在聊天栏输入命令时使用 `Tab` 键],
  image("图片/在聊天栏输入命令时使用Tab键.png", width: 10em)
) <fig:using_tab_when_typing_command>
读者可以直接在命令列表中点击需要的命令，或者如@fig:command_typing (a) 所示，输入命令的前若干字符后使用 `Tab` 键补全。若这个命令后续还有其他参数，则也可以如@fig:command_typing (b) 所示用 `Tab` 键补全。
#sub-figure(
  caption: [命令输入过程],
  label: <fig:command_typing>,
  [#image("图片/命令输入过程a.png", height: 4em)\(a)],
  [#image("图片/命令输入过程b.png", height: 4em)\(b)]
)
聊天栏的字符数量被限制在256以内，命令开头的 `/` 也会被计入字符数。因此，聊天栏不能用于执行太长的命令。
===== 在命令方块或命令方块矿车内输入命令
命令方块控制台可输入的字符最多为32500个，较聊天栏的限制有很大提升。文本框长度有限，每次只能显示命令的其中一段，需要使用 `鼠标左键` 或 `←`、`→` 键移动光标调整命令显示的位置，且每次打开命令方块GUI时光标总显示在命令的末尾。

在命令方块或命令方块矿车内输入命令时，斜杠前缀 `/` 不是必须的。和在聊天栏中使用命令一样，当文本框中无任何内容时，下方会显示一个命令列表（如@fig:command_block_gui），通过调整鼠标滚轮能够调整命令列表显示的位置，按 `Tab` 键能够在输入命令时自动补全或选择命令的部分。
#figure(
  caption: [命令方块GUI],
  image("图片/命令方块GUI.png", width: 28em)
) <fig:command_block_gui>
===== 在数据包函数文件中输入命令
这种编写方式需要使用一定的编译软件，常用的编译软件有Windows自带的记事本、Visual Studio Code等。函数中的命令不能带有斜杠前缀。具体的内容可参阅《数据包》教程的描述。
===== 在服务器控制台中输入命令
===== 在带有 `run_command` 动作的点击事件的文本组件或对话框按钮中输入命令
=== 权限等级与限制条件
命令功能强大、种类繁多，如果在任意情况下都能够随意使用，则很有可能会破坏玩家的游戏体验。因此，命令系统有一套专门的机制用于控制游戏内可用命令的情形，即权限等级。#proper-noun(display: "权限等级（Permission level）", "quan2 xian4 deng3 ji2")用于决定命令执行者可以使用什么样的命令。所有命令都有一个所需的权限等级，如果命令执行者没有达到该有的权限等级，则无法执行该命令。例如：`/advancement` 需要的权限等级为2，命令方块的权限等级也为2，因此命令方块可以执行该命令；而关闭命令的单人游戏玩家的权限为0，所以该玩家不能执行该命令。

权限等级共分为0、1、2、3、4级，表罗列了Java版所有可用命令需要的权限等级与限制条件。除权限等级之外，一些命令还对当前的游戏世界有限制：一些命令只能在专用服务器（以下简称多人游戏）中使用，另有只能在非专用服务器（以下简称单人游戏，无论是否对局域网开放）中使用的命令，然而大部分命令都是无此限制条件的。
#split-table(
  caption: [Java版可用命令列表],
  original-cols: (3fr, 2fr, 2fr),
  seperator: (3,),
  header: ([命令], [权限等级], [限制条件]),
  data: (
    [`/advancement`], [2], [],
    [`/attribute`], [2], [],
    [`/ban`], [3], [仅多人游戏],
    [`/ban-ip`], [3], [仅多人游戏],
    [`/banlist`], [3], [仅多人游戏],
    [`/bossbar`], [2], [],
    [`/chase`], [0], [仅调试工具],
    [`/clear`], [2], [], 
    [`/clone`], [2], [],
    [`/damage`], [2], [],
    [`/data`], [2], [],
    [`/datapack`], [2], [], 
    [`/debug`], [3], [],
    [`/debugconfig`], [3], [仅调试工具],
    [`/debugmobspawning`], [2], [仅调试工具],
    [`/debugpath`], [2], [仅调试工具],
    [`/defaultgamemode`], [2], [],
    [`/deop`], [3], [仅多人游戏],
    [`/dialog`], [2], [],
    [`/difficulty`], [2], [],
    [`/effect`], [2], [],
    [`/enchant`], [2], [],
    [`/execute`], [2], [],
    [`/experience`], [2], [],
    [`/fill`], [2], [],
    [`/fillbiome`], [2], [],
    [`/fetchprofile`], [2], [],
    [`/forceload`], [2], [],
    [`/function`], [2], [],
    [`/gamemode`], [2], [],
    [`/gamerule`], [2], [],
    [`/give`], [2], [],
    [`/help`], [0], [],
    [`/item`], [2], [],
    [`/jfr`], [4], [],
    [`/kick`], [3], [],
    [`/kill`], [2], [],
    [`/list`], [0], [],
    [`/locate`], [2], [],
    [`/loot`], [2], [],
    [`/me`], [0], [],
    [`/msg`], [0], [],
    [`/op`], [3], [仅多人游戏],
    [`/pardon`], [3], [仅多人游戏],
    [`/pardon-ip`], [3], [仅多人游戏],
    [`/particle`], [2], [],
    [`/perf`], [4], [],
    [`/place`], [2], [],
    [`/playsound`], [2], [],
    [`/publish`], [4], [仅单人游戏],
    [`/raid`], [3], [仅调试工具],
    [`/random`], [0（不使用 `sequence`）或2（使用 `sequence`）], [],
    [`/recipe`], [2], [],
    [`/reload`], [2], [],
    [`/return`], [2], [],
    [`/ride`], [2], [],
    [`/rotate`], [2], [],
    [`/save-all`], [4], [仅多人游戏],
    [`/save-off`], [4], [仅多人游戏],
    [`/save-on`], [4], [仅多人游戏],
    [`/say`], [2], [],
    [`/serverpack`], [2], [仅调试工具],
    [`/schedule`], [2], [],
    [`/scoreboard`], [2], [],
    [`/seed`], [0（单人游戏）或2（多人游戏）], [],
    [`/setblock`], [2], [],
    [`/setidletimeout`], [3], [仅多人游戏],
    [`/setworldspawn`], [2], [],
    [`/spawn_armor_trims`], [2], [仅调试工具],
    [`/spawnpoint`], [2], [],
    [`/spectate`], [2], [],
    [`/spreadplayers`], [2], [],
    [`/stop`], [4], [仅多人游戏],
    [`/stopsound`], [2], [],
    [`/stopwatch`], [2], [],
    [`/summon`], [2], [],
    [`/swing`], [2], [],
    [`/tag`], [2], [],
    [`/team`], [2], [],
    [`/teammsg`], [0], [],
    [`/teleport`], [2], [],
    [`/tell`], [0], [],
    [`/tellraw`], [2], [],
    [`/test`], [2], [],
    [`/tick`], [3], [],
    [`/time`], [2], [],
    [`/title`], [2], [],
    [`/tm`], [0], [],
    [`/tp`], [2], [],
    [`/transfer`], [3], [仅多人游戏],
    [`/version`], [0], [],
    [`/version`], [0（单人游戏）或2（多人游戏）], [],
    [`/w`], [0], [],
    [`/waypoint`], [2], [],
    [`/warden_spawn_tracker`], [2], [仅调试工具],
    [`/weather`], [2], [],
    [`/whitelist`], [3], [仅多人游戏],
    [`/worldborder`], [2], [],
    [`/xp`], [2], []
  )
)
权限等级和限制条件也会影响命令 `/help` 的行为。比如，若执行权限等级为0，则 `/help` 仅列出所需权限等级为0的命令；若执行权限等级为2，则仅列出所需权限等级小于等于2的命令。
=== 命令的解析 \*
游戏处理命令的过程可分为*解析*和*执行*两个阶段。Minecraft使用*Brigadier*作为命令的解析器、派发器。

命令的实质是一个根命令节点的直接量分支，这就意味着所有的命令都是一个树状结构，命令中每一个参数都作为一个节点，而命令名作为根节点使用。显然，一个节点可能会有两种类型：字面量和变量，反映到命令文本语法中分别为字面量参数和需要自定义值的参数。

游戏在读取命令后，会首先解析根节点是否是已注册的命令，其次解析下一个参数即子节点是否可用，然后依次解析余下的节点。Brigadier读取到某一个节点时，会枚举其子节点的所有可行节点，并在聊天栏或命令方块控制台内显示为可读性较强的可视化参数列表。
#figure(
  caption: [命令 `tag` 的所有结点和分支],
  image("图片/命令tag的所有结点和分支.png", width: 18em)
) <fig:branch_of_command_tag>
以命令 `/tag` 为例，其命令树如@fig:branch_of_command_tag 所示。`tag` 是根命令，其子节点 `<target>` 是一个需要特定参数类型（这里是 `entity`）的节点，解析此节点的时候，会判断输入的参数是否为 `entity` 类型，若为否则解析异常，命令无法执行。2级子节点是已注册的字面量 `add`、`remove` 和 `list`，解析该级节点的工作比较简单：只需读取该节点的文本是否与注册的字面量吻合。若2级子节点的参数指定为 `add`、`remove`，则读取3级子节点 `<name>`，这个节点又是一个需要自定义的量；若2级子节点的参数指定为 `list`，则不能再添加后续参数。
=== 命令上下文
当一条命令被执行时，该命令一定有一个调用者以及调用环境，这一系列调用者及调用环境构成的集合被称为#proper-noun(display: "命令上下文（Command context）", "ming4 ling4 shang4 xia4 wen2")，或称#proper-noun(display: "执行上下文（Execution context）", "zhi2 xing2 shang4 xia4 wen2")、#proper-noun(display: "命令源（Command origin）", "ming4 ling4 yuan2")、#proper-noun(display: "命令来源堆叠（Command source stack）", "ming4 ling4 lai2 yuan2 dui1 die2")。

命令上下文由以下参数构成：
===== 执行权限等级
===== #proper-noun(display: "执行者（Executor）", "zhi2 xing2 zhe3")
由“执行者名称”和“执行者实体”两个参数构成，但执行者实体不一定存在，例如执行者为命令方块、命令方块矿车或服务端的时候。
===== #proper-noun(display: "执行位置（Execution position）", "zhi2 xing2 wei4 zhi4")
这个参数是命令执行时所在的坐标，包含$x$、$y$、$z$三个坐标参数。
===== #proper-noun(display: "执行朝向（Execution rotation）", "zhi2 xing2 chao2 xiang4")
这个参数是命令执行时面向的方向，包含偏航角和俯仰角两个参数。
===== #proper-noun(display: "执行锚点（Execution anchor）", "zhi2 xing2 mao2 dian3")
#proper-noun(display: "实体锚点（Entity Anchor）", "shi2 ti3 mao2 dian3")是实体身上用于定位的*点*，有两个可用的实体锚点：脚部和眼部。故名思义，脚部位于实体碰撞箱的底部中心点，这个位置实际上就是实体本身的位置，也是*默认使用的实体锚点*。眼部位于实体眼睛高度处碰撞箱的中心点。眼部和脚部在水平方向上的位置是一样的，在$y$轴上，这个实体眼睛部位的高度就是眼部和脚部高度的差值。
#figure(
  caption: "玩家的实体锚点",
  image("图片/玩家的实体锚点.png", width: 9em)
)
对于玩家而言，其眼部与脚部的高度差约为1.62格，如上图所示。但是不同实体的眼部高度实际上是不一致的，不能笼统地认为所有实体的眼部高度均为1.62格。

相应地，锚点也作为命令上下文参数的一部分，是为执行锚点。如果执行位置为一个实体所在的位置，则脚部与执行位置实际上是重合的。事实上在所有的命令中，*执行锚点默认都是脚部*。无论锚点是否被修改为眼部，执行位置一定是在实体碰撞箱的底部中心点，不会随着锚点的变化而发生变动。
===== #proper-noun(display: "执行维度（Execution dimension）", "zhi2 xing2 wei3 du4")
这个参数是命令执行所在的维度，执行位置位于这个维度内。
===== 执行输出反馈
尝试执行命令会产生一定的执行效果，并在执行失败或执行成功时返回#proper-noun(display: "成功次数（Success）", "cheng2 gong1 ci4 shu4")和#proper-noun(display: "结果（Result）", "jie2 guo3")两个返回值。其中成功次数总是为0或1，结果一定为整数，遇到小数时则向下取整。下面讨论所有种类的命令执行效果：
====== 无法解析
这种效果会在命令中存在无法解析的参数、输入的命令不完整或执行上下文不符合命令的限制条件，如执行者拥有的权限等级不够、超出游戏世界的限制时出现。此时命令没有返回值。在聊天栏或命令方块内输入的命令若无法解析，则会返回语法错误信息。在函数内的命令若无法解析，则该函数无法加载。
====== 执行错误
出现这种效果说明命令中存在严重的漏洞。此时命令没有返回值。
====== Void
当且仅当执行命令 `/function` 时会出现这种效果，说明 `/function` 调用了一个Void类型的函数，没有返回值。
====== 执行中断
当且仅当执行命令 `/execute` 时会出现这种效果，此时 `/execute` 的分支数量为0，在 `run` 子命令执行前执行就已经中止。此时命令没有返回值。
====== *执行失败*和*执行成功*
当命令执行效果不是上述4种中任意一种时，才能出现执行失败或执行成功。且只有当执行效果为执行失败或执行成功时，才能返回成功次数和结果。执行失败并不意味着命令没有起作用，执行成功也不意味着命令会对游戏做出更改。

不同情况下的命令上下文列举于下表：
#general-table(
  caption: [不同情况的命令上下文],
  columns: (4fr, 5fr, 4fr, 4fr, 4fr, 4fr, 4fr),
  colspan: 7,
  header:([情况], [执行权限等级], [执行者], [执行位置], [执行朝向], [执行锚点], [执行维度]),
  [玩家], [视情况而定], [玩家], [玩家的位置], [玩家的朝向], [脚部], [玩家所在的维度],
  [服务器控制台], [4], [Server], [世界出生点方块的西北下角顶点], [水平向南], [脚部], [主世界],
  [服务端], [2], [Server], [世界出生点方块的西北下角顶点], [水平向南], [脚部], [主世界],
  [命令方块], [2], [命令方块], [命令方块的正中心], [命令方块的朝向], [脚部], [命令方块所在维度],
  [命令方块矿车], [2], [命令方块矿车], [命令方块矿车的位置], [命令方块矿车的朝向], [脚部], [命令方块矿车所在维度],
  [函数], [可修改], [该函数的调用者], [函数调用者的位置], [函数调用者的朝向], [函数调用者的锚点], [函数调用者所在维度],
  [告示牌], [2], [点击告示牌的玩家], [告示牌所在方块正中心], [水平向南], [脚部], [告示牌所在维度],
  [`/execute`], [-], [修饰后的执行者], [修饰后的执行位置], [修饰后的执行朝向], [修饰后的执行锚点], [修饰后的执行维度],
  [自定义进度], [2], [获得进度的玩家], [玩家的位置], [玩家的朝向], [脚部], [玩家所在的维度],
  [自定义魔咒], [2], [魔咒作用的实体], [魔咒作用的位置], [魔咒作用实体的朝向], [脚部], [魔咒作用的维度]
)
#tips(
  [
    玩家的权限等级与其游戏模式无关，需要分情况讨论：
    + 若该玩家是服务器管理员，则他的权限等级由 #icon(name: "json")  `ops.json` 中的值决定，默认为4级；
    + 若该玩家处于启用命令的单人世界中或为启用命令的局域网世界所有者，则他的权限等级为4级；
    + 若该玩家处于启用命令的局域网世界中，则他的权限等级为4级；
    + 非上述情况者权限等级一律为0级。
    函数的权限等级默认为2级，可在 #icon(name: "file") `server.properties` 中修改。
  ],
  width: 100%
)
== JSON格式
在讲述数据包和资源包这两种开发实例之前，有必要先介绍Minecraft使用的用于数据交换的格式，即JSON格式。事实上，这种数据格式的应用极其广泛，是当今互联网最通用的数据交换格式之一。在Minecraft中，为方便网络传输和数据存储，一些游戏内程序会被*序列化*为JSON格式。而对于数据包、资源包内容中的JSON格式而言，游戏会尝试将这些JSON数据*反序列化*为游戏内相应的程序。

游戏的一些数据以 `.json` 文件的格式存储在各文件夹中。这些文件有如：资源包的模型文件，数据包的进度、谓词文件，游戏版本信息文件，等等。下面展示的是金合欢木按钮的模型文件：
#codefile(
  lang: "json",
  title: "assets > minecraft > models > block > acacia_button.json",
  "{
  \"parent\": \"minecraft:block/button\",
  \"textures\": {
    \"texture\": \"minecraft:block/acacia_planks\"
  }
}")
=== JSON数据类型
#proper-noun("JSON（JavaScript Object Notation，JavaScript对象表示法)")是一种轻量级数据交换格式，独立于编程语言，是JavaScript的一个子集。其内容主要由键和值构成，即#proper-noun(display: "键值对（Name-value pair）", "jian4 zhi2 dui4")，这些键值对可认为是一个个#proper-noun(display: "字段（Field）", "zi4 duan4")。这种格式主要有两个优点：第一，便于编写者阅读和修改；第二，由于其轻量级的特点，其对环境的依赖程度较小，因此能用于存储大量不同种类的信息。Minecraft使用的JSON标准为ECMA-404。

JSON格式键值对的基本语法为：
#codebox("\"<键>\":<值>")
#wrap-content(
  tips(
    [键名的两侧必须是*英文引号*，且不接受单引号！],
    width: 15em
  ),
  [
    
    对于一个键，可以给其定义一个值。在书写时，JSON的所有键的键名必须用*双引号*引起。若有多个键值对，则需使用逗号将这些键值对分隔开来，最后一个键值对的后面不加逗号，如：
  ],
  align: right
)
#codebox("\"<键>\":<值>,\"<键>\":<值>")
在一个`.json`文件中，须使用花括号 `{}` 将所有的键值对封装包裹在一起，如：
#codebox("{\"<键>\":<值>,\"<键>\":<值>}")
对于值而言，每一个不同的键都需的值的类型不尽相同，比如键 `color` 可能需要的是颜色值，`bold` 可能需要的是布尔值，`text` 可能需要的是字符串，等等。JSON一共使用六种不同的数据类型：
===== #icon(name: "json-string") #proper-noun(display: "字符串（String）", "zi4 fu2 chuan4")
常见的数据类型，可以包含任意字符（如空格），字符串由一对*（英文）双引号*定义，*不接受单引号*，用法举例：
#codebox("\"description\": \"The default data for Minecraft\"")
也可以使用中文：
#codebox("\"description\": \"我的世界默认数据包\"")
JSON同时也支持Unicode，表示方式为 `\uxxxx`，其中每一个 `x` 都为一个十六进制数字。例如，符号★的Unicode为 `U2605`，则在字符串中输入★的方式可以为：
#codebox("\"text\": \"\u2605\"")
这样便可以在字符串中输入一些生僻字或是在键盘上无法直接打出来的字符。但是Minecraft的字库是有限的，并非所有的字符都可以在Minecraft中显示。
===== #icon(name: "json-bool") #proper-noun(display: "布尔值（Bool）", "bu4 er3 zhi2")
由 `true`（真）或 `false`（假）定义，这两者是JSON中的字面量符号，不需要使用双引号引起，举例：
#codebox("\"bold\": true")
#codebox("\"italic\": false")
===== #icon(name: "json-number") #proper-noun(display: "数值（Number）", "shu4 zhi2")
由数字定义，允许使用整数、浮点数或是科学计数法表示的数，举例：
#codebox("\"min\": 1.0")
在JSON中使用的数值不需要注明它们的数据类型。
===== #icon(name: "json-array") *数组（Array，或称为列表）*#index(display: "数组（Array）", "shu4 zu3")
由一对方括号定义，数组中元素与元素之间使用逗号隔开，*最后一个元素后不能有逗号*。这些元素可以是其他的数据类型，如字符串、布尔值、数值和对象，数组中甚至能嵌套数组。在定义其他的数据类型时，需注意这些数据类型的定义方法。以下为包含了数值的数组：
#codebox("\"frames\": [1, 2, 3, 4, 5]")
下面为包含了字符串的数组，字符串均由一对双引号定义：
#codebox("\"text\": [\"A\", \"B\", \"C\"]")
对于数组内的元素，其数据类型不必完全一致，例如：
#codebox("\"extra\": [1, {\"text\": \"2\"}, \"3\"]")
===== #icon(name: "json-object") #proper-noun(display: "对象（Object）", "dui4 xiang4")
由一对花括号定义，对象内字段与字段之间使用逗号隔开，*最后一个字段后不能有逗号*。对象中可以包含其他数据类型，也可以在对象中嵌套对象。整个 `.json` 文件就可以看作是一个大的对象。在编写JSON的时候，通常需要用到对象嵌套对象，因此花括号一定要检查是否匹配。用法举例：
#codebox("{
  \"rolls\": {
    \"type\": \"minecraft:binomial\",
    \"n\": 3,
    \"p\": 0.2
  }
}")
===== Null
空值，作为字面量符号使用。Minecraft基本不使用这种数据类型。

由于JSON为多层级结构，为了方便说明，本系列教程会使用和Minecraft Wiki一样的树状图来表示。例如：
#tree(
  (0, [#icon(name: "json-object")]),
  (1, [#icon(name: "json-string") *string*: `这是一个字符串`]),
  (1, [#icon(name: "json-bool") *boolean*: `true`]),
  (1, [#icon(name: "json-number") *number*: `5`]),
  (1, [#icon(name: "json-array") *array*]),
  (2, [#icon(name: "json-string") `这是数组的第一个元素，是一个字符串`]),
  (2, [#icon(name: "json-object") ]),
  (3, [#icon(name: "json-string") *string*: `这是对象内的一个字符串`]),
  (1, [#icon(name: "json-object") ]),
  (2, [#icon(name: "json-string") *string*: `这是对象内的一个字符串`])
)

对应的JSON为：
#codebox("{
  \"string\": \"这是一个字符串\",
  \"boolean\": true,
  \"number\": 5,
  \"array\": [
    \"这是数组的第一个元素，是一个字符串\",
    {
      \"string\": \"这是对象内的一个字符串\"
    }
  ],
  {
    \"string\": \"这是对象内的一个字符串\"
  }
}")
#tips(
  [
    如何看懂树状图？
    + 父节点和子节点的关系会以这样的方式表示：

      #tree(
        (0, [这是父节点]),
        (1, [这是子节点])
      )

      相同层级的节点会表示为相同的缩进。
    + 对于一个字段：

      #icon(name: "json-string") *field*: `这是一个字段`
      + 字段开头的 #icon(name: "json-string")#icon(name: "json-bool")#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") 表示这个字段使用的数据类型。如果出现了多种数据类型，则表示这些数据类型均可使用。
      + 加粗红色的字表示这个字段的键名。
      + 冒号后面如果只有 `代码块`，表示此 `代码块` 是该字段使用的真实值。如果冒号后面是一段文字，则这是对于该字段的解释。如：

        #icon(name: "json-string") *field*: 这是对于这个字段的解释。
      + 如果键名有下划线，则表示这个字段是必填项：

        #icon(name: "json-string") *#underline[string]*: 此项为必选项。
  ],
  width: 100%
)
=== JSON的转义序列
使用JSON字符串时，如果字符串本身的内容中含有英文引号 `"`，如一个JSON字段 `text` 的值需要为 `"Hello World!"`，那该如何编写JSON呢？若使用如下的JSON：
#codebox("\"text\":\"\"Hello World!\"\"") <code:json_escape_error>
这样通常会产生报错，这是由于用于定义字符串的引号和值中的英文引号发生了配对从而导致了错误，因此需要使用#proper-noun(display: "转义字符（Escape character）", "zhuan3 yi4 zi4 fu2")`\` 对文本引号进行转义。转义的作用为：将被转义的字符转换成字符，被转换的引号便不再与用于定义字符串的引号发生配对。除用于转义英文引号外，反斜杠还可以用于转义反斜杠以及创造一些特定的转义序列。JSON中可用的转义序列如下：
#wrap-content(
  tips([`\b`、`\f`、`\n`、`\r`、`\t` 这些特殊的转义序列能在JSON中使用，但这不代表这些转义序列能在相应的游戏实例中真正起作用。例如，在物品修饰器中定义物品名称时，虽然JSON支持输入换行符 `\n`，但物品名称本身不支持换行。], width: 11em),
  [
+ `\"`，是半角双引号（英文引号） `"` 的转义方式（中文引号不需要转义）；
+ `\\`，是反斜杠 `\` 的转义方式，已被转义的反斜杠被视为普通字符，不再具有转义作用；
+ `\b`，退格；
+ `\f`，换页；
+ `\n`，换行；
+ `\r`，回车；
+ `\t`，制表符；
+ `\u<unicode>`，用四位十六进制表示Unicode字符。
  ],
  align: right
)
由此可以得出字段@code:json_escape_error 的正确写法：
#codebox("\"text\":\"\\\"Hello World!\\\"\"")
同样地，如果值为 `\Hello World!\`，需要对反斜杠进行转义，正确的写法为：
#codebox("\"text\":\"\\\\Hello World!\\\\\"")
#example(
  [
    判断下列JSON的转义是否有效，若有效，则写出其值。
    #codebox("\"text\":\"\\\\\\Hello World\\\\\\\"")<code:json_escape_example_1>
    #codebox("\"text\":\"\\\"\\\\Hello World!\\\\\\\"\"")<code:json_escape_example_2>
    #codebox("\"text\":\"\\\"Hello World!\\\\\\\"\"")<code:json_escape_example_3>
    #codebox("\"text\":\"\\\"Hello World!\\\\\"\"")<code:json_escape_example_4>
  ],
  [
    字段@code:json_escape_example_1 的值出现了连续三个反斜杠 `\\\` 的情况，第一个反斜杠用于转义第二个反斜杠，而第二个反斜杠不再具有转义作用；而第三个反斜杠后面没有其他转义序列，故值无效。

    对于@code:json_escape_example_2，依次检验所有反斜杠：第一个反斜杠用于转义引号，第二个反斜杠用于转义第三个反斜杠，第四个反斜杠用于转义第五个反斜杠，第六个反斜杠用于转义引号。故值为 `"\Hello World!\"`。

    字符串两端的反斜杠数量不一定需要相等，因此字段@code:json_escape_example_3 是有效的，输出结果 `"Hello World\"`。

    注意，@code:json_escape_example_4 的所有转义序列都书写正确，但第三个反斜杠后面存在一个引号，而第三个反斜杠已被第二个反斜杠转义而失去转义作用。因此用于定义字符串的引号配对混乱，该值无效。判断一个值是否有效，不仅需要有效的转义序列，还要注意字符串本身的双引号是否正确配对。
  ]
)
特殊情况下，JSON字段可能会以字符串类型包含另一个需要被解析的JSON数据而非直接嵌套为相应类型的值，例如：
#tree(
  (0, [#icon(name: "json-string") *content*: `{"text":"Hello World!"}`])
)
字段 #icon(name: "json-string") `content` 的值类型为字符串，两端一定需要一对引号。为了防止决定字符串的引号与值中的引号发生匹配混乱，会将值中的引号进行转义：
#codebox("\"content\": \"{\\\"text\\\":\\\"Hello World!\\\"}\"")
如果 #icon(name: "json-string") `text` 字段的值也带有引号，如 `"Hello World!"`，则需要相应地添加反斜杠：
#tree(
  (0, [#icon(name: "json-string") *content*: `{"text":"\"Hello World!\""}`])
)
这时如果把字段 #icon(name: "json-string") `content` 写成如下的形式：
#codebox("\"content\": \"{\\\"text\\\":\\\"\\\"Hello World!\\\"\\\"}\"")
现在来手动分析这个字段。把 #icon(name: "json-string") `content` 的值拆出来，对所有的转义序列都去掉反斜杠。首先，键 #icon(name: "json-string") `text` 两端的引号被转义，因此能够正常匹配。其次，冒号 `:` 之后、字符 `H` 之前有两个已被转义的引号；而字符感叹号 `!` 后又有两个已被转义的引号，一共有四个被转义的引号：
#codebox("{\"text\":\"\"Hello World!\"\"}")
所以不可避免地又发生了引号匹配混乱的情况。现在要解决的问题就是如何让这些引号不发生匹配混乱。最有效的写法就是*从里层向外层书写，每嵌套一层，就在上一层所有需要被转义的字符（如 `"` 和 `\`）前添加反斜杠*。因此，对于里层的 `{"text":"\"Hello World!\""}`，需要在所有的 `"` 和 `\` 之前都添加一个反斜杠：
#codebox("\"content\": \"{\\\"text\\\":\\\"\\\\\\\"Hello World!\\\\\\\"\\\"}\"")<code:multilevel_escaping>
@code:multilevel_escaping 才是正确的写法。如果更进一步，将@code:multilevel_escaping 封装在对象中，让它作为另一个 #icon(name: "json-string") `content` 的值，这样就又增加了一层嵌套，于是应在@code:multilevel_escaping 的每一个 `"` 和 `\` 之前都添加一个反斜杠：
#codebox("\"content\": \"{\\\"content\\\": \\\"{\\\\\\\"text\\\\\\\":\\\\\\\"\\\\\\\\\\\\\\\"Hello World!\\\\\\\\\\\\\\\"\\\\\\\"}\\\"}\"")
== 游戏文件
游戏的各项数据被零零散散地存放在各个游戏文件里，部分数据对于做技术性开发而言非常重要，因此有必要适当掌握游戏文件的结构。
=== 常用文件格式
存储Minecraft数据的文件格式有很多种，下面介绍一些常见的文件格式。
===== #icon(name: "text") `.txt` 文件
`.txt` 文件是非常常见的文本文件，用Windows自带的记事本即可打开。这种文件通常被用于存储一些简易的文本，如游戏标题画面上的闪烁标语，有时也被用于存储游戏中的设置，在这些 `.txt` 文件中更改的内容会在游戏本体上有相应的改动。有时候 `.txt` 文件也可用于记录一些自定义的、不作为游戏数据的文本。有效的 `.txt` 文件必须为无BOM的UTF-8格式。
===== #icon(name: "mcfunction") `.mcfunction` 文件
`.mcfunction` 文件，即函数文件，同样必须为无BOM的UTF-8格式。函数文件可以用Windows10自带的记事本打开并编辑，默认的Windows 10记事本已经为无BOM的UTF-8格式，这点从记事本页面下方的状态栏就可以看到。记事本无法指出函数中的语法错误，必须得手动检查，笔者更推荐在编译软件中打开函数文件。本教程推荐的辅助工具是 #icon(name: "dhp") Data-pack Helper Plus（DHP），这是编译软件 #icon(name: "vscode") Visual Studio Code（VS Code）的一个扩展，可在 #icon(name: "vscode") VS Code的应用商店中找到。#icon(name: "dhp") DHP是专门用于制作Minecraft数据包或资源包部分文件的辅助工具，在编写数据包或资源包的过程中，#icon(name: "dhp") 提供了高亮显示，并为部分错误的语法提供解决方案。

《数据包》教程提供了该文件格式的具体编写规范。
===== #icon(name: "json") `.json` 和 `.mcmeta` 文件
`.json` 和 `.mcmeta` 文件都是使用JSON格式的文件。这些文件中的JSON格式是允许换行的，且为了美观、可读性，编写者在习惯上会在所有的 `.json` 和 `.mcmeta` 文件中使用换行，并使得同一层级的字段在行前缩进上保持一致。`.json` 和 `.mcmeta` 文件没有专门用于注释的语法，若需要注释，则使用游戏不需要、不会被游戏识别的键，如 `_comment1`、`_comment2`。
===== #icon(name: "nbt") `.mca`、`.dat`、`.dat_old` 和 `.nbt` 文件
`.mca`、`.dat`、`.dat_old` 和 `.nbt` 文件均是使用NBT格式的文件，通常用于存储世界的全局信息和结构信息。同样地，这两类文件不能用 #icon(name: "dhp") DHP在编译软件内进行编辑，但可以在NBT编辑器内编辑，本教程推荐的编辑器为 #icon(name: "nbtstudio") NbtStudio。一些无法由命令进行编辑的信息可以通过 #icon(name: "nbtstudio") NbtStudio修改。
===== #icon(name: "png") `.png` 文件
`.png` 文件是图片文件，被用于存储游戏中的绝大部分图像，包括但不限于图标、游戏截图、资源包纹理。可以使用Windows自带的 #icon(name: "paint") 画图、#icon(name: "ps") PS或 #icon(name: "gimp") GIMP处理，但需要注意 #icon(name: "paint") 画图不支持透明背景。
===== #icon(name: "ogg") `.ogg` 文件
游戏中所有的声音文件都为 `.ogg` 格式，从外部导入声音时应注意格式转换。直接修改文件名后缀是无效的，可以使用
===== #icon(name: "zip") `.zip` 文件
压缩文件，即 `.zip` 文件，也是常用的文件格式，通常被用于数据包和资源包的压缩。读者可自行选择合适的压缩软件对数据包或资源包进行压缩。
===== 其他的文件格式
Minecraft还使用其他一些文件格式，如 `.jfr` 文件、`.log` 文件等。具体见下文的说明。
=== .minecraft文件夹 \*
`.minecraft` 文件夹，macOS上为 #icon(name: "folder") `minecraft`，是存储Java版所有游戏数据的文件夹。

对于Windows系统，这个文件夹默认位于 #icon(name: "folder") `C: Users\Admin\AppData\Roaming\.minecraft`，其中 #icon(name: "folder") `AppData` 文件夹一般是隐藏的，可以在文件资源管理器 `查看` 工具栏，在 `显示/隐藏` 一项勾选 `隐藏的项目` 以显示这个文件夹。

对于Mac系统，这个文件夹默认位于 #icon(name: "folder") `home\用户名\Library\Application Support\minecraft`。对于Linux系统，这个文件夹默认位于 #icon(name: "folder") `home\用户名\.minecraft`，其中以 `.` 开头的文件夹默认是隐藏的，需要使用 `Ctrl` + `H` 切换是否可见。

第三方启动器会有其特殊的文件夹路径，具体见各启动器的设置。由官方启动器运行的游戏可以在启动器内手动修改存储路径，或者在默认存储路径处使用快捷方式重定向至自定义路径下。

随着游戏内容的增多、各种其他资源（如光影、模组）不断被下载到游戏中， #icon(name: "folder") `.minecraft`中的子文件（夹）可能会持续增多。鉴于无法讲到所有可能出现的文件（夹），本节仅列举原版游戏使用文件（夹）。文件结构如下所示：
#tree(
  (0, [#icon(name: "folder") *.minecraft*]),
  (1, [#icon(name: "folder") *assets*: 存放原版资源包部分游戏资源的文件夹，如简体中文的语言文件、声音 `.ogg` 文件等，其中这些文件被称为*散列资源文件*。]),
  (2, [#icon(name: "folder") *indexes*]),
  (3, [#icon(name: "json") *\<版本号>.json*: 该版本号用于映射散列资源的哈希表。]),
  (2, [#icon(name: "folder") *log_configs*]),
  (3, [#icon(name: "file") *client-<版本号>.xml*]),
  (2, [#icon(name: "folder") *objects*: 此文件夹专门用于存储声音、语言文件。]),
  (3, [#icon(name: "folder") *\<哈希值前两位>*]),
  (4, [#icon(name: "file") *\<哈希值>*: 散列资源文件。]),
  (2, [#icon(name: "folder") *skins*]),
  (3, [#icon(name: "folder") *\<哈希值前两位>*]),
  (4, [#icon(name: "file") *\<哈希值>*: 散列资源文件。]),
  (2, [#icon(name: "folder") *virtual*]),
  (1, [#tips(
  [
    #icon(name: "folder") `assets` 文件夹内的资源文件都是用#proper-noun(display: "哈希值（Hash value，散列值）", "ha1 xi1 zhi2")加密的，以哈希表的方式映射资源位置。要查询 #icon(name: "folder") `assets` 内的任意一个资源文件，需按照以下步骤：
    + 打开 #icon(name: "folder") `indexes` 文件夹，找到需要提取资源的 #icon(name: "json") `<版本号>.json` 文件。其中的内容大致如下所示：
    
      #codefile(
      lang: "json",
      title: ".minecraft > assets > indexes > <版本号>.json",
  "{
  \"objects\": {
    \"icons/icon_128x128.png\": {
      \"hash\": \"b62ca8ec10d07e6bf5ac8dae0c8c1d2e6a1e3356\", 
      \"size\": 9101
    }, 
    \"icons/icon_16x16.png\": {
      \"hash\": \"5ff04807c356f1beed0b86ccf659b44b9983e3fa\", 
      \"size\": 781
    }, 
    \"icons/icon_256x256.png\": {
      \"hash\": \"8030dd9dc315c0381d52c4782ea36c6baf6e8135\", 
      \"size\": 19642
    },
    \"_comment\": \"后续还有很多其他资源\"
  }
}")
    + 用编译软件的查询功能在 #icon(name: "json") `<版本号>.json` 文件中查找所需资源，记录对应 #icon(name: "json-string") `hash` 字段的值，此即为映射该资源的哈希值。
    + 打开 #icon(name: "folder") `objects` 文件夹，找到匹配的 #icon(name: "folder") `<哈希值前两位>` 文件夹，在此文件夹内找寻对应哈希值命名的文件，此即为需要找寻的资源。
  ]
)
#example(
  [在 #icon(name: "folder") `assets` 文件夹内找到1.21.4版本（哈希表版本号显示为 `19`）简体中文语言的资源文件。],
  [
    在 #icon(name: "json") `<19>.json` 文件中查询 `zh_cn`，可以找到一个键名为 `minecraft/lang/zh_cn.json` 的键值对：
    #codebox("\"minecraft/lang/zh_cn.json\": {
  \"hash\": \"4674523c91196e0898c24a06531f94154111f2a3\",
  \"size\": 459788
}")
    这时获取到哈希值 `4674523c91196e0898c24a06531f94154111f2a3`，其前两位是 `46`。然后打开文件夹 #icon(name: "folder") `objects\46`，在其中找到名为 #icon(name: "file") `4674523c91196e0898c24a06531f94154111f2a3` 的文件，此即为简体中文的语言文件。打开后会发现文件中的汉字均是用Unicode码表示的。
  ])], false, true),
  (1, [#icon(name: "folder") *backups*: 存放备份存档的文件夹。]),
  (2, [#icon(name: "zip") *\<日期>\_\<时间>\_\<存档名称>.zip*: 一个备份存档。]),
  (1, [#icon(name: "folder") *bin*]),
  (2, [#icon(name: "folder") *\<随机ID>*]),
  (3, [#icon(name: "file") `.dll` 或 `.so` 文件]),
  (1, [#icon(name: "folder") *crash-reports*: 存储游戏崩溃报告的文件夹。]),
  (2, [#icon(name: "text") *crash-\<日期>\_\<时间>-\<逻辑端类型>.txt*: 一份#proper-noun(display: "崩溃报告（Crash Report）", "bengkuibaogao")文件。]),
  (1, [#tips(
  [游戏可能会以各种原因而发生#proper-noun(display: "崩溃（Crash）", "beng1 kui4")，读者可以从崩溃报告中查询崩溃原因。例如，以下是一份崩溃报告的开头部分内容：
  #codefile(
    lang: "txt",
    title: ".minecraft > crash-reports > crash-2024-02-08_21.25.56-server.txt",
    "---- Minecraft Crash Report ----
// I bet Cylons wouldn't have this problem.

Time: 2024-02-08 21:25:56
Description: Ticking entity"
  )
  其中第二行是“诙谐的评论”，对崩溃报告的分析没有作用。`Description` 行是崩溃原因，此处的崩溃原因是 `Ticking entity`，这种崩溃通常意味着有实体发生了错误。后文通常是崩溃的具体原因。
  
  鉴于崩溃原因多种多样，本教程无法介绍每一种崩溃原因及其解决办法，读者可以从社区获取各种崩溃原因的解决办法或者使用AI分析。])], false, true),
  (1, [#icon(name: "folder") *debug*: 存储函数调试结果的文件夹。]),
  (2, [#icon(name: "text") *debug-trace-\<日期>\_\<时间>.txt*: 一份调试结果。]),
  (1, [#tips([命令 `/debug` 可用于函数的调试，并将调试的结果以 `.txt` 的文件格式存入 #icon(name: "folder") `debug` 中。文件中的内容极为详细，可以以此观察函数的整个运行过程，并从中找到错误的地方。调试结果的具体内容如：
    #codefile(
      lang: "txt",
      title: ".minecraft > debug > debug-trace-2022-10-10_19.16.40.txt",
      "[C] scoreboard players reset @s heart_of_life
    [E] 未知的记分项'heart_of_life'    [C] advancement revoke @s only plus:items/heart_of_life
    [E] 无法撤销Mu_xian的进度plus:items/heart_of_life，因为该玩家并未达成此进度    [C] effect clear @s absorption
    [M] 已移除Mu_xian的伤害吸收效果
  [R = 1] effect clear @s absorption
  [C] scoreboard players add @s max_health 2
    [M] 将Mu_xian的[max_health]增加了2（现在是44）
  [R = 44] scoreboard players add @s max_health 2
  [C] function plus:game/attributes/max_health
    [M] 已执行函数plus:game/attributes/max_health中的0条命令
  [R = 0] function plus:game/attributes/max_health
  [F] plus:game/attributes/max_health size=60
    [C] execute as @a if score @s max_health matches 1 run attribute @s max_health base set 1 -> 0
    [C] execute as @a if score @s max_health matches 2 run attribute @s max_health base set 2 -> 0"
    )
    其中首行是函数的命名空间ID。以 `[C]` 开头的内容为函数中的命令行；以 `[E]` 开头的内容指明了上一条命令行出现错误的地方；以 `[M]` 开头的内容说明上一条命令执行成功，并有 `[R=<值>]` 输出执行的结果。`[F]` 说明上一条命令引用了其他函数，并指出被引用的函数的大小。
  ])], false, true),
  (1, [#icon(name: "folder") *libraries*: 按Maven仓库的标准目录结构组织和存储的第三方库。]),
  (2, [#icon(name: "folder") 一个第三方库。]),
  (1, [#icon(name: "folder") *logs*: 存储日志文件的文件夹。]),
  (2, [#icon(name: "zip") *\<日期>-\<日志编号>.log.gz*: 压缩文件，可使用解压软件打开。]),
  (3, [#icon(name: "file") *\<日期>-\<日志编号>.log*: 日志文件。]),
  (2, [#icon(name: "file") *latest.log*: 最新一次游戏或当前正在进行的游戏所生成的日志文件。]),
  (1, [#tips(
  [日志文件会存储游戏运行全过程的各种反馈，包括加载错误时的反馈，这些文件对游戏调试很重要。文件内容大致如下所示：
  #codefile(
    title: ".minecraft > log > 2025-03-07-1.log.gz > 2025-03-07-1.log",
    "[19:06:06] [Render thread/INFO]: Using default channel type
[19:06:06] [Render thread/INFO]: Started serving on 10000
[19:06:06] [Render thread/INFO]: [System] [CHAT] 本地游戏已在端口[10000]上开启
[19:06:41] [User Authenticator #1/INFO]: UUID of player XVExodus is 0caaf85c-27b0-4cf6-8f63-7278c55aa0e1
[19:06:42] [Server thread/INFO]: XVExodus[/172.20.10.5:53055] logged in with entity id 252 at (-8.221424908762929, 0.0, 8.503485026934579)
[19:06:42] [Server thread/INFO]: XVExodus加入了游戏
[19:06:42] [Render thread/INFO]: [System] [CHAT] XVExodus加入了游戏
[19:09:58] [Server thread/WARN]: XVExodus moved too quickly! -7.169010753171733,-1.6414613841373864,7.738717431310306
[19:12:34] [Server thread/INFO]: [Mu_xian: 已将Mu_xian传送至XVExodus]
[19:13:54] [Server thread/INFO]: [Mu_xian: 已将Mu_xian传送至XVExodus]
[19:14:43] [Server thread/INFO]: [Mu_xian: 已将Mu_xian传送至XVExodus]
[19:16:11] [Server thread/INFO]: [XVExodus: 已将XVExodus传送至Mu_xian]
[19:16:37] [Render thread/INFO]: Loaded 610 advancements
[19:18:25] [Render thread/WARN]: Unable to play empty soundEvent: minecraft:entity.salmon.ambient
[19:18:32] [Render thread/INFO]: [System] [CHAT] 已设置重生点
[19:20:23] [Render thread/INFO]: Loaded 612 advancements
[19:22:03] [Server thread/WARN]: XVExodus moved too quickly! -4.311401208300595,-1.8757037979856364,17.86772802981045
[19:23:27] [Server thread/INFO]: [Mu_xian: 已将Mu_xian传送至XVExodus]
[19:23:27] [Render thread/INFO]: Loaded 612 advancements
[19:24:38] [Server thread/INFO]: [XVExodus: 已将XVExodus传送至Mu_xian]
[19:25:06] [Server thread/INFO]: [XVExodus: 已将XVExodus传送至Mu_xian]"
  )
  ])], false, true),
  (1, [#icon(name: "folder") *resourcepacks*: 存储所有资源包的文件夹，其基本结构见@sec:resourcepack，具体的制作方式将在《资源包》教程中给出。]),
  (1, [#icon(name: "folder") *saves*: 存储游戏中所有存档的文件夹，具体结构见@sec:saves 。]),
  (2, [#icon(name: "folder") *\<存档名称>*: 一个存档。]),
  (1, [#icon(name: "folder") *screenshots*: 存储 `F2` 截屏图片的文件夹。]),
  (2, [#icon(name: "png") *\<日期>\_\<时间>.png*: 一张截屏，名称可手动修改。]),
  (1, [#icon(name: "folder") *versions*: 存储游戏不同版本游戏资源的文件夹。]),
  (2, [#icon(name: "folder") *\<版本号>*: 一个游戏版本，可以是正式版，也可以是快照。]),
  (3, [#icon(name: "jar") *\<版本号>.jar*: 物理客户端文件，是存放该版本号游戏源代码的地方。可以用压缩软件打开这个文件。]),
  (4, [#icon(name: "folder") *assets*: 存放该版本号原版资源包内容的文件夹，它决定了客户端游戏内容的外观。在制作资源包时可以参考这个文件夹的结构。不含在 #icon(name: "folder") `.minecraft\assets` 中存放的语言和声音文件。]),
  (4, [#icon(name: "folder") *com*]),
  (4, [#icon(name: "folder") *data*: 存放该版本号原版数据包内容的文件夹，它决定了可写注册表的内容，如进度、战利品表、配方、结构等。在制作数据包时可以参考这个文件夹的结构。]),
  (4, [#h(-2em)#icon(name: "file") *flightrecorder-config.jfc*: Java Flight Recorder配置文件，可用于JFR分析。JFR分析，即使用Java Flight Recorder分析数据和某些自定义事件。自定义事件包括：
  #param-desc(
    prefix: "",
    [`minecraft.ServerTickTime` ], [采样事件。],
    [`minecraft.ChunkGeneration` ], [生成单个区块阶段所需的时间。],
    [`minecraft.PacketRead` 或 `minecraft.PacketSent` ], [网络流量。],
    [`minecraft.WorldLoadFinishedEvent` ], [初始化世界加载耗费的时间。]
  )
  #h(-2em)在游戏中可使用命令 `/jfr` 进行JFR分析，此命令用于开始或结束JFR分析，分析结果以JSON的格式写入日志或 `debug` 文件夹。该命令所需权限等级为4，语法为：#index(index: "command", "jfr")
  #codebox("jfr (start|stop)")]),
  (4, [#icon(name: "folder") *META-INF*: `.jar` 文件的元数据。]),
  (5, [#icon(name: "file") *LICENSE*: 游戏许可协议。]),
  (5, [#icon(name: "file") *MANIFEST.MF*: 清单文件。]),
  (5, [#icon(name: "file") *MOJANGCS.RSA*: 用于验证JAR的文件。]),
  (5, [#icon(name: "file") *MOJANGCS.SF*: JAR签名。]),
  (4, [#icon(name: "folder") *net*: 自25w45a起，Mojang发布的未经混淆的客户端其源代码均存储于该文件夹内。其中的类文件均未被混淆，可查看，是制作Mods的重要依据。]),
  (5, [#icon(name: "folder") *minecraft*]),
  (6, [#icon(name: "file") *\<名称>.class*: 一个未混淆的Java类文件。]),
  (4, [#h(-2em)#icon(name: "png") *pack.png*: 原版资源包的图标。#figure(caption: [原版资源包的图标（pack.png）],image("图片/原版资源包的图标（pack.png）.png", width: 4em))]),
  (4, [#icon(name: "json") *versions.json*: 版本信息文件，存储该版本的信息。]),
  (3, [#icon(name: "json") *\<版本号>.json*: 客户端清单文件。]),
  (1, [#icon(name: "folder") *webcache2*]),
  (1, [#icon(name: "text") *allowed_symlinks.txt*: 信任符号链接列表文件。]),
  (1, [#icon(name: "text") *command\_history.txt*: 命令历史文件，最多只能保留50条记录。]),
  (1, [#icon(name: "png") *debug.stitched\_items.png*]),
  (1, [#icon(name: "png") *debug.stitched\_terrain.png*]),
  (1, [#icon(name: "nbt") *hotbar.nbt*: 存储在创造模式中保存的快捷栏信息的文件，在创造模式中的快捷栏以 `C` + `<数字>` 存储，然后以 `X` + `<数字>` 调用。可以用NBT编辑器打开这个文件。]),
  (1, [#icon(name: "text") *launcher\_cef\_log.txt*]),
  (1, [#icon(name: "json") *launcher\_entitlements.json*]),
  (1, [#icon(name: "json") *launcher\_gamer\_pics.json*]),
  (1, [#icon(name: "json") *launcher\_msa\_credentials.json*]),
  (1, [#icon(name: "json") *launcher\_profiles.json*: 启动器档案文件。]),
  (1, [#icon(name: "json") *launcher\_quick\_play.json*: 启动器快速进入游戏存档信息文件。]),
  (1, [#icon(name: "json") *launcher\_settings.json*: 启动器配置文件。]),
  (1, [#icon(name: "json") *launcher\_skins.json*]),
  (1, [#icon(name: "json") *launcher\_ui\_state.json*]),
  (1, [#h(-2em)#icon(name: "text") *options.txt*: 该文件存储了游戏中设定的选项，可以通过更改该文件中的内容以更改在游戏中的设置。此外一些在选项界面中不存在的设置也可以通过该文件更改。文件中内容如下所示：#codefile(lang:"txt",title:".minecraft > options.txt","version:4189
ao:true
biomeBlendRadius:2
enableVsync:false
entityDistanceScaling:1.0
entityShadows:true")], true, true),
  (1, [#icon(name: "file") *output-client.log*]),
  (1, [#icon(name: "file") *output-server.log*]),
  (1, [#icon(name: "json") *realms\_persistence.json*: 存储Realms数据的文件。]),
  (1, [#icon(name: "nbt") *servers.dat*: 存储玩家添加到服务器列表的多人游戏服务器的数据。]),
  (1, [#icon(name: "png") *textures\_0.png*]),
  (1, [#icon(name: "png") *textures\_1.png*]),
  (1, [#icon(name: "png") *textures\_2.png*]),
  (1, [#icon(name: "png") *textures\_3.png*]),
  (1, [#icon(name: "png") *textures\_4.png*]),
  (1, [#icon(name: "json") *usercache.json*: 游戏为减少重复获取玩家档案信息所使用的缓存文件。])
)
== 数据包
Minecraft的命令系统虽然完善，但其功能十分有限。例如，命令没有办法直接指导游戏世界的生成；直接用命令模拟一些游戏机制也不够灵活。数据包可以看作是命令系统功能的延伸：它不仅为命令提供了程序化执行的环境，更开放了部分API以允许数据驱动内容。

#proper-noun(display: "数据包（Data pack）", "shu4 ju4 bao1")*允许玩家在不修改游戏代码的前提下覆盖既有的或添加自定义的游戏内容。*因此，*原版技术性开发从不添加任何不在可写注册表内的游戏内容，只会用各种手段模拟这些游戏内容*。数据包本质上是一个文件夹或压缩文件。一个数据包仅对特定的游戏世界有效，它被储存在 `.minecraft\saves\<存档名称>\datapacks` 中。数据包可以是文件夹，也可以是 `.zip` 类型的压缩文件。同一个 #icon(name:"folder") `datapacks` 文件夹内能存放多个数据包。

数据包有两种添加方式——
===== 手动添加
直接将数据包添加至 `.minecraft\saves\<存档名称>\datapacks`。
===== 创建世界时添加数据包
在创建新的世界界面，选择 `更多`，点击 `数据包` 选项，此时会进入选择数据包窗口，类似于资源包选项的窗口，可在“可用”一栏内选用数据包，只有“已选”一栏的数据包有效，且数据包的加载顺序可以在该栏中调换。点击 `打开包文件夹` 选项后游戏会弹出一个临时的文件夹，此时可以将数据包拖入其中。
#figure(
  caption: [选择数据包窗口],
  image("图片/选择数据包窗口.png", width: 28em)
)
当一个存档中存在多个有效的已启用数据包时，游戏会根据数据包的顺序加载其内容，这里的“有效”是指数据包有合法的元数据且数据包内无任何语法错误。已启用数据包的加载顺序存储于 #icon(name:"nbt") `level.dat` 中。在选择数据包窗口“已选”一栏的加载顺序表现为从下到上。

若这些数据包对同种资源进行定义，则*后加载的数据包会对先加载的数据包进行覆盖*，表明*越靠后加载的数据包其优先级越高*。可使用命令  `/datapack` 查询、修改、控制这些数据包的启用或禁用，`/datapack` 所需的权限等级为2，以下是所有用法：#index(index: "command", "datapack")
#reset-h5
===== 启用指定数据包
#codebox("datapack enable <name>")
#param-desc(
  [`<name>`（字符串 `brigadier:string`）#footnote[括号中内容为该参数的类型及该参数类型在注册表内的命名空间ID，后续教程均如此。]], [指定数据包的名称。必须使用单个词，可用引号括起整个字符串。可用字符有：\
  数字 `0123456789`；\
  大写字母 `ABCDEFGHIJKLMNOPQRSTUVWXYZ`；\
  小写字母 `abcdefghijklmnopqrstuvwxyz`；\
  下划线 `_`；\
  加号 `+`、减号 `-`；\
  点 `.`；\
  引号 `'`、`"`；\
  反斜杠 `\`。\
  如果用引号括起整个字符串，字符串内的同种引号与反斜杠前需要加上反斜杠 `\` 转义。]
)
===== 禁用指定数据包
#codebox("datapack disable <name>")
===== 列举所有数据包
#codebox("datapack list [available|enabled]")
#param-desc(
  [`[available|enabled]`], [可选，若设为 `available` 则列举所有可用数据包，无论是否启用；若设为 `enabled`，则仅列举已启用数据包。默认为 `available`。]
)
===== 启用指定的数据包，并设置其优先级为最低或最高
#codebox("datapack enable <name> (first|last)")
#param-desc(
  [`(first|last)`], [设置 `first` 以将该数据包的加载位次设为*首位*，因此优先级设为*最低*；设置 `last` 以将该数据包的加载位次设为*末位*，因此优先级设为*最高*。]
)
===== 启用指定的数据包，并调整其加载优先级居于另一个数据包
#codebox("datapack enable <name> (before|after) <existing>")
#param-desc(
  [`(before|after)`], [设置 `before` 以将该数据包的加载放于数据包 `<existing>` *之前1位*，因此优先级比数据包 `<existing>` *低1级*；设置 `after` 以将该数据包的加载放于数据包 `<existing>` *之后1位*，因此优先级比数据包 `<existing>` *高1级*。],
  [`<existing>`（字符串 `brigadier:string`）], [必须为一个存在并已启用的数据包的名称。可用字符与 `<name>` 一致。]
)
===== 新建一个空数据包，并设置此数据包的描述，注意，被创建的数据包默认为禁用状态
#codebox("datapack create <id> <description>")
#param-desc(
  [`<id>`（字符串 `brigadier:string`）], [新建数据包的名称，可用字符与上述 `<name>` 参数一致。],
  [`<description>`（文本组件 `minecraft:component`）], [该数据包的描述，是为元数据 `pack.mcmeta` 内 #icon(name: "json-string")#icon(name: "json-array")#icon(name: "json-object") `description` 的值。需要是文本组件，具体写法可参照@chap:text_component。]
)
编写数据包是一个“修改——调试——再修改——再调试”的重复过程，在既有内容的基础上对数据包做出修改并保存后，游戏不会立即识别这些修改的内容，而是依旧在修改前数据包的基础上运行原先的内容。此时需要重新加载数据包。

每次玩家进入存档（或称之为启动服务端）后，游戏都会按照加载顺序加载数据包，无论是否为首次进入存档。如果新加载的数据包内含有无效数据，则使用先前版本的数据包。在游戏过程中可以用命令 `/reload` 重新加载数据包而不必退出游戏并重新进入存档，这种方式被称为*热重载*。`/reload` 需要的权限等级为2，其语法中不需附带任何参数：
#codebox("reload")
但是，使用 `/reload` 和重启服务端加载数据包的加载行为不同。`/reload` 只能用于重新加载数据包标签、函数、进度、战利品表、物品修饰器、战利品表谓词和配方这些注册项，剩余的注册项无法使用 `/reload` 加载，必须通过重启服务端加载。
#wrap-content(
  box(
    width: 12em,tips(
    [删除Anvil文件或自定义维度文件夹是比较危险的行为，可能会删掉存档中一些重要数据，删除之前需慎重考虑！]
  )),
  [

    其中维度、世界生成这些控制世界生成方式的注册项，对于已经生成的区块或维度，也无法通过世界加载重新生成这些区块或维度。因此自定义世界生成模块需要在世界首次加载时就被应用，即需要在创建世界时添加数据包而非在世界运行过程中手动添加数据包。如果确需在在世界运行过程中修改世界生成，可在确保世界仅作调试使用的前提下删除存档中需要重新生成区块的Anvil文件或自定义维度文件夹使其重新加载。
  ],
  align: right
)
对于非数据包标签、函数、进度、战利品表、物品修饰器、战利品表谓词或配方的注册项，进入存档会出现#proper-noun(display: "实验性设置（Experimental settings）", "shi2 yan4 xing4 she4 zhi4")的警告，此时可点击创建备份并加载或我知道我在做什么！。但若这些注册项出现各种各样的错误（不一定是语法错误），则进入存档会出现#proper-noun(display: "安全模式（Safe mode）", "an1 quan2 mo2 shi4")错误，可在官方启动器设置中打开“当《Minecraft：Java版》启动时输出日志”一项以随时获得错误日志，或在 `.minecraft\debug` 文件夹中获取 `.txt` 输出日志以检查存在的错误。

数据包的编写是一个极为繁琐的过程，需要不断地调试、纠错，有时甚至要对其底层逻辑进行重构。在编写数据包之前，读者应提前做好规划，对其可行性进行初步的研究，还要考虑数据包运行过程中的流畅性、玩家游玩过程中的平衡性。编写过程合理使用文件层级，对文件适当分类，以免内容混乱，降低文件可读性。

原版数据包位于 #icon(name: "folder") `.minecraft\versions\<版本号>\<版本号>.jar\data`，是编写自定义数据包的重要依据，读者可参考之。
=== 数据包的基本结构
一个数据包拥有以下的基本结构：
#tree(
  (0, [#icon(name: "folder") *\<数据包名称>*或 #icon(name: "zip") *\<数据包名称>.zip*]),
  (1, [#icon(name: "folder") *\<子数据包>*]),
  (2, [递归此文件夹结构]),
  (1, [#icon(name: "folder") *data*: 数据包的主体内容。]),
  (1, [#icon(name: "json") *#underline[pack.mcmeta]*: 数据包的元数据。]),
  (1, [#icon(name: "png") *pack.png*: 可选，作为数据包的图标使用。])
)
如果该数据包以压缩文件的形式存在，则 #icon(name: "zip") `<数据包名称>.zip` 和 #icon(name: "folder") `<子数据包>`、#icon(name: "folder") `assets`、#icon(name: "json") `pack.mcmeta`、#icon(name: "png") `pack.png` 这些文件（夹）之间不要插入其他层级的文件夹。
==== 元数据
#icon(name: "json") `pack.mcmeta` 是数据包的#proper-noun(display: "元数据（Metadata）", "yuan2 shu4 ju4")。所谓元数据，就是用于决定 #icon(name: "folder") `<数据包名称>` 或 #icon(name: "zip") `<数据包名称>.zip` 这个文件（夹）是否为一个数据包的基本数据。只有当元数据存在时，游戏才能识别数据包。

#icon(name: "json") `pack.mcmeta` 使用JSON格式，其包含的内容如下所示：
#tree(
  (0, [#icon(name: "json-object") 文件封装]),
  (1, [#icon(name: "json-object") *#underline[pack]*: 此数据包的基本信息。]),
  (2, [#icon(name: "json-string")#icon(name: "json-array")#icon(name: "json-object") *#underline[description]*: 任意文本，使用文本组件格式，可用于对数据包的简单介绍。此段文本会出现在选项数据包中。使用 `/datapack list` 列举数据包时，将鼠标悬停于数据包名称上也会显示此文本。]),
  (2, [#icon(name: "json-number")#icon(name: "json-array") *#underline[max_format]*: 数据包最高兼容的版本号。若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon(name: "json-number") 形式或在 #icon(name: "json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0x7fffffff`。]),
  (2, [#icon(name: "json-number")#icon(name: "json-array") *#underline[min_format]*: 数据包最低兼容的版本号。若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon(name: "json-number") 形式或在 #icon(name: "json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0`。]),
  (2, [#icon(name: "json-number") *pack_format*: 25w31a以前用于指定数据包版本号的字段，现已弃用，可用于兼容旧版数据包。]),
  (2, [#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") *supported_formats*: 25w31a以前用于指定数据包版本号兼容范围的字段，现已弃用，可用于兼容旧版数据包。]),
  (3, [*若使用 #icon(name: "json-number") 形式，则精确匹配，效果与 #icon(name: "json-number") pack_format一致*], false),
  (3, [*若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为最低兼容的版本号，第二个为最高兼容的版本号*], false),
  (3, [*若使用 #icon(name: "json-object") 形式，则有以下字段：*], false),
  (3, [#icon(name: "json-number") *max_inclusive*: 最高兼容的版本号。]),
  (3, [#icon(name: "json-number") *min_inclusive*: 最低兼容的版本号。]),
  (1, [#icon(name: "json-object") *features*: 可选，用于启用实验性内容，若指定该键，则数据包必须在创建世界时添加。]),
  (2, [#icon(name: "json-array") *#underline[enabled]*: 启用实验性内容数据包的列表。]),
  (3, [#icon(name: "json-string") 一个实验性内容数据包的命名空间ID，当前版本可用值有 `minecraft:trade_rebalance`（村民交易平衡性调整）、`minecraft:redstone_experiments`（红石实验性内容）和 `minecraft:minecart_improvements`（矿车改进）。]),
  (1, [#icon(name: "json-object") *filter*: 可选，用于指定在数据包加载列表中优先级低于该包的数据包内要禁用的内容。]),
  (2, [#icon(name: "json-array") *block*: 禁用内容列表。]),
  (3, [#icon(name: "json-object") 一项被禁用的内容。]),
  (4, [#icon(name: "json-string") *namespace*: 要禁用的命名空间，若省略则禁用所有命名空间，可使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (4, [#icon(name: "json-string") *path*: 要禁用的资源路径，若省略则禁用所有路径，可使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (1, [#icon(name: "json-object") *overlays*: 可选，用于子数据包的识别。]),
  (2, [#icon(name: "json-array") *#underline[entries]*: 可用子数据包的列表。]),
  (3, [#icon(name: "json-object") 一个子数据包。]),
  (4, [#icon(name: "json-string") *#underline[directory]*: 该子数据包相对于主数据包根目录的路径。允许使用的字符有：小写字母、`0123456789`、`_` 和 `-`。]),
  (4, [#icon(name: "json-number")#icon(name: "json-array") *max_format*: 该子数据包最高兼容的版本号。若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon(name: "json-number") 形式或在 #icon(name: "json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0x7fffffff`。]),
  (4, [#icon(name: "json-number")#icon(name: "json-array") *min_format*: 该子数据包最低兼容的版本号。若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon(name: "json-number") 形式或在 #icon(name: "json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0`。]),
  (4, [#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") *formats*: 25w31a以前用于指定子数据包版本号兼容范围的字段，现已弃用，可用于兼容旧版数据包。]),
  (5, [*若使用 #icon(name: "json-number") 形式，则精确匹配*], false),
  (5, [*若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为最低兼容的版本号，第二个为最高兼容的版本号*], false),
  (5, [*若使用 #icon(name: "json-object") 形式，则有以下字段：*], false),
  (5, [#icon(name: "json-number") *max_inclusive*: 最高兼容的版本号。]),
  (5, [#icon(name: "json-number") *min_inclusive*: 最低兼容的版本号。])
)#cite(<datapack_merge>, form: none)
例如，下面是1.21.11版本的一个标准 #icon(name: "json") `pack.mcmeta` 文件：
#codefile(
  lang: "json",
  title: "pack.mcmeta",
  "{
  \"pack\": {
    \"description\": \"The default data for Minecraft\",
    \"max_format\": 94.1,
    \"min_format\": 94.1,
  }
}"
)
==== 数据包版本号
元数据中有一个很重要的参数：#proper-noun(display: "数据包版本号（Data pack format）", "shu4 ju4 bao1 ban3 ben3 hao2")，这是一个用于区分不同版本数据包的参数。每当Mojang对数据包做出修改时，版本号都会发生变动。在1.19.4以前，数据包版本号一般一个大版本变更一次；自1.19.4起，由于Mojang对技术性开发的更新变得频繁，版本号一般每个快照变更一次。数据包应当使用其所在游戏版本的版本号，由于Mojang对数据包的改动可能是颠覆性的，版本号不对应可能会出现错误。

1.21.8以前的版本号均为整数，例如，1.21.8的数据包版本号为81，25w31a是1.21.9的快照，其引入了#proper-noun(display: "次要版本号（Minor versions）", "ci4 yao4 ban3 ben3 hao4")的概念，原先的整数形式的版本号为#proper-noun(display: "主要版本号（Major versions）", "zhu3 yao4 ban3 ben3 hao4")，25w31a是第一个使用此版本号格式的版本，是为82.0。同一个主版本号内的数据包可以向下兼容，例如83.1的数据包可以兼容83.0的数据包。

下表罗列了所有主版本使用的数据包版本号，不包括快照版本。包含快照版本的数据包版本号参考附录@sec:pack_format\中的@tab:pack_format。
#split-table(
  caption: "数据包版本号",
  original-cols: (auto, auto),
  seperator: (2,),
  header: ([游戏版本], [数据包版本号]),
  data: (
    [1.13 \~ 1.14.4], [4],
    [1.15 \~ 1.16.1], [5],
    [1.16.2 \~ 1.16.5], [6],
    [1.17 \~ 1.17.1], [7],
    [1.18 \~ 1.18.1], [8],
    [1.18.2], [9],
    [1.19 \~ 1.19.3], [10],
    [1.19.4], [12],
    [1.20 \~ 1.20.1], [15],
    [1.20.2], [18],
    [1.20.3 \~ 1.20.4], [26],
    [1.20.5 \~ 1.20.6], [41],
    [1.21 \~ 1.21.1], [48],
    [1.21.2 \~ 1.21.3], [57],
    [1.21.4], [61],
    [1.21.5], [71],
    [1.21.6], [80],
    [1.21.7 \~ 1.21.8], [81],
    [1.21.9 \~ 1.21.10], [88.0],
    [1.21.11], [94.1]
  )
) <tab:datapack_format>
游戏允许编写者在元数据内指定数据包版本号的区间以使数据包兼容多个版本。但由于在不同版本中 #icon(name: "json") `pack.mcmeta` 本身的格式也会发生变化，数据包版本号需要进行校验。不过，这个校验仅仅作为“门槛”，数据包能否运行取决于其实际内容，而非元数据声明。在26.1以前，校验失败会现实“已损坏或不兼容”；而在26.1以后，校验失败会直接认为元数据无效，从而不识别此数据包。

校验规则以25w31a（1.21.9）为分水岭实行“新旧双轨制”，如下表所示：
#general-table(
  caption: "数据包版本号校验规则",
  colspan: 4,
  columns: (2fr, 5fr, 4fr, 4fr),
  header: ([配置要求], [元数据中必须使用的字段], [元数据中可以使用的字段], [元数据中不能使用的字段]),
  [仅适用于25w31a之前], [#icon(name: "json-number") `pack_format`], [#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats`\ 若使用，则此区间必须包含 #icon(name: "json-number") `pack_format` 的值，且最大值不能低于16，因为此字段是在23w31a引入的], [#icon(name: "json-number") `max_format` 和\ #icon(name: "json-number") `min_format`],
  [仅适用于25w31a及之后], [#icon(name: "json-number") `max_format` 和\ #icon(name: "json-number") `min_format`], [-], [#icon(name: "json-number") `pack_format` 和\ #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats`],
  [同时适用于25w31a之前及之后], [#set align(left)
  #h(-2em)同时指定 #icon(name: "json-number") `pack_format`、#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats`、#icon(name: "json-number") `max_format` 和 #icon(name: "json-number") `min_format`，且必须满足以下要求：\ *区间验证：\ *#icon(name: "json-number") `pack_format` 必须落在兼容区间内。\ *对最低版本号的验证：*\ #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats` 的下限必须与 #icon(name: "json-number") `min_format` 相等。\ *对最高版本号的验证，以下两种方案二选一：*\ 
  + #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats` 的上限与 #icon(name: "json-number") `max_format` 相等。
  + #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats` 的上限固定为81，此时最高版本号由#icon(name: "json-number") `max_format` 决定。], [-], [-]
) <tab:datapack_format_verify>
#example(
  [现需要编写一个适用于1.20.5至1.21.11的数据包，尝试编写其元数据。],
  [
    查@tab:datapack_format，1.20.5的版本号为41，1.21.11的版本号为94.1。因为此数据包同时适用于25w31a之前及之后的版本，根据@tab:datapack_format_verify，需要同时指定 #icon(name: "json-number") `pack_format`、#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats`、#icon(name: "json-number") `max_format` 和 #icon(name: "json-number") `min_format`。

    首先，#icon(name: "json-number") `pack_format` 的值需要在41和94.1之间，此处直接写41。其次，可将 #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats` 的下限调整为与 #icon(name: "json-number") `min_format` 一致，上限设为81，#icon(name: "json-number") `max_format` 设为94.1。故元数据可写为：
    #codefile(
      lang: "json",
      title: "pack.mcmeta",
      "{
  \"pack\": {
    \"description\": \"元数据\"
    \"max_format\": [ 94, 1 ],
    \"min_format\": [ 41, 0 ],
    \"pack_format\": 41,
    \"supported_formats\": [ 41, 81 ]
  }
}"
    )
  ]
)
==== 子数据包
子数据包会在当前主数据包的基础上添加内容，同时也会覆盖主数据包相同路径的文件。不过，仅在主数据包文件夹的子层级添加一个数据包并不会让主数据包识别到这个子数据包，应当在元数据的 #icon(name: "json-object") `overlays` 中配置。配置方式见上文的数据格式。注意，由于 #icon(name: "json-string") `directory` 字段允许包含的字符仅有小写字母、`0123456789`、`_` 和 `-`，那么子数据包的名称及相对路径也只能包含这些字符。
#example(
  [一个版本号为88.0的数据包需要使用 #icon(name: "folder") `jigsaw_marker_v1.0` 这个数据包作为其子包，尝试配置子数据包。],
  [
    首先，将数据包 #icon(name: "folder") `jigsaw_marker_v1.0` 移入主数据包，文件夹结构如下：
    #tree(
      (0, [#icon(name: "folder") *主数据包*]),
      (1, [#icon(name: "folder") *jigsaw_marker_v1.0*]),
      (1, [#icon(name: "folder") *data*]),
      (1, [#icon(name: "json") *pack.mcmeta*])
    )
    其次，在 #icon(name: "json") `pack.mcmeta` 中做如下配置：
    #codefile(
      lang: "json",
      title: "pack.mcmeta",
      "{
  \"overlays\": {
    \"entries\": [
      {
        \"directory\": \"jigsaw_marker_v1.0\",
        \"max_format\": [ 88, 0 ],
        \"min_format\": [ 88, 0 ]
      }
    ]
  },
  \"pack\": {
    \"description\": \"数据包\",
    \"max_format\": [ 88, 0 ],
    \"min_format\": [ 88, 0 ]
  }
}")
  ]
) <exa:datapack_overlays>
子数据包的版本号也需要进行校验，校验规则与主数据包的校验规则类似，如下表所示：
#general-table(
  caption: "子数据包版本号校验规则",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([子数据包的配置要求], [#icon(name: "json-object") overlays 必须使用的字段], [#icon(name: "json-object") overlays 不能使用的字段]),
  [仅适用于25w31a之前], [#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats`], [#icon(name: "json-number") `max_format` 和\ #icon(name: "json-number") `min_format`],
  [仅适用于25w31a及之后], [#icon(name: "json-number") `max_format` 和\ #icon(name: "json-number") `min_format`\ *注意：如果主数据包适用于25w31a之前，则必须保留 #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats`*], [-],
  [同时适用于25w31a之前及之后], [#set align(left)
  #h(-2em)同时指定 #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats`、#icon(name: "json-number") `max_format` 和 #icon(name: "json-number") `min_format`，且必须满足以下要求：\ *对最低版本号的验证：*\ #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats` 的下限必须与 #icon(name: "json-number") `min_format` 相等。\ *对最高版本号的验证，以下两种方案二选一：*\ 
  + #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats` 的上限与 #icon(name: "json-number") `max_format` 相等。
  + #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats` 的上限固定为81，此时最高版本号由#icon(name: "json-number") `max_format` 决定。], [-]
)
==== data文件夹
#icon(name: "folder") `data` 文件夹是存储数据包主要内容的文件夹，下面展示了#icon(name: "folder") `data` 文件夹的基本结构，这些文件（夹）就是@tab:writable_registry 所展示的可写注册表以及其他一些配置项的路径，它们不一定必须全部存在，游戏会根据指定的资源路径读取可写注册表中的内容，若相应的可写注册表需要存在，则必须有正确的资源路径和文件（夹）名称。

一个 #icon(name: "folder") `data` 文件夹中可以存在多个不同的命名空间，而命名空间 `minecraft` 下的内容会覆盖原版游戏内容。

在命名空间下的这些文件夹中， #icon(name: "folder") `function` 内的文件使用 `.mcfunction` 格式，#icon(name: "folder") `structure` 内的文件使用 `.nbt` 格式，除 #icon(name: "folder") `datapacks` 外其余文件夹内的文件一律使用 `.json` 格式，编写时务必使用正确的编译软件打开它们。此外，除了 #icon(name: "folder") `datapacks` 的文件夹内部都是可以自由指定资源路径的，那么在各游戏资源的命名空间ID中就可以使用这些资源路径。可参考@exa:namespaced_id_in_datapack。
#tree(
  (0, [#icon(name: "folder") *data*]),
  (1, [#icon(name: "folder") *\<命名空间>*]),
  (2, [#icon(name: "folder") *advancement*: 进度注册表]),
  (2, [#icon(name: "folder") *banner_pattern*: 旗帜图案注册表]),
  (2, [#icon(name: "folder") *cat_variant*: 猫的变种注册表]),
  (2, [#icon(name: "folder") *chat_type*: 聊天类型注册表]),
  (2, [#icon(name: "folder") *chicken_variant*: 鸡的变种注册表]),
  (2, [#icon(name: "folder") *cow_variant*: 牛的变种注册表]),
  (2, [#icon(name: "folder") *damage_type*: 伤害类型注册表]),
  (2, [#icon(name: "folder") *datapacks*: 内置数据包，均为功能数据包]),
  (2, [#icon(name: "folder") *dialog*: 对话框注册表]),
  (2, [#icon(name: "folder") *dimension*: 维度注册表]),
  (2, [#icon(name: "folder") *dimension_type*: 维度类型注册表]),
  (2, [#icon(name: "folder") *enchantment*: 魔咒注册表]),
  (2, [#icon(name: "folder") *enchantment_provider*: 魔咒提供器注册表]),
  (2, [#icon(name: "folder") *frog_variant*: 青蛙的变种注册表]),
  (2, [#icon(name: "folder") *function*: 函数]),
  (2, [#icon(name: "folder") *instrument*: 山羊角乐器注册表]),
  (2, [#icon(name: "folder") *item_modifier*: 物品修饰器注册表]),
  (2, [#icon(name: "folder") *jukebox_song*: 唱片机曲目注册表]),
  (2, [#icon(name: "folder") *loot_table*: 战利品表注册表]),
  (2, [#icon(name: "folder") *painting_variant*: 画的变种注册表]),
  (2, [#icon(name: "folder") *pig_variant*: 猪的变种注册表]),
  (2, [#icon(name: "folder") *predicate*: 谓词注册表]),
  (2, [#icon(name: "folder") *recipe*: 配方注册表]),
  (2, [#icon(name: "folder") *structure*: 结构]),
  (2, [#icon(name: "folder") *tags*: 数据包标签]),
  (2, [#icon(name: "folder") *test_environment*: 测试环境注册表]),
  (2, [#icon(name: "folder") *test_instance*: 测试实例注册表]),
  (2, [#icon(name: "folder") *timeline*: 时间线注册表]),
  (2, [#icon(name: "folder") *trade_set*: 交易集注册表]),
  (2, [#icon(name: "folder") *trial_spawner*: 试炼刷怪笼配置注册表]),
  (2, [#icon(name: "folder") *trim_material*: 盔甲纹饰材料注册表]),
  (2, [#icon(name: "folder") *trim_pattern*: 盔甲纹饰图案注册表]),
  (2, [#icon(name: "folder") *villager_trade*: 村民交易注册表]),
  (2, [#icon(name: "folder") *wolf_variant*: 狼的变种注册表]),
  (2, [#icon(name: "folder") *world_clock*: 世界时钟注册表]),
  (2, [#icon(name: "folder") *worldgen*: 世界生成模块]),
  (3, [#icon(name: "folder") *biome*: 生物群系注册表]),
  (3, [#icon(name: "folder") *configured_carver*: 已配置的雕刻器注册表]),
  (3, [#icon(name: "folder") *configured_feature*: 已配置的地物注册表]),
  (3, [#icon(name: "folder") *density_function*: 密度函数注册表]),
  (3, [#icon(name: "folder") *flat_level_generator_preset*: 超平坦世界生成预设注册表]),
  (3, [#icon(name: "folder") *multi_noise_biome_source_parameter_list*: 多噪声参数列表注册表]),
  (3, [#icon(name: "folder") *noise*: 噪声注册表]),
  (3, [#icon(name: "folder") *noise_settings*: 噪声设置注册表]),
  (3, [#icon(name: "folder") *placed_feature*: 已放置的地物注册表]),
  (3, [#icon(name: "folder") *processor_list*: 处理器列表注册表]),
  (3, [#icon(name: "folder") *structure*: 已配置的结构地物注册表]),
  (3, [#icon(name: "folder") *structure_set*: 结构集注册表]),
  (3, [#icon(name: "folder") *template_pool*: 结构池注册表]),
  (3, [#icon(name: "folder") *world_preset*: 世界预设注册表]),
  (2, [#icon(name: "folder") *zombie_nautilus_variant*: 僵尸鹦鹉螺变种注册表])
)
=== 实验性内容 \*
自22w42a起，Minecraft部分更新内容会以内置数据包的形式加入游戏，使玩家可以提前体验这些内容。这些内容被称为#proper-noun(display: "实验性内容（Experiments）", "shi2 yan4 xing4 nei4 rong2")。在当前版本（26.1），可用的实验性内容有三项：村民交易平衡性调整、红石实验性内容和矿车改进。

所有实验性内容都是#proper-noun(display: "功能数据包（Feature datapack）", "gong1 neng2 shu4 ju4 bao1")的形式，启用这些实验性内容的方式有两种：一是在选择数据包窗口选择功能数据包；二是创建新世界时点击实验性内容从而操控这些实验性内容的开关。
#figure(
  caption: "试验性内容窗口",
  image("图片/试验性内容窗口.png", width: 28em)
)
数据包无法直接修改游戏代码，但功能数据包似乎“注册”了新的游戏内容，功能数据包是否有其独特的行为？其实，实验性内容分为硬编码内容和数据驱动内容，其中的硬编码内容被称为特定组别的#proper-noun(display: "功能元素（Feature Element）", "gong1 neng2 yuan2 su4")。#proper-noun(display: "功能开关（Feature Flag）", "gong1 neng2 kai1 guan1")则用于启用或禁用这些功能元素。当一个功能数据包被启用时，元数据中 `enabled` 字段启用，相应的功能开关被打开，其中的功能元素就能在游戏中正常运行。若一个功能数据包被关闭，则相应的功能元素被过滤。

实验性内容除了可在新创建存档时启用或禁用外，也可以通过修改 #icon(name: "nbt") `level.dat` 中的 #icon(name: "nbt-list") `enabled_features` 字段以在已创建的存档中启用或禁用。相应格式见@sec:saves 节的描述。

实验性内容中的数据驱动部分则交由数据包完成，这些功能数据包作为子数据包存在，存储于 #icon(name: "folder") `datapacks` 文件夹，相应文件结构如下：
#tree(
  (0, [#icon(name: "folder") *data*]),
  (1, [#icon(name: "folder") *\<命名空间>*]),
  (2, [#icon(name: "folder") *datapacks*]),
  (3, [#icon(name: "folder") *\<数据包名称>*]),
  (4, [#icon(name: "folder") *data*]),
  (4, [#icon(name: "json") *pack.mcmeta*]),
  (4, [#icon(name: "png") *pack.png*])
)
其中的 #icon(name: "folder") `<数据包名称>` 即为一个功能数据包，其结构与正常数据包无异，也需要有元数据。但这些数据包无法由自定义的数据包添加，仅由游戏内部提供，仅作了解。
=== 数据包标签定义格式 <subsec:tag_definition>
小节@subsec:tag_in_datapack 已提出了#proper-noun(display: "数据包标签（Tags in data packs）", "shu4 ju4 bao1 biao1 qian1")的概念，它是将游戏资源分类的一种办法。玩家不仅可以使用原版数据包既有的数据包标签，也可以新增或删改原有的标签。数据包标签模块在数据包内的文件结构如下：
#tree(
  (0, [#icon(name: "folder") *data*]),
  (1, [#icon(name: "folder") *\<命名空间>*]),
  (2, [#icon(name: "folder") *tags*]),
  (3, [#icon(name: "folder") *\<注册表>*]),
  (4, [#icon(name: "json") *\<标签>.json*])
)
每个注册表下的数据包标签只允许引用该注册表内的游戏资源。在数据包标签中所有可用的注册表如下表所示：
#split-table(
  caption: "数据包标签可用注册表",
  original-cols: (auto, auto),
  seperator: (2,),
  header: ([资源类型], [注册表 / 配置的路径]),
  data: (
    [旗帜图案], [`banner_pattern`],
    [方块], [`block`],
    [伤害类型], [`damage_type`],
    [魔咒], [`enchantment`],
    [实体类型], [`entity_type`],
    [流体], [`fluid`],
    [函数], [`function`],
    [游戏世界], [`game_event`],
    [山羊角乐器], [`instrument`],
    [物品], [`item`],
    [画的变种], [`painting_variant`],
    [兴趣点类型], [`point_of_interest_type`],
    [药水效果], [`potion`],
    [时间线], [`timeline`],
    [村民交易], [`villager_trade`],
    [自定义世界生成（生物群系）], [`worldgen\biome`],
    [自定义世界生成（超平坦预设）], [`worldgen\flat_level_generator_preset`],
    [自定义世界生成（结构）], [`worldgen\structure`],
    [自定义世界生成（世界预设）], [`worldgen\world_preset`]
  )
)
对于一个特定的数据包标签 #icon(name: "json") `data\<命名空间>\tags\<注册名>\<标签>.json`，引用它的方式是带 `#` 号的命名空间ID，其中 `<注册表>` 层级不书写：
#codebox("#<命名空间>:<标签>")
若命名空间不写，则默认使用 `minecraft` 内的数据包标签。`<注册表>` 层级下可以添加一定的路径。例如，#icon(name: "json") `data\<命名空间>\tags\<注册名>\<路径>\<标签>.json` 的引用格式为
#codebox("#<命名空间>:<路径>/<标签>")
所有的数据包标签 `.json` 文件，无论其所属的注册表，一律有如下的格式：
#tree(
  (0, [#icon(name: "json-object") 文件封装]),
  (1, [#icon(name: "json-bool") *replace*: 指定此标签的引用是否覆盖较低优先级数据包中同命名空间内的同名标签，若设为 `true`，则忽略较低优先级数据包内的引用；若设为 `false`，则此标签内的引用作为对同名标签内引用内容的补充。默认为 `false`。]),
  (2, [#icon(name: "json-object") *#underline[values]*: 此标签引用的游戏资源，必须引用同类型的游戏资源。可以引用游戏资源本身，也可以引用其他的同类型数据包标签。]),
  (3, [#icon(name: "json-string") 一个被引用游戏资源的命名空间ID。]),
  (3, [#icon(name: "json-string") 一个被引用的同类型数据包标签，需要带 `#` 号。]),
  (3, [#icon(name: "json-object") 引用游戏资源的完整格式。]),
  (4, [#icon(name: "json-string") *#underline[id]*: 一个被引用游戏资源的命名空间ID或同类型数据包标签。]),
  (4, [#icon(name: "json-bool") *required*: 用 `false` 表示该条目是可选的，若该条目 #icon(name: "json-string") `id` 所述内容不存在，则不会使标签加载失败。默认为 `true`。])
)
#example(
  [原版存在一个名为 `#air` 的方块标签，有三种方块属于这个标签：空气、洞穴空气和虚空空气，试编写这个标签。],
  [
    这个标签没有使用命名空间，默认命名空间为 `minecraft`。首先确定这个标签的文件路径：
    #v(-1em)
    #tree(
      (0, [#icon(name: "folder") *data*]),
      (1, [#icon(name: "folder") *minecraft*]),
      (2, [#icon(name: "folder") *tags*]),
      (3, [#icon(name: "folder") *block*]),
      (4, [#icon(name: "json") *air.json*])
    )
    标签内容如下所示：
    #codefile(
      lang: "json",
      title: "minecraft > tags > block > air.json",
      "{
  \"values\":[
    \"minecraft:air\",
    \"minecraft:void_air\",
    \"minecraft:cave_air\"
  ]
}"
    )
  ]
)
#example(
  [
    有一个生物群系标签如下所示：
    #v(-1em)
    #tree(
      (0, [#icon(name: "folder") *data*]),
      (1, [#icon(name: "folder") *the_backrooms*]),
      (2, [#icon(name: "folder") *tags*]),
      (3, [#icon(name: "folder") *worldgen*]),
      (4, [#icon(name: "folder") *biome*]),
      (5, [#icon(name: "json") *level_37.json*])
    )
    + 写出该标签的引用方式。
    + 同个数据包内已有如下的生物群系，尝试在该标签中引用这些生物群系。

      #v(-1em)
      #tree(
        (0, [#icon(name: "folder") *data*]),
        (1, [#icon(name: "folder") *the_backrooms*]),
        (2, [#icon(name: "folder") *worldgen*]),
        (3, [#icon(name: "folder") *biome*]),
        (4, [#icon(name: "folder") *level_37*]),
        (5, [#icon(name: "json") *normal.json*]),
        (5, [#icon(name: "json") *deep_water.json*]),
        (5, [#icon(name: "json") *dark_zone.json*])
      )
  ],
  [
    + #icon(name: "folder") `the_backrooms` 是命名空间，#icon(name: "folder") `tags` 是标签的路径，#icon(name: "folder") `worldgen` 和 #icon(name: "folder") `biome` 是标签内注册表的路径，因此该标签的引用方式为 `#the_backrooms:level_37`。
    + #icon(name: "folder") `the_backrooms` 是命名空间，#icon(name: "folder") `worldgen` 和 #icon(name: "folder") `biome` 是注册表的路径，因此这些生物群系的命名空间ID分别为 `the_backrooms:level_37/normal`、`the_backrooms:level_37/deep_water` 和 `the_backrooms:level_37/dark_zone`，现在在标签内引用它们：
      #codefile(
        lang: "json",
        title: "data > the_backrooms > tags > worldgen > biome > level_37.json",
        "{
  \"values\":[
    \"the_backrooms:level_37/normal\",
    \"the_backrooms:level_37/deep_water\",
    \"the_backrooms:level_37/dark_zone\"
  ]
}"
    )
  ]
)
原版的一些数据包标签具有特殊的行为。例如，实体标签 `#arthropod` 引用的实体均被视为节肢生物，会受到节肢杀手魔咒的作用，如果往标签中添加新的实体，则新使用的实体也会被视为节肢生物。所有的原版数据包标签列举于附录@sec:tag_in_datapack。
== 资源包<sec:resourcepack>
为了搭配所制作的小游戏、冒险地图或原版模组，使得游戏的观感和体验感提高，作者通常会系统性地改变游戏的外观，例如方块的纹理、外形等。于是就需要使用资源包。 

#proper-noun(display: "资源包（Resource pack）", "zi1 yuan2 bao1")允许玩家在不修改源代码的情况下自定义纹理、模型、声音、语言等外观性资源，对客户端有效。资源包本质上是一个文件夹或压缩文件，被储存在 #icon(name: "folder") `.minecraft/resourcepacks` 中，同一个 #icon(name: "folder") `resourcepacks` 文件夹内能存放多个资源包。选项资源包窗口“可用”一栏仅罗列 #icon(name: "folder") `resourcepacks` 文件夹内的所有的有效资源包，可在这一栏选用资源包，只有位于“已选”一栏的资源包有效。点击打开包文件夹后可以手动添加资源包。
#figure(
  caption: "选择资源包窗口",
  image("图片/选择资源包窗口.png", width: 28em)
)
在游戏中可以同时使用多个资源包，这些资源包按照“已选”一栏中从下到上的顺序依次加载，资源包的加载顺序可以在该栏中调换。和数据包类似，若这些资源包对同种资源的外观进行定义，则*后加载的资源包会对先加载的资源包进行覆盖*，*表明越靠后加载的资源包其优先级越高*。

资源包也可以以压缩包的形式存放在存档文件夹中，这时资源包作为#proper-noun(display: "世界指定资源包（World specific resources）", "shijiezhidingziyuanbao")使用，仅在当前存档起作用，且会使该资源包的优先级设为最高，并将已定义的资源外观覆盖选项资源包中已启用的资源包。有效的世界指定资源包必须以 #icon(name: "zip") `resources.zip` 为压缩文件名。

在服务器中，管理员可在 #icon(name: "file") `server.properties` 中的 `resource-pack` 一项指定一个 `.zip` 文件的下载地址，从而将此 `.zip` 文件设为服务器的指定资源包。若启用，则游戏会强制将该资源包设为最顶层资源包且无法更改位置。

原版资源包位于 #icon(name: "folder") `.minecraft\versions\<版本号>\<版本号>.jar\assets`，是制作自定义资源包的重要依据，读者可参考之。
=== 资源包的基本结构
一个资源包拥有以下的基本结构：
#tree(
  (0, [#icon(name: "folder") *\<资源包名称>*或 #icon(name: "zip") *\<资源包名称>.zip*]),
  (1, [#icon(name: "folder") *\<子资源包>*]),
  (2, [递归此文件夹结构]),
  (1, [#icon(name: "folder") *assets*: 资源包的主体内容。]),
  (1, [#icon(name: "json") *#underline[pack.mcmeta]*: 资源包的元数据。]),
  (1, [#icon(name: "png") *pack.png*: 可选，作为资源包的图标使用。])
)
如果该资源包以压缩文件的形式存在，则 #icon(name: "zip") `<资源包名称>.zip` 和 #icon(name: "folder") `<子数据包>`、#icon(name: "folder") `assets`、#icon(name: "json") `pack.mcmeta`、#icon(name: "png") `pack.png` 这些文件之间不要插入其他层级的文件夹。若该资源包为世界指定资源包，则名称一定为 #icon(name: "zip") `resources.zip`。

资源包中 #icon(name: "folder") `assets` 用于存放各种资源文件，#icon(name: "json") `pack.mcmeta` 作为资源包的#proper-noun(display: "元数据（Metadata）", "yuan2 shu4 ju4")使用。和数据包一样，所谓元数据，就是用于决定 #icon(name: "folder") `<资源包名称>` 或 #icon(name: "zip") `<资源包名称>.zip` 这个文件（夹）是否为一个资源包，只有当元数据存在时，游戏才能识别资源包。

#icon(name: "json") `pack.mcmeta` 包含的内容如下所示：
#tree(
  (0, [#icon(name: "json-object") 文件封装]),
  (1, [#icon(name: "json-object") *#underline[pack]*: 此资源包的基本信息。]),
  (2, [#icon(name: "json-string")#icon(name: "json-array")#icon(name: "json-object") *#underline[description]*: 任意文本，使用文本组件格式，可用于对资源包的简单介绍。此段文本会出现在选项资源包中。]),
  (2, [#icon(name: "json-number")#icon(name: "json-array") *#underline[max_format]*: 资源包最高兼容的版本号。若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon(name: "json-number") 形式或在 #icon(name: "json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0x7fffffff`。]),
  (2, [#icon(name: "json-number")#icon(name: "json-array") *#underline[min_format]*: 资源包最低兼容的版本号。若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon(name: "json-number") 形式或在 #icon(name: "json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0`。]),
  (2, [#icon(name: "json-number") *pack_format*: 25w31a以前用于指定资源包版本号的字段，现已弃用，可用于兼容旧版资源包。]),
  (2, [#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") *supported_formats*: 25w31a以前用于指定资源包版本号兼容范围的字段，现已弃用，可用于兼容旧版资源包。]),
  (3, [*若使用 #icon(name: "json-number") 形式，则精确匹配，效果与 #icon(name: "json-number") pack_format一致*], false),
  (3, [*若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为最低兼容的版本号，第二个为最高兼容的版本号*], false),
  (3, [*若使用 #icon(name: "json-object") 形式，则有以下字段：*], false),
  (3, [#icon(name: "json-number") *max_inclusive*: 最高兼容的版本号。]),
  (3, [#icon(name: "json-number") *min_inclusive*: 最低兼容的版本号。]),
  (1, [#icon(name: "json-object") *language*: 可选，用于添加选项卡中的语言，可以添加多个语言。]),
  (2, [#icon(name: "json-array") *\<语言代码>*: 一个新建的语言，键名按照 `<语言>_<地区>` 的格式，其与 #icon(name: "folder") `assets\minecraft\lang` 中同名的 `.json` 文件相对应。]),
  (3, [#icon(name: "json-bool") *bidirectional*: 布尔值，若为 `true`，则按照从右到左的格式显示。默认为 `false`。]),
  (3, [#icon(name: "json-string") *#underline[name]*: 语言的名称。]),
  (3, [#icon(name: "json-string") *#underline[reigon]*: 国家或地区的名称。]),
  (1, [#icon(name: "json-object") *filter*: 可选，用于指定在资源包加载列表中优先级低于该包的资源包内要忽略的内容。]),
  (2, [#icon(name: "json-array") *block*: 忽略内容列表。]),
  (3, [#icon(name: "json-object") 一项被忽略的内容。若此项为空则完全忽略所有优先级低的资源包。]),
  (4, [#icon(name: "json-string") *namespace*: 要忽略的命名空间，若省略则忽略所有命名空间，可使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (4, [#icon(name: "json-string") *path*: 要忽略的资源路径，若省略则忽略所有路径，可使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (1, [#icon(name: "json-object") *overlays*: 可选，用于子资源包的识别。]),
  (2, [#icon(name: "json-array") *#underline[entries]*: 可用子资源包的列表。]),
  (3, [#icon(name: "json-object") 一个子资源包。]),
  (4, [#icon(name: "json-string") *#underline[directory]*: 该子资源包相对于主资源包根目录的路径。允许使用的字符有：小写字母、`0123456789`、`_` 和 `-`。]),
  (4, [#icon(name: "json-number")#icon(name: "json-array") *max_format*: 该子资源包最高兼容的版本号。若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon(name: "json-number") 形式或在 #icon(name: "json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0x7fffffff`。]),
  (4, [#icon(name: "json-number")#icon(name: "json-array") *min_format*: 该子资源包最低兼容的版本号。若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon(name: "json-number") 形式或在 #icon(name: "json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0`。]),
  (4, [#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") *formats*: 25w31a以前用于指定子资源包版本号兼容范围的字段，现已弃用，可用于兼容旧版资源包。]),
  (5, [*若使用 #icon(name: "json-number") 形式，则精确匹配*], false),
  (5, [*若使用 #icon(name: "json-array") 形式，则内部包含两个整数，第一个为最低兼容的版本号，第二个为最高兼容的版本号*], false),
  (5, [*若使用 #icon(name: "json-object") 形式，则有以下字段：*], false),
  (5, [#icon(name: "json-number") *max_inclusive*: 最高兼容的版本号。]),
  (5, [#icon(name: "json-number") *min_inclusive*: 最低兼容的版本号。])
)
例如，下面是1.21.11版本的一个标准 #icon(name: "json") `pack.mcmeta` 文件：
#codefile(
  lang: "json",
  title: "pack.mcmeta",
  "{
  \"pack\": {
    \"description\": \"The default look and feel of Minecraft\",
    \"max_format\": 75.0,
    \"min_format\": 75.0,
  }
}"
)
和数据包一样，#proper-noun(display: "资源包版本号（Resource pack format）", "zi1 yuan2 bao1 ban3 ben3 hao1")是一个用于区分不同版本数据包的参数。每当Mojang对资源包做出修改时，版本号都会发生变动。同样，1.21.8以前的版本号均为整数，例如，1.21.8的数据包版本号为64，25w31a引入了次要版本号，是为65.0。同一个主版本号内的资源包可以向下兼容，例如65.2的资源包可以兼容65.0的资源包。

下表罗列了所有主版本使用的资源包版本号，不包括快照版本。包含快照版本的资源包版本号参考附录@sec:pack_format\中的@tab:pack_format。
#split-table(
  caption: "资源包版本号",
  original-cols: (auto, auto),
  seperator: (2,),
  header: ([游戏版本], [资源包版本号]),
  data: (
    [1.6.1 \~ 1.8.9], [1],
    [1.9 \~ 1.10.2], [2],
    [1.11 \~ 1.12.2], [3],
    [1.13 \~ 1.14.4], [4],
    [1.15 \~ 1.16.1], [5],
    [1.16.2 \~ 1.16.5], [6],
    [1.17 \~ 1.17.1], [7],
    [1.18 \~ 1.18.2], [8],
    [1.19 \~ 1.19.2], [9],
    [1.19.3], [11],
    [1.19.4], [12],
    [1.20 \~ 1.20.1], [15],
    [1.20.2], [18],
    [1.20.3 \~ 1.20.4], [22],
    [1.20.5 \~ 1.20.6], [32],
    [1.21 \~ 1.21.1], [34],
    [1.21.2 \~ 1.21.3], [42],
    [1.21.4], [46],
    [1.21.5], [55],
    [1.21.6], [63],
    [1.21.7 \~ 1.21.8], [64],
    [1.21.9 \~ 1.21.10], [69.0],
    [1.21.11], [75.0]
  )
)
资源包的版本号同样具有校验规则，也以25w31a（1.21.9）为分水岭实行“新旧双轨制”，如下表所示：
#general-table(
  caption: "资源包版本号校验规则",
  colspan: 4,
  columns: (2fr, 5fr, 4fr, 4fr),
  header: ([配置要求], [元数据中必须使用的字段], [元数据中可以使用的字段], [元数据中不能使用的字段]),
  [仅适用于25w31a之前], [#icon(name: "json-number") `pack_format`], [#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats`\ 若使用，则此区间必须包含 #icon(name: "json-number") `pack_format` 的值，且最大值不能低于16，因为此字段是在23w31a引入的], [#icon(name: "json-number") `max_format` 和\ #icon(name: "json-number") `min_format`],
  [仅适用于25w31a及之后], [#icon(name: "json-number") `max_format` 和\ #icon(name: "json-number") `min_format`], [-], [#icon(name: "json-number") `pack_format` 和\ #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats`],
  [同时适用于25w31a之前及之后], [#set align(left)
  #h(-2em)同时指定 #icon(name: "json-number") `pack_format`、#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats`、#icon(name: "json-number") `max_format` 和 #icon(name: "json-number") `min_format`，且必须满足以下要求：\ *区间验证：\ *#icon(name: "json-number") `pack_format` 必须落在兼容区间内。\ *对最低版本号的验证：*\ #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats` 的下限必须与 #icon(name: "json-number") `min_format` 相等。\ *对最高版本号的验证，以下两种方案二选一：*\ 
  + #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats` 的上限与 #icon(name: "json-number") `max_format` 相等。
  + #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats` 的上限固定为64，此时最高版本号由#icon(name: "json-number") `max_format` 决定。], [-], [-]
)
和子数据包一样，子资源包的版本号也需要进行校验，校验规则与主资源包的校验规则类似，如下表所示：
#general-table(
  caption: "子资源包版本号校验规则",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([子资源包的配置要求], [#icon(name: "json-object") overlays 必须使用的字段], [#icon(name: "json-object") overlays 不能使用的字段]),
  [仅适用于25w31a之前], [#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats`], [#icon(name: "json-number") `max_format` 和\ #icon(name: "json-number") `min_format`],
  [仅适用于25w31a及之后], [#icon(name: "json-number") `max_format` 和\ #icon(name: "json-number") `min_format`\ *注意：如果主数据包适用于25w31a之前，则必须保留 #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats`*], [-],
  [同时适用于25w31a之前及之后], [#set align(left)
  #h(-2em)同时指定 #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats`、#icon(name: "json-number") `max_format` 和 #icon(name: "json-number") `min_format`，且必须满足以下要求：\ *对最低版本号的验证：*\ #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats` 的下限必须与 #icon(name: "json-number") `min_format` 相等。\ *对最高版本号的验证，以下两种方案二选一：*\ 
  + #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats` 的上限与 #icon(name: "json-number") `max_format` 相等。
  + #icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `formats` 的上限固定为64，此时最高版本号由#icon(name: "json-number") `max_format` 决定。], [-]
)
#example(
  [
    判断以下的资源包元数据是否符合版本号的校验要求。
    #codefile(
      lang: "json",
      title: "pack.mcmeta",
      "{
  \"pack\": {
    \"pack_format\": 55,
    \"supported_formats\": {
      \"min_inclusive\": 55,
      \"max_inclusive\": 64
    },
    \"description\": {
      \"translate\": \"森罗物语：装饰\"
    },
    \"min_format\": [ 55, 0 ],
    \"max_format\": [ 1000, 0 ]
  }
}"
    )
  ],
  [
    #icon(name: "json-number") `pack_format`、#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats`、#icon(name: "json-number") `max_format` 和 #icon(name: "json-number") `min_format` 四个字段同时存在，说明此资源包同时适用于25w31a之前及之后。

    首先进行区间验证：#icon(name: "json-number") `pack_format` 的值在兼容区间内。

    其次对最低版本号进行验证：#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats` 的下限与 #icon(name: "json-number") `min_format` 相等。

    最后对最高版本号进行验证，#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats` 的上限与 #icon(name: "json-number") `max_format` 不相等。再检查，#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object") `supported_formats` 的上限为64，#icon(name: "json-number") `max_format` 是一个大于64的值。

    故此资源包的版本号编写正确。
  ]
)
下面展示了 #icon(name: "folder") `assets` 文件夹的基本结构，这些文件（夹）不一定必须全部存在，游戏会根据指定的资源路径读取资源包中的内容，因此若相应的资源文件（夹）需要存在，则必须有正确的资源路径和文件（夹）名称。
#tree(
  (0, [#icon(name: "folder") *assets*]),
  (1, [#icon(name: "folder") *\<命名空间>*]),
  (2, [#icon(name: "folder") *atlases*: 纹理图集]),
  (2, [#icon(name: "folder") *blockstates*: 方块状态映射]),
  (2, [#icon(name: "folder") *equipment*: 装备模型]),
  (2, [#icon(name: "folder") *font*: 字体]),
  (2, [#icon(name: "folder") *items*: 物品模型映射]),
  (2, [#icon(name: "folder") *lang*: 语言]),
  (2, [#icon(name: "folder") *models*: 烘焙模型]),
  (2, [#icon(name: "folder") *particles*: 粒子纹理定义]),
  (2, [#icon(name: "folder") *post_effect*: 后处理管线]),
  (2, [#icon(name: "folder") *sounds*: 声音]),
  (2, [#icon(name: "folder") *shaders*: 着色器]),
  (2, [#icon(name: "folder") *texts*: 文本]),
  (2, [#icon(name: "folder") *texture*: 纹理]),
  (2, [#icon(name: "folder") *waypoint_style*: 路径点样式]),
  (2, [#icon(name: "json") *gpu_warnlist.json*: GPU警告列表]),
  (2, [#icon(name: "json") *regional_compliancies.json*: 地区合规性警告]),
  (2, [#icon(name: "json") *sounds.json*: 声音事件定义文件]),
)
=== GPU警告列表 \*
资源包负责游戏的画面渲染。部分计算机显卡太旧、驱动版本不匹配，或者GPU属于某些已知会造成游戏崩溃的型号，因此资源包内存在 #icon(name: "json") `gpu_warnlist.json` 这个用于自检硬件兼容性的配置文件。其格式如下所示：
#tree(
  (0, [#icon(name: "json-object") 文件封装]),
  (1, [#icon(name: "json-array") *#underline[renderer]*: 需要显示渲染器警告的渲染器名称（显卡型号）。]),
  (2, [#icon(name: "json-string") 一个渲染器名称，使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (1, [#icon(name: "json-array") *#underline[version]*: 需要显示渲染器版本警告的渲染器版本（通常为显卡驱动的版本号）。]),
  (2, [#icon(name: "json-string") 一个渲染器版本，使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (1, [#icon(name: "json-array") *#underline[vendor]*: 需要显示渲染器厂商警告的渲染器生产厂商。]),
  (2, [#icon(name: "json-string") 一个渲染器厂商，使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。])
)
例如，原版资源包的 #icon(name: "json") `gpu_warnlist.json` 文件内容如下：
#codefile(
  lang: "json",
  title: "assets > minecraft > gpu_warnlist.json",
  "{
  \"renderer\" : [],
  \"version\" : [
    \"\\\\bMetal\\\\b\"
  ],
  \"vendor\" : []
}"
)
这份配置专门针对macOS用户。当渲染器版本信息中包含独立的Metal单词时，会触发警告。因为macOS使用苹果系统独特的图形接口Metal，而不使用OpenGL。
#figure(
  caption: "GPU警告页面",
  image("图片/GPU警告页面.png", width: 28em)
) <fig:warning_gpu>
警告页面会在玩家开启游戏极佳画质时出现。不过，这个页面以及GPU警告列表的配置都只是警告机制，并不是禁止硬件被匹配到的计算机运行Minecraft。游戏具体的运行情况取决于硬件本身。例如，以下的配置文件可以使得持有RTX 4060显卡的计算机显示警告页面，显示的页面如@fig:warning_gpu 所示。
#codefile(
  lang: "json",
  title: "assets > minecraft > gpu_warnlist.json",
  "{
  \"renderer\": [
    \".*RTX 4060.*\"
  ],
  \"version\": [],
  \"vendor\": []
}"
)
=== 地区合规性警告 \*
部分国家或地区针对游戏颁布了一定的法律法规，资源包内 #icon(name: "json") `regional_compliancies.json` 可以相应地设置游戏在运行一段时间后出现的弹窗警告，其格式如下所示：
#tree(
  (0, [#icon(name: "json-object") 文件封装]),
  (1, [#icon(name: "json-array") *\<地区代码>*: 键名为#link("https://zh.wikipedia.org/wiki/ISO_3166-1%E4%B8%89%E4%BD%8D%E5%AD%97%E6%AF%8D%E4%BB%A3%E7%A0%81")[ISO 3166-1三位字母地区代码]，游戏会针对该系统地区进行弹窗。]),
  (2, [#icon(name: "json-object") 一项弹窗。]),
  (3, [#icon(name: "json-number") *delay*: 第一次弹窗时游戏的运行时间，单位为分钟，默认值为 `0`。]),
  (3, [#icon(name: "json-number") *period*: 弹窗周期，单位为分钟。]),
  (3, [#icon(name: "json-string") *title*: 弹窗标题，需要是一个翻译标识符，详见小节@subsec:translate。]),
  (3, [#icon(name: "json-string") *message*: 弹窗的具体信息，需要是一个翻译标识符，详见小节@subsec:translate。])
)
原版资源包内的 #icon(name: "json") `regional_compliancies.json` 内容如下：
#codefile(
  lang: "json",
  title: "assets > minecraft > gpu_warnlist.json",
  "{
  \"KOR\" : [
    {
      \"delay\": 1440,
      \"period\": 60,
      \"title\": \"compliance.playtime.greaterThan24Hours\",
      \"message\": \"compliance.playtime.message\"
    },
    {
      \"period\": 60,
      \"title\": \"compliance.playtime.hours\",
      \"message\": \"compliance.playtime.message\"
    }
  ]
}"
)
它只设置了针对韩国的弹窗警告：每1小时提醒一次，连续游戏时间超过24小时也会提醒。
== 游戏机制
虽然技术性开发是能够调控游戏运行方式的手段，但开发成果还是不免受到游戏机制的制约。在时间上受到游戏循环驱动的影响，以游戏刻为单位计算内容；在空间上受到区块加载的影响，绝大多数操作都只能在允许运算的区块中进行。本节旨在介绍游戏加载、运行、更新的一些基本游戏机制。
=== 端
Minecraft的架构是*客户端-服务端模型*，顾名思义，Minecraft使用#proper-noun(display:"客户端（Cilent）","ke4 hu4 duan1")和#proper-noun(display:"服务（器）端（Server）","fu2 wu4 duan1")来运作自身。这两个#proper-noun(display:"端（Sides）","duan1")之间的通信是由#proper-noun(display:"封包（Packet）","feng1 bao1")实现的。在网络工程中，这个概念一般译为“数据包”，而Minecraft中另有一个叫Datapack（数据包）的概念，故Packet在Minecraft技术性开发领域会特地译为“封包”。

然而，仅通过客户端和服务端理解Minecraft的运作是远远不够的，因为Minecraft的架构还包括#proper-noun(display:"物理端（Physical sides）","wu4 li3 duan1")和#proper-noun(display:"逻辑端（Logical sides）","luo2 ji2 duan1")，并且物理端和逻辑端分别具有各自的客户端和服务端。
==== 物理客户端
#proper-noun(display:"物理客户端（Physical client）","wu4 li3 ke4 hu4 duan1")是指下载游戏版本得到的 `<version>.jar` 文件，它的默认文件路径为 `.minecraft\<版本号>\<version>.jar`。物理客户端包含了游戏的全部内容，也包含了内置的客户端和服务端，即#proper-noun(display:"逻辑客户端（Logical client）","luojikehuduan")和#proper-noun(display:"逻辑服务端（Logical server）","luo2 ji2 fu2 wu4 duan1")，其中逻辑服务端又称*内置服务器（Integrated server，或译为集成服务端）*#index(display:"内置服务器（Integrated server）","nei4 zhi4 fu2 wu4 qi4")。内置服务器会受到客户端的影响。

逻辑客户端负责接收来自玩家的输入、处理资源包、渲染游戏画面，并将数据输送给逻辑服务端处理；逻辑服务端负责处理由客户端发送的数据，运行游戏逻辑。例如，当玩家在游戏中移动时，客户端会根据玩家输入的移动方向渲染玩家此时的游戏画面，同时又将玩家移动的信息通过封包发送给逻辑服务端，逻辑服务端计算玩家的坐标、玩家周围是否存在任何的碰撞箱阻止玩家移动，将计算结果通过封包返还给逻辑客户端，渲染玩家移动的游戏画面。客户端的渲染会与服务端产生不一致的情况，例如标记是一种仅存在于服务端的实体，在客户端上并不会渲染标记，参见@sec:technical_entity。
#figure(
  caption: [逻辑客户端和逻辑服务端的运行流程],
  image("图片/逻辑客户端和逻辑服务端的运行流程.png", width: 24em)
)
*即使是进行单人游戏，Minecraft依旧会在玩家进入本地世界时创建一个内置服务器，在本地世界关闭时内置服务器即被关闭。*这个内置服务器可以开放至局域网，从而将单人游戏开放为局域网联机的多人游戏。此时内置服务器拥有一个地址，其格式为
#codebox("<IPv4地址>:<端口>") <code:ipv4>
局域网联机的IPv4地址可由CMD的 `ipconfig` 命令查询。端口是一个数值，可以自由指定，范围为 `0` 至 `65535`（含两端）。除了通过暂停游戏的对局域网开放选项外，玩家还可以通过命令 `/publish` 开放内置服务器，该命令所需权限等级为4，且仅能在单人游戏中使用，其语法为：#index(index: "command", "publish")
#codebox("publish [<allowCommands>] [<gamemode>] [<port>]")
#param-desc(
  [`<allowCommands>`（布尔值 `brigadier:bool`）], [可选，指定是否启用命令，默认为否。],
  [`<gamemode>`（游戏模式 `minecraft:gamemode`）], [指定新玩家进入游戏的游戏模式，可用值有 `survival`（生存模式）、`creative`（创造模式）、`adventure`（冒险模式）和 `spectator`（旁观模式）。若不指定，则使用该游戏世界的默认游戏模式。],
  [`<port>`（整数 `brigadier:integer`）], [指定端口，必须为介于 `0` 和 `65535` 之间（含）的值，若不指定，则随机选择大于 `1024` 的端口。]
)
#example(
  [使用命令 `/publish` 开放当前本地世界，要求关闭命令、设置玩家游戏模式为生存模式、端口指定为 `12345`。],
  [
    命令为
    #codebox("publish false survival 12345")
  ]
)
==== 物理服务端
除了使用局域网联机进行多人游戏，Minecraft提供了另一种进行多人游戏的方法，即#proper-noun(display: "物理服务端（Physical server）", "wu4 li3 fu2 wu4 duan1")。物理服务端只包含一个逻辑服务端，并不包含逻辑客户端。这意味着物理服务端只能负责服务端的任务，而不能使用户参与游戏；但同时也意味着若服主不在游戏中，服务器也不会关闭；此外，物理服务端在运行过程中只能加载一个游戏世界，切换其他游戏世界需要重启服务器。

物理服务端内的逻辑服务端又可被称为*专用服务器（Dedicated server，或译为独立服务端）*#index(display: "专用服务器（Dedicated server，独立服务端）", "zhuan1 yong4 fu2 wu4 qi4")，该逻辑服务端包含配置文件 #icon(name: "file") `server.properties`，用于存储服务器的所有设置。专用服务器不会受到连接的逻辑客户端的影响。同局域网联机一样，专用服务器也拥有一个地址，其格式与语法@code:ipv4 所述一致。
#general-table(
  caption: "各种情况使用的客户端和服务端",
  colspan: 4,
  columns: (auto, auto, auto, auto),
  header: ([], [单人游戏], [局域网多人游戏], [专用服务器多人游戏]),
  [客户端], [逻辑客户端], [玩家各自的逻辑客户端], [玩家各自的逻辑客户端],
  [服务端], [内置服务器], [内置服务器], [专用服务器]
)
=== 游戏刻
由于游戏不可能时时刻刻都进行计算，正常情况下，游戏以一定的频率循环驱动，即每隔一定的时间进行一次计算，计算完毕后游戏会进行休眠，此时游戏不作任何计算直到下一游戏刻。一个循环周期被称为一个#proper-noun(display: "刻（Tick）", "ke4")，或*游戏刻（Game tick，简称gt）*#index(display: "游戏刻（Game tick，gt）", "you2 xi4 ke4")。
==== 刻率和帧率
每秒游戏刻的数量数由*每秒刻数（Ticks per second，简称TPS）*#index(display: "每秒刻数（Ticks per second，TPS）", "mei3 miao3 ke4 shu4")这个指标显示；此外还有一个指标与每秒游戏刻数相关，即*每刻毫秒数（Milliseconds per tick，简称MSPT）*#index(display: "每刻毫秒数（Milliseconds per tick，MSPT）", "mei3 ke4 hao2 miao3 shu4")，它反映的是游戏刻计算的平均时间。TPS是一个可变量，它可以由命令 `/tick` 修改，不做修改的默认值为20。也就是说，正常情况下每秒有20gt，或者称最大TPS频率为20。MSPT可以由 `F3`（调试屏幕）查看，这个统计量名称为 `ms ticks`。正常情况下MSPT不会大于50，且只有当MSPT值不大于50时才能保证TPS维持在20。

MSPT与TPS的数量关系可表示为
$ "MSPT" times "TPS" lt.eq 1000 $
受限于游戏中的计算量及计算机的性能，若计算量过大，MSPT增大，则TPS会相应地减小，造成*掉刻*。TPS无法维持在最大频率时，可由下式计算出实际的TPS：
$ "TPS" eq 1000 / "MSPT" $
如果按照默认的每秒20gt的频率渲染画面，难免会产生肉眼可见的不连续画面。因此客户端渲染游戏画面时，并不是完全按照刻率渲染，而是在刻之间*补帧*以形成平滑画面。用于描述渲染频率的指标为*帧率（Frame per second，简称FPS）*#index(display: "帧率（Frame per second，FPS）", "zhen1 lv4")，它反应的是客户端的每秒渲染的帧数。帧率受到客户端渲染计算量、计算机性能的影响，可以通过*最大帧率*选项控制最高FPS。

当客户端渲染计算量较大时，FPS会下降，造成*掉帧*。因此分析客户端画面卡顿时，可以考虑的若干可能性有：渲染计算量较大，或是游戏刻计算量较大造成渲染补帧无法形成平滑画面。若遇到画面较为流畅、但游戏内容卡顿——如实体不移动、放置破坏方块相应时间较长——则说明客户端渲染计算正常而游戏刻计算量大。

游戏的流畅程度是影响玩家游戏体验的关键因素，*无论是搭建红石电路还是制作数据包，均需要综合考虑成品对TPS和FPS的影响*。
==== 命令/tick的用法
命令 `/tick` 可用于控制游戏刻运行，该命令所需权限等级为3。以下是所有用法。#index(index: "command", "tick")
===== 查询当前游戏刻频率，并返回性能数据。语法为：
#codebox("tick query")
===== 定义游戏刻频率，语法为：
#codebox("tick rate <rate>")
#param-desc(
  [`<rate>`（浮点数 `brigadier:float`）], [需要设置的游戏刻频率。设置后，最大TPS频率即为这个参数设置的值。]
)
#example(
  [将游戏刻频率设为40。],
  [
    所需命令为
    #codebox("tick rate 40")
    负载正常时，MPST应不大于$1000 div 40=25$。
  ]
)
===== 冻结游戏刻，语法为：
#codebox("tick freeze")
===== 步进特定数量的游戏刻，语法为：
#codebox("tick step [<time>]") <code:tick_step>
该语法仅能在游戏刻已冻结的情况下使用。步进结束后，游戏刻会继续冻结。
#param-desc(
  [`[<time>]`（时间 `minecraft:time`）], [步进时间长度。格式为：\ `<单精度浮点数>[<单位>]`\ 单位可以为：`t`（游戏刻），`s`（秒）或 `d`（游戏日，1游戏日固定为24000游戏刻），若不写单位，则默认单位为游戏刻。时间参数会在单位转化成游戏刻后取最近的整数。例如，`.2d` 会换算为$24000 times 2=48000$gt。若游戏刻频率为40，则 `.5s` 会换算为$40 times 0.5=20$gt。]
)
#example(
  [使游戏刻步进10秒。],
  [
    所需命令为
    #codebox("tick step 10s")
  ]
)
===== 停止正在进行的步进，并冻结游戏刻。语法为：
#codebox("tick step stop")
===== 取消冻结游戏刻，语法为：
#codebox("tick unfreeze")
===== 忽略游戏刻频率的限制持续进行更新，语法为：
#codebox("tick sprint [<time>]")
 该语法用于在指定的时间 `[<time>]` 内尽可能快地运行游戏，结束后恢复先前的游戏刻速率并返回性能信息。参数 `[<time>]` 的用法与语法@code:tick_step 中所述的一致。
===== 停止正在进行的忽略游戏刻频率进行的更新，并恢复先前的游戏刻频率。语法为：
#codebox("tick sprint stop")
==== 游戏刻计算流程 \*
Minecraft的游戏计算内容繁多，在同一个线程中的计算不可能同步完成，各模块的计算在同一游戏刻内一定有先后顺序，这种先后顺序被称为*微时序（Microtiming，或称微观延迟）*#index(display: "微时序（Microtiming，微观延迟）", "wei1 shi2 xu4")。在一个游戏刻内，服务端的计算流程顺序如下所示#footnote[带\*的项目表示在游戏刻冻结时忽略执行。]：
+ 检查游戏是否被暂停，若已暂停，则自动保存游戏。若此时内置服务器正在主持局域网联机，则统计世界打开时间。
+ 已暂停游戏若恢复运行，则对所有玩家强制时间同步。
+ 运行服务端逻辑。内容顺序如下：
  + 更新游戏刻计数器。
  + 若此时正在使用 `/tick step` 步进游戏刻，则计算剩余需步进游戏刻。
  + 关闭与客户端的网络自动发送队列的刷新。
  + 如果游戏世界被重新加载（如使用 `/reload`），则调用 `#minecraft:load` 中的函数，调用顺序与列表 #icon(name: "json-array") `value` 中的函数顺序一致。一个函数被调用时按 `.mcfunction` 文件内的命令顺序依次执行命令。<enu:gametick_order_reload> 
  + \*调用一次 `#minecraft:tick` 中的函数，顺序与@enu:gametick_order_reload 中所述一致。
  + 遍历所有维度，遍历顺序为：主世界、下界、末地、有先后顺序的自定义维度。遍历到某个维度时，按以下流程计算：
    + 每隔20 gt对玩家同步一次该维度的时间。
    + 运行维度游戏刻逻辑，若计算出现异常，则游戏崩溃。游戏刻逻辑按以下流程计算：
      + 更新世界边界。
      + \*计算天气循环、更新降雨和雷暴计时器。此计时器可由 `/weather` 命令重置，该命令亦可用于直接更改游戏内天气，所需权限等级为2，语法为：#index(index: "command", "weather")
        #codebox("weather (clear|rain|thunder) [<duration>]")
        #param-desc(
          [`(clear|rain|thunder)` ], [用于指定天气为晴天、雨天（温度值低于0.15的区域会下雪）或雷暴。],
          [`[<time>]`（时间 `minecraft:time`）], [可选，与语法@code:tick_step 所述一致。如不填写，则重置游戏内的天气循环时间。]
        )
      + 计算日夜更替，若玩家入睡情况满足跳过当前时间至下一次日出，则将时间调整至下一次日出。若此时正在降雨，则重置天气循环。
      + 更新内部光照等级乘数。
      + \*更新时间。
      + \*在非调试维度执行方块计划刻。
      + \*在非调试维度执行流体计划刻。
      + \*更新袭击事件。
      + 计算区块数据，按以下流程计算：
        + \*更新计算标签。
        + 计算需要执行区块刻的区块，并打乱区块刻执行顺序。
        + \*计算生物生成。
        + \*按区块顺序执行区块刻。
        + \*执行计划周期生成。
        + 更新各个玩家追踪的区块。
        + 更新兴趣点数据。
        + 卸载不需要的区块。
      + \*计算方块事件。
      + 如果维度内有玩家或强加载区块，则重置限制超时。
      + 如果闲置超时小于300 gt，则运行实体和方块计算逻辑，按以下流程计算：
        + \*计算末影龙战斗数据。
        + 遍历所有实体，进行实体计算。
        + \*计算方块实体。
      + 加载区块内未加载的实体，卸载不需要的实体。
  + 检查客户端连接。
  + 每600gt向所有玩家发送更新延迟网络包。
  + 若存在服务器GUI，则更新服务器GUI。
  + 对所有玩家发送正在等待发送的区块网络包，并打开与玩家客户端的网络自动发送队列刷新。
  + 若与上一次自动保存已有100 gt，则尝试自动保存。
  + 运行处理队列中的事件。
+ 在客户端更新渲染距离和模拟距离。
=== 区块加载
一个Minecraft世界在水平方向上的长宽均超过了六千万格，如果一次性将所有内容全部加载出来，则会消耗非常多的内存。为使游戏运行过程中不占用过多的内存，游戏仅会加载部分区域供玩家游玩，这些加载和数据存储的单位被称为#proper-noun(display: "区块（Chunk）", "qu1 kuai4")，每一个区块均是$16 times 384 times 16$的立方体，一个区块又可以沿高度分割成24个$16 times 16 times 16$大小的#proper-noun(display: "区段（Chunk section）", "qu1 duan4")，或称#proper-noun(display: "子区块（Sub chunk）", "zi3 qu1 kuai4")。在必要的情况下，游戏会*卸载*一些区块，并在需要的时候*加载*区块。已卸载的区块不会处理游戏的任何事件，这其中也包括了实体的生成、活动，红石电路、命令的运行等等。若长距离执行命令，区块的加载是需要着重考虑的一方面。
==== 加载等级和计算等级
游戏使用#proper-noun(display: "加载等级（Load level）", "jia1 zai3 deng3 ji2")和#proper-noun(display: "计算等级", "ji4 suan4 deng3 ji2")#footnote[无英文原文。]来确定一个区块的加载情况。
===== 加载等级
区块的加载等级范围可表示为0 \~ 45（含）的整数，且等级越高，区块内加载的内容就越多。加载等级可划分为如下表所示的不同加载等级类型：
#general-table(
  caption: "加载等级类型",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([类型], [加载等级], [描述]),
  [实体计算], [$lt.eq.slant 31$], [可以计算实体、方块实体和计划刻，方块修改可以被追踪。],
  [方块计算], [32], [不可计算但可以追踪实体，可以计算方块实体和计划刻，可以追踪方块修改。],
  [完全加载], [33], [不可计算但可以追踪实体，不可以计算方块实体和计划刻，不可以追踪方块修改。],
  table.cell(rowspan: 4)[不可访问], [34], [大于该加载等级时，实体和方块修改都不可以追踪，方块实体和计划刻不可以计算，但可以进行初始化光照计算。],
  [35], [可进行地形雕刻。],
  [36], [可填充生物群系。],
  [37 \~ 44], [结构允许生成。],
  [卸载], [45], [区块已被卸载]
)
===== 计算等级
类似于加载等级，区块的加载等级范围可表示为0 \~ 33（含）的整数。且等级越高，区块内加载的内容就越多。区块内具体可以加载何内容由加载等级和计算综合决定。下表列举了不同加载程度的区块#footnote[表中一种类型的区块必须同时满足该行加载等级和计算等级的要求。]：
#general-table(
  caption: "区块加载类型",
  colspan: 4,
  columns: (auto, auto, auto, auto),
  header: ([区块类型], [加载等级], [计算等级], [每游戏刻的具体行为]),
  [强加载区块], [$lt.eq.slant 31$], [$lt.eq.slant 31$], [可以计算实体、方块实体和计划刻，任何命令都能正常执行。],
  [弱加载区块], [32], [32], [可以计算方块实体和计划刻，实体可以被命令追踪和记录，但无法计算实体。],
  [加载边界区块], [33], [32], [实体可以被命令追踪和记录，但不计算实体、方块实体和计划刻。],
  [不可访问], [$gt.eq.slant 34$], [33], [不计算实体、方块实体和计划刻，任何命令都不可执行。]
)
==== 加载标签
一个区块加载等级和计算等级的具体数值可以由#proper-noun(display: "加载标签（Load ticket）", "jia1 zai3 biao1 qian1")决定。一个加载标签有*基础等级*、*标签类型*、*存活时间*和*持久化*四个属性，基础等级指一个区块被赋予某种加载标签时该区块的加载等级和计算等级（两者不一定相等），存活时间指该类加载标签能够持续的时长。以下是注册表内所有类型的加载标签：
===== 玩家标签
玩家标签在注册表内分为#proper-noun(display: "玩家加载标签（Player loading ticket）", "wan2 jia1 jia1 zai3 biao1 qian1")和#proper-noun(display: "玩家计算标签（Player simulation ticket）", "wan2 jia1 ji4 suan4 biao1 qian1")。玩家所在的区块会被赋予这玩家标签，其中加载等级由玩家加载标签赋予，计算等级由玩家计算标签赋予，此时该区块的加载等级主要取决于#proper-noun(display: "渲染距离（Render distance）", "xuan4 ran3 ju4 li2")，计算等级主要取决于#proper-noun(display: "模拟距离（Simulation distance）", "mo2 ni3 ju4 li2")，渲染距离和模拟距离均可以由选项设置。渲染距离主要决定游戏世界的渲染距离，即渲染区块的数量，对FPS的影响程度较高。通常来说渲染区域以玩家所在区块为中心，在平面上为正方形，其边长为
$ a = 2d_"r" + 1 $ <equ:render_distance>
#param-desc(
  prefix: "式中：",
  [$a$], [渲染区域边长。],
  [$d_"r"$], [在单人游戏中为渲染距离，原版的渲染距离必须为介于2和32之间（含）的整数。在多人游戏中为 #icon(name: "file") `server.properties` 中 `view-distance` 的值。]
)
*对于上述正方形区域内的每一个区块，其加载等级均为31。*

模拟距离主要决定实体更新、计算方块计划刻、流体计划刻，这些计算主要由服务端负责，因此相对于渲染距离而言，它对TPS的影响更大。玩家所在区块的计算等级为
$ L_"s" = max{0, 31-d_"s"} $ <equ:player_simulation_level>
#param-desc(
  prefix: "式中：",
  [$L_"s"$], [计算等级。],
  [$d_"s"$], [模拟距离，原版的模拟距离必须为介于5和32之间（含）的整数。]
)
===== 传送门标签
当有实体在下界传送门或末地传送门中且正在被传送至另一个维度时，游戏将会为目的维度的目标区块赋予传送门标签，加载等级和计算等级均为30，存活时间为300 gt。
===== 末影龙标签
玩家与末影龙发生战斗时会在末地的$[0,0]$区块产生末影龙标签，加载等级和计算等级均为24，存活时间不定，直到末影龙被杀死或与末影龙战斗的玩家数量清零时才撤销该标签。
===== 强制加载标签
命令 `/forceload` 所指定区块的加载等级和计算等级为31，并被添加该标签，这是持久性标签，除非使用命令 `/forceload` 移除标签。参见节@subsec:command_forceload。
===== 末影珍珠标签
当玩家掷出末影珍珠后，该末影珍珠所在区块每39 gt会被赋予该标签，加载等级和计算等级均为31，存活时间40 gt。
===== 临时标签
由游戏代码决定而创建，通常用于计算生物的AI和生成，加载等级一般大于等于32，不设置计算等级。存活时间仅为1 gt。

整理上述信息可得下表：
#general-table(
  caption: "加载标签",
  colspan: 6,
  columns: (auto, auto, auto, auto, auto, auto),
  header: (table.cell(rowspan: 2)[标签类型], table.cell(rowspan: 2)[注册名称], table.cell(colspan: 2)[基础等级], table.cell(rowspan: 2)[存活时间], table.cell(rowspan: 2)[持久化], table.cell(fill: rgb("#ff6565"))[#set text(fill: white, font: "Source Han Sans SC")
  加载等级], table.cell(fill: rgb("#ff6565"))[#set text(fill: white, font: "Source Han Sans SC")
  计算等级]),
  [玩家加载标签], [`player_loading`], [31], [无], table.cell(rowspan: 2)[永久], table.cell(rowspan: 2)[否],
  [玩家计算标签], [`player_simulation`], [无], [$max{0,31-d_"s"}$],
  [传送门标签], [`portal`], table.cell(colspan: 2)[30], [300 gt], [是],
  [末影龙标签], [`dragon`], table.cell(colspan: 2)[24], [永久], [否],
  [强制加载标签], [`forced`], table.cell(colspan: 2)[31], [永久], [是],
  [末影珍珠标签], [`ender_pearl`], table.cell(colspan: 2)[31], [40 gt], [否],
  [临时标签], [`unknown`], [$gt.eq.slant 32$], [无], [40 gt], [否]
)
==== 等级传播
拥有一定加载等级和计算等级的区块可以向周围的8个区块传播加载等级和计算等级，每次传播时等级增加1。加载等级的最大值为45，等级为45的区块会直接从内存中卸载。计算等级的最大值为33，此时若继续向外传播则等级会维持在33。
#figure(
  caption: "等级的传播",
  image("图片/等级的传播.png")
)
根据这种传播规则，假设有一个区块$A$被赋予了加载标签，已知其加载等级或计算等级，在周围没有其他区块具有加载标签的情况下，区块等级的传播使用#proper-noun(display: "切比雪夫距离（Chebyshev distance）", "qie1 bi3 xue3 fu1 ju4 li2")来计算。则区块$B$的等级为
$ L_("z",B) = cases(
  L_("z",A) + d_∞(A,B)& "," &L_("z",A) + d_∞(A,B) lt.eq.slant 44,
  "不存在"& "," &"otherwise"
) $ <equ:load_level>
$ L_("s",B) = min{33,L_("s",A) + d_∞(A,B)} $ <equ:simulation_level>
#param-desc(
  prefix: "式中：",
  [$L_("z",A)$、$L_("z",B)$、$L_("s",A)$、$L_("s",B)$], [下标“z”表示加载等级，“s”表示计算等级，逗号后的字母表示该等级所属的区块。],
  [$x_A$、$x_B$、$z_A$、$z_B$], [区块$A$、$B$分别在$x$、$z$方向上的区块坐标。],
  [$d_∞(A,B)$], [区块$A$、$B$之间的切比雪夫距离，$d_∞(A,B) = max{abs(x_B-x_A),abs(z_B-z_A)}$]
)
若一个区块接受到多个传播等级，则选取等级最低者作为自己的加载（计算）等级。假设一定区域内存在被赋予加载标签的区块1、2、3、……则该区域内任意区块的加载（计算）等级可表示为
$ L_"z" = cases(
  limits(min)_(i gt.eq.slant 1){L_("z",i) + d_∞}& "," &limits(min)_(i gt.eq.slant 1){L_("z",i) + d_∞} lt.eq.slant 44,
  "不存在"& "," &"otherwise"
) $ <equ:chunk_load_level>
$ L_"s" = cases(
  limits(min)_(i gt.eq.slant 1){L_("s",i) + d_∞}& "," &limits(min)_(i gt.eq.slant 1){L_("s",i) + d_∞} lt.eq.slant 44,
  "不存在"& "," &"otherwise"
) $ <equ:chunk_simulation_level>
#param-desc(
  prefix: "式中：",
  [$x$、$z$], [被计算区块的区块坐标。],
  [$x_i$、$z_i$], [区块$i$的区块坐标，$i = 1,2,3...$。],
  [$d_∞$], [被计算区块到区块$i$的切比雪夫距离，$d_∞ = max{abs(x-x_i),abs(z-z_i)}$。]
)
#example(
  [
    @fig:level_propagation_example 展示了一个区域的区块，玩家所在的区块为$P$，此时模拟距离为5，渲染距离为4，判断在区块$A$内能否正常执行命令。
    #figure(
      caption: "",
      image("图片/等级传播例题.png", width: 12em)
    ) <fig:level_propagation_example>
  ],
  [
    显然区块$P$被赋予了玩家标签，已知模拟距离为5，由@equ:player_simulation_level 可得区块$P$的计算等级为26。已知渲染距离为4，由@equ:render_distance 得以区块$P$为中心$9 times 9$区块的加载等级均为31。由等级的传播，该区域的等级如@fig:level_propagation_example_answer 所示。
    #sub-figure(
      caption: "",
      label: <fig:level_propagation_example_answer>,
      [#image("图片/等级传播例题解a：计算等级.png", height: 10em)\(a) 计算等级],
      [#image("图片/等级传播例题解b：加载等级.png", height: 10em)\(b) 加载等级]
    )
    则区块A的计算等级为32，加载等级为33，属于加载边界区块，可以使用命令追踪该区块内的实体。
  ]
)
#example(
  [一玩家所在区块的区块坐标为$[5,12]$，试通过调整渲染距离和模拟距离使区块$[17,-5]$为强加载区块。],
  [
    遇到这种两个区块之间相隔较远不能通过画图直接得到结果的，可先计算两个区块之间的切比雪夫距离$d_∞ = max{abs(17-5),abs(-5-12)} = 17$，要使区块$[17,-5]$为强加载区块，则该区块的加载和计算等级必须均小于等于31，所以渲染距离必须至少为17。设模拟距离为$d_"s"$，则玩家当前区块的计算等级为$max{0, 31-d_"s"}$，切比雪夫距离为17的区块的计算等级$max{0, 31-d_"s"} + 17 lt.eq.slant 31$，得$d_"s" gt.eq.slant 17$。所以渲染距离和模拟距离都应大于17。

  ]
)
==== 闲置超时
若玩家离开某一维度的时间超过300 gt，除非该维度中有其他玩家或有使用 `/forceload` 强制加载的区块，否则该维度会无视区块加载等级而停止方块实体、实体等有关的运算，这种限制被称为#proper-noun(display: "闲置超时（Idle timeout）", "xian2 zhi4 chao1 shi2")。玩家进入或离开维度时均会重制闲置超时。
=== 区块刻#h(1em)随机刻#h(1em)计划刻#h(1em)红石刻
游戏刻的计算过程中还有一些特殊的计算模式。
==== 区块刻
游戏计算区块数据时，以区块为单位进行一次计算，该计算被称为#proper-noun(display: "区块刻（Chunk tick）", "qu1 kuai4 ke4")。区块刻按以下流程计算：
+ 按随机顺序遍历所有满足区块刻条件、加载标签类型为实体计算、水平方向上区块中心距玩家128格以内的区块。
  + 增加区块时间。
  + 如果当前为雷暴，执行雷暴相关逻辑。
  + 在世界边界内执行周期生成。
+ 遍历所有满足区块刻条件的区块。
  + 如果正在降雨，执行雨雪相关逻辑。
  + 执行随机刻。
==== 随机刻
接受到区块刻的区块会随机挑选区块内的一些方块并赋予#proper-noun(display: "随机刻（Random tick）", "sui2 ji1 ke4")，接收到随机刻的方块会进行方块更新，如农作物的生长、藤蔓的蔓延、草方块的蔓延等。随机刻的赋予规则是：每一游戏刻在所有区段内随机挑选若干方块，游戏规则 `random_tick_speed` 可用于指定随机挑选方块的数量（默认为3），每次挑选的方块可以为同一个。

假设 `random_tick_speed` 的值为$m$，则在一个游戏刻内区段内某方块被选中的概率为
$ p_0 &= 1 - "C"_0^m (1 / 16^3)^0 (1 - 1 / 16^3)^m\
&= 1 - (1 - 1 / 16^3)^m $ <equ:random_tick_probability>
显然该方块在$t$gt内获取随机刻是独立的重复伯努利试验，服从参数为$p_0$的几何分布，则第$t$gt得到随机刻的概率为
$ P(X = t) = (1 - p_0)^(t-1) p_0 $ <equ:random_tick_distribution>
则方块接受到随机刻的平均间隔为
$ E(X) = sum_(t-1)^(+∞) X_t P_t = 1 / p_0 = 1 / display(1 - (1 - 1 / 16^3))^m $ <equ:random_tick_mean>
上式结果的单位为游戏刻。若将 `random_tick_speed` 的默认值3代入，且此时游戏刻率为20，可以得到默认的随机刻的平均间隔时间1365.67 gt，合68.28秒。若 `random_tick_speed` 的值为零，有$limits(lim)_(x arrow.r 0) E(X) = +∞$，即永远不会接受到随机刻。在设计方块更新的速率时可参考上述公式。不过，上述公式是在概率论及数理统计的范围内讨论的，并不意味着随机刻平均间隔时间一定是该值，极端情况下可能会出现1 gt或超过1000000 gt的间隔，只能说接受到随机刻这一事件大致服从几何分布。总体上来说，`random_tick_speed` 的值越大，方块更新的频率就越高。
==== 计划刻 \*
一些方块除了会被动接受随机刻，有时还会主动请求在未来某一游戏刻更新方块，这种更新方式被称为#proper-noun(display: "计划刻（Schedule tick）", "ji4 hua4 ke4")，如水的流动、红石中继器的信号变更等。计划刻分为*方块计划刻*和*流体计划刻*，分别控制普通方块和液体的计划更新。方块计划刻会根据优先级按顺序依次执行，优先级一般为非正数，且优先级越小，执行时间越早。流体计划刻则没有优先级。一个游戏刻内最多执行65536个计划刻。超出限制数量的计划刻将延后至下一游戏刻处理。
==== 红石刻
一般而言，大部分红石元件的工作时间以2 gt为基本单位，可令2 gt为1个*红石刻（Redstone tick，简称rt）*#index(display: "红石刻（Redstone tick，rt）", "hong2 shi2 ke4")以方便计算电路的延迟。在TPS等于20的情况下，1 rt等效于0.1秒。不过，红石刻不是真实存在的游戏机制，是仅在红石电路或使用命令方块的命令系统中用于描述延迟的基本单位。
#example(
  [创造一个10秒的延迟至少需要多少红石中继器？],
  [
    10秒钟的延迟即100 rt，一个红石中继器最多可提供4 rt的延迟，至少需要$100 div 4 =25$个红石中继器。

  ]
)
=== 方块
#proper-noun(display: "方块（Block）", "fang1 kuai4")是构成Minecraft的基本单位。一般而言方块是$1 times 1 times 1$大小的实物，部分方块可能有特殊的大小和形状。

*空气*和*液体*是两类特殊的方块。其中空气包括普通空气（命名空间ID `minecraft:air`）、洞穴空气（命名空间ID `minecraft:cave_air`）和虚空空气（命名空间ID `minecraft:void_air`）三种。洞穴空气是生成世界时创建洞穴生成的空气，虚空空气是生成于建造区域以外的空气。这三类空气共同填满了任何未被其他方块占用的空间，因此使用命令移除其他方块是通过在这些方块的位置上放置空气从而实现的。此外，物品形式的空气也广泛存在于物品栏中未被其他物品填充的槽位，使用命令 `/item` 移除物品栏中的物品也是通过在该槽位放置空气从而实现的。

液体是可以自由流动的方块，目前游戏中只有水和熔岩两种液体。液体会扩散，具有深度，该性质用于控制液体最大可扩散的距离。
==== 方块状态
特别地、当指定部分方块时，这些方块很可能拥有变种，比如门的开关状态、小麦的成熟度等，这些变种便是#proper-noun(display: "方块属性（Block property）", "fang1 kuai4 shu3 xing4")。不同方块属性的集合被称为#proper-noun(display: "方块状态（Block states）", "fang1 kuai4 zhuang4 tai4")，相应地，液体的属性集合是#proper-noun(display: "流体状态（Fluid states）", "liu2 ti3 zhuang4 tai4")。方块状态在命名空间ID的基础上进一步定义了一个方块的模型、行为，方块状态是方块本身拥有的性质，是硬编码的。附录@sec:block_state 列举了所有方块及其可用的方块状态。

以Minecraft中的门为例，如果给门的开关状态分别配置一个ID，那门的一个ID就会被拆分成两个。不仅如此，门还有不同的朝向、上半扇和下半扇、门轴的位置、是否被激活这些变种，不同的变种组合在一起的所有结果一共有64种。

可见，如果将这些方块的每一个变种都用单独的命名空间ID来表示则可能会占用更多的内存，也会让原本清晰的命名空间ID变得难以书写、阅读，而使用数字ID附带Damage值的做法在扁平化后已被淘汰了。为此，在指定方块状态的时候，不直接使用命名空间ID，而是在命名空间ID后添加类似键值对的表示方式，格式为：
#codebox("<命名空间>:<ID>[<属性>=<值>,<属性>=<值>,…]")
注意：
+ 括号 `{}` 要紧贴命名空间ID，不能出现空格。
+ 不同的键值对之间用英文逗号 `,` 隔开，最后一个键值对后面不要加逗号。
+ 属性必须是这个方块所拥有的，门没有年龄这个属性，因此无法对门设置年龄这种方块状态。属性可以使用 `Tab` 键补全。
+ 属性的值必须按照Minecraft要求的参数格式填写，比如布尔值、方向或是整型。每个属性都有其需要的参数类型，这些参数类型不尽相同，有些需要布尔值、有些需要方向值。比如，门的 `open` 属性需要布尔值 `true` 或 `false`，像 `east` 这样的方向值是无效的。
例如，一个开启的、朝向为东的铁门可写成如下的形式：
#codebox("minecraft:iron_door[open=true,face=east]")
不定义任何方块状态时，系统会选择这个方块的默认方块状态，铁门的默认方块状态为朝向北、关闭。

#proper-noun(display: "调试棒（Debug stick）", "tiao2 shi4 bang4")可用于快速更改一个方块的方块状态，对方块点击（默认为 `鼠标左键`）可以切换更改的方块状态种类，对方块使用（默认为 `鼠标右键`）可以切换此方块状态的值。
==== 方块实体
#proper-noun(display: "方块实体（Block entity）", "fang1 kuai4 shi2 ti3")是一个很有趣的概念，它将一般被认为相对静态的方块和相对动态的实体结合起来。这样做的意义在于——在方块状态规定的有穷集合的基础上，使方块能够容纳更多数据，并使得方块数据便于编辑、修改。方块实体可以每游戏刻都进行计算，从而提供更好的渲染动画，但同时也可能使得计算量超过游戏刻计算的负载。

例如，告示牌是典型的既有方块实体又有多个方块状态的方块，其方块状态 `Rotation` 决定告示牌为何种朝向（告示牌的朝向只有16种），从而调用相应的模型使告示牌显示出需要的朝向。而告示牌又是一种可以显示文本的方块，显然几个模型无法承载大量各种式样的文本，因此使用方块实体让告示牌能够容纳更多的数据。

和方块状态一样，只有部分方块拥有方块实体。方块实体的数据使用NBT格式，详见节@sec:block_entity。
==== 方块更新 \*
受限于计算机性能，游戏无法每游戏刻都对方块进行计算。只有当方块被放置、破坏、修改，或方块状态产生变化时，该方块会通知其毗邻方块（即上、下、东、南、西、北六个面的邻接方块）进行相应，这种游戏机制被称为#proper-noun(display: "方块更新（Block update）", "fang1 kuai4 geng1 xin1")。使用非 `strict` 模式的命令放置、移除方块时也会产生方块更新。Minecraft有三种类型的方块更新，即PP更新、NC更新和比较器更新。

方块更新一般依照以下的顺序依次计算：调用被替代方块状态的破坏行为$ arrow.r$调用替代方块状态的放置行为$ arrow.r$进行NC更新$ arrow.r$进行比较器更新$ arrow.r$进行PP更新。

方块更新会向外传播，在执行更新的过程中可能在毗邻方块产生新的更新，一直到所有可用的更新都执行完毕，但是在更新无法完全清除的情况下可能会造成游戏崩溃。例如在只有一层沙子的超平坦世界中破坏任意沙子，则方块更新传播会持续进行，并且计算更新的方块数量越来越多，最终会不可避免地造成游戏崩溃。服务端配置文件 #icon(name: "file") `server.properties` 的 `max-chained-neighbor-updates` 一项可用于设置最大的连锁更新数量，超过此值的新增更新将会被忽略。

当一个方块发生变化时，即产生PP更新。对于一个方块上的六个毗邻方块，依次沿$x$、$z$、$y$轴的方向，各方向上先检查负轴方向上的方块，再检查正轴方向上的方块，即按照西、东、北、南、下、上的顺序传播PP更新。PP更新是广泛存在的一种更新类型，包括但不限于附着性方块的掉落、连接性方块的连接判断、重力方块的掉落检测等。

NC更新是一种在红石元件中更常见的更新类型，除了方块放置、修改或移除外，方块实体也可能会产生NC更新。与PP更新不同，除红石线外，NC更新的传播次序是西、东、下、上、北、南；对于红石线则为更新传入方向的后、前、左、右、下、上方。

比较器更新只适用于在放置后可发出模拟信号的方块。
=== 实体
#proper-noun(display: "实体（Entity）", "shi2 ti3")是一个动态的对象，包括*玩家*、*生物*、交通运输工具（所有种类的船和所有种类的矿车）、物品、物品展示框、画、盔甲架、经验球、所有的弹射物、激活的TNT、下落的方块、漂浮的鱼饵、闪电、栓绳结、末影水晶、尖牙和标记等。*实体每游戏刻都会被计算，是技术性开发的主要研究对象。又由于其计算量较大，当已加载区域的实体数量过多，则容易引起掉刻，因此在开发过程中涉及实体计算的部分需要仔细斟酌。*

#proper-noun(display: "判定箱（Hitbox）", "pan4 ding4 xiang1")是规定的方块和实体的边界，用于计算碰撞和选取。所有实体的判定箱都是长方形，无论该实体的外形如何。末影龙比较特殊，它的判定箱是由多个判定箱组合而成的。同方块判定箱一样，实体判定箱也是硬编码的，无法通过命令或数据包修改，但可以通过修改实体属性对其进行放缩。实体判定箱有以下几种类型：#proper-noun(display: "边界箱（Boundary box）", "bian1 jie4 xiang1")是计算实体碰撞、交互事件的区界，可使用快捷键 `F3` + `B` 查看；#proper-noun(display: "视平线（Eye level）", "shi4 ping2 xian4")显示为红色，用于判定窒息和溺水伤害。

Java版原版所有可用的实体可分为若干类别，这些实体的命名空间均为 `minecraft`。下面列举了所有可用的实体：
===== 玩家
===== 生物
#triple-split-table(
  caption: "所有可用生物及其ID",
  original-cols: (auto, auto),
  seperator: (2,),
  header: ([ID], [名称]),
  data: (
    [`allay`], [悦灵],
    [`armadillo`], [犰狳],
    [`armor_stand`], [盔甲架],
    [`axolotl`], [美西螈],
    [`bat`], [蝙蝠],
    [`bee`], [蜜蜂],
    [`blaze`], [烈焰人],
    [`breeze`], [旋风人],
    [`camel`], [骆驼],
    [`cat`], [猫],
    [`cave_spider`], [洞穴蜘蛛],
    [`chicken`], [鸡],
    [`cod`], [鳕鱼],
    [`copper_golem`], [铜傀儡],
    [`cow`], [牛],
    [`creaking`], [嘎吱],
    [`creeper`], [苦力怕],
    [`dolphin`], [海豚],
    [`donkey`], [驴],
    [`drowned`], [溺尸],
    [`elder_guardian`], [远古守卫者],
    [`ender_dragon`], [末影龙],
    [`enderman`], [末影人],
    [`endermite`], [末影螨],
    [`evoker`], [唤魔者],
    [`fox`], [狐狸],
    [`frog`], [青蛙],
    [`ghast`], [恶魂],
    [`giant`], [巨人],
    [`glow_squid`], [发光鱿鱼],
    [`goat`], [山羊],
    [`guardian`], [守卫者],
    [`happy_ghast`], [快乐恶魂],
    [`hoglin`], [疣猪兽],
    [`horse`], [马],
    [`husk`], [尸壳],
    [`illusioner`], [幻术师],
    [`iron_golem`], [铁傀儡],
    [`llama`], [羊驼],
    [`magma_cube`], [岩浆怪],
    [`mannequin`], [玩家模型],
    [`mooshroom`], [哞菇],
    [`mule`], [骡],
    [`nautilus`], [鹦鹉螺],
    [`ocelot`], [豹猫],
    [`panda`], [熊猫],
    [`parrot`], [鹦鹉],
    [`phantom`], [幻翼],
    [`pig`], [猪],
    [`piglin`], [猪灵],
    [`piglin_brute`], [猪灵蛮兵],
    [`pillager`], [掠夺者],
    [`polar_bear`], [北极熊],
    [`pufferfish`], [河豚],
    [`rabbit`], [兔子],
    [`ravager`], [劫掠兽],
    [`salmon`], [鲑鱼],
    [`sheep`], [绵羊],
    [`shulker`], [潜影贝],
    [`silverfish`], [蠹虫],
    [`skeleton`], [骷髅],
    [`skeleton_horse`], [骷髅马],
    [`slime`], [史莱姆],
    [`sniffer`], [嗅探兽],
    [`snow_golem`], [雪傀儡],
    [`spider`], [蜘蛛],
    [`squid`], [鱿鱼],
    [`stray`], [流浪者],
    [`strider`], [炽足兽],
    [`tadpole`], [蝌蚪],
    [`trade_llama`], [行商羊驼],
    [`tropical_fish`], [热带鱼],
    [`turtle`], [海龟],
    [`vex`], [恼鬼],
    [`villager`], [村民],
    [`vindicator`], [卫道士],
    [`wandering_trader`], [流浪商人],
    [`warden`], [监守者],
    [`witch`], [女巫],
    [`wither`], [凋灵],
    [`wither_skeleton`], [凋灵骷髅],
    [`wolf`], [狼],
    [`zombie`], [僵尸],
    [`zombie_horse`], [僵尸马],
    [`zombie_nautilus`], [僵尸鹦鹉螺],
    [`zombified_piglin`], [僵尸猪灵],
    [`zombie_villager`], [僵尸村民],
    [`zoglin`], [僵尸疣猪兽]
  )
)
===== 弹射物
#triple-split-table(
  caption: "所有可用弹射物及其ID",
  original-cols: (auto, auto),
  seperator: (2,5),
  header: ([ID], [名称]),
  data: (
    [`arrow`], [箭],
    [`breeze_wind_charge`], [旋风人风弹],
    [`dragon_fireball`], [末影龙火球],
    [`egg`], [掷出的鸡蛋],
    [`ender_pearl`], [掷出的末影珍珠],
    [`experience_bottle`], [掷出的附魔之瓶],
    [`fireball`], [火球],
    [`firework_rocket`], [烟花火箭],
    [`fishing_bobber`], [浮漂],
    [`llama_spit`], [羊驼唾沫],
    [`potion`], [药水],
    [`shulker_bullet`], [潜影弹],
    [`small_fireball`], [小火球],
    [`snowball`], [雪球],
    [`spectral_arrow`], [光灵箭],
    [`trident`], [三叉戟],
    [`wind_charge`], [风弹],
    [`wither_skull`], [凋灵之首]
  )
)
===== 交通工具
#triple-split-table(
  caption: "所有可用交通工具及其ID",
  original-cols: (auto, auto),
  seperator: (2,5),
  header: ([ID], [名称]),
  data: (
    [`boat`], [船],
    [`chest_boat`], [运输船],
    [`minecart`], [矿车],
    [`chest_minecart`], [运输矿车],
    [`command_block_minecart`], [命令方块矿车],
    [`furnace_minecart`], [动力矿车],
    [`hopper_minecart`], [漏斗矿车],
    [`spawner_minecart`], [刷怪笼矿车],
    [`tnt_minecart`], [TNT矿车]
  )
)
===== 可悬挂实体
这一类实体有物品展示框 `item_display`、荧光物品展示框 `glow_item_frame`、画 `painting`。
===== 技术类实体
这一类实体有标记 `marker`、展示实体和交互实体 `interaction`。其中展示实体分为方块展示实体 `block_display`、物品展示实体 `item_display` 和文本展示实体 `text_display`。
===== 物品 `item`，即掉落物形式的物品，*它是一种实体*。
===== 下落的方块 `falling_block`
===== 被激活的TNT `tnt`
===== 末地水晶 `end_crystal`
===== 区域效果云 `area_effect_cloud`
===== 唤魔者尖牙 `evoker_fangs`
===== 经验球 `experience_orb`
===== 末影之眼 `eye_of_ender`
===== 烟花火箭 `firework_rocket`
===== 栓神结 `leash_knot`
===== 闪电束 `lightning_bolt`
=== 难度#h(1em)游戏模式#h(1em)游戏规则
难度、游戏模式和游戏规则是基本的游戏设置。
==== 难度
#proper-noun(display: "难度（Difficulty）", "nan2 du4")是控制游戏难易程度的选项。游戏中一共有四种难度，难易程度由低到高依次为*和平*、*简单*、*普通*和*困难*。玩家可以在选项中调整游戏难度，也可以通过命令 `/difficulty` 来调整，该命令所需权限等级为2，语法为：#index(index: "command", "difficulty")
#codebox("difficulty [easy|hard|normal|peaceful]")
#param-desc(
  [`[easy|hard|normal|peaceful]` ], [游戏难度，依次为简单、普通、困难、和平，若不指定该参数则视作查询当前游戏难度。]
)
==== 游戏模式
#proper-noun(display: "游戏模式（Game mode）", "you2 xi4 mo2 shi4")是玩家进行游戏的方式，Minecraft一共有四种游戏模式：*生存模式*、*创造模式*、*冒险模式*和*旁观模式*，*注意极限模式是一种世界设置而不是一种游戏模式。*

每一个游戏世界都有其默认的游戏模式，使得新进入世界（服务器）的玩家会使用该默认游戏模式。在创建新世界页面选择的游戏模式是该世界的默认游戏模式，极限模式比较特殊，它使用的默认游戏模式为生存模式。默认游戏模式可以在游戏过程中通过命令 `defaultgamemode` 修改，该命令所需权限等级为2，语法为：#index(index: "command", "defaultgamemode")
#codebox("defaultgamemode <mode>") <code:command_defaultgamemode>
#param-desc(
  [`<mode>`（游戏模式 `minecraft:gamemode`）], [必须为下列值其中一者：`survival`（生存模式）、`creative`（创造模式）、`adventure`（冒险模式）、`spectator`（旁观模式）。]
)
玩家自身的游戏模式不一定必须是世界默认游戏模式，可以由命令 `/gamemode` 修改，该命令所需权限等级为2，语法为：#index(index: "command", "gamemode")
#codebox("gamemode <mode> [<targets>]")
#param-desc(
  [`<mode>`（游戏模式 `minecraft:gamemode`）], [与语法@code:command_defaultgamemode 一致。],
  [`[<targets>]`（实体 `minecraft:entity`）], [可选，指定需要更改游戏模式的玩家，必须为玩家名称、UUID或目标选择器，且目标选择器必须指定玩家。如不指定则更改命令执行者的游戏模式。]
)
当玩家的游戏模式是旁观模式时，他可以手动旁观另一个实体，也可以通过命令 `/spectate` 自动旁观。被旁观的实体不一定必须为玩家。`/spectate` 需要的权限等级为2，语法为：#index(index: "command", "spectate")
#codebox("spectate [<target>] [<player>]")
#param-desc(
  [`<target>`（实体 `minecraft:entity`）], [可选，若填写，则需要是玩家名称、UUID或目标选择器，必须仅指定一个实体。],
  [`<player>`（实体 `minecraft:entity`）], [可选，若填写，则需要是玩家名称、UUID或目标选择器，其中目标选择器必须指定单个玩家。]
)
此处有必要强调：*`<target>` 是被旁观的实体，`<player>` 是执行旁观行为的玩家。*若 `<targets>`、`<player>` 两个参数均不填写，只使用命令 `/spectate`，则取消旁观实体；若 `<targets>`填写而 `<player>` 不使用，则默认执行旁观行为的玩家是命令执行者自身。

*当玩家不是旁观模式时，对该玩家执行 `/spectate` 会执行失败。*这是 `/spectate` 常见的执行失败原因，读者可在自己设计的程序中检查此类原因。
==== 游戏规则
#proper-noun(display: "游戏规则（Game rule）", "you2 xi4 gui1 ze2")是控制游戏玩法的一种手段。Minecraft拥有很多种游戏规则，自25w44a起，游戏规则变为了注册项，被移动到了注册表中，现使用命名空间ID映射这些游戏规则。不同的游戏规则可以设置它们各自的值，不是所有的游戏规则都适用布尔值，一些游戏规则会使用整数，这些整数的可用范围为有符号的32位整数，即$-2147483648$\~ 2147483647（含）。每个游戏规则都会有一个默认值，玩家没有指定它们的值时，便使用这些默认值。
#figure(
  caption: "游戏规则页面",
  image("图片/游戏规则页面.png", width: 28em)
)
在创建游戏世界时，可以通过 `更多`$arrow.r$`游戏规则` 页面修改。自26.1-snapshot-3起，也可以在游戏过程中点击 `世界选项…`$arrow.r$`编辑游戏规则` 手动修改。命令 `/gamerule` 也可用于更改游戏模式，其所需权限等级为2，语法为：#index(index: "command", "gamerule")
#codebox("gamerule <rulename> [<value>]")
#param-desc(
  [`<rulename>` ], [必须为有效的游戏规则。],
  [`[<value>]` ], [可选，必须为该游戏规则的可用值，如不指定则查询该游戏规则的当前值。]
)
所有游戏规则及其可用值如@tab:gamerule 所示，表中所有游戏规则均省略其命名空间前缀 `minecraft`。
#general-table(
  caption: "游戏规则表",
  colspan: 4,
  columns: (auto, auto, auto, auto),
  header: ([游戏规则], [说明], [可用值], [默认值]),
  [`advance_time`], [游戏内时间是否流逝。], [布尔值], [`true`],
  [`advance_weather`], [天气是否更替。], [布尔值], [`true`],
  [`allow_entering_nether_using_portals`], [是否允许实体通过下界传送门进入下界。], [布尔值], [`true`],
  [`block_drops`], [方块被破坏时是否掉落物品和经验球。], [布尔值], [`true`],
  [`block_explosion_drop_decay`], [在床或重生锚的爆炸中，方块是否有概率不会掉落战利品。], [布尔值], [`true`],
  [`command_block_output`], [是否广播命令方块的输出。], [布尔值], [`true`],
  [`command_blocks_work`], [是否启用命令方块。], [布尔值], [`true`],
  [`drowning_damage`], [是否有溺水伤害。], [布尔值], [`true`],
  [`elytra_movement_check`], [是否启用鞘翅移动检测。], [布尔值], [`true`],
  [`ender_pearls_vanish_on_death`], [玩家投掷的末影珍珠是否在玩家死亡时消失。], [布尔值], [`true`],
  [`entity_drops`], [非生物实体是否掉落战利品。], [布尔值], [`true`],
  [`fall_damage`], [是否有掉落伤害。], [布尔值], [`true`],
  [`fire_damage`], [是否有火焰伤害。], [布尔值], [`true`],
  [`fire_spread_radius_around_player`], [以玩家为中心一定范围内火焰可以更新（包括火焰蔓延、熄灭及自然生成）的半径。若为 `0`，则禁用火焰更新；若为 `-1`，则无视玩家位置，所有位置都会进行火焰更新。], [整数], [`128`],
  [`forgive_dead_players`], [是否宽恕死亡玩家。若为 `true`，则愤怒的中立型生物将在其目标玩家于附近死亡后息怒。], [布尔值], [`true`],
  [`freeze_damage`], [是否有冰冻伤害。], [布尔值], [`true`],
  [`global_sound_events`], [特定游戏事件发生时，声音是否可在所有地方听见。], [布尔值], [`true`],
  [`immediate_respawn`], [玩家死亡时是否立即重生。], [布尔值], [`false`],
  [`keep_inventory`], [死亡后是否保留物品栏物品和经验。], [布尔值], [`false`],
  [`lava_source_conversion`], [是否允许流动熔岩转化成熔岩源。], [布尔值], [`false`],
  [`limited_crafting`], [是否需要配方。若启用，玩家只能使用已解锁的配方合成。], [布尔值], [`false`],
  [`locator_bar`], [是否启用玩家定位条。], [布尔值], [`true`],
  [`log_admin_commands`], [是否在日志中记录管理员使用的命令。], [布尔值], [`true`],
  [`max_block_modifications`], [一条命令（如 `/fill` 和 `/clone`）修改方块的数量限制。], [整数], [`32768`],
  [`max_command_forks`], [命令能够执行的最大分支数量。], [整数], [`65536`],
  [`max_command_sequence_length`], [命令连锁执行数量限制，应用于命令方块链和函数。], [整数], [`65536`],
  [`max_entity_cramming`], [实体挤压数量上限。], [整数], [`24`],
  [`max_minecart_speed`], [此游戏规则仅在启用“矿车改进”后可用。控制矿车最大运行速度，单位为格 / 秒。上限为1000。], [整数], [`8`],
  [`max_snow_accumulation_height`], [下雪时地面的雪能够堆积的最大层数。], [整数], [`1`],
  [`mob_drops`], [生物在死亡时是否掉落物品和经验球。], [布尔值], [`true`],
  [`mob_explosion_drop_decay`], [在生物爆炸中，方块是否有概率不会掉落战利品。], [布尔值], [`true`],
  [`mob_griefing`], [是否允许生物破坏性行为。生物破坏性行为包括：生物放置、修改或破坏方块的行为、生物捡起物品、村民繁殖、幻魔者更改绵羊颜色等。], [布尔值], [`true`],
  [`natural_health_regeneration`], [生命值是否自然恢复。], [布尔值], [`true`],
  [`player_movement_check`], [是否启用玩家移动检测。], [布尔值], [`true`],
  [`players_nether_portal_creative_delay`], [创造模式的玩家需要在下界传送门内等待多少游戏刻才能进入另一维度。], [整数], [`0`],
  [`players_nether_portal_default_delay`], [非创造模式的玩家需要在下界传送门内等待多少游戏刻才能进入另一维度。], [整数], [`80`],
  [`players_sleeping_percentage`], [入睡比例：跳过夜晚所需的入睡玩家占比。设为 `0` 时仅需1个玩家入睡即可跳过夜晚。设为大于 `100` 的值会使玩家无法跳过夜晚。], [整数], [`100`],
  [`projectiles_can_break_blocks`], [弹射物能否破坏紫颂花、滴水石锥或饰纹陶罐。], [布尔值], [`true`],
  [`pvp`], [是否启用PVP。], [布尔值], [`true`],
  [`raids`], [是否启用袭击。], [布尔值], [`true`],
  [`random_tick_speed`], [一个游戏刻内随机刻挑选方块的数量。], [整数], [`3`],
  [`reduced_debug_info`], [是否简化调试信息、限制调试屏幕的内容。], [布尔值], [`false`],
  [`respawn_radius`], [重生点半径。], [整数], [`10`],
  [`send_command_feedback`], [是否发送命令反馈。], [布尔值], [`true`],
  [`show_advancement_messages`], [是否在聊天栏中通知进度的达成。], [布尔值], [`true`],
  [`show_death_messages`], [是否显示死亡信息。], [布尔值], [`true`],
  [`spawn_mobs`], [是否自然生成生物，一些实体可能有其特定的规则，如刷怪笼、命令 `/summon` 生成的生物不受此影响。], [布尔值], [`true`],
  [`spawn_monsters`], [是否自然生成敌对生物。], [布尔值], [`true`],
  [`spawn_patrols`], [是否生成灾厄巡逻队。], [布尔值], [`true`],
  [`spawn_phantoms`], [是否生成幻翼。], [布尔值], [`true`],
  [`spawn_wandering_traders`], [是否生成流浪商人。], [布尔值], [`true`],
  [`spawn_wardens`], [是否生成监守者。], [布尔值], [`true`],
  [`spawner_blocks_work`], [刷怪笼和试炼刷怪笼是否运作。], [布尔值], [`true`],
  [`spectators_generate_chunks`], [是否允许旁观模式的玩家生成区块。], [布尔值], [`true`],
  [`spread_vines`], [藤蔓是否蔓延。], [布尔值], [`true`],
  [`tnt_explodes`], [TNT是否可被激活并爆炸], [布尔值], [`true`],
  [`tnt_explosion_drop_decay`], [在TNT爆炸中，方块是否有概率不会掉落战利品。], [布尔值], [`false`],
  [`universal_anger`], [是否启用无差别愤怒，若值为 `true`，愤怒的中立型生物将攻击附近所有的玩家，而不限于激怒它们的玩家。], [布尔值], [`false`],
  [`water_source_conversion`], [是否允许流动水转化成水源。], [布尔值], [`true`]
) <tab:gamerule>
== 服务器管理
专用服务器是在Minecraft中实现多人游戏的一种手段。玩家们可以连接服务器游玩各种小游戏，体验SMP、PVP或各种自定义多人游戏地图，极大地提高了Minecraft的可玩性。篇幅有限，本教程并不提供服务器的架设方法，仅提供服务器配置以及能够在服务器上使用的命令的解释，供服务器管理人员参考。
=== server.properties \*
#icon(name: "file") `server.properties`，即*服务端配置文件*，文件中一个配置属性占据一行，每一行的格式为：
#codebox("<属性>=<值>")
例如：
#codebox("gamemode=survival")
#codebox("enable-command-block=false")
下表列举了所有可用的属性：
#general-table(
  caption: [ #icon(name: "file") `server.properties` 可用属性表],
  colspan: 4,
  columns: (auto, auto, auto, auto),
  header: ([属性], [值类型], [默认值], [描述]),
  [`accepts-transfers`], [布尔值], [`false`], [服务器是否接受以Transfers封包作为登录请求的传入连接。若为 `true`，则在其他服务器中使用命令 `/tranfer` 能将玩家转移至该服务器。],
  [`allow-flight`], [布尔值], [`false`], [是否允许玩家在安装添加飞行功能的Mods前提下在生存模式下飞行。],
  [`broadcast-console-to-ops`], [布尔值], [`true`], [是否向所有在线管理员发送命令执行输出。],
  [`broadcast-rcon-to-ops`], [布尔值], [`true`], [是否向所有在线管理员发送RCON命令执行输出。],
  [`difficulty`], [字符串], [`easy`], [游戏的难度，可用值：`peaceful`（和平）、`easy`（简单）、`normal`（普通）、`hard`（困难）。],
  [`enable-jmx-monitoring`], [布尔值], [`false`], [是否暴露一个具有对象名 `net.minecraft.server:type=Server` 的MBean和两个属性 `averageTickTime` 和 `tickTimes` 用于暴露以毫秒为单位的tick时间。],
  [`enable-query`], [布尔值], [`false`], [是否允许使用GameSpy4协议的服务器监听器。],
  [`enable-rcon`], [布尔值], [`false`], [是否允许远程访问服务器控制台（RCON）。],
  [`enable-status`], [布尔值], [`true`], [是否使服务器在服务器列表中显示为在线。],
  [`enforce-secure-profile`], [布尔值], [`true`], [是否要求进入服务器的玩家必须具有Mojang签名的公钥。],
  [`enforce-whitelist`], [布尔值], [`false`], [是否强制启用白名单。],
  [`entity-broadcast-range-percentage`], [整数], [`100`], [控制实体需要距离玩家有多近才会将封包发送给客户端。值越高，则实体可以在更远的地方被渲染。可用值为 `10` \~ `1000`（含）。],
  [`force-gamemode`], [布尔值], [`false`], [是否强制玩家加入时为默认游戏模式。],
  [`function-permission-level`], [整数], [`2`], [设置函数的权限等级，可用值为`1` \~ `4`（含）。],
  [`gamemode`], [字符串], [`survival`], [设置默认游戏模式，可用值：`survival`（生存模式）、`creative`（创造模式）、`adventure`（冒险模式）、`spectator`（旁观模式）。],
  [`generate-structures`], [布尔值], [`true`], [是否在未生成的区块中生成结构。],
  [`generator-settings`], [字符串], [`{}`], [定义自定义世界的生成。],
  [`hardcore`], [布尔值], [`false`], [是否使用极限模式进行游戏。],
  [`hide-online-players`], [布尔值], [`false`], [是否在响应客户端状态请求时不返回在线玩家列表。值为 `true` 时不返回。],
  [`initial-disabled-packs`], [字符串], [无], [设置在创建世界过程中需要禁用的数据包名称，存在多个数据包时用逗号分隔。],
  [`initial-enabled-packs`], [字符串], [`vanilla`], [设置在创建世界过程中需要启用用的数据包名称，存在多个数据包时用逗号分隔。],
  [`level-name`], [字符串], [`world`], [设置该游戏世界的自定义名称及文件夹名。],
  [`level-seed`], [字符串], [无], [该游戏世界的种子。],
  [`level-type`], [字符串], [`minecraft:normal`], [定义使用的世界预设ID，以命名空间ID表示，冒号 `:` 前需要加 `\` 以转义。原版世界预设可省略命名空间。],
  [`log-ips`], [布尔值], [`true`], [定义是否当新玩家加入游戏时在服务器日志中记录其IP地址。],
  [`management-server-allowed-origins`], [字符串], [无], [在使用浏览器WebSocket API的情况下，服务端管理协议允许连入的来源，以 `,` 分割，且不允许有前后空格。],
  [`management-server-enabled`], [布尔值], [`false`], [是否启用Minecraft服务器管理协议。],
  [`management-server-host`], [字符串], [`localhost`], [服务端管理协议绑定的主机名。],
  [`management-server-port`], [整数], [`0`], [服务端管理协议监听的窗口，若为 `0`，则绑定当前未被绑定的可绑定窗口。],
  [`management-server-secret`], [字符串], [随机], [用于认证的令牌，必须为一个长度为40且仅包含大写字母、小写字母和数字。],
  [`management-server-tls-enabled`], [布尔值], [`true`], [是否启用TLS。],
  [`management-server-tls-keystore`], [字符串], [无], [保存服务端用于TLS的私钥和证书的KeyStore。],
  [`management-server-tls-keystore-password`], [字符串], [无], [KeyStore的密码。],
  [`max-chained-neighbor-updates`], [整数], [`1000000`], [限制连锁NC更新的数量，超过此数量的连锁NC更新会被跳过。],
  [`max-players`], [整数], [`20`], [设置服务器同时能容纳的最大玩家数量。可用值 `0` \~ `2147483647`（含）。],
  [`max-tick-time`], [整数], [`60000`], [设置每个tick花费的最大毫秒数。可用值 `0` \~ $2^63-1$（含）],
  [`max-world-size`], [整数], [`29999984`], [设置世界边界最大可用半径。可用值 `1` \~ `29999984`（含）。],
  [`motd`], [字符串], [`A Minecraft Server`], [玩家客户端的多人游戏服务器列表中显示的服务器信息。],
  [`network-compression-threshold`], [整数], [`256`], [若值为$n$，则允许$n-1$字节的封包正常发送, 如果封包为$n$字节或更大时会进行压缩。`-1` 代表完全禁用封包压缩，`0` 代表压缩全部封包。],
  [`online-mode`], [布尔值], [`true`], [是否让服务器对比Minecraft账户数据库验证登录信息，为 `true` 时只允许正版玩家进入。],
  [`op-permission-level`], [整数], [`4`], [设定使用 `/op` 命令时管理员的权限等级，可用值 `1` \~ `4`（含）。],
  [`pause-when-empty-seconds`], [整数], [`60`], [服务器在没有玩家在线后多少秒暂停。],
  [`player-idle-timeout`], [整数], [`0`], [设置玩家可空闲不被提出服务器的最大时间（单位为分钟），为 `0` 时不踢出。],
  [`prevent-proxy-connections`], [布尔值], [`false`], [是否允许玩家使用虚拟专用网络或代理。],
  [`query.port`], [整数], [`25565`], [设置监听服务器的端口号，可用值 `1` \~ `65534`（含）。],
  [`rate-limit`], [整数], [`0`], [设置玩家被踢出服务器前可发送的封包数量，设为 `0` 表示不发送。],
  [`rcon.password`], [字符串], [无], [RCON远程访问的密码。],
  [`rcon.port`], [整数], [`25575`], [RCON远程访问的端口号，可用值 `1` \~ `65534`（含）。],
  [`region-file-compression`], [字符串], [`deflate`], [设置区域文件压缩算法，可用值：`deflate`（Deflate算法）、`lz4`（LZ4算法）、`none`（不压缩）。],
  [`require-resource-pack`], [布尔值], [`false`], [是否对玩家强制启用服务器资源包。],
  [`resource-pack`], [字符串], [无], [可选，指向一个资源包的URI，玩家可选择是否使用该资源包。值中的 `:` 和 `/` 前必须有 `\` 作为转义。],
  [`resource-pack-id`], [UUID], [无], [可选，`resource-pack` 指定的资源包的UUID。],
  [`resource-pack-prompt`], [字符串], [无], [可选，使用 `require-resource-pack` 时在资源包提示界面显示自定义信息。],
  [`resource-pack-sha1`], [字符串], [无], [资源包的SHA-1值，必须为小写十六进制。],
  [`server-ip`], [字符串], [无], [将服务器与特定IP绑定。],
  [`server-port`], [整数], [`25565`], [服务器监听端口号，可用值 `1` \~ `65534`（含）。],
  [`simulation-distance`], [整数], [`10`], [模拟距离，可用值`3` \~ `32`（含）。],
  [`spawn-protection`], [整数], [`16`], [设该值为$x$，则以出生点所在方块为中心边长为$2x+1$的正方形区域内存在出生点保护。若值为 `0` 则禁用出生点保护。],
  [`status-heartbeat-interval`], [整数], [`0`], [控制管理服务器向已连接的客户端发送心跳通知的间隔，单位为秒。若为 `0`，则禁用此功能。],
  [`sync-chunk-writes`], [布尔值], [`true`], [是否使区块文件以同步模式写入。],
  [`text-filtering-config`], [字符串], [无], [服务器中需要被屏蔽的文本。],
  [`text-filtering-version`], [整数], [`0`], [服务器中需要被屏蔽文本格式的版本。],
  [`use-native-transport`], [布尔值], [`true`], [是否使用针对Linux平台的封包收发优化。],
  [`view-distance`], [整数], [`10`], [渲染距离，可用值`3` \~ `32`（含）。],
  [`white-list`], [布尔值], [`false`], [是否启用白名单。]
) <tab:server_properties>
=== 仅在多人游戏可用命令
本小节讲述的一系列命令是对服务器管理有用的一类命令，仅能在多人游戏中使用。由于它们的权限等级均大于2，因此在命令方块上无法运行这些命令。如果 #icon(name: "file") `server.properties` 中的 `function-permission-level` 没有设为足够的权限等级，那么数据包函数也是不能执行这些命令的。
==== 用于封禁玩家与设置黑名单的命令
===== 命令 `/ban` #index(index: "command", "ban")
#codebox("ban <targets> [reason]") <code:command_ban>
该命令用于封禁特定的玩家，并将其加入黑名单。加入黑名单的玩家将不被允许进入服务器。该命令所需权限等级为3。
#param-desc(
  [`<targets>`（游戏档案 `minecraft:game_profile`）], [需要是玩家名称或UUID，无论玩家是否在线。成功后，拥有该名称的所有玩家都无法进入该服务器。],
  [`[reason]`（文本 `minecraft:message`）], [可选，是一个贪婪词组，接受含空格的字符串。用于表示封禁的理由。可记录于服务器日志中。]
)
===== 命令 `/ban-ip` #index(index: "command", "ban-ip")
#codebox("ban-ip <target> [reason]") <code:command_ban-ip>
该命令主要是针对IP地址的封禁，并将此IP地址列入黑名单，但也可以支持对玩家名称的封禁（不能是UUID），成功后所有由被封IP进入服务器的玩家都不被允许。该命令所需权限等级为3。
#param-desc(
  [`<target>`（字符串 `brigadier:string`）], [需要被封禁的IP地址或玩家名称。]
)
===== 命令 `/banlist` #index(index: "command", "banlist")
#codebox("banlist (ips|players)")
该命令可供查询被封禁的IP地址或玩家，所需权限等级为3。
#param-desc(
  [`(ips|players)` ], [在 `ips` 和 `players` 中任选其一，表示需要查询的内容为处在黑名单中的IP地址或玩家。]
)
==== 设置玩家解封的命令
===== 命令 `/pardon` #index(index: "command", "pardon")
#codebox("pardon <targets>")
该命令用于解封特定的玩家，并将该玩家从黑名单中移除。该命令所需权限等级为3。
===== 命令 `/pardon-ip` #index(index: "command", "pardon-ip")
#codebox("pardon-ip <target>")
该命令用于解封特定的IP地址，并将该IP地址从黑名单中移除。该命令所需权限等级为3。
==== 白名单
黑名单制度通常用于管理开放类型的服务器，并对个别不遵守服务器规则的玩家实施单独的封禁，其他玩家依旧可以自由进出服务器。而白名单制度常见于一些私人服务器，仅针对特定的玩家开放，这样可以最大限度地防止外来人员对服务器造成破坏。命令 `/whitelist` 是专门针对白名单的命令，该命令所需权限等级为3，它有以下几种语法：#index(index: "command", "whitelist")
===== 添加玩家至白名单
#codebox("whitelist add <targets>")
===== 查询在白名单上的玩家
#codebox("whitelist list")
===== 关闭白名单
#codebox("whitelist off")
===== 开启白名单
#codebox("whitelist on")
===== 重新加载白名单
#codebox("whitelist reload")
===== 将玩家从白名单上移除
#codebox("whitelist remove <targets>")
==== 管理员命令
===== 命令 `/op` #index(index: "command", "op")
用于给予玩家管理员权限。该命令所需权限等级为3，语法为：
#codebox("op <targets>")
此管理员权限等级由 #icon(name: "file") `server.properties` 中的 `op-permission-level` 决定，详见@tab:server_properties。
===== 命令 `/deop` #index(index: "command", "deop")
剥夺玩家的管理员权限。该命令所需权限等级为3，语法为：
#codebox("deop <targets>")
==== 用于设置玩家在服务器中最长挂机时间的命令 `/setidletimeout` #index(index: "command", "setidletimeout")
该命令所需权限等级为3，语法为：
#codebox("setidletimeout <minutes>")
#param-desc(
  [`<minutes>`（整型 `brigadier:integer`）], [单位是分钟不是而不是游戏刻，可用范围$[0,214748364]$。]
)
==== 服务器保存相关的命令
以下命令所需权限等级均为4。
===== 命令 `/save-all`：将服务器手动保存至硬盘。 #index(index: "command", "save-all")
#codebox("save-all [flush]")
#param-desc(
  [`[flush]`], [可选字面量，若填入该字面量，则服务器会立即保存所有的区块数据，并造成服务器临时冻结。]
)
===== 命令 `/save-off`：关闭自动保存服务器，无附加参数。 #index(index: "command", "save-off")
#codebox("save-off")
===== 命令 `/save-on`：开启自动保存服务器，无附加参数。 #index(index: "command", "save-on")
#codebox("save-on")
==== 用于关闭服务器的命令 `/stop`
该命令所需权限等级均为4，语法为：#index(index: "command", "stop")
#codebox("stop")
==== 将玩家从一个服务器转移至另一服务器的命令 `/transfer` #index(index: "command", "transfer")
此命令仅会发出请求，实际能否转移成功取决于目的服务器 #icon(name: "file") `server.properties` 中的 `accepts-transfers` 配置，详见@tab:server_properties。`/transfer` 的语法为：
#codebox("transfer <hostname> [<port>] [<players>]")
#param-desc(
  [`<hostname>`（字符串 `brigadier:string`）], [目的服务器的主机名。],
  [`[<port>]`（整型 `brigadier:integer`）], [可选，目的服务器端口号，若不指定则为 `25565`。],
  [`[<players>]`（实体 `minecraft:entity`）], [可选，被转移的玩家，必须为玩家名、目标选择器或UUID。若不指定则默认为命令执行者。]
)
==== 命令 `/perf`
它用于记录服务器游戏刻执行时长和占用的堆内存大小等性能指标，并将结果保存于游戏文件 #icon(name: "zip") `.minecraft\debug\profiling\<时间戳>.zip`。命令 `perf start` 即开始长达10秒的性能分析，`perf stop` 可以在10秒之前结束性能分析。此命令需要权限等级4。#index(index: "command", "perf")
#codebox("perf (start|stop)")
由于它仅在专用服务器上使用，在单人游戏中可以用 `F3` + `L` 代替它的性能分析功能。 
=== 其他与服务器相关的命令
==== 命令 `/kick`
将玩家踢出服务器，注意只是踢出，如果不加封禁，该玩家还可以继续加入服务器。事实上，该命令不仅在多人游戏中可用，在单人游戏中同样可用。该命令所需权限等级为3，语法为：#index(index: "command", "kick")
#codebox("kick <targets> [reason]")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [指定提出服务器的玩家，必须为玩家名、目标选择器或UUID。],
  [`[reason]`（文本 `minecraft:message`）], [可选，格式与语法@code:command_ban、@code:command_ban-ip 一致。]
)
==== 命令 `/list`
该命令用于列出服务器中的所有玩家，在单人游戏中同样可用，所需权限等级为0，语法为：#index(index: "command", "list")
#codebox("list [uuids]")
#param-desc(
  [`[uuids]` ], [可选，如果加了会让玩家的名称和UUID一起显示。]
)
#heading(level: 2, numbering: none, [第一章思考题与习题])
+ 判断下列说法是否正确。
  + 所有的仅适用于多人游戏的命令都需要大于2的权限等级。
  + 在聊天栏中可输入的命令字符数小于命令方块的最大字符数。
  + 在创建世界时关闭作弊意味着所有命令在这个存档中均不可用。
  + 生存模式的玩家在开启作弊的存档中无法打开命令方块，也无法使用命令。
+ 列举出所有在不允许作弊的单人游戏中可使用的命令。
+ 列举出所有无法在命令方块中运行的命令。
+ 查阅相关资料，填写下列游戏资源的命名空间ID：

  例：石头—— `minecraft:stone`

  羊毛、旗帜、唱片、红砂岩台阶、火把、雪块、红石中继器、煤炭、岩浆块、树叶、海晶石、末地石砖。
+ 查阅相关资料，填写下列方块的所有属性以及各自的可用值。

  例：铁砧——方块状态 `facing`，可用值 `north`、`south`、`east`、`west`。

  织布机、树叶、漏斗、讲台、砂轮、南瓜灯、原木、下界疣、梯子、虞美人、红石粉、雪、水、唱片机、可可果、灯笼、树苗、甘蔗、织布机、干草块、玻璃板	、堆肥桶、紫颂花。
+ 在TPS为20的情况下，将下列时间单位进行换算（不考虑命令中的取整）：
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    row-gutter: 0.8em,
    [2 s$=$#blank d], [18 t$=$#blank s], [0.25 d$=$#blank s], [0.8 d$=$#blank t],
    [1.2 s$=$#blank t], [360 t$=$#blank d]
  )
+ 解释下列名词：

  命令、命令历史、权限等级、命令执行者、命名空间、方块状态、数据值、扁平化、MSPT、强加载区块、物理服务端。
+ 在游戏刻频率为40的情况下，由调试屏幕查阅得到MSPT值为20，则此时TPS值为何？若MSPT值为100，则TPS值又为何？
+ 能进行方块更新的区块可以正常运行命令这一说法是否正确？反之，可以正常运行命令的区块是否一定能进行方块更新？
+ 游戏中发生掉帧的原因可能有哪些？
+ 假如一个玩家在某服务器中发现画面很流畅，而实体完全不移动，可能的原因是什么？
+ 判断下列命名空间ID的解析结果。
  + `minecraft`
  + `custom`
  + `minecraft:custom`
  + `custom:minecraft`
  + `minecraft:custom/custom`
  + `custom:minecraft/custom`
  + `minecraft/custom:custom`
  + `minecraft:custom:custom`
+ \*尝试列举命令 `/tick` 在解析中出现的所有节点。
+ 已知一个玩家位于区块$[17,39]$，渲染距离为17，模拟距离为15，则区块$[10,20]$的加载等级和计算等级分别为多少？
+ 当渲染距离为16时，以玩家为中心的强加载区块个数为#blank，弱加载区块个数为#blank。
+ 将以下树状形式的数据写为JSON。
  #tree(
    (0, [#icon(name: "json-object") 文件封装]),
    (1, [#icon(name: "json-string") *condition*: `minecraft:entity_properties`]),
    (1, [#icon(name: "json-string") *entity*: `this`]),
    (1, [#icon(name: "json-object") *predicate*]),
    (2, [#icon(name: "json-string") *type*: `minecraft:player`]),
    (2, [#icon(name: "json-object") *flags*]),
    (3, [#icon(name: "json-bool") *is\_{}sprinting*: `true`])
  )
+ 若一个字符串类型的JSON字段 #icon(name: "json-string") `text` 需要的值分别如下所示，写出各自对应的字段。
  + `分节符"\"的作用很大`
  + `\\"Hello World!\\"`
  + `JSON形式的文本组件为{"text":"\\Hello World!\\"}`
  + `在SNBT中，反斜杠\直接使用反斜杠\转义即可，即\\`
+ \*什么是 `.txt` 文件？#icon(name: "folder") `.minecraft`文件夹中有哪些文件是以 `.txt` 的格式存在的？
+ \*任意列举10个需要使用JSON格式的文件。
+ \*如何在#icon(name: "folder") `assets` 文件夹中寻找村民悠闲时的声音文件？
+ \*若一份完整的 `debug` 文件内容如下所示，则该函数中能够成功执行的命令有多少条？
  #codefile(
    lang: "txt",
    title: "debug-trace-2024-10-19_15.19.03.txt",
    "the_backrooms:developer/temp
  [F] the_backrooms:developer/temp size=15
    [C] tag @s remove evidence_1
      [E] 对象没有这个标签                [M] 对象没有这个标签
    [C] tag @s remove gaming
      [E] 对象没有这个标签                [M] 对象没有这个标签
    [C] data remove storage the_backrooms:player data
      [E] 无变化，所指定的属性已有这些值                [M] 无变化，所指定的属性已有这些值
    [C] execute in the_frontrooms:main store result score #forceload bug_test run forceload add -1 -1 0 0
      [M] 已将the_frontrooms:main中的[-1, -1]至[0, 0]间的4个区块标记为强制加载
    [R = 4] execute in the_frontrooms:main store result score #forceload bug_test run forceload add -1 -1 0 0
    [C] tellraw @a {\"score\":{\"name\":\"#forceload\",\"objective\":\"bug_test\"}} -> 1
    [C] execute in the_frontrooms:main if dimension the_frontrooms:main run say 该命令在前厅内执行 -> 1
    [C] execute in the_frontrooms:main positioned 0 0 0 store result score #decorations bug_test if entity @e[tag=decorations]
      [E] 测试失败                [M] 测试失败
    [C] tellraw @a {\"score\":{\"name\":\"#decorations\",\"objective\":\"bug_test\"}} -> 1
    [C] execute in the_frontrooms:main positioned 0 0 0 store result score #decorations bug_test run kill @e[tag=decorations]
      [E] 未找到实体                [M] 未找到实体
    [C] tellraw @a {\"score\":{\"name\":\"#decorations\",\"objective\":\"bug_test\"}} -> 1
    [C] execute in the_frontrooms:main positioned 0 0 0 store result score #decorations bug_test if entity @e[type=painting]
      [E] 测试失败                [M] 测试失败
    [C] tellraw @a {\"score\":{\"name\":\"#paintings\",\"objective\":\"bug_test\"}} -> 1
    [C] execute in the_frontrooms:main positioned 0 0 0 store result score #paintings bug_test run kill @e[type=painting]
      [E] 未找到实体                [M] 未找到实体
    [C] tellraw @a {\"score\":{\"name\":\"#paintings\",\"objective\":\"bug_test\"}} -> 1
    [C] execute in the_frontrooms:main run forceload remove all
      [M] 已解除标记the_frontrooms:main内所有的强制加载区块
    [R = 0] execute in the_frontrooms:main run forceload remove all"
  )
+ 解释下列名词：数据包、实验性设置、安全模式错误、元数据、数据包标签。
+ 编写一个数据包的元数据，使得此数据包能支持从45到100.0的数据版本。
+ 编写一个资源包的元数据，使得此资源包能支持从20到80.0的数据版本。
+ 列举出在数据包内所有不使用 `.json` 格式的数据项类型。
+ 尝试覆盖原版数据包中定义的 `#base_stone_overworld` 方块标签，使其仅引用石头（`stone`）、深板岩（`deepslate`）两种方块。
= 坐标
Minecraft的游戏世界是三维的。在编写数据包的时候，有时需要确定实例所需的位置参数。这样的参数被称为#proper-noun(display:"坐标（Coordinate）","zuo biao")。本章将详细介绍各种坐标参数以及这些参数在命令上的应用。
#pagebreak()
== 坐标系与坐标
Minecraft使用的空间直角坐标系是右手坐标系。在这种空间直角坐标系中，$x$轴和$z$轴所反映的是水平方向上的位置，$y$轴所反映的是垂直方向上的位置。其中，*$x$轴的正方向指向正东，而$z$轴的正方向指向正南*。
#figure(
  caption: [适用于Minecraft的空间直角坐标系],
  image("图片/适用于Minecraft的空间直角坐标系.png"),
)
在命令参数中，可以用三个分量来表示某一点的位置，这是一个有序的实数三元组：
#codebox("<x> <y> <z>")
比如，用数学方法表示的点$(0,4,4)$在一些命令参数中直接表示为 `0 4 4`。

#example(
  [
    空间直角坐标系中有两个点$A(124.5,76,−64.29)$、$B(−10.003,80,−33.33)$，则$B$点在水平位置上位于$A$点的什么方向？
  ],
  [
    $B$点$x$坐标位于$A$点$x$坐标的负方向，因此$B$点在东西方向上位于$A$点的西方；$B$点$z$坐标位于$A$点$z$坐标的正方向，因此$B$点在东西方向上位于$A$点的南方。综上所述，$B$点位于$A$点的西南方向。

  ]
)

虽然不同的坐标表示方式基本一致，但不同的命令作用的对象不同，其坐标参数类型也不完全一致，下文将梳理命令系统使用的所有种类的坐标参数。

=== 坐标的命令参数类型
命令使用4种与坐标相关的参数类型：方块坐标 `minecraft:block_pos`、三维坐标 `minecraft:vec3`、平面方块坐标 `minecraft:column_pos` 和二维坐标 `minecraft:vec2`。它们的关系和应用场景可以很清晰地列于下表：
#general-table(
  caption: [Minecraft中的坐标参数],
  columns: 3,
  colspan: 3,
  header: ([], [一般应用于方块], [一般应用于非方块的游戏内容]),
  [三维], [`minecraft:block_pos`], [`minecraft:vec3`],[二维], [`minecraft:column_pos`], [`minecraft:vec2`]
)

==== 方块坐标
坐标表示的是一个没有体积的点，而方块是有体积的，因此需要给方块规定一个基准点，用这个基准点的坐标来表示该对象的坐标。

Minecraft规定：大部分方块的长、宽和高均为1米，体积为1立方米。用坐标系表示这些位置时，默认了方块的边长和坐标系的单位长度在数值上相等，这意味着坐标系的基本单位为米，或称为“格”。

一个方块使用其*西北下角*的点作为它的#proper-noun(display:"方块坐标（Block position）","fangkuaizuobiao")。若一个方块的西北下角顶点坐标为$(x,y,z)$，则该方块的方块坐标记为$(x,y,z)$，而这个方块位于$(x,y,z)$和$(x+1,y+1,z+1)$这两个坐标围成的立体几何图形之间。
#figure(
  caption: [用方块这个方向的顶点来表示方块坐标],
  image("图片/用方块这个方向的顶点来表示方块坐标.png", width: 35%)
)
由于方块的角总是位于整数坐标点，作为命令参数 `minecraft:block_pos` 的方块坐标一定是由三个整数构成的有序三元组。
#example(
  [
    如图所示，方块坐标为`0 0 0`的方块为哪一个？
    #figure(caption: "", image("图片/方块坐标例题.png", width: 30%))
  ],
  [
    方块坐标严格按照西北下角顶点来计算，而正西、正北分别是$x$轴和$z$轴的负方向，因此用方块坐标指示的方块位置，永远位于实际坐标的东南方向，且在垂直方向上位于上方，在空间直角坐标系中的反映即为$x$、$y$、$z$三个坐标轴的正方向。因此方块坐标为`0 0 0`的方块位于第一卦限，即方块$A$。

  ]
)
==== 三维坐标
#proper-noun(display:"三维坐标（Three-dimensional coordinates）","sanweizuobiao")是精确表示一个位置的坐标参数，命令参数类型为 `minecraft:vec3`，用于表示坐标位置的三个元素均为双精度浮点数。三维坐标一般应用于实体，它也可能会在粒子生成和声音播放的时候被使用。例如，这是一个合法的三维坐标：
#codebox("5.0 56.0 17.0")
#h(-2em)这个坐标带有小数点，因为三维坐标的三个参数均是双精度浮点数。但是，这并不意味着三维坐标只能使用浮点数。也可以在三维坐标中使用整数形式，如：
#codebox("5 56 17")
注意，上述这两个坐标描述的位置并不是一致的。在实际操作中，可以发现参数 `5 56 17` 指定的坐标实际上是$(5.5,56.0,17.5)$，这个现象在 `/tp`、`/summon` 等命令使用的坐标参数中都可以观察到。如图，可以观察到$x$坐标和$z$坐标都发生了“偏移”，与实际坐标有所出入，而$y$坐标不受影响。
#figure(
  caption: [整数坐标发生的“偏移”],
  image("图片/整数坐标发生的“偏移”.png", width: 36em)
)
这些位置的偏移都位于相对方块两条对边的中心线上，这是因为三维坐标使用了#proper-noun(display:"中心校准（Center correct）","zhongxinjiaozhun")，即使用整数形式的三维坐标，当其某一个坐标参数为$n$（$n∈Z$）时，其实际坐标为$n−0.5$，这样可以与方块的位置相适应。注意*中心校准仅适用于$x$坐标和$z$坐标。$y$坐标严格使用实际坐标*。

注意这里不使用“三维坐标根据方块坐标位于方块中心”的说法，是因为三维坐标的三个参数中整数和浮点数形式可以混用，并且使用小数形式的参数严格遵循实际坐标，整数形式的参数则使用中心校准。比如，位于 `5 56 17.0` 的玩家实际位于$(5.5,56,17.0)$。
==== 平面方块坐标
故名思义，平面方块坐标 `minecraft:column_pos` 就是二维的方块坐标，以西北角的二维坐标作为一个方块纵列的平面坐标，两个元素均为整数。
==== 二维坐标
即只由$x$坐标和$z$坐标构成的#proper-noun(display:"二维坐标（Three-dimensional coordinates）","erweizuobiao")。二维坐标的命令参数类型为 `minecraft:vec2`，两个元素均为双精度浮点数。二维坐标若为整数，则也使用中心校准。
=== 相对坐标#h(1em)局部坐标
==== 相对坐标
世界坐标是以空间直角坐标系为基准的、固定的坐标体系，每一个位置都有其固定的坐标。在表示这些坐标的时候，有时候需要确定“相对位置”，即抛开固有的以原点为基准的坐标系，使用“相对偏移量”来表达一个位置相对于另一个位置的坐标，即下文所要介绍的#proper-noun(display:"相对坐标（Relative world coordinates）", "xiang1 dui4 zuo4 biao1")。与之相对的固定空间直角坐标系坐标被称为#proper-noun(display:"绝对坐标（Absolute world coordinates）", "jue2 dui4 zuo4 biao1")。

在相对坐标系中，必须要确定一个原点，这个原点通常是命令执行位置。如果命令由玩家执行，则原点为玩家所在的位置；如果命令由命令方块执行，则原点为该命令方块所在的位置。相对坐标用波浪号 `~` 和相对偏移量表示，即
#codebox("~[<dx>] ~[<dy>] ~[<dz>]")
若相对偏移量 `[<dx>]`、`[<dy>]`、`[<dz>]` 不填写，则偏移量为0。偏移量可以为负数。这就相当于建立了一个以命令执行位置为原点的空间直角坐标系，一个世界中可以存在多个不同的相对坐标系，只要这些坐标都有特定的执行位置。例如，相对于该点正东面的3格距离可以表示为 `~3 ~ ~`。
#figure(
  caption: "在绝对坐标系中建立的相对坐标系",
  image("图片/在绝对坐标系中建立的相对坐标系.png", width: 15em)
)
#example(
  [一个位于点$(-24,55,10)$的命令方块，其相对坐标 `~12 ~-3 ~-5` 所指的方块坐标为#blank。],
  [
    相对坐标规定命令方块所在的位置即为原点，在将相对坐标转换为绝对坐标时，只需要在绝对坐标的基础上做相应的加减，这个题中的方块坐标为$(-24-12,55-3,10-5)$，计算可得$(-12,52,5)$。

  ]
)
*相对坐标可以与绝对坐标混合使用。*在不使用波浪号的坐标参数中，计算绝对坐标。比如，`~10 10 ~10` 会根据锚点变换$x$坐标和$z$坐标，但$y$坐标被固定为10。
==== 局部坐标
除了相对坐标外，命令系统还有一种更加灵活的坐标，即#proper-noun(display:"局部坐标（Local coordinates）", "ju2 bu4 zuo4 biao1")。局部坐标也用于表示相对偏移量，由脱字符 `^` 和相对偏移量的格式来表示：
#codebox("^[<dx>] ^[<dy>] ^[<dz>]")
与相对坐标不同的是，局部坐标脱离了绝对坐标系规定的方向，它以命令执行朝向作为基准，由朝向角度参数决定，可以是任意的。如@fig:local_coordinate_system，使用局部坐标相当于建立了一个坐标轴方向任意的坐标系，但是坐标轴之间的正交关系不变。若执行朝向发生变动，这个坐标系也之转动。
#figure(
  caption: "局部坐标系",
  image("图片/局部坐标系.png", width: 15em)
) <fig:local_coordinate_system>
局部坐标系规定：*命令执行朝向被视为$z$轴的正方向，若命令执行者为命令方块，则局部坐标系与相对坐标系无异*，因此$x$轴正方向位于命令执行位置的左边，$y$轴正方向位于命令执行位置的上方。比如，执行位置右边3米距离的局部坐标为 `^-3 ^ ^`。*由于局部坐标不使用绝对坐标系规定的坐标轴方向，因此同一坐标参数中局部坐标不能与绝对坐标和相对坐标混用。*

局部坐标会被执行锚点影响。当锚点是脚部时，*相对坐标和局部坐标的原点都在执行位置（脚部）*。而当锚点是眼部时，*相对坐标的原点在执行位置，也就是脚部；局部坐标的原点在眼部*。

以下举一个例子以进一步说明：
#codebox("execute as @a at @s anchored eyes run setblock ~ ~ ~ stone")
这条命令将执行锚点设为玩家的眼部，而执行位置仍然为玩家碰撞箱底部中心点，这个位置被相对坐标 `~ ~ ~` 使用，因此石头会放置在玩家下半身所在方块。
#codebox("execute as @a at @s anchored eyes run setblock ^ ^ ^ stone")
同样是将执行锚点设为玩家的眼部，但 `^ ^ ^` 使用执行锚点，因此石头会放置在玩家上半身所在方块。
=== 调试屏幕的坐标
使用 `F3` 打开调试屏幕时，屏幕上会显示和坐标有关的一些信息。首先是屏幕中央的准星会由十字形变成一个简约的正交分解三维坐标轴。规定红线代表$x$轴正方向，绿线代表$y$轴正方向，蓝线代表$z$轴正方向。这个图形会随着玩家的朝向改变而旋转，可以很容易地通过该图形中辨别方向。

使用 `F3` + `F6` 打开调试选项页面，其中的 `player_position`、`player_section_position`、`looking_at_block`、`looking_at_fluid` 等都会显示坐标信息。`player_position` 中一共有四行用于显示世界坐标的信息，如@fig:coordinate_in_debug_screen 所示。在框内信息中，第一行表示的是玩家当前的位置，其中$y$坐标表示的是玩家脚底的$y$坐标。第二行表示的是玩家脚部的方块坐标。第三行显示的是区块信息，第四行是玩家的朝向信息，指明了玩家大致的方向朝向（东南西北）以及具体的朝向角度参数（偏航角/俯仰角）。`player_section_position` 显示的是玩家在区块内的相对坐标。
#figure(
  caption: "调试屏幕中的玩家坐标",
  image("图片/调试屏幕中的玩家坐标.png", height: 4em)
) <fig:coordinate_in_debug_screen>
如@fig:block_position_in_debug_screen，当 `looking_at_block` 开启时，若玩家指向一个方块，调试屏幕会显示玩家指向方块的方块坐标及其方块状态与其所属的数据包标签；当 `looking_at_fluid` 开启时，会显示指向液体的信息。
#figure(
  caption: "调试屏幕中的方块坐标信息",
  image("图片/调试屏幕中的方块坐标信息.png", height: 6em)
) <fig:block_position_in_debug_screen>
== 朝向
上一节对局部坐标的描述使用了“朝向”这一概念。通常地、为了在空间直角坐标系中实体的朝向，可以使用两个旋转角度来表示：即水平方向上的#proper-noun(display:"偏航角（Yaw）", "pian1 hang2 jiao3")和竖直方向上的#proper-noun(display:"俯仰角（Pitch）", "fu3 yang3 jiao3")。其中偏航角表示实体使用这两个参数可表示三维空间中实体所有朝向，因为原版的Minecraft并未使用翻滚角。在命令中，所有的朝向均采用角度制，参数不写度数符号，一般来说命令参数类型为 `minecraft:rotation`，其中含有两个参数，分开表示成
#codebox("<yaw> <pitch>")
=== 偏航角
偏航角定义了实体绕绝对坐标$y$轴旋转的角度，因此它也可以被称为绕$y$轴旋转角度。它是一个实体的水平朝向与绝对坐标$z$轴的夹角$gamma$，其中$gamma in [-180,180)$。并且规定：$gamma$随顺时针方向增大，$z$轴正方向$gamma=0$。

$gamma$的符号可以按如下方法判断：对水平面内的向量进行正交分解，若有同向平行于$x$轴正方向或与$x$轴重合的分向量，则$gamma<0$；反向平行于$x$轴则$gamma >0$。用方位的语言描述：水平朝向偏向东，则$gamma<0$；偏向西则$gamma>0$。
#figure(
  caption: "偏航角",
  image("图片/偏航角.png", width: 18em)
)
注意在以上描述中，$gamma$的值都被限定在$[-180,180)$内。这个范围一般被视为偏航角的可用值（调试屏幕显示的范围），但是超出这个范围的参数仍然可以被识别。识别的规则是：*给一个偏航角参数加上或减去360，则新的偏航角参数与原来的偏航角参数等效*，最终将任意偏航角换算至$[-180,180)$的范围内。例如，`180` 会被识别为 `-180`，即正北方向；`270` 会被识别为 `-90`；`580` 会被识别为 `-140`。
#example(
  [要求设置某实体的朝向为北偏东$75 degree$，则偏航角参数应为#blank。],
  [
    如@fig:yaw_example 所示，根据偏航角的旋转角度特性，北偏东$75 degree$的方向参数就是在正北方向参数上加75，即$-180+75=-105$。偏航角参数为 `-105`。本题没有规定参数范围，因此填 `255`、`-465` 之类的答案也算正确。
    #figure(
      caption: "",
      image("图片/偏航角例题.png", width: 6em)
    ) <fig:yaw_example>
  ]
)
类似于相对坐标，游戏允许使用 `~` 和相对偏移量表示相对偏航角，格式为：
#codebox("~[<yaw>]")
表示在原来偏航角的基础上增加一定角度值后形成的偏航角。例如，若初始偏航角参数为 `30`， `~15` 则表示在 `30` 的基础上增加15，即 `45`。
=== 俯仰角
俯仰角定义了实体绕局部坐标$x$轴旋转的角度，因此它也可以被称为绕$x$轴旋转角度。它是一个实体的水平朝向与局部坐标$x$轴的夹角$theta$，其中$theta in [-90,90]$。并且规定：$theta$随俯视方向增大，与$y O z$平面平行时$theta=0$。

$theta$的符号可以按如下方法判断：对局部坐标$y O z$面内的向量进行正交分解，若与$y$轴正方向重合，则$theta<0$；与$y$轴反向则$theta>0$。用方位的语言描述：仰视时$theta<0$；俯视则$theta>0$。
#sub-figure(
  caption: "俯仰角",
  [#image("图片/俯仰角a.png", height: 8em)\(a)],
  [#image("图片/俯仰角b.png", height: 8em)\(b)]
)
在以上描述中，$theta$的值都被限定在$[-90,90]$内。这个范围一般被视为俯仰角的可用值（调试屏幕显示的范围），但是超出这个范围的参数仍然可以被识别。识别的规则是：*给一个俯仰角参数加上或减去360，则新的俯仰角参数与原来的俯仰角参数等效*。最终将任意俯仰角换算至的范围$[-90,90]$内。例如，`370` 会被识别为 `10`。但是显然任意俯仰角的范围局限于$[-90+360n, 90+360n]$，$n in ZZ$，诸如 `-180` 这样的参数不在此范围内，因此该参数是无效的。

和相对偏航角一样，游戏也允许使用~和相对偏移量表示相对俯仰角，格式为：
#codebox("~[<pitch>]")
表示在原来俯仰角的基础上增加一定角度值后形成的俯仰角。由偏航角、俯仰角组成的朝向参数允许绝对朝向和相对朝向混用。
=== 朝向与局部坐标的关系 \*
对于空间内的任意向量$bold(alpha)$，在计算其朝向时，可以先将其正交分解为两个向量：即如@equ:any_rotation 所示的平行于水平面的向量$bold(alpha)_parallel$和垂直于水平面的向量$bold(alpha)_perp$。偏航角是分向量$bold(alpha)_parallel$与z轴的夹角（注意符号），俯仰角是$bold(alpha)$与其水平分向量的夹角（注意符号）。运用方向角公式可以求出两个向量$bold(alpha)_1=(x_1,y_1,z_1)$、$bold(alpha)_2=(x_2,y_2,z_2)$之间的夹角$gamma$：
$ cos gamma= (bold(alpha)_1bold(alpha)_2)/(bar.v.double bold(alpha)_1bar.v.double bar.v.double bold(alpha)_2 bar.v.double)=(x_1 x_2+y_1 y_2+z_1 z_2)/(sqrt(x_1^2+y_1^2+z_1^2)sqrt(x_2^2+y_2^2+z_2^2)) $
#figure(
  caption: "任意朝向",
  image("图片/任意朝向.png", width: 10em)
) <equ:any_rotation>
据此可以求出两个朝向参数。计算偏航角的时候需要构造同向平行于$z$轴的单位向量。下面举一例以说明之。
#example(
  [有一锚点为$A(12,100,-170)$的实体，其朝向为坐标$B(14,102,-172)$的位置，求该实体的朝向角度（取值范围$[-180,180)$，取三位有效数字）。],
  [
    首先进行向量的分解，先得出向量$arrow.r(A B)=(2,2,-2)$在水平面上的分向量，如@fig:horizontal_projection 所示。
    #figure(
      caption: "水平投影",
      image("图片/水平投影.png", width: 12em)
    ) <fig:horizontal_projection>
    水平分向量$arrow.r(A' B')=(2,0,-2)$，此时只需要计算它与$z$轴的方向角，取同向平行于$z$轴的单位向量$bold(e)=(0,0,1)$，应用方向角余弦公式可得
    $ cos gamma=(-2)/(sqrt(2^2+(-2)^2)times 1)=-(sqrt(2))/2 $
    因为方向向量的指向偏东，故偏航角为 `-135`。

    计算俯仰角则只需求$arrow.r(A B)$与$arrow.r(A' B')=(2,0,-2)$的夹角，则
    $ cos theta=(2 times 2+(-2)times(-2))/(sqrt(2^2+2^2+(-2)^2)times sqrt(2^2+(-2)^2))=sqrt(6)/(3) $
    又$arrow.r(A' B')=(2,0,-2)$的竖直分量与$y$轴正方向平行，故$theta<0$，则俯仰角取近似值 `-35.3`。
  ]
)
引入偏航角、俯仰角两个朝向参数后，局部坐标指向的具体位置便可以准确计算出来了。设偏航角为$gamma$，俯仰角$theta$，则局部坐标系内某向量$bold(alpha)$实际上也跟随朝向角度增量发生转动得到向量$bold(alpha)'=(x',y',z')$，这里称为等效的相对坐标。@fig:projection_of_vectors (b) 是这两个向量在$x O z$平面上的投影，@fig:projection_of_vectors (c) 是它们在$y O z$平面上的投影。
#sub-figure(
  caption: "两个向量的投影结果",
  columns: 3,
  label: <fig:projection_of_vectors>,
  [#image("图片/两个向量的投影结果a.png", height: 8em)\(a)],
  [#image("图片/两个向量的投影结果b.png", height: 8em)\(b)],
  [#image("图片/两个向量的投影结果c.png", height: 8em)\(c)]
)
先分析在$x O z$平面上的投影，实际上水平方向的旋转即绕$y$轴旋转，此时$y$坐标不变。假设向量$bold(alpha)_parallel$与$x$轴的夹角为$phi$，令$bold(alpha)_parallel$的模为$l$，则有
$ cases(
  x=l cos phi,
  y=y_0,
  z=l sin phi
) $ <equ:rotation_derivation_1>
同理可得向量$bold(alpha)'_parallel$的坐标关系
$ cases(
  x'_parallel=l cos(phi+gamma)=l cos phi cos gamma-l sin phi sin gamma,
  y'_parallel=y_0,
  z'_parallel=l sin(phi+gamma)=l sin phi cos gamma+l cos phi sin gamma
) $
@equ:rotation_derivation_1 代入得
$ cases(
  x'_parallel=x cos phi-z sin phi,
  y'_parallel=y,
  z'_parallel=x sin phi+z cos phi
) $ <equ:rotation_derivation_3>
*矩阵*是一种用于求解线性方程组和实现线性变换的数学工具，可以将@equ:rotation_derivation_3 写成矩阵形式
$ mat(
  x'_parallel;
  y'_parallel;
  z'_parallel
) = mat(
  cos gamma, 0, -sin gamma;
  0, 1, 0;
  sin gamma, 0, cos gamma
)mat(
  x;
  y;
  z
) $
其中令矩阵
$ bold(R)_y (gamma) = mat(
  cos gamma, 0, -sin gamma;
  0, 1, 0;
  sin gamma, 0, cos gamma
) $
即得到向量绕$y$轴旋转的矩阵#footnote[这个矩阵与数学上通用的旋转矩阵不同，数学上向量旋转以逆时针为正方向，Minecraft的朝向角度以顺时针为正方向。]，这个矩阵与偏航角相关。

同理可以分析$y O z$上的投影，此时向量绕$x$轴旋转，得到旋转矩阵
$ bold(R)_x (theta) = mat(
  1, 0, 0;
  0, cos theta, -sin theta;
  0, sin theta, cos theta
) $
这个矩阵与俯仰角相关。绕$z$轴旋转的情况这里不需要使用，因为Minecraft暂时还不存在翻滚角。等效的相对坐标计算可以直接使用这两个矩阵，即
$ bold(alpha)'=bold(R)_y (gamma)bold(R)_x (theta)bold(alpha) $ <equ:equivalent_relative_coordinates>
用向量形式表示的实际绝对坐标$bold(beta)$即等效的相对坐标与命令执行位置$(x_0,y_0,z_0)$的和
$ bold(beta)=bold(alpha)'+(x_0,y_0,z_0)^"T" $
下面举一个计算的例子。
#example(
  [有一个位于点$(30,50,10)$的命令执行者，执行位置为该点，其偏航角和俯仰角分别为 `45` 和 `45`，求其局部坐标 `^10 ^ ^10` 的绝对坐标。],
  [
    由题意得$gamma=45 degree$，$theta=45 degree$，$alpha=(10,0,10)^"T"$。由@equ:equivalent_relative_coordinates，此坐标对于命令执行者的相对坐标为
    $ bold(alpha)'&=bold(R)_y (gamma)bold(R)_x (theta)bold(alpha)\
    &=mat(
      cos 45 degree, 0, -sin 45 degree;
      0, 1, 0;
      sin 45 degree, 0, cos 45 degree
    )mat(
      cos 45 degree, 0, -sin 45 degree;
      0, 1, 0;
      sin 45 degree, 0, cos 45 degree
    )mat(10; 0; 10)\
    &=mat(5sqrt(2)-5; -5sqrt(2); 5sqrt(2)+5) $
    则绝对坐标为
    $ bold(beta)=bold(alpha)'+(30,50,10)^"T"=mat(5sqrt(2)+25; -5sqrt(2)+50; 5sqrt(2)+15)approx mat(32.07; 42.93; 22.07) $
  ]
)
== 坐标参数在命令中的应用
本节讲述一些使用坐标参数的命令语法。
=== 使用方块坐标的命令
一些命令使用的坐标参数均为方块坐标 `minecraft:block_pos`，这部分命令包括用于放置方块的 `/setblock`、`/fill`、`/clone` 和用于设置出生点的 `/spawnpoint`、`/setworldspawn`。
==== 命令 `/setblock`
此命令用于更改单个方块。这里的“单个方块”意为长宽高均小于等于1米的方块，如石头一类的标准方块，楼梯、台阶、栅栏、玻璃板一类的“不完整方块”。若遇到长度或高度大于1米的方块则无法使用单个 `/setblock` 命令以放置完整的方块，如床、门等。此命令所需权限等级为2，语法为：#index(index: "command", "setblock")
#codebox("setblock <pos> <block> [destroy|keep|replace|strict]") <code:command_setblock>
#param-desc(
  [`<pos>`（方块坐标 `minecraft:block_pos`）], [需要放置方块的坐标。],
  [`<block>`（方块状态 `minecraft:block_state`）], [参数格式为 `命名空间ID[方块状态]{NBT}`，表示被放置的方块，其中方块状态和方块实体NBT是可选的。],
  [`[destroy|keep|replace|strict]` ], [选填，四种有效值的效果如下：],
  [`destroy` ], [原方块会像被不带有精准采集或时运的工具破坏那样掉落其掉落物，并且会播放方块被破坏的声音。例如，将玻璃方块更改为其他方块时不会掉落任何掉落物，更改草方块时会掉落泥土，以此类推。],
  [`keep` ], [只有空气方块会被更改，非空气方块将被保留。注意：如果使用 `/setblock` 去更改非空气方块，则命令执行失败。],
  [`replace` ], [完全更改原方块，原方块不会掉落其掉落物、没有被破坏的声音。如果不指定参数 `[destroy|keep|replace|strict]`，命令默认使用这种更改方式。],
  [`strict` ], [使用这种模式时更改方块不会触发方块更新。其他模式均会触发方块更新。]
)
#example(
  [在$(0,0,0)$放置一个石头。],
  [
    命令为
    #codebox("setblock 0 0 0 minecraft:stone")
  ]
)
#example(
  [在$(0,0,0)$放置一个浮空的沙子。],
  [
    如果使用非 `strict` 模式放置，则命令会触发方块更新，进一步造成沙子坠落而无法浮空，因此需使用 `strict` 模式：
    #codebox("setblock 0 0 0 minecraft:sand strict")
  ]
)
==== 命令 `/fill`
该命令用指定的方块填充一个长方体区域的全部或部分，所需权限等级为2。以下是它的一种语法，这条语法仅会更改填充区域内的非空气方块，与 `/setblock` 中的 `keep` 模式完全相同。#index(index: "command", "fill")
#codebox("fill <from> <to> <block> keep")
#param-desc(
  [`<from>`、`<to>`（方块坐标 `minecraft:block_pos`）], [如@fig:command_fill 所示，两个对角方块可以决定空间内的一个长方体，一般将这个长方体占据的空间称为#proper-noun(display: "源区域（Source region）", "yuan2 qu1 yu4")。在 `/fill` 命令中，决定源区域的两个方块坐标不必刻意强调其某个坐标轴上坐标参数的大小。],
  [`<block>`（方块状态 `minecraft:block_state`）], [与语法@code:command_setblock 一致。]
)
`/fill` 的另一种语法如下：
#codebox("fill <from> <to> <block> [replace <filter>] [destroy|hollow|outline|strict]")
#param-desc(
  [`[<filter>]`（方块谓词 `minecraft:block_predicate`）], [可选，用于指定需要被替换的方块种类；若不指定，则所有方块都会被替换，注意此时字面量 `replace` 也需要省略。对于方块谓词这种参数，可以用命名空间ID指定某一种方块，也可以用数据包标签指定某一类方块，同时允许指定方块状态或方块实体NBT。具体格式为：\ `<命名空间ID>[<方块状态>=<值>,…]{<方块实体数据>}`\ 其中 `[<方块状态>=<值>,…]` 和 `{<方块实体数据>}` 在不需要时可以省略。检查方块时只会检查此参数指定的方块状态是否匹配。],
  [`[destroy|hollow|outline|strict]` ], [可选，方块处理方式。注意无论是哪种处理方式，其更改的方块都只能是 `[<filter>]` 指定的方块，除非不指定被替换的方块。`destroy` 与 `strict` 的用法和效果与 `/setblock` 中的用法完全相同，参考语法@code:command_setblock。其他的可选参数有其特殊的用处：],
  [`hollow` ], [它的效果相当于一个空心的、外部只有一层方块包裹的长方体。源区域的外层将被替换为指定的方块，内部将被替换为空气。],
  [`outline` ], [与 `hollow` 类似，`outline` 也会生成有一层方块包裹的长方体，但是内部的方块则不会发生变化。这样的效果可以理解为为内部的结构套一层方块外框。]
)
一条 `/fill` 命令的源区域的方块数量上限由游戏规则 `max_block_modifications` 决定，默认为 `32768`，可由命令 `/gamerule` 修改。*若源区域体积超过此上限则命令执行失败，无论实际上修改的方块数量。*
#figure(
  caption: [`/fill` 命令图解],
  image("图片/fill命令图解.png", width: 20em)
) <fig:command_fill>
例如，以下两条命令均能够被识别，且二者表示的源区域完全相同。
#codebox("fill 12 24 17 13 18 16 stone")
#codebox("fill 13 18 16 12 24 17 stone")
设第一个方块坐标为$(x_1,y_1,z_1)$，第二个方块坐标为$(x_2,y_2,z_2)$，则源区域的方块总数
$ S=(abs(x_1-x_2)+1)(abs(y_1-y_2)+1)(abs(z_1-z_2)+1) $ <equ:source_region_volume>
#example(
  [
    判断下列命令是否超过了默认的 `max_block_modifications` 规定的限制。
    + 其中源区域均为空气方块：
      #codebox("fill ~ ~ ~ ~24 ~-22 ~17 stone")
    + 其中源区域含有600个非空气方块：
      #codebox("fill 23 179 66 5 223 104 stone keep")
    + 其中源区域均为空气方块：
      #codebox("fill ~3 ~ ~9 ~36 ~-25 ~-49 stone outline")
  ],
  [
    + 直接代入@equ:source_region_volume 得$S=25 times 23 times 18=10350$，小于默认的 `32768` 上限。
    + 代入公式得源区域方块总数$S=19 times 45 times 39=33345$，虽然源区域有600个非空气方块，实际更改的方块数量为$33345-600=32745<32768$，但源区域的方块总数已超限。
    + 代入公式，$S=34 times 26 times 41=36244>32768$，超限。
  ]
)
==== 命令 `/clone`
此命令用于将某一个区域的方块复制到另一个区域。对于被复制的区域一般称其为*源区域*，而 `/clone` 的目的位置称为#proper-noun(display: "目标区域（Destination region）", "mu4 biao1 qu1 yu4")。允许跨维度复制区域。它所需权限等级为2，语法为：#index(index: "command", "clone")
#codebox("clone [from <sourceDimension>] <begin> <end> [to <targetDimension>] <destination> [strict] [replace|masked] [force|move|normal]") <code:command_clone_replace>
或
#codebox("clone [from <sourceDimension>] <begin> <end> [to <targetDimension>] <destination> [strict] filtered <filter> [force|move|normal]") <code:command_clone_filtered>
#param-desc(
  [`[from <sourceDimension>]` ], [区域复制来源维度，选填，若需指定，字面量 `from` 必不可少。参数 `<sourceDimension>` 的类型为 `minecraft:dimension`，必须为维度的命名空间ID。不指定则默认使用命令执行维度。],
  [`<begin>`、`<end>`（方块坐标 `minecraft:block_pos`）], [决定源区域的两个方块坐标。],
  [`[to <targetDimension>]` ], [区域复制目标维度，选填，若需指定，字面量 `to` 必不可少。参数 `<sourceDimension>` 的类型为 `minecraft:dimension`，必须为维度的命名空间ID。不指定则默认使用命令执行维度。],
  [`<destination>`（方块坐标 `minecraft:block_pos`）], [#h(-2em)目的位置被定义为目标区域西北下角的方块，复制到目标区域的结构在每个坐标轴上均位于该方块坐标的正方向，如@fig:command_clone_destination 所示。#figure(caption: [`/clone` 命令目的位置方块在目标区域中的位置], image("图片/clone命令目的位置方块在目标区域中的位置.png", width: 10em)) <fig:command_clone_destination>],
  [`[strict]` ], [可选，若使用该参数则不会触发方块更新。]
)
对于语法@code:command_clone_replace 而言，
#param-desc(
  [`[replace|masked]` ], [可选，两者各自的作用为：],
  [`replace` ], [强制复制所有方块，即用源区域的方块完全替换目标区域的方块。为方块处理方式的默认值。],
  [`masked` ], [仅复制非空气方块，即只有目标区域中源区域非空气方块对应的位置会被替换，源区域空气方块对应的位置则保持不变。],
  [`[force|move|normal]` ], [可选，它们各自的作用是：],
  [`force` ], [无论源区域和目标区域是否有重叠，一律强制复制。若有重叠的部分，则该部分目标区域会覆盖源区域。],
  [`move` ], [将源区域“移动”到目标区域，即复制过后源区域会被替换为空气。],
  [`normal` ], [默认的复制方式，在该复制方式下，源区域和目标区域不能有重叠的部分。]
)
语法@code:command_clone_filtered 是 `/clone` 命令的过滤模式，
#param-desc(
  [`<filter>`（方块谓词 `minecraft:block_predicate`）], [在源区域中选定需要被复制的方块ID，只有指定的方块才会被复制到目标区域中。]
)
#example(
  [将对于命令执行位置而言 `~ ~ ~` 和 `~2 ~1 ~3` 之间区域的所有草方块按其在区域内的位置复制到 `~ ~10 ~`。],
  [
    显然需要使用 `/clone` 的过滤模式，命令为：
    #codebox("clone ~ ~ ~ ~2 ~1 ~3 ~ ~10 ~ filtered minecraft:grass_block")
  ]
)
==== 命令 `/spawnpoint`
这条命令用于设置玩家的出生点，需要的权限等级为2，其语法为：#index(index: "command", "spawnpoint")
#codebox("spawnpoint [<targets>] [<pos>] [<angle>]")
#param-desc(
  [`[<targets>]`（实体 `minecraft:entity`）], [如果不填指定的玩家，则默认作用于命令执行者。如果命令执行者为命令方块，则必须填写指定的玩家。允许使用目标选择器指定玩家。],
  [`[<pos>]`（方块坐标 `minecraft:block_pos`）], [三个参数必须为整数，因此无法在设置玩家出生点时使用精确的实际坐标，所以玩家的出生点只能被设置在一个方块底部的中心点。若不填写坐标参数则会将玩家出生点设置在命令执行者的当前位置。],
  [`[<angle>]`（角度 `minecraft:angle`）], [指定玩家出生时的偏航角，只有偏航角一个参数，不可指定俯仰角。]
)
读者也可以使用这条命令设置在任意维度的出生点。但是在末地使用 `/spawnpoint` 需谨慎，因为末地传送门会将玩家传送回出生点，无论该出生点所在的维度，因此很有可能会将玩家困在末地，不过玩家依旧可以使用 `/tp` 传送至其他维度的玩家或使用 `/execute` 子命令 `in` 直接传送至指定维度。
==== 命令 `/setworldspawn`
用于设置世界出生点，当命令执行成功后出生点区块会变为该出生点所在区块，也会影响区块刻的赋予。注意：该命令不能用于设置除主世界外其他维度的世界出生点，需要的权限等级为2，语法为：#index(index: "command", "setworldspawn")
#codebox("setworldspawn [<pos>] [<angle>]")
=== 使用三维坐标的命令
命令 `/tp` 和 `/teleport` 使用的坐标参数均为三维坐标 `minecraft:vec3`，一般使用浮点数，允许使用整数以进行中心校准。这两条命令可以互通，语法也完全相同。出于习惯以及在实际操作中为了方便输入命令，通常在语法格式介绍中使用更为简便的 `tp` 字符。`/tp` 的主要作用为传送实体至指定的位置或指定其朝向，所需权限等级为2，以下是它的所有用法。#index(index: "command", "tp")#index(index: "command", "teleport")
===== 将命令执行者直接传送至指定的目标实体，并与目标实体保持相同的朝向，语法为：
#codebox("tp <destination>") <code:command_tp_destination>
#param-desc(
  [`<destination>`（实体 `minecraft:entity`）], [指定要传送至的实体，可以是玩家名称、UUID或目标选择器，但只允许选择一个实体。]
)
===== 将命令执行者传送至指定的坐标，朝向保持不变，语法：
#codebox("tp <location>")
#param-desc(
  [`<location>`（三维坐标 `minecraft:vec3`）], [可以使用整数坐标以进行中心校准。]
)
===== 将指定的实体传送至其他目标实体，并与目标实体保持相同的朝向，语法为：
#codebox("tp <targets> <destination>")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [被传送的实体。],
  [`<destination>`（实体 `minecraft:entity`）], [同语法@code:command_tp_destination 一致。]
)
例如，将玩家A传送至玩家B（不要混淆成将玩家B传送至玩家A）：
#codebox("tp A B")
===== 将指定的实体传送至指定的坐标，并允许修改被传送者的朝向角度，语法为：
#codebox("tp <targets> <location> [<rotation>]")
#param-desc(
  [`[<rotation>]`（朝向 `minecraft:rotation`）], [选填，偏航角在前，俯仰角在后。如果不使用该参数，则会保持指定实体原本的朝向。]
)
===== 将指定的目标实体传送至指定的坐标位置，并指定其朝向的坐标，语法为：
#codebox("tp <targets> <location> facing <facingLocation>")
#param-desc(
  [`<facingLocation>`（三维坐标 `minecraft:vec3`）], [决定目标实体朝向的坐标。]
)
执行锚点会对该命令的执行结果造成影响，因为它会改变命令上下文。若该命令的执行者锚点为 `feet`，则以朝向位置对脚底的方向作为视线方向（如@fig:raycasting_by_anchor (a)，因此如果朝向位置的$y$坐标与指定实体脚底$y$坐标相等，理论上该指定实体的视线方向应是水平的；若该命令的执行者锚点为 `eyes`（如@fig:raycasting_by_anchor (b)），则以朝向位置对眼睛的方向作为视线方向 。若该命令单独使用，则默认锚点为 `feet`，如果需要将锚点设为 `eyes`，则可以用 `/execute` 命令修改。
#sub-figure(
  caption: "锚点与朝向位置的关系对视线方向的影响",
  label: <fig:raycasting_by_anchor>,
  [#image("图片/锚点与朝向位置的关系对视线方向的影响a.png", height: 10em)\(a)],
  [#image("图片/锚点与朝向位置的关系对视线方向的影响b.png", height: 10em)\(b)]
)
===== 将指定实体传送至指定的坐标位置，并指定其朝向的实体，语法为：
#codebox("tp <targets> <location> facing entity <facingEntity> [<facingAnchor>]")
#param-desc(
  [`<facingEntity>`（实体 `minecraft:entity`）], [指定要朝向的实体。],
  [`[<facingAnchor>]`（实体锚点 `minecraft:entity_anchor`）], [可选，指定朝向实体的何种锚点，可以为 `eyes` 或 `feet`，默认为 `feet`。]
)
朝向的准则遵循图@fig:raycasting_by_anchor 所示的规律，视线方向会严格按照锚点之间的位置关系。例如，单独使用如下的命令：
#codebox("tp A ~ ~ ~ facing entity B eyes")
这时指定实体A的锚点为 `feet`，而朝向为实体B的锚点 `eyes`，此时朝向实体的上方而不是实体B的眼睛部位，如@fig:command_tp_anchor_example 所示。
#figure(
  caption: [`/tp` 命令锚点例子],
  image("图片/tp命令锚点例子.png", height: 10em)
) <fig:command_tp_anchor_example>
只有当实体A的锚点为 `eyes` 时，才会朝向实体B的眼睛部位，这时需要使用命令 `/execute`。
=== 使用二维坐标的命令
`/spreadplayers` 和 `/worldborder` 使用的坐标参数均为二维坐标 `minecraft:vec2`。
==== 命令 `/spreadplayers`
这条命令用于分散多个实体、将实体传送到任意位置，所需权限等级为2，语法为：#index(index: "command", "spreadplayers")
#codebox("spreadplayers <center> <spreadDistance> <maxRange> [under <maxHeight>] <respectTeams> <targets>")
#param-desc(
  [`<center>`（二维坐标 `minecraft:vec2`）], [只使用$x$坐标和$z$坐标，两个元素均为双精度浮点数，指定传送区域的中心点。],
  [`<spreadDistance>`（浮点数 `brigadier:float`）], [目标实体之间的最小间距，最小值 `0.0`。],
  [`<maxRange>`（浮点数 `brigadier:float`）], [指传送区域的边界与中心点在$x$轴和$z$轴上的距离，最小值应为 `1.0`。因此传送区域为一个正方形而不是圆形。],
  [`[under <maxHeight>]`], [可选，包含两个参数：`under` 是字面量，无需更改写法，`<maxHeight>` 参数类型为整型 `brigadier:integer`，参数之间的空格不要缺失。如果指定了实体传送的最大高度，则在最大范围内一定要保证该最大高度下有足够的空间，否则命令执行失败。],
  [`<respectTeams>`（布尔值 `brigadier:bool`）], [若为 `true`，则同队伍的所有成员会传送到同一个位置。],
  [`<targets>`（实体 `minecraft:entity`）], [需要被传送的实体，可以为多个玩家名称、UUID或目标选择器，玩家名称之间应该用空格隔开。也可以指定除玩家外的实体。]
)
#figure(
  caption: [命令 `/spreadplayers` 图解],
  image("图片/命令spreadplayers图解.png", height: 9em)
) <fig:command_spreadplayers>
如@fig:command_spreadplayers，$O$点为传送区域的中心点，最大范围决定了$O$点离正方形边界的距离，分散间距决定了实体$A$和实体$B$之间的最短距离。在实际的命令编写中还需要考虑的问题是分散间距与最大范围的关系，如果最大范围无法满足分散间距的需求，则命令执行失败。在这条命令中，两个实体的间距不能大于传送区域的边长，否则便会判定最大范围无法满足分散间距的需求。根据正方形的几何性质来看，当目标实体数量不大于4个时，分散间距必须小于最大范围的两倍。

下面为该命令的具体使用举例：
#example(
  [
    使用 `/spreadplayers` 按要求写出下列命令：
    + 将两个不属于同一队伍的玩家 `Waterman12345`、`Mu_xian` 传送至随机位置，其中中心点为命令执行者所在位置，最大范围为12，两个玩家间距不能小于7；
    + 将所有实体随机传送，要求：中心点为$(0,0)$，最大范围100，传送的最大高度为100，同队的所有实体必须传送在一起，队伍与队伍之间最小间距为12。
  ],
  [
    + 命令为
      #codebox("spreadplayers ~ ~ 7 12 false Waterman12345 Mu_xian")
    + 命令为
      #codebox("spreadplayers 0 0 12 100 under 100 true @e")
  ]
)
==== 命令 `/worldborder`
虽然Minecraft的游戏世界巨大无比，但其仍然是有可玩游戏区域界限的，自定义世界边界则是这个界限的一种保障。从宏观上来看，世界边界是一个巨大的正方形边框。世界边界的中心决定了世界边界的位置，而正方形边界的边长则决定了世界边界的大小，两种参数均可自定义。
#figure(
  caption: "宏观的世界边界及边界中心",
  image("图片/宏观的世界边界及边界中心.png", height: 9em)
) <fig:world_border>
#proper-noun(display: "边界中心（World border's center）", "bian1 jie4 zhong1 xin1")使用二维坐标。由于二维坐标缺少$y$坐标，因此它不能用于指定方块坐标，所有的二维坐标无论其是否为整数均指定精确的实际$x O z$坐标。玩家可以自定义一些带有小数的二维坐标世界中心，并且世界边界会严格按照边界中心确定其位置。默认的边界中心为$(0,0)$。边界中心与出生点区块和玩家出生点无关，`/setworldspawn` 和 `/spawnpoint` 无法指定边界中心。

边界的大小一般指#proper-noun(display: "世界边界直径（World border diameter）", "shi4 jie4 bian1 jie4 zhi2 jing4")，即@fig:world_border 中正方形的*边长*。该参数可以为小数并且世界边界会严格按照该参数确定其大小。世界边界直径可以接受的最大值为 `59999968`，最小值为 `1`，因此边界中心距世界边界的最大值为 `29999984`，最小值则为 `0.5`。#index(index: "command", "worldborder")
===== 设置世界边界直径增量，语法为：
#codebox("worldborder add <distance> [<time>]")
#param-desc(
  [`<distance>`（双精度浮点数 `brigadier:double`）], [即世界边界直径。在原来的世界边界直径基础上增加或减少指定的距离，距离参数可以为负。若该参数为正，则世界边界直径增加，若为负，则减小。],
  [`[<time>]`（整型 `brigadier:integer`）], [选填，用于指定世界边界直径发生变化所需的时间，注意*该参数类型实际上是整型而非真正的时间参数，且单位为秒而非游戏刻*。若不指定则默认为 `0`，即世界边界直径会瞬间发生变化。]
)
===== 设置世界边界直径大小，语法为：
#codebox("worldborder set <distance> [<time>]")
#param-desc(
  [`<distance>`（双精度浮点数 `brigadier:double`）], [直接指定世界边界直径的大小。]
)
#example(
  [有中心位于$(0,0)$、原直径为300的世界边界，要使该世界边界在一定时间内直径变化至50。且由于地图制作的要求，一堵边界墙的移动速度需要约等于玩家正常步行的速度（4.317m/s）。写出符合要求的命令，各参数需要精确到个位。],
  [
    世界边界的变化可用 `/worldborder add` 和 `/worldborder set` 指定，如@fig:world_border_example 所示：
    #figure(
      caption: "",
      image("图片/世界边界例题.png", width: 10em)
    ) <fig:world_border_example>
    先探讨 `/worldborder add` 命令所需的参数：由正方形的性质，可以很快求得边界墙移动距离#box(baseline: 30%, inset: (y: 0.5em))[$Delta d=display((300-50)/2)=125$]，该结果即为距离参数。又该世界边界直径缩小，所以距离参数应为负，即$-125$。同时要求边界墙的移动速度需要等于玩家正常步行的速度，故时间参数为#box(baseline: 30%, inset: (y: 0.5em))[$t=display((Delta d)/v=125/4.317) approx 29$]。所以可用的命令可以是
    #codebox("/worldborder add -125 29")
    在 `/worldborder set` 的情况下，时间参数的计算仍然需要使用边界墙移动距离$Delta d$，但是$Delta d$本身不会出现在命令参数中。所以可用的命令也可以是
    #codebox("worldborder set 50 29")
  ]
)
===== 设置边界中心的位置，语法为：
#codebox("worldborder center <pos>")
#param-desc(
  [`<pos>`（二维坐标 `minecraft:vec2`）], [世界中心，两个元素均为双精度浮点数。]
)
===== 设置玩家越过世界边界后作用于玩家的伤害，语法为：
#codebox("worldborder damage buffer <distance>")
#codebox("worldborder damage amount <damagePerBlock>")
#param-desc(
  [`<distance>`（双精度浮点数 `brigadier:double`）], [边界墙的外围有一层缓冲区，在这层缓冲区中的玩家可免受世界边界的伤害，此参数指定该缓冲区的宽度。该参数为浮点数，必须为非负数，若指定为 `0`，则边界外围没有缓冲区，玩家一旦越过边界墙即受到伤害。],
  [`<damagePerBlock>`（浮点数 `brigadier:float`）], [缓冲区的外围是一层层的伤害区，每一层伤害区宽度为1格方块，此参数用于决定每一层伤害区每秒钟对玩家造成的伤害，其计算方法为：]
)
$ D_n=n dot d $
#param-desc(
  prefix: "式中：",
  [$D_n$], [第$n$层伤害区每秒造成伤害。],
  [$n$], [层数。],
  [$d$], [`<damagePerBlock>` 的值。]
)
例如，`/worldborder damage amount 0.1` 会让玩家在第5层伤害区受到每秒0.5的伤害值。每方格伤害值必须为浮点数和非负数，其默认值为 `0.2`。
#sub-figure(
  caption: "世界边界作用于玩家的伤害区域",
  [#image("图片/世界边界作用于玩家的伤害区域a.png", height: 10em)\(a)],
  [#image("图片/世界边界作用于玩家的伤害区域b.png", height: 10em)\(b)]
)
===== 返回当前世界边界的直径，语法为：
#codebox("worldborder get")
===== 设置世界边界的警告
#wrap-content(
  tips(
    [当玩家靠近边界墙时，玩家的屏幕会变红，但若图像设置为流畅，则屏幕不会变红。这种视觉效果在冒险地图中被广泛使用，且通常用于表现紧张或恐惧的情景。],
    width: 20em
  ),
  [
    世界边界的警告可用 `distance` 和 `time` 两种模式来指定。若指定：玩家距离边界墙一定距离$d$时产生警告，适用 `distance` 模式；若指定：某位置在$t$秒后即将被边界墙越过，若玩家进入该位置即产生警告，则适用 `time` 模式。语法分别为：

  ],
  align: right
)
#codebox("worldborder warning distance <distance>")
#codebox("worldborder warning time <time>")
#param-desc(
  [`<distance>`（整型 `brigadier:integer`）], [最小值可以为 `0`，默认值为 `5`。],
  [`<time>`（整型 `brigadier:integer`）], [最小值可以为 `0`，默认值为 `15`。]
)
#figure(
  caption: "边界墙与警告区域（灰色）的位置关系",
  image("图片/边界墙与警告区域（灰色）的位置关系.png", width: 9em)
)
== 区块
Minecraft游戏世界的加载单位被称为*区块*，一个区块的水平横截面为$16 times 16$的方格。在高度未扩展之前，一个区块高256格方块，覆盖方块$y$坐标0 \~ 255的高度。1.18游戏高度扩展之后，一个区块高达384格方块，覆盖方块$y$坐标$-64$ \~ 319的高度。
=== 区块坐标和区段坐标
快捷键 `F3` + `G` 可以显示区块边界。区块的边缘总是与方块边缘相贴合，当$x$坐标或$z$坐标能被16整除时该位置为区块的边界，因此两个区块的接触面方程可以表示为$x=16n$或$z=16n$（$n in ZZ$）。因此在$x O z$平面内，一个区块任意顶点的二维坐标可以表示为$(16n_1,16n_2)$（$n_1$、$n_2 in ZZ$）。
#figure(
  caption: [水平面上$(0,0)$附近的区块],
  image("图片/水平面上(0,0)附近的区块.png", width: 25em)
) <fig:chunks_nearby_origin>
由于Minecraft一个世界中区块数量众多，因此有必要对这些区块进行一定处理以方便了解它们大致的位置。表述一个方块的位置使用的是直角坐标系，它对每个方块都规定了其坐标。那么能否使用类似坐标的手段对区块进行描述呢？

对于一个方块而言，其西北下角的顶点是其方块坐标；对于一个区块而言，同样可以使用其西北角的棱作为其区块坐标。在$x O z$平面内，若一个区块截面的西北角顶点坐标为$(16n_1,16n_2)$（$n_1$、$n_2 in ZZ$），则该区块的区块坐标可用方括号表示为$[n_1,n_2]$（$n_1$、$n_2 in ZZ$）。如@fig:chunks_nearby_origin 所示，若要表示由$x=16$、$z=16$、$x$轴和$z$轴围成区块的区块坐标，其西北角的点为坐标轴原点，则区块坐标可以表示为$[0,0]$。

对于一个区块内的区段，它相比区块而言多了$y$轴方向的度量，并且当$y$坐标能被16整除时该位置为区段顶部或底部的边界。游戏使用区段的西北下角顶点作为它的区段坐标：若一个区段的西北下角顶点为$(16n_1,16n_2,16n_3)$（$n_1$、$n_2$、$n_3 in ZZ$），则该区段的区段坐标可表示为$[n_1,n_2,n_3]$（$n_1$、$n_2$、$n_3 in ZZ$）。这对于$y$坐标小于0的空间同样适用。
#figure(
  caption: "一个区块被分成若干个区段",
  image("图片/一个区块被分成若干个区段.png", width: 4em)
)
当描述一个方块在该区块内的位置时，就需要使用到区段坐标。并且需要在该区段的西北下角建立一个空间直角坐标系，用这个坐标系描述方块在区段内的相对位置。因此在这个坐标系内，所有坐标参数均为大于等于0且小于等于15的整数，西北下角的方块在区段内位置可表示为$(0,0,0)$。

对于一个方块坐标为$(a,b,c)$（$a$、$b$、$c in ZZ$）的方块，可以直接使用floor函数#footnote[floor函数即向下取整函数，取不大于该实数的最大整数。数学语言一般记作$floor.l x floor.r$，例如$floor(3.14)=3$，$floor(-1.5)=-2$，$floor(1)=1$。]求得该方块所在区段的区段坐标为：
$ [floor(a/16), floor(b/16), floor(c/16)] $
该数据显示于调试屏幕 `Chunk` 一行。因此该方块所在区块为
$ [floor(a/16), floor(c/16)] $
该区段西北下角方块的方块坐标可由区段坐标转化：
$ (16floor(a/16), 16floor(b/16), 16floor(c/16)) $
而西北下角的方块在区段内位置表示为$(0,0,0)$，由坐标与方向的关系知结构西北下角的所有坐标参数在结构内最小，而该方块的方块坐标为$(a,b,c)$，则该方块在区块中的位置可表示为
$ (a-16floor(a/16), b-16floor(b/16), c-16floor(c/16)) $
对于任何方块坐标，都可以通过代入上式计算其所在的区块，并求得该方块在区块中的位置。如果是玩家的坐标，也可以以此计算调试屏幕中 `player_section_position` 的数据。
=== 命令/forceload<subsec:command_forceload>
在18w31a之前，根据预传送加载标签的原理，一般使用 `/spreadplayers` 来加载所需要的区块，但是这种加载方式非常地不稳定。于18w31a加入的命令 `/chunk`（后改名为 `/forceload}` 很好地解决了这个问题。

`/forceload` 用于指定强制加载的区块，并把这些区块的加载等级和计算等级指定为31。它需要的权限等级为2，所有用法如下：#index(index: "command", "forceload")
===== 指定或解除强制加载的区块，语法为：
#codebox("forceload (add|remove) <from> [<to>]")
#param-desc(
  [`<from>`、`[<to>]`（平面方块坐标 `minecraft:column_pos`）], [两个参数均只接受整数形式的二维化方块坐标，元素顺序为 `<x> <z>`，允许使用相对坐标，不接受局部坐标。`[<to>]` 参数可选填，若不填则仅操作 `<from>` 坐标所在区块。注意，该语法中所用的二维坐标非区块坐标，使用命令的时候需要手动计算确定方块所在的区块。]
)
===== 在一个维度中解除所有区块的强制加载，语法为：
#codebox("forceload remove all")
===== 查询区块是否为强制加载区块，语法为：
#codebox("forceload query [<pos>]")
#param-desc(
  [`[<pos>]`（平面方块坐标 `minecraft:column_pos`）], [指定要查询的方块所在的区块，若不指定则返回强制加载的所有区块，返回值会使用区块坐标。]
)
#example(
  [
    在一个初始情况下没有强制加载区块的世界中使用命令 `/forceload add 45 -32 87 10`。
    + 求强制加载的区块个数；
    + 写出 `/forceload query` 的返回内容。<enu:forceload_query>
  ],
  [
    首先根据起始、终止两个参数的二维方块坐标确定两个指定点所在的区块。由上文推导的结果可得到：二维方块坐标$(a,c)$所在的区块为#box(baseline: 30%, inset: (y: 0.5em))[$display([floor(a/16), floor(c/16)])$]。对于起始点$(45,-32)$，代入可得起始区块$[2,-2]$，同理可得终止区块$[5,0]$，因此强制加载的区块共有$4 times 3=12$个。

    第@enu:forceload_query 小题所问即写出所有强制加载的区块，一共有12个区块：$[2,-2]$、$[2,-1]$、$[2,0]$、$[3,-2]$、$[3,-1]$、$[3,0]$、$[4,-2]$、$[4,-1]$、$[4,0]$、$[5,-2]$、$[5,-1]$、$[5,0]$。
  ]
)
#heading(level: 2, numbering: none, [第二章思考题与习题])
+ 一个命令执行位置为$(-27,32,102)$，其相对坐标 `~29 ~-3 ~23` 所表示的绝对坐标为#blank。
+ 一个命令执行位置为$(457,23,-1283)$，则用于表示绝对坐标$(321,21,-1234)$的相对坐标为#blank。
+ 一个命令方块位于$(-90,122,-18)$，其局部坐标 `^-18 ^19 ^77` 所表示的绝对坐标为#blank。
+ 某玩家的水平朝向为南偏西$24 degree$，$24 degree$的偏航角参数为#blank。
+ 已知某玩家的锚点为$(220,17,26)$，其偏航角为 `135`，俯仰角为 `-45`，求（取小数点后一位）：
  + 相对坐标 `~23 17 ~-9` 表示的绝对坐标；
  + 局部坐标 `^3 ^7 ^-6` 表示的绝对坐标。
+ 一锚点位于$(3,7,9)$的实体朝向坐标$(6,8,7)$，求该实体的朝向，并判断在调试页面中显示的大概朝向信息。（取小数点后一位）
+ 某玩家的锚点为$(33,56,-10)$，其偏航角和俯仰角分别为 `30` 和 `45`，若要用局部坐标表示绝对坐标为$(12,40,-12)$的点，则求局部坐标。（取小数点后一位）
+ 命令 `/fill ~-1 ~7 ~3 ~19 ~6 ~-5 stone replace` 源区域的方块数量为
+ 已知玩家Sky位于$(1.5,57.0,-36.6)$，一个命令执行者使用
  #codebox("tp @s ~ ~ ~ facing entity Sky feet")
  则该命令执行者实际朝向的坐标为#blank。
+ 设置玩家出生点为$(0,64,0)$，且出生时平视、面朝正东方的命令为#blank。
+ 在下列命令中，判断其是否有错误，若有则指出其错误。
  + `spreadplayers ~ ~ 13 5 under 90 false @a`
  + `setblock 30 73 -45 quartz_block replace`
  + `tp 0 70 0 66.5 -45`
  + `worldborder warning distance 1.5`
  + `clone 12 15 4 15 17 -1 9 17 -6`
+ 现用如下命令自定义一个世界边界：
  #codebox("worldborder center 0 0")
  #codebox("worldborder set 50")
  #codebox("worldborder damage buffer 5")
  #codebox("worldborder damage amount 0.5")
  某生命值为20的玩家位于$(0,35)$，由于该位置处于边界之外，因此其以疾跑的速度（5.612m/s）奔向安全区域。
  + 判断该玩家能否在生命值归零之前跑到安全区域；
  + 在上述条件下，又以如下命令定义世界边界的移动：`/worldborder add -30 10`，玩家的疾跑与世界边界发生变化同时开始，判断该玩家能否在生命值归零之前跑到安全区域。
+ 区块$[4,5]$和区块$[3,5]$的接触面方程为#blank。
+ 命令 `/forceload add 1247 -359` 所指定的强加载区块为#blank。
+ 求下列方块坐标所在的区块（区段），并求出这些坐标在区段中所处的位置。
  + $(127,93,-29)$
  + $(-9825,2,193)$
  + $(83,48,-2148)$
  + $(-293,212,-249)$
+ 在一个均为空气方块的区域中，若一个位于区块$[2,-3]$的命令执行者使用命令：
  #codebox("setblock x 0 0 command_block")
  其中$x$为未知数，此时渲染距离为10。
  + 若命令方块能够被正常放置，求$x$的最大值和最小值。
  + 若放置的命令方块能被红石激活且执行命令，求$x$的最大值和最小值。
+ 在初始情况下没有强加载区块的区域中依次执行以下命令：
  #codebox("forceload add 12 17 124 156")
  #codebox("forceload remove -13 14 100 110")
  求最终指定的强加载区块数量。
= UUID与目标选择器
一些命令，诸如 `/tp`、`/spreadplayers` 等，不可避免地会与实体产生互动。这些命令基本上都会使用有如 `minecraft:entity`、`minecraft:game_profile` 的参数类型。这些参数类型的表示方式是：如果要选择特定玩家，则可以直接指定*玩家的名称*，选择其他实体的情况则可能需要使用其他的参数，这便是下文所讲的UUID和目标选择器。
#pagebreak()
== UUID
实体种类繁多，不同的实体可能拥有不同的名称，存储有不同的NBT数据，行为、基础属性也不尽相同。为了区分这些实体，现在给每个实体单独派发一张“身份证”，每张“身份证”都标有一个号码，这些号码彼此之间各不相同。这些用于区分不同对象的数字串即*通用唯一识别码（Universally Unique Identifier，简称UUID）*#index("UUID（Universally Unique Identifier，通用唯一识别码）")。

UUID具有以下性质：
===== 唯一性
每个UUID对应一个对象，在不使用修改器的情况下，不存在共用同一个UUID的多个实体。因此可以通过指定一个UUID以选择唯一的对象，此举使得目标的选择变得精准、无差错。游戏内部存在随机数生成器以保证每次生成的UUID都是不同的。
===== 大容量
UUID为128位数。因此UUID支持二进制下从$-2^127$到$2^127-1$的所有整数值。

UUID有以下几种表示方式：
#reset-h5
===== #proper-noun(display: "有连字符的十六进制（Hyphenated hexadecimal）", "you3 lian2 zi4 fu2 de shi2 liu4 jin4 zhi4")
使用32位长的16进制表示，拆分成五个部分，相邻部分之间用连字符隔开，格式为
#codebox("<8位>-<4位>-<4位>-<4位>-<12位>")
例如，一个开启的、朝向为东的铁门可写成如下的形式：
#codebox("0a324608-a033-42f4-b753-c34de1ad3154")
其中每一部分都单独作为一个数字处理，允许存在先导零，也可以不写先导零。*UUID作为单独的参数使用时，通常使用这种写法。*
#example(
  [已知一个玩家的UUID为654c6848-d79d-4e07-bbf4-0a88e65a57ef，尝试将命令执行者传送至该玩家。],
  [
    根据 `/tp` 的语法，命令为
    #codebox("tp 654c6848-d79d-4e07-bbf4-0a88e65a57ef")
  ]
)
在聊天栏中输入命令时，若遇到参数类型 `minecraft:entity`，且此时执行者的视线正好指向另一个实体的碰撞箱，则自动补全会以有连字符的十六进制的形式显示指向实体的UUID。
===== #proper-noun(display: "十六进制（Hexadecimal）", "shi2 liu4 jin4 zhi4")
使用32位长的16进制表示但不使用连字符。其中的每个零都不能被省略，例如
#codebox("00000001000100010001000000000001")
===== #proper-noun(display: "整型数组（Int array）", "zheng3 xing2 shu4 zu3")
在NBT中使用，使用4个10位的十进制数表示，例如
#codebox("[I;1699506248,-677556729,-1141634424,-430286865]")
== 目标选择器
=== 目标选择器变量
通过玩家名称或UUID选择目标，每次只能选择一个。若需要批量选择或附加特定的限制条件，则这两种方法就无能为力了。而穷举玩家名称或UUID明显不是一种有效的办法。命令系统提供了一种高效选择目标实体的参数，即#proper-noun(display: "目标选择器（Target selectors）", "mu4 biao1 xuan3 ze2 qi4")。

目标选择器共有6种变量：`@p`、`@r`、`@a`、`@e`、`@s`、`@n`。下面将逐个介绍这6种变量的功能：
===== `@p`
用于选择距离命令执行者*附近的玩家*，如果有多个玩家与命令执行者的距离相同，则会选择最后进入服务器的玩家。该变量也可用于选择死亡的玩家。

例如，如果一个命令执行者位于$(0,70,0)$，有两个玩家分别位于$(13,70,0)$和$(-14,0,0)$，显然位于$(13,70,0)$的玩家距离命令执行者更近一些，因此 `@p` 会选择该玩家。
  
如果命令执行者为玩家，则直接使用 `@p` 会指向身为命令执行者的玩家本身。比如，在聊天栏内输入命令
#codebox("tp @p <x> <y> <z>")
会将玩家自身传送至指定的坐标。
===== `@r`
用于选择*随机的玩家*，也可用于选择死亡的玩家。
===== `@a`
用于选择*所有的玩家*，死亡的玩家也会被包括在内，已卸载区块内的实体不会被选择。
===== `@e`
在已加载的区块中选择*所有存活的实体*，已卸载区块内的实体不会被选择。
===== `@s`
用于选择*当前实体，即命令执行者本身*，无论命令执行者是否存活。若在命令方块或服务器控制台中引用该变量，则不会选择任何的实体。
===== `@n`
与 `@p` 类似，但用于选择距离命令执行者*附近的实体*。

下表总结了这些目标选择器变量的功能：
#general-table(
  caption: "目标选择器变量特性表",
  colspan: 4,
  columns: (auto, auto, auto, auto),
  header: ([目标选择器变量], [作用实体], [关键词], [能否选择死亡的实体]),
  [`@p`], [仅玩家], [附近], [能],
  [`@r`], [仅玩家], [随机], [能],
  [`@a`], [仅玩家], [所有], [能],
  [`@e`], [所有实体], [所有], [否],
  [`@s`], [所有实体], [当前], [能],
  [`@n`], [所有实体], [附近], [否]
)
=== 目标选择器参数
目标选择器的六种变量仅提供了最基础的实体选择功能，可以在此基础上为这些变量添加一些限定条件以进一步选择需要的实体。这些限定条件被称为#proper-noun(display: "目标选择器参数（Target selector arguments）", "mu4 biao1 xuan3 ze2 qi4 can1 shu4")。要添加这些参数，只需要在目标选择器变量后方添加方括号，在方括号内输入参数名及其值，参数与参数之间用逗号隔开，方括号与目标选择器变量之间不能有空格，语法为：
#codebox("<目标选择器变量>[参数名=值,参数名=值]")
示例：
#codebox("@p[team=A]")
#codebox("@e[type=creeper,limit=1]")
当目标选择器含有多个参数时，所有的参数都会被计算，这有点类似于“与”逻辑运算，这也意味着可以在同一个目标选择器中设置多个限定条件。但在同一个目标选择器中，大部分情况下的参数名不能出现两次，否则该选择器将无法被解析。错误示例：
#codebox("@e[type=sheep,type=cow]")
由于不存在既为绵羊又为牛的实体，因此该选择器不会被解析。

参数的值可以为数字、浮点数范围或字符串，当值为字符串时，可以使用 `=!` 进行反选，即选择参数不为该值的实体，语法为：
#codebox("<目标选择器变量>[参数=!值,参数=!值]")
*当一个参数定义为反选时，该参数在同一个目标选择器中允许出现两次。*其中的逻辑关系可以通过举例说明：无法选择既为鸡又为牛的生物，但可以选择既不为鸡又不为牛的生物，这时候用于选择实体类型的参数就可以在同一个目标选择器中出现两次。

目标选择器的参数种类繁多，本教程将这些参数分为若干个类别，下面是每一类参数的具体介绍：
==== 原点参数
原点使用一组双精度浮点数作为参数的值，共包括了 `x`、`y`、`z` 三个参数，用于在世界中定义一个位置。参数的值可以为小数，原点的坐标不适用中心校准，所有原点坐标一律使用其实际坐标。用法举例：
#codebox("[x=0,y=57,z=0]")
这个选择器参数定义了精确的原点$(0.0,57.0,0.0)$。原点参数是可选的，三个参数均可选填。当某个坐标的参数未定义值时，则在未指定的坐标轴上使用命令执行位置。例如，定义下列参数：
#codebox("[x=0,z=0]")
由于参数 `y` 未定义，则使用命令执行位置的$y$坐标作为参数 `y` 的值。若三个参数均未定义值，则完全使用命令执行位置。

一般而言，原点参数需要配合距离、体积、排序或数量参数使用，*不配合这些参数单独使用原点参数是无效的*。
==== 距离参数
距离参数的参数名为 `distance`，值可以为浮点数或浮点数范围，但必须为非负数，其用于选择与位置锚点有特定距离的实体，使用#proper-noun(display: "欧几里得距离（Euclidean distance）", "ou1 ji3 li3 de2 ju4 li2")。若指定了原点（球心），与该点之间有特定距离的点的集合为一个球面，因此距离参数也可以被理解为通过球形空间选择实体。概括地说，距离参数一共有以下四种用法：
===== 球面选择
若定义位置锚点参数分别为$x_1$、$y_1$、$z_1$，距离参数为$d$，设实体坐标为$(x_2,y_2,z_2)$，当且仅当满足关系式#box(baseline: 30%, inset: (y: 0.5em))[$d=sqrt((x_1-x_2)^2+(y_1-y_2)^2+(z_1-z_2)^2)$]，该实体才会被选择。语法为：
#codebox("[distance=<值>]")
该用法要求实体与锚点有特定的距离。在空间上看，选择的区域仅为一层球面，处于球内的实体不会被选择。
===== 球体选择
若定义位置锚点参数分别为$x_1$、$y_1$、$z_1$，距离参数为$d$，设实体坐标为$(x_2,y_2,z_2)$，实体被选择时需要满足关系式#box(baseline: 30%, inset: (y: 0.5em))[$d lt.eq.slant sqrt((x_1-x_2)^2+(y_1-y_2)^2+(z_1-z_2)^2)$]。只需定义上限临界值，语法为：
#codebox("[distance=..<值>]")
由于被选择的实体必须小于或等于 `distance` 定义的值，因此被选择的区域在空间中形成一个实心的球体。
#figure(
  caption: "距离参数定义的球面（左）和球体（右）",
  image("图片/距离参数定义的球面（左）和球体（右）.png", width: 20em)
)
===== 球体反选
若定义位置锚点参数分别为$x_1$、$y_1$、$z_1$，距离参数为$d$，设实体坐标为$(x_2,y_2,z_2)$，实体被选择时需要满足关系式#box(baseline: 30%, inset: (y: 0.5em))[$d gt.eq.slant sqrt((x_1-x_2)^2+(y_1-y_2)^2+(z_1-z_2)^2)$]。只需定义下限临界值，语法为：
#codebox("[distance=<值>..]")
在这种情况下被选择的实体必须大于 `distance` 定义的值，在欧式空间中的位置锚点周围挖去一个球体，剩下的无限大区域就是该情况选择的范围。读者可以理解为“球体反选”，即选择不属于该球体的区域。但是球体反选在游戏中受制于区块的加载，选择的区域并不是无穷大的。
===== 球壳选择
球壳选择定义了两个参数，一个为上限$d_"MAX"$，另一个为下限$d_"min"$，即选择距离锚点不超过$d_"MAX"$又不小于$d_"min"$的实体。现定义位置锚点参数分别为$x_1$、$y_1$、$z_1$，设实体坐标为$(x_2,y_2,z_2)$，则被选择的实体需满足#box(baseline: 30%, inset: (y: 0.5em))[$d_"min" lt.eq.slant sqrt((x_1-x_2)^2+(y_1-y_2)^2+(z_1-z_2)^2) lt.eq.slant d_"MAX"$]。需要定义两个临界值，语法为：
#codebox("[distance=<下限>..<上限>]")
在空间内，选择的区域为一个有厚度的球壳（注意与没有厚度的球面区分）。
#figure(
  caption: "球壳（左）和球壳沿某一方向的剖面（右）",
  image("图片/球壳（左）和球壳沿某一方向的剖面（右）.png", width: 20em)
)
==== 体积参数
体积参数用于在长方体区域内选择实体，具体方法为：在原点的基础上沿三个坐标轴延伸一定的距离，组成的区域为一个长方体。体积参数共分为三个参数：`dx`、`dy` 和 `dz`，三个参数均可以为负数。当参数为正数时，选择的区域会在其对应的坐标轴正方向上延伸特定的长度；若为负数则往负方向延伸。语法为：
#codebox("[dx=<值>,dy=<值>,dz=<值>]")
设原点坐标$(x,y,z)$，三个体积参数值分别为$"d"x$、$"d"y$、$"d"z$，理论上该原点对应的体对角坐标为$(x+"d"x,y+"d"y,z+"d"z)$；但根据#link("https://bugs.mojang.com/browse/MC/issues/MC-123441")[MC-123441]，实际上三条边长分别为$abs("d"x+1)$、$abs("d"y+1)$、$abs("d"z+1)$，该特性至今仍存在于游戏中。
#figure(
  caption: "体积参数均为正时的长方体区域",
  image("图片/体积参数均为正时的长方体区域.png", width: 20em)
)
不同于其他的位置参数，当实体的碰撞箱与长方体区域有重叠时，该实体就会被选择。若$"d"x$、$"d"y$和$"d"z$参数定义值为 `0` 时，只要锚点位于实体的碰撞箱内，该实体就会被选择。
#example(
  [
    写出符合下列要求的目标选择器。
    + 距离命令执行者10格以内的所有实体； <enu:dx_dy_dz_1>
    + 距离点$(72,76,155)$15格开外又不超过32格的所有玩家；
    + 由$(-13,40,32)$和$(10,55,67)$决定的长方体区域内的随即玩家。 <enu:dx_dy_dz_3>
  ],
  [
    @enu:dx_dy_dz_1 至@enu:dx_dy_dz_3 题所需的选择器如下所示，其中第@enu:dx_dy_dz_3 小题答案不唯一：
    #codebox("@e[distance=..10]")
    #codebox("@a[x=72,y=76,z=155,distance=15..32]")
    #codebox("@r[x=-13,y=40,z=32,dx=23,dy=15,dz=35]")
  ]
)
==== 水平旋转参数
水平旋转的参数名为 `y_rotation`。当选择特定偏航角的实体时，有如下语法：
#codebox("[y_rotation=<值>]")
同样地、水平旋转参数地值也可以是浮点数范围，当定义了两个临界值（含）时，语法可以为：
#codebox("[y_rotation=<最小偏航角>..<最大偏航角>]")
该语法用于选择偏航角介于定义的最小偏航角和最大偏航角（含）之间的实体。举例：
#codebox("[y_rotation=-10..10]") <code:y_rotation_-10_10>
该参数用于选择偏航角介于 `-10` 和 `10` 之间的实体。在以右为$z$轴正方向、以上为$x$轴正方向建立的平面坐标系中，偏航角的范围可以表示为（阴影部分）：
#figure(
  caption: "",
  image("图片/[y_rotation=-10..10].png", width: 14em)
) 
给一个偏航角参数加上或减去360，则新的偏航角参数与原来的偏航角参数等效。对于目标选择器中超出$[-180,180)$范围的参数，可以对其加上或减去360换算到合适的区间，例如下面的目标选择器参数选择的范围与@code:y_rotation_-10_10 一致：
#codebox("[y_rotation=-10..370]")
#codebox("[y_rotation=-190..10]")
#codebox("[y_rotation=-190..730]")
对于下面的参数：
#codebox("[y_rotation=10..190]")
将 `190` 换算为 `-170` 后，结果为
#codebox("[y_rotation=10..-170]")
发现最大的偏航角参数反而比最小的偏航角小。不妨对这个范围取反，选择偏航角位于 `10..-170` 的实体相当于选择偏航角不位于 `-170..10` 的实体，即对@fig:y_rotation (a) 的范围取反，得到@fig:y_rotation (b) 所示的范围。
#sub-figure(
  caption: "",
  label: <fig:y_rotation>,
  [#image("图片/[y_rotation=-170..10].png", width: 14em)\(a)],
  [#image("图片/[y_rotation=10..-170].png", width: 14em)\(b)]
)
综上所述，*对于任意的水平旋转参数，先将所有超出$[-180,180)$的角度换算到该值域内，若换算后存在下限比上限大的浮点数范围，则交换上下限，对交换上下限后的范围进行取反*，最终得到实际的偏航角角度范围。
==== 竖直旋转参数
竖直旋转的参数名为 `x_rotation`，用于选则有特定俯仰角的实体。与水平旋转有所不同的是，*竖直旋转的参数被严格限定在$[-90,90]$*。当选择特定俯仰角的实体时，有如下语法：
#codebox("[x_rotation=<值>]")
同样地、竖直旋转参数的值也可以是浮点数范围，当定义了两个临界值（含）时，语法可以为：
#codebox("[y_rotation=<最小俯仰角>..<最大俯仰角>]")
举例：在以上为$y$轴正方向建立的坐标系中，参数
#codebox("[x_rotation=-45..45]")
表示的范围如@fig:x_rotation_-45_45 所示。
#figure(
  caption: "",
  image("图片/[x_rotation=-45..45].png", width: 14em)
) <fig:x_rotation_-45_45>
如果存在下面的参数：
#codebox("[x_rotation=45..-45]")
显然最大的俯仰角比最小的俯仰角小，同水平旋转参数一样，不妨对这个范围取反，选择俯仰角位于 `45..-45` 之间的实体即选择俯仰角不位于 -45..45 之间的实体，而俯仰角位于 `-45..45` 的范围已经由@fig:x_rotation_-45_45 给出，只需对这个范围取反即可，如@fig:x_rotation_45_-45 所示。
#figure(
  caption: "",
  image("图片/[x_rotation=45..-45].png", width: 14em)
) <fig:x_rotation_45_-45>
综上所述，*对于任意的水平旋转参数，若存在下限比上限大的浮点数范围，则交换上下限，对交换上下限后的范围进行取反*，最终得到实际的俯仰角角度范围。
==== 记分板标签参数
*记分板标签*是一种将实体分类的方法，由节@sec:team_and_tag 的命令为实体赋予记分板标签后，就可以在目标选择器中使用记分板标签参数选择这些被分类后的实体了。记分板标签参数名为 `tag`，是少有的可以在非反选的情况下于同一个目标选择器中多次出现的参数，这是由于同一个实体可以被赋予多个不同的记分板标签。语法为：
#codebox("[tag=<标签名>]")
#codebox("[tag=<标签名>,tag=<标签名>]")
其中的标签名均为字符串，因此也可以通过 `=!` 对实体进行反选，即选择没有定义该记分板标签的实体，语法为：
#codebox("[tag=!<标签名>]")
例如，要选择一个实体，而该实体带有记分板标签 `A` 和 `B`，则这两个目标选择器参数都能选中该实体：
#codebox("[tag=A]")
#codebox("[tag=B]")
若游戏内存在其他只带有记分板标签 `A` 或 `B` 的实体，而只需选择同时带这两个记分板标签名实体时，可以进一步将参数写成：
#codebox("[tag=A,tag=B]") <code:target_selector_tag_a_tag_b>
带有记分板标签 `A`、`B` 两者之一的实体不会被选择。
若游戏内存在其他同时带有记分板标签 `A`、`B` 和 `C` 的实体，则该实体满足既有记分板标签 `A`、又有记分板标签 `B` 的限定条件，则参数@code:target_selector_tag_a_tag_b 也会选择到该实体。若只需选择仅带有 `A` 和 `B` 两个记分板标签的实体，就需要把参数写成：
#codebox("[tag=A,tag=B,tag=!C]")
即选择带有记分板标签 `A` 和 `B` 而不带有记分板标签 `C` 的实体。

特别地、当记分板标签参数的值为空时，会选择所有没有记分板标签的实体：
#codebox("[tag=]")
若对其进行反选，则会选择所有拥有记分板标签的实体：
#codebox("[tag=!]")
==== 队伍参数
同记分板标签一样，队伍也是记分板的重要组成部分。一个玩家最多只能存在于一个队伍中，因此同一个目标选择器中队伍参数最多只能出现一次。队伍参数的参数名为 `team`，语法：
#codebox("[team=<队伍名>]")
选择不属于某队伍的实体：
#codebox("[team=!<队伍名>]")
当队伍参数的值为空时，会选择所有不属于任何队伍的实体：
#codebox("[team=]")
若进行反选，则会选择所有属于任意队伍的实体：
#codebox("[team=!]")
==== 记分项参数
记分项参数的作用为：当实体在某一个或多个记分项上的分数同时满足定义的分数范围时，该实体就会被选择。记分项参数支持同时定义多个记分项的选择范围，语法格式较一般的目标选择器参数有所不同，即在参数值的位置上加花括号，在花括号中定义各记分项的分数范围，记分项之间用逗号隔开：
#codebox("[scores={<记分项>=<值>}]")
#codebox("[scores={<记分项>=<值>,<记分项>=<值>}]")
定义的记分项分数可以为特定的值或整数范围，例如选择在记分项 `[A]` 的分数介于12至15之间、在记分项 `[B]` 的分数为10的实体：
#codebox("[scores={A=12..15,B=10}]")
==== 名称参数
名称参数用于选择有特定名称的实体，语法为：
#codebox("[name=<名称>]")
此参数接受反选，即选择不是该名称的实体：
#codebox("[name=!<名称>]")
名称必须为字符串，不能包含文本组件。若名称中含有空格，则需在字符串两端添加引号，如：
#codebox("[name=\"A  B\"]")
如果名称中含有双引号 `"` ，则应在名称的双引号前使用反斜杠 `\` 对双引号进行转义。
==== 实体类型参数
实体类型参数用于选择特定类型的实体，语法为：
#codebox("[type=<实体类型>]")
接受反选，即选择不为该类型的实体：
#codebox("[type=!<实体类型>]")
实体类型的值必须为一个有效的命名空间ID或数据包标签。当定义命名空间ID时，位于命名空间 `minecraft` 内的实体ID可以省略命名空间前缀。如果值需要是数据包实体标签，示例有：
#codebox("[type=#raiders]")
这个参数用于选择位于 `#raiders` 标签下的实体，这类实体包括唤魔者、卫道士、掠夺者、女巫等，`#raiders` 为默认命名空间 `minecraft` 下的标签，因此这里省略了 `minecraft` 的命名空间前缀。读者也可以在数据包中自定义标签，这些自定义标签也可用于选择实体。

要特别之处的是，目标选择器是一个非常占用游戏运算的组件，因为游戏需要根据选择器中的参数一一遍历实体。尤其是当制作的冒险地图、数据包中目标选择器数量过多时，如无特别要求，应尽量在选择器中使用 `type` 参数，这样游戏就可以仅遍历特定类型的实体，从而减少运算量。#cite(<datapack_optimize>, form: none)
==== 排序参数
在计算机领域中，#proper-noun(display: "排序算法（Sorting algorithm）", "pai2 xu4 suan4 fa3")通常指将一些数据排列成为一组有序序列的过程。在MC-CMD中也可以通过这种思路将实体排序，并依照序列处理实体。目标选择器变量便提供了排序算法，例如，变量 `@p` 用于选择命令执行者附近的实体，则游戏会将所有实体按照与命令执行者间的距离进行排序，然后选取距命令执行者更近的玩家。

目标选择器一共提供了四种不同的排序方式，它们分别是 `nearest`、`furthest`、`random`、`arbitrary`。语法为：
#codebox("[sort=(nearest|furthest|random|arbitrary)]")
#param-desc(
  prefix: "这四种排序方式的作用分别为：",
  [`nearest` ], [将实体由近及远排序，即优先选择最近的实体，是变量 `@p` 和 `@n` 的默认排序方式。],
  [`furthest` ], [将实体由远及近排序，即优先选择最远的实体。],
  [`random` ], [将实体随机排序，是变量 `@r` 的默认排序方式。],
  [`arbitrary` ], [将实体按生成时间由先到后排序，即优先选择先生成的实体, 是变量 `@a` 和 `@e` 的默认排序方式。]
)
对实体进行排序后，目标选择器会根据排序得到的结果对实体进行一个筛选。这时候可以结合下文所述的数量参数来一次性选择特定数量符合要求的实体。
==== 数量参数
数量参数的语法为：
#codebox("limit=<值>")
数量参数的值只能为正整数，不接受浮点数范围。事实上，这个数量参数充当了“最大选择数量”的角色，当场上所有符合要求的实体数小于该值时，则所有符合要求的实体都会被选择；反之则会在所有符合要求的实体中选择数量为该值的实体。
#wrap-content(
  tips(
    [
      变量 `@p` 实际上与 `@a[limit=1,sort=nearest]` 等效。同样，变量 `@n` 与 `@e[limit=1,sort=nearest]` 等效。考虑命令的可读性、直观性，一般使用前者，这样做既省去了不必要的累赘，又适当压缩了命令的长度。
    ],
    width: 15em
  ),
  [
    
    目标选择器变量 `@p` 和 `@r` 的数量参数默认为1，即分别选择距命令执行者最近和随机的一个实体。可以定义其他数量参数的值来扩大可选的实体数量，例如：`@p[limt=3]` 可用于选择距命令执行者最近的三个玩家。`@r[limit=5]` 可用于选择随机的五个玩家。

    变量 `@a` 和 `@e` 没有默认的数量参数值，因为它们是分别用于选择所有玩家和所有实体的变量。这时候使用数量参数会限制选择的实体数量。
  ],
  align: right
)
#example(
  [
    如@fig:target_selector_limit_example 所示，空间中有实体A \~ K和命令执行位置O。其中●代表玩家，■代表非玩家实体。
    #figure(
      caption: "",
      image("图片/目标选择器limit参数例题.png", width: 14em)
    ) <fig:target_selector_limit_example>
    + 写出下列目标选择器所选择的实体：

      `@a`、`@a[limit=3,sort=nearest]`、`@e[limit=4,sort=furthest]`
    + 写出可用于选择D、G、J三个实体的目标选择器。
  ],
  [
    对于在空间内分布的实体，一般先对其进行排序，主要按照其与命令执行位置之间的距离、实体类型进行排序。按照离命令执行位置由近及远的排序结果如下表所示：
    #general-table(
      caption: "排序结果",
      colspan: 12,
      columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
      header: ([序号], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11]),
      [实体], [E], [D], [F], [I], [G], [J], [C], [H], [A], [B], [K],
      [距离], [$2 sqrt(2)$], [4], [5], [$sqrt(34)$], [$3 sqrt(5)$], [$sqrt(65)$], [$6 sqrt(2)$], [$sqrt(74)$], [$sqrt(130)$], [$sqrt(145)$], [$9 sqrt(2)$],
      [是否为玩家], [是], [否], [是], [是], [否], [否], [是], [否], [是], [否], [是]
    ) <tab:target_selector_limit_example>
    + 由上表可以很清晰地分析出排序的结果。`@a` 用于选择所有的玩家，即A、C、E、F、I、K；`@a[limit=3,sort=nearest]` 用于选择距命令执行者最近的三个玩家，值得注意的是，这里的命令执行者是一个玩家，故命令执行者本身也会被选择，由此可以通过上表找出序号靠前的两个玩家即可，即E、F，故该目标选择器选择的实体为O、E、K；`@e[limit=4,sort=furthest]` 用于选择距命令执行者最远的四个实体，即K、B、A、H。
    + 首先，D、G、J三个实体均为非玩家，因此可以使用 `type` 参数来限定选择的实体类型，选择不是玩家的实体，则可以使用反选。其次，观察@tab:target_selector_limit_example 不难发现，D、G、J是距离命令执行者最近的三个非玩家实体，故可以把目标选择器写成：
      #codebox("@e[type=!player,limit=3,sort=nearest]")
  ]
)
==== 游戏模式参数
游戏模式参数可用于选择处于该游戏模式的玩家，但也*仅能够用于选择玩家类型的实体*：
#codebox("[gamemode=<游戏模式>]")
选择不处于该游戏模式的玩家：
#codebox("[gamemode=!<游戏模式>]")
游戏模式参数只接受 `adventure`（冒险模式）、`creative`（创造模式）、`spectator`（旁观模式）和 `survival`（生存模式）四个值，这些值不能用数字代替。
==== 经验等级参数
经验等级参数通过定义玩家的经验等级以过滤玩家，仅能够用于选择玩家类型的实体，语法为：
#codebox("[level=<值>]")
其中的值可以为整型或范围。若值为范围形式，则上限和下限必须为整数。
==== 进度参数
进度参数通过玩家的进度来筛选玩家，*仅能够用于选择玩家类型的实体*。参数名为 `advancements`，值为用花括号包括的键值对#footnote[这里指诸如 `<键>=<值>` 形式的字符串，即有对应关系的键值。]，语法为：
#codebox("[advancements={<键>=<值>}]")
其中 `<键>` 为所指定进度的ID，`<值>` 必须为布尔值或用花括号包括的键值对，若为布尔值，则目标选择器用于筛选 `true`（是）`false`（否）取得该进度的玩家。例如，选择取得进度 #icon(name: "mine_stone") 石器时代 `story/mine_stone` 的玩家的目标选择器参数可以为
#codebox("[advancements={story/mine_stone=true}]")
若 `<值>` 的位置填充了用花括号包括的键值对，则语法又为：
#codebox("[advancements={<键>={<键>=<值>}}]")
在键值对中嵌套键值对的意义为：*根据进度JSON的格式，玩家取得一定进度一定是通过满足这个进度的某些判据达成的。*比如进度#icon(name: "obtain_armor")整装上阵 `story/obtain_armor` 的判据之一为装备过铁头盔 `iron_helmet`，可以选择通过装备铁头盔以取得进度整装上阵的玩家：
#codebox("[advancements={story/obtain_armor={iron_helmet=true}}]")
*其中被选择的玩家当前不必正在装备铁头盔。*这些判据的具体情况可以查阅数据包内的进度定义文件，读者也可以使用自定义的进度及其判据。
==== NBT参数
NBT参数用于选择有指定NBT的实体，有关NBT的内容参考@chap:nbt\及@chap:level_format，语法为：
#codebox("[nbt=<NBT>]")
在填写NBT时，需要加上花括号，括号内严格按照NBT的格式与层级关系填写。此处的NBT是一个测试NBT标签，用于对比实体的NBT数据，具体的对比规则见节@sec:testing_nbt。举例，选择所有手持石头的玩家：
#codebox("@a[nbt={SelectedItem:{id:\"minecraft:stone\"}}]")
此参数也可以使用反选以选择NBT不匹配的实体：
#codebox("[nbt=!<NBT>]")
然而，由于实体NBT的计算本身是耗费较大的项目，加上目标选择器本身的高消耗，因此不建议在目标选择器中定义NBT参数，应尽量改用@chap:command_execute\讲述的 `if data` 或 `if items` 子命令。或将实体数据存储于其他低消耗的媒介再进行测试比对。
==== 谓词参数
选择匹配指定战利品表谓词的目标，有关谓词的内容参考《数据包》教程，语法为：
#codebox("[predicate=<命名空间ID>]")
其中 `<命名空间ID>` 为指定谓词的命名空间ID，谓词文件的路径一定要填写正确。不能使用内联形式。若需要选择不匹配指定谓词的目标，则语法为：
#codebox("[predicate=!<命名空间ID>]")
同样，在目标选择器中直接指定谓词也是耗费较大算量的做法，为了优化命令的执行，应尽量改用@chap:command_execute\讲述的 `if predicate` 子命令。
#heading(level: 2, numbering: none, [第三章思考题与习题])
根据下面的要求，分别编写目标选择器：
+ 所有处于创造模式的玩家；
+ 任意3个玩家；
+ 距离$(3,2,4)$不超过10格又不小于5格、且距离该点最近的一个玩家；
+ 当前实体；
+ 既没有记分板标签A又没有记分板标签B的所有实体；
+ Johnny卫道士；
+ 在队伍 `frank` 中、`[ai]` 分数小于0的所有玩家；
+ 随机的一个实体；
+ 随机选择一个玩家，要求水平朝向范围和竖直朝向范围分别如下图所示：
  #sub-figure(
    caption: "",
    [#image("图片/第三章思考题与习题图1a.png", width: 14em)\(a)],
    [#image("图片/第三章思考题与习题图1b.png", width: 14em)\(b)]
  )
+ 由$(117,83,-95)$和$(120,90,-67)$决定的长方体区域内的所有标记；

  #[
    #set text(font: "Minecraft")
    \
    如@fig:chapter_3_exercise_2 所示，★为命令执行者（盔甲架）且位于同心圆圆心，●均为盔甲架，同心圆每往外一层，半径就增加4格，最里面的圆半径为4，据此选择第11 \~ 13题所需的实体。
    #figure(
      caption: "",
      image("图片/第三章思考题与习题图2.png", width: 11em)
    ) <fig:chapter_3_exercise_2>
  ]
+ A、C、E；
+ B；
+ A、D。
+ 过获取黑石 `blackstone` 以取得进度 #icon(name: "mine_stone") 石器时代 `story/mine_stone` 的所有玩家。
= NBT格式<chap:nbt>
一个面包、一块石砖、一只绵羊……这些游戏内容本质上是许多游戏数据构成的集合，Minecraft的游戏数据主要由这种格式存储——NBT。
#pagebreak()
== 概述
Minecraft存在一种用于存储数据的格式，即*二进制命名标签（Named Binary Tags），简称NBT*#index("NBT（Named Binary Tags，二进制命名标签）")，它是一种树状的数据存储格式，是由Mojang Studio首创的、极具Minecraft游戏特色的一种数据存储格式。NBT存储的内容比较精细化，主要包含方块、实体、物品等数据。
=== SNBT的概念
Minecraft中大部分具体游戏资源的数据都是以NBT文件的格式存储在游戏文件夹中的，这些具体的内容可能是——某一个方块、某一个区块、区块内某一个实体等。这些内容使用统一的NBT格式存储数据，鉴于其可读性较低，且在命令中无法直接处理这样的数据。因此在命令中使用一种便于编写的NBT格式，即*字符串化的二进制命名标签（Stringified NBT），简称SNBT*#index("SNBT（Stringified NBT，字符串化的二进制命名标签）")。当命令中的标签解析成功时，SNBT就会被转换为NBT以存储数据。

SNBT的基本格式为键值对。写法为
#codebox("<标签名>:<值>")
举例：
#codebox("tag:123")
SNBT的标签名允许包含字母A \~ Z、a \~ z、数字0 \~ 9、下划线 `_` 和引号 `"`，对大小写敏感，不允许含有空格、中文字符等其他字符（文件中存储的一些标签可能带有空格）。比如，`tag` 和 `Tag` 是两个不同的标签名。对于由多个单词组成的标签名，其命名方法一般有三种——#proper-noun(display: "大驼峰命名法（Upper camel case）", "da4 tuo2 feng1 ming4 ming2 fa3")，即所有单词首字母均大写，如 `CanDestory`；#proper-noun(display: "小驼峰命名法（Lower camel case）", "xiao3 tuo2 feng1 ming4 ming2 fa3")，即除首个单词外的所有单词首字母均大写，如 `maxUses`；#proper-noun(display: "蛇形命名法（Snake case）", "she2 xing2 ming4 ming2 fa3")，即所有字母均小写、单词之间用下划线隔开，如 `map_scale_direction`。近年来游戏新数据在标签名上一般采用蛇形命名法，且原有的数据标签名也逐步改为了蛇形命名法，为便于统一管理游戏数据，建议读者自己进行开发时，尽量使用蛇形命名法定义标签。
=== 数据类型与数据树
在SNBT中，对于每一个诸如 `<标签名>:<值>` 这样形式的内容，称其为一个单独的#proper-noun(display: "标签（Tag）", "biao1 qian1")。一个标签由三部分组成：一是*标签类型*，它用于决定该标签需要使用什么类型的数据；二是*标签名*，它用于区分不同的标签；三是*该标签存储的数据*，对于不同类型的标签，其需要的数据也不尽相同。NBT本身一共存在13种数据类型，在SNBT中一共可以使用13种标签类型，其中包含一种较为特殊的标签类型。本教程在介绍SNBT的语法时，采用与Minecraft Wiki一致的结构化树状图。下面分类介绍所有的数据类型：
#continue-h5([整型类数据])
===== #icon(name: "nbt-byte")#footnote[本教程使用这些图标表示各SNBT数据类型。] 字节型
#proper-noun(display: "字节型（Byte）", "zi4 jie2 xing2")占据1个字节，存储容量为$-128$ \~ 127，且数值必须为整数。在填写字节型数据时，可以在数值后面加一个字母 `b`，大小写均可，格式为：
#codebox("<标签名>:<值>b")
示例：
#codebox("Difficulty:2b")
结构化表示为
#tree(
  (0, [#icon(name: "nbt-byte") *Difficulty*: `2`])
)
这个字母 `b` 被称为数据的后缀，后缀用于决定该数据为何种类型的数据，同时也有助于将SNBT转换为NBT。字母 `b` 决定了这个数据为字节型数据。不过后缀是可选的，因为NBT的数据类型是自动更正的。然而笔者还是强烈建议不要省略后缀以避免小概率解析不成功的情况。
===== #icon(name: "nbt-bool") 布尔值
NBT本身并没有#proper-noun(display: "布尔值（Bool）", "bu4 er3 zhi2")这种数据类型，因此使用字节型数据的 `0b` 来表示布尔值中的“假”，用非 `0b` 的数据来表示布尔值中的“真”。但出于习惯，一般用 `1b` 来表示“真”。在SNBT中可以直接使用 `true` 和 `false`，它们分别能转换为NBT格式的\code `1b` 和 `0b`。事实上，在SNBT中直接使用字节形式的 `1b` 和 `0b` 也是可接受的。示例：
#codebox("NoAI:true")
或
#codebox("NoAI:1b")
结构化表示为
#tree(
  (0, [#icon(name: "nbt-bool") *NoAI*: `true`])
)
===== #icon(name: "nbt-short") 短整型
#proper-noun(display: "短整型（Short）", "duan3 zheng3 xing2")占据2个字节，存储容量为$-32768$ \~ 32767，且值必须为整数。该数据类型需要的后缀为 `s`，大小写均可。示例：
#codebox("Fire:10s")
结构化表示为
#tree(
  (0, [#icon(name: "nbt-short") *Fire*: `10`])
)
===== #icon(name: "nbt-int") 整型
#proper-noun(display: "整型（Int）", "zheng3 xing2")是非常常见的一种数据类型，被用于存储大量的标签数据。它占据4个字节，存储容量为$-2^31$ \~ $2^31-1$（即$-2147483648$ \~ 2147483647），值必须为整数。该数据类型需要的后缀为 `i`，大小写均可，也可以不写这个后缀。示例：
#codebox("Age:20")
结构化表示为
#tree(
  (0, [#icon(name: "nbt-int") *Age*: `20`])
)
若在填写其他数据类型时没有加后缀，则实际上填写的数据类型默认为整型，因此需要经过更正才能被识别。如果数据不在整型可用范围内，则需使用 #icon(name: "nbt-long") 长整型，并添加 #icon(name: "nbt-long") 长整型的类型后缀。
===== #icon(name: "nbt-long") 长整型
#proper-noun(display: "长整型（Long）", "chang2 zheng3 xing2")可用于存储绝对值很大的数据，其占据8个字节，存储容量为$-2^63$ \~ $2^63-1$（即$-9223372036854775808$ \~ 9223372036854775807），值同样需要为整数。长整型数据的后缀为 `l`（注意不是字母i的大写），大小写均可。示例：
#codebox("DeathLootTableSeed:7214855795308447l")
#linebreak()

上述四种数据类型均为整数形式，可以在类型后缀处添加 `s` 或 `u` 分别代表有符号或无符号的数据，如果为无符号数据，则表示负数时需要在数值前添加 `-`。格式为
#codebox("<值><符号><类型后缀>")
例如，`129sb` 即为有符号的字节型数据，它等同于 `-127b`、`-127sb`，但 `129ub` 作为无符号字节型数据超出了其可用范围，故无效。*如果对整型数据指定有无符号，则整形数据的后缀 `i` 不能缺省。*例如 `123u` 的写法是错误的，必须要写成 `123ui`；`123s` 会被识别为短整型数据，正确的有符号整型数据应写为 `123si`。

这些数据类型还可以使用二进制和十六进制，若为二进制，则需要在值前添加 `0b` 前缀；若为十六进制，则需要在值前添加 `0x` 前缀。例如，`0b1001` 即为整型的值 `9`，`0xcad` 即为整型的值 `3245`。值前面不加任何前缀时，为十进制数据。

进制前缀还可以与类型后缀结合使用，例如 `0b1100b` 表示二进制的值 `12b`，`0xabl` 表示十六进制的长整型数据 `171l`，`0xaub` 表示无符号的十六进制字节型数据 `10b`，`0b11ss` 表示有符号的二进制短整型数据 `3s`。*如果使用十六进制字节型数据，则符号类型后缀 `s` 或 `u` 不能缺省，这是因为字节型类型后缀 `b` 也是有效的十六进制数字。*例如，`0xab` 会被识别为整型数据 `171`，字节型数据的写法应为 `0xasb` 或 `0xaub`。

没有符号类型后缀 `s` 或 `u` 时，默认十进制数有符号，而二进制数和十六进制数无符号。无论值有没有符号，数字的前面一定不能带有前导零，如 `1` 不能写成 `01`、`-1` 不能写成 `-01`，否则该数据就会失效，这是因为带有 `0` 前缀的数据一般表示八进制数，SNBT规避了这种写法以防止冲突。

此外，数字之间允许有下划线 `_` 分隔，但下划线不能位于数值的开头或结尾。
#continue-h5([浮点数类数据])
===== #icon(name: "nbt-float") 单精度浮点数
#proper-noun(display: "单精度浮点数（Float）", "dan1 jing1 du4 fu2 dian3 shu4")采用IEEE754标准，占据4个字节，长度为32位。它用于存储一个实型数据，数据可以带符号，如 `1.2`、`-0.5` 等。单精度浮点数使用字母 `f` 作为它的数据后缀。
===== #icon(name: "nbt-double") 双精度浮点数
#proper-noun(display: "双精度浮点数（Double）", "shuang1 jing1 du4 fu2 dian3 shu4")同样采用IEEE754标准。它占据8个字节，长度为64位，能用于存储精度比单精度浮点数更高的实型数据。双精度浮点数使用字母 `d` 作为它的数据后缀。

#linebreak()

浮点数小数点后面的位数不定，这取决于其所存储的数值的整数位数，但是双精度浮点数存储的数据一般带有更多的小数点位数。浮点数可以写成整数形式或小数形式，如 `2f`、`1.5f`、`10d` 等。虽然小数点不是必要的，但还是建议为数值为整数的浮点数加上小数点，可以精确到小数点后一位，比如，将 `1f` 写成 `1.0f` 的形式。不同于整型，浮点数的整数部分可以带有前导零，`1.0f` 和 `01.0f` 均可以识别。

带小数点的浮点数分为整数和小数两个部分，这两个部分都是可以省略的。若省略整数部分，则默认在整数部分补上0，如 `.4f` 会被识别为 `0.4f`；若省略小数部分，则默认会在小数部分补上0，如 `1.f` 会被识别为 `1.0f`。

浮点数还可以用科学计数法表示。数学上科学计数法一般写作$m times 10^n$，在浮点数中，科学计数法就可以写作 `<m>e<n>`，例如$1.2 times 10^(-2)$就可以写作 `1.2e-2`。其中，$m$被称为尾数，必须是带符号的浮点数，可以为整数也可以为小数；而$n$被称为指数，它只能是带符号的整数。此外，尾数和指数均必须有数值，不能为空。例如，`4.5e4`、`.2e-3`、`4.e+2`、`03e0`（允许带有前导零、指数可以为0）均为正确的科学计数法表示；而 `e9`（尾数缺失）、`-3e`（指数缺失）、`.2e-.2`（指数不能为浮点数）均为错误的科学计数法表示。
#continue-h5([字符串类数据])
===== #icon(name: "nbt-string") 字符串
#proper-noun(display: "字符串（String）", "zi4 fu2 chuan4")为若干任意字符按特定顺序的排列，允许包含中文、标点符号、特殊字符等。字符串最多允许存储32767个字节的字符。字符串必须被一对双引号或单引号定义。

字符串存在一些特殊字符的转义序列：
====== 单引号 `'`、双引号 `"`
若使用双引号定义字符串，则字符串中所有的双引号都需要用反斜杠进行转义；若使用单引号定义字符串，则字符串中所有的单引号都需要用反斜杠进行转义。如果字符串中含有双引号，则可以用单引号来定义字符串而不必为字符串中的引号加上反斜杠，反之亦然。举例：
#codebox("Name:\"\\\" is a quotation mark\"") <code:snbt_string_example_1>
#codebox("Name:'\" is a quotation mark'") <code:snbt_string_example_2>
结构化表示为
#tree(
  (0, [#icon(name: "nbt-string") *Name*: `" is a quotation mark`])
)
出于可读性要求、社区标准及 #icon(name: "vscode") VSCode中 #icon(name: "dhp") DHP扩展要求的书写规范，在字符串中一般需尽量规避转义行为，因此@code:snbt_string_example_1 的写法不符合可读性要求，应采用@code:snbt_string_example_2 的写法。若字符串中既有双引号又有单引号，则转义无法规避，此时正常使用反斜杠即可。
====== 反斜杠 `\`
反斜杠 `\` 直接使用反斜杠 `\` 转义即可，即 `\\`。
====== Unicode字符
字符串可以接受Unicode字符，使用十六进制表示。由以下方式对Unicode字符进行转义：
======= 如果Unicode码位于两位数以内，则使用 `\x`，如 `\x3e` 对应的字符为 `>`。
======= 如果Unicode码位于四位数以内，则使用 `\u`，如 `\u4e0a` 对应的字符为 `上`。
======= 也可以使用八位数的Unicode码，此时转义写法为 `\U`，如 `\U00004e0a` 对应的字符为 `上`。
======= 如果一个Unicode字符有名称，则可以使用名称指定之，格式为 `\N{名称}`。如字符 🗹 的名称为Ballot Box with Bold Check，则可以使用 `\N{Ballot Box with Bold Check}` 转义之。
====== 退格符 `\b`
====== 空格 `\s`
====== 水平指标符 `\t`
====== 换行符 `\n`
====== 换页符 `\f`
====== 回车 `\r`
#continue-h5([数组类数据])
===== #icon(name: "nbt-byte_array") 字节型数组
#proper-noun(display: "字节型数组（Byte array）", "zi4 jie2 xing2 shu4 zu3")将若干个*有序*字节型数据整合到一起。数组需要用方括号将所有数据包括起来，并在开头标上 `B;` 以定义该数组为字节型数组。`B;` 后面跟随若干个字节型数据，数据与数据之间用逗号 `,`（一定为英文逗号）隔开。数组末尾的数据后面允许添加且最多只能添加一个 `,`，其他数组类数据相同。格式为：
#codebox("[B;<字节型数据1>,<字节型数据2>,<字节型数据3>,…]")
数组内数据的顺序很重要，例如，`[B;1b,2b,3b]` 与 `[B;3b,2b,1b]` 是两个不同的标签数据。其中前者的结构化表示为
#tree(
  (0, [#icon(name: "nbt-byte_array")]),
  (1, [`1`]),
  (1, [`2`]),
  (1, [`3`])
)
数组内的数据会假定与使用与定义一致的数据类型，如 `[B;1,2,3]` 会被识别为 `[B;1b,2b,3b]`。
===== #icon(name: "nbt-int_array") 整型数组
#proper-noun(display: "整型数组（Int array）", "zheng3 xing2 shu4 zu3")是若干个整型数据构成的*有序列表*。其写法与上面字节型数组的写法类似，但数组开头为 `I;` 以定义该数组为整型数组。格式为：
#codebox("[I;<整型数据1>,<整型数据2>,<整型数据3>,…]")
===== #icon(name: "nbt-long_array") 长整型数组
#proper-noun(display: "长整型数组（Long array）", "chang2 zheng3 xing2 shu4 zu3")是若干个长整型数据构成的*有序列表*。其写法与上面字节型、整型数组的写法类似，但数组开头为 `L;` 以定义该数组为长整型数组。格式为：
#codebox("[L;<长整型数据1>,<长整型数据2>,<长整型数据3>,…]")
数组可以接受可用范围比该数组的定义更小的值，例如 `[L;1b,2,3l]` 会被识别为 `[L;1l,2l,3l]`。短整型数组虽然还未使用，但允许在整型数组和长整型数组中使用短整型的数据，如 `[L;1s,2s,3s]` 会被识别为 `[L;1l,2l,3l]`。
===== #icon(name: "nbt-list") 列表
#proper-noun(display: "列表（List）", "lie4 biao3")是若干个任意类型的数据构成的*有序列表*，NBT格式的列表内的数据类型需一致，但SNBT可接受类型不一致的异构列表，存储为NBT时会将不同的数据类型转换为相同的数据类型，例如列表内同时存在字节型数据和复合标签时，会将字节型数据按列表内位置套在另一个复合标签内再进行存储；从NBT读取为SNBT时，相同的数据类型并不会逆向转换为不同的数据类型。列表的开头不需要加任何的内容以表明它是哪种类型的数组，格式为：
#codebox("[<数据1>,<数据2>,<数据3>,…]")
若列表内的数据类型为字节型、整型或长整型，它们并不能视为 #icon(name: "nbt-byte_array") 字节型数组、#icon(name: "nbt-int_array") 整型数组或 #icon(name: "nbt-long_array") 长整型数组。例如，`[I;1,2,3]` 与 `[1,2,3]` 是两个完全不同的标签数据，前者为 #icon(name: "nbt-int_array") 整型数组，后者为 #icon(name: "nbt-list") 列表。其中前者的结构化表示为
#tree(
  (0, [#icon(name: "nbt-int_array")]),
  (1, [`1`]),
  (1, [`2`]),
  (1, [`3`])
)
#h(-2em)后者的结构化表示为
#tree(
  (0, [#icon(name: "nbt-list")]),
  (1, [#icon(name: "nbt-int") `1`]),
  (1, [#icon(name: "nbt-int") `2`]),
  (1, [#icon(name: "nbt-int") `3`])
)
#continue-h5([复合标签与数据树])
===== #icon(name: "nbt-compound") 复合标签
#proper-noun(display: "复合标签（Compound）", "fu4 he2 biao1 qian1")使得标签和标签的嵌套成为可能，其基本格式为
#codebox("<标签名>:{子标签}")
现在对这个格式进行进一步的解释：标签名和冒号为一个标签写法的组成部分，值的部分为一个花括号。一般称这一整个标签为#proper-noun(display: "父标签（Parent tag）", "fu4 biao1 qian1")，花括号内的内容被称为#proper-noun(display: "子标签（Children tag）", "zi3 biao1 qian1")。子标签允许存在多个不同的标签，这些子标签之间使用逗号逗号 `,` 分割，最后一个子标签后面允许添加且最多只能添加一个 `,`。每一个标签都是父标签的子标签，于是复合标签的基本格式又可以写成如下的形式：
#codebox("<父标签名>:{<子标签名1>:<值>,<子标签名2>:<值>,…}")
花括号内的子标签也可以成为下一级标签的父标签，于是又可以在子标签内嵌套子标签。将这些子标签分层命名为第一级子标签、第二级子标签……经过层层嵌套，最终可以得到如下所示的树形结构，这便是#proper-noun(display: "数据树（Data tree）", "shu4 ju4 shu4")的基本结构。
#tree(
  (0, [#icon(name: "nbt-compound") 父标签]),
  (1, [#icon(name: "nbt-compound") 第一级子标签]),
  (2, [#icon(name: "nbt-compound") 第二级子标签]),
  (3, [……]),
  (2, [#icon(name: "nbt-compound") 第二级子标签]),
  (3, [……]),
  (1, [#icon(name: "nbt-compound") 第一级子标签]),
  (2, [#icon(name: "nbt-compound") 第二级子标签]),
  (3, [……]),
  (2, [#icon(name: "nbt-compound") 第二级子标签]),
  (3, [……]),
)
然而，父标签和子标签的界限并不是明确的，它们只有相对的关系：一个父标签可能是上一级标签的子标签，一个子标签也可能是下一级标签的父标签，这就好比一棵树上分叉的树枝。不过，即使一棵树的枝干分叉再复杂、树枝的层级再多，它终究是有树干和根部的，这样的道理在数据树上仍成立。对于一个特定的游戏资源，如一个具有方块实体的方块、一个实体，游戏使用一棵数据树存储它所有的信息，在这棵数据树内存在一个标签，由这个标签衍生出所有的子标签，再经过层层嵌套、衍生，最终形成一棵数据树，这棵数据树就可以用于存储数据。对于这样的标签，可以给予其形象的名称：#proper-noun(display: "根标签（Root tag）", "gen1 biao1 qian1")，以将其比作一棵数据树的“根”。

在了解数据树的基本结构后，现在取数据树上一个小部分（可以不包含根标签）进行分析。假设一个标签 #icon(name: "nbt-compound") `Me` 衍生出来的数据树如下所示：
#tree(
  (0, [#icon(name: "nbt-compound") *Me*]),
  (1, [#icon(name: "nbt-string") *Name*: `Mu_xian`]),
  (1, [#icon(name: "nbt-string") *Game*: `Minecraft`]),
  (1, [#icon(name: "nbt-compound") *Country*]),
  (2, [#icon(name: "nbt-string") *Name*: `中国`]),
  (2, [#icon(name: "nbt-string") *Area*: `Asia`]),
  (2, [#icon(name: "nbt-string") *Language*: `汉语`])
)
相应地、它的SNBT格式为#footnote[为方便阅读，本教程部分SNBT会分行表示，在客户端内编写命令的时候不要使用回车键。]：
#codebox("Me:{
  Name:\"Mu_xian\",
  Game:\"Minecraft\",
  Country:{
    Name:\"中国\",
    Area:\"Asia\",
    Language:\"汉语\"
  }
}")
可以看到，标签 #icon(name: "nbt-compound") `Me` 一共有三个子标签，它们分别是 #icon(name: "nbt-string") `Name`、#icon(name: "nbt-string") `Game` 和 #icon(name: "nbt-compound") `Country`，存储的数据类型分别为字符串、字符串和复合标签。可以理解为，这三个子标签分属父标签 #icon(name: "nbt-compound") `Me` 的三个不同的属性，在查阅这些数据时，首先需要保证每种属性所对应标签的唯一性，不能让数据出现冲突、矛盾的地方。规定：*同一级子标签内不能存在标签名相同的标签。*

但是不难发现，标签 #icon(name: "nbt-compound") `Country` 作为一个复合标签，其三个子标签中也有一个名为 #icon(name: "nbt-string") `Name` 的标签，这是不是与上述规定有所冲突呢？答案是否定的。上述规定有一个前提——同一级子标签内，标签 #icon(name: "nbt-compound") `Country` 的子标签 #icon(name: "nbt-string") `Name` 与 #icon(name: "nbt-compound") `Me` 的子标签 #icon(name: "nbt-string") `Name` 不属于同一级子标签，因此标签名可以相同。*对于一个标签而言，其子标签的子标签不是它的子标签。*
  
标签 #icon(name: "nbt-compound") `Me` 的三个子标签，它们的数据类型也不尽相同。这是因为复合标签是对父标签多个不同属性的内容的描述，与同样可以存储多个数据的数组（包括列表）相比，复合标签中允许存在不同数据类型的标签；而对列表而言，即使在SNBT中写为异构列表，存储为NBT时所有数据类型必须一致。复合标签与数组的另一个区别是，复合标签内的所有子标签是不论次序的，标签的先后顺序不会影响到数据的处理或存储。而数组内数据的先后顺序很重要，数据顺序的改动会影响到数据存储的位置。

在数据树中，复合标签与数组是可以相互嵌套的，这意味着复合标签中可以有数组，而数组内的数据类型也可以是复合标签。下面给出了 #icon(name: "nbt") `<玩家>.dat` 数据树的一部分：
#tree(
  (0, [#icon(name: "nbt-compound") *Player*]),
  (1, [#icon(name: "nbt-int") *playerGameType*: `0`]),
  (1, [#icon(name: "nbt-list") *Inventory*]),
  (2, [#icon(name: "nbt-compound")]),
  (3, [#icon(name: "nbt-int") *count*: `1`]),
  (3, [#icon(name: "nbt-byte") *Slot*: `0`]),
  (3, [#icon(name: "nbt-string") *id*: `minecraft:diamond_sword`]),
  (2, [#icon(name: "nbt-compound")]),
  (3, [#icon(name: "nbt-int") *count*: `45`]),
  (3, [#icon(name: "nbt-byte") *Slot*: `1`]),
  (3, [#icon(name: "nbt-string") *id*: `minecraft:bread`])
)
它的SNBT格式为：
#codebox("Player:{
  playerGameType:0,
  Inventory:[
    {count:1,Slot:0b,id:\"minecraft:diamond_sword\"},
    {count:45,Slot:1b,id:\"minecraft:bread\"}
  ]
}")
可以看到标签 #icon(name: "nbt-compound") `Player` 的一个子标签 #icon(name: "nbt-list") `Inventory` 为一个列表，列表中的数据类型为 #icon(name: "nbt-compound") 复合标签，可以称它为复合标签的列表。#icon(name: "nbt-list") 列表和 #icon(name: "nbt-compound") 复合标签能相互嵌套形成非常复杂的数据树结构，但嵌套深度不能超过512。
===== 结束（End）
这种数据类型仅用于标记复合标签的结束，无存储容量。SNBT不使用这种数据类型。
=== SNBT转换为NBT \*<subsec:snbt_to_nbt>
对于一个输入的SNBT，游戏需要将其转换为NBT格式以使用。在转换的时候，游戏会对输入的SNBT做一定处理以适应目标程序对象的数据格式。转换行为可总结为以下四点：
===== 不能被程序对象使用的直接丢弃
若属性在程序对象中不存在（未被使用）或不可写，则输入的SNBT会被直接丢弃。此过程不会产生错误，但也不会保留数据。“不存在”的情况有如：实体的数据有一个字段 #icon(name: "nbt-bool") `Invulnerable`，如果错误地把这个字段写为了 #icon(name: "nbt-bool") `invulnerable`，此字段实体未使用，所以输入的 #icon(name: "nbt-bool") `invulnerable` 会被丢弃。“不可写”的情况有如：方块实体的 #icon(name: "nbt-string") `id` 不可被修改，传入的 #icon(name: "nbt-string") `id` 也会被忽略。
===== 编码层级的错误会发生报错
如果一个字段本身存在，但其编码格式违反硬性约束，则会产生报错，并使命令执行失败。例如，一些字段需要使用文本组件作为其值，如果输入的文本组件有错误，则整个输入都会产生错误。以下命令会产生报错，即使传入的数据在SNBT的层面上是一个空复合标签：
#codebox("give @s ladder[minecraft:custom_name={}]")
===== 数据能转换就转换
如果输入的SNBT与期望的数据不符，若存在明确的转换规则，则会按照转换规则纠正输入数据：
====== *若期望的值是一个命名空间ID，而输入的值是一个省略命名空间前缀的字符串，则会为其添加默认的命名空间 `minecraft`。*如：
输入 `id: "stone"` $arrow.r$ 转换为 `id: "minecraft:stone"`
====== 若期望的值是 #icon(name: "nbt-bool")  布尔值，而输入的值是 #icon(name: "nbt-byte") 字节型、#icon(name: "nbt-short") 短整型、#icon(name: "nbt-int") 整型、#icon(name: "nbt-long") 长整型、#icon(name: "nbt-float") 单精度浮点数或 #icon(name: "nbt-double") 双精度浮点数，则向下取整转换为字节型，非 `0b` 的值被视为 `1b`。
====== 若期望的值是 #icon(name: "nbt-byte") 字节型、#icon(name: "nbt-short") 短整型、#icon(name: "nbt-int") 整型、#icon(name: "nbt-long") 长整型、#icon(name: "nbt-float") 单精度浮点数或 #icon(name: "nbt-double") 双精度浮点数，而输入的值与目标类型不符，则自动转换为目标类型。若目标的类型是 #icon(name: "nbt-byte") 字节型、#icon(name: "nbt-short") 短整型、#icon(name: "nbt-int") 整型或 #icon(name: "nbt-long") 长整型，而输入的值是 #icon(name: "nbt-float") 单精度浮点数或 #icon(name: "nbt-double") 双精度浮点数，则会先向下取整再进行转换。
===== 不能转换的数据就归零或置空
如果输入的SNBT与期望的数据不符且无法转换，则：
====== 若期望的值是一个 #icon(name: "nbt-bool")  布尔值，而输入的值是 #icon(name: "nbt-list") 列表、#icon(name: "nbt-byte_array") 字节型数组、#icon(name: "nbt-int_array") 整型数组、#icon(name: "nbt-long_array") 长整型数组、#icon(name: "nbt-string") 字符串或 #icon(name: "nbt-compound") 复合标签，则强制使用 `0b`。
====== 若期望的值是 #icon(name: "nbt-byte") 字节型、#icon(name: "nbt-short") 短整型、#icon(name: "nbt-int") 整型、#icon(name: "nbt-long") 长整型、#icon(name: "nbt-float") 单精度浮点数或 #icon(name: "nbt-double") 双精度浮点数，而输入的值是 #icon(name: "nbt-list") 列表、#icon(name: "nbt-byte_array") 字节型数组、#icon(name: "nbt-int_array") 整型数组、#icon(name: "nbt-long_array") 长整型数组、#icon(name: "nbt-string") 字符串或 #icon(name: "nbt-compound") 复合标签，则强制赋值为 `0`，具体数据类型取决于期望的类型。
====== 若期望的值是 #icon(name: "nbt-string") 字符串，而输入的值不是字符串，则强制使用空字符串 `""`。
====== 若期望的值是 #icon(name: "nbt-list") 列表、#icon(name: "nbt-byte_array") 字节型数组、#icon(name: "nbt-int_array") 整型数组或 #icon(name: "nbt-long_array") 长整型数组，而输入的值不是对应的类型，则强制使用空列表 `[]` 或空数组。
====== 若期望的值是 #icon(name: "nbt-compound") 复合标签，而输入的值不是复合标签，则强制使用空复合标签 `{}`。
=== 二进制格式 \*
NBT文件大部分遵循马库斯·阿列克谢·佩尔松（Notch）的原始标准，是GZip格式的压缩文件，但仍有小部分未被压缩。在被压缩的NBT文件中，一定使用一个复合标签用于文件的封装，也就是说，这个未命名的复合标签便是根标签。

每个NBT文件都使用*二进制格式*，其内容是由一个个字节组成的，可读性较低。将每个字节用十六进制表示，如：
#codebox(text(blue)[01 ] + text(purple)[00 05 ] + text(red)[63 6f 75 61 74 ] + text(olive)[01]) <code:binary_format_1>
对于这样的格式，有一套特定的方法将其转换为可读性高的SNBT。对于所有的标签，它们首先需要一个字节存储各自的数据类型，因此每种数据类型都有一个ID作为它们的标识。各数据类型的ID以及各ID的二进制格式如@tab:data_type_and_binary_format 所示。
#general-table(
  caption: "数据类型及其二进制格式",
  colspan: 4,
  columns: (auto, auto, auto, auto),
  header: ([ID], [数据类型], [图标], [二进制格式]),
  [0], [结束], [-], [`00`],
  [1], [字节型], [#icon(name: "nbt-byte")], [`01`],
  [2], [短整型], [#icon(name: "nbt-short")], [`02`],
  [3], [整型], [#icon(name: "nbt-int")], [`03`],
  [4], [长整型], [#icon(name: "nbt-long")], [`04`],
  [5], [单精度浮点数], [#icon(name: "nbt-float")], [`05`],
  [6], [双精度浮点数], [#icon(name: "nbt-double")], [`06`],
  [7], [字节型数组], [#icon(name: "nbt-byte_array")], [`07`],
  [8], [字符串], [#icon(name: "nbt-string")], [`08`],
  [9], [列表], [#icon(name: "nbt-list")], [`09`],
  [10], [复合标签], [#icon(name: "nbt-compound")], [`0a`],
  [11], [整型数组], [#icon(name: "nbt-int_array")], [`0b`],
  [12], [长整型数组], [#icon(name: "nbt-long_array")], [`0c`]
) <tab:data_type_and_binary_format>
===== 结束
对于结束类型的数据，它只有一个字节的长度，且这个字节固定为 `00`，它一定会出现在复合标签的末尾。
===== 字节型、短整型、整型和长整型
对于这四种类型的数据，每一个标签都由四部分组成：第1个字节标识该标签的类型。第2、3字节标识该标签之标签名长度，必须为无符号整数，两个字节能存储的最大数值为65535，因此一个标签的标签名最多不能超过65535个字符。根据第2、3字节定义的标签名长度，接下来若干字节用于存储该标签的标签名，名称中每个ASCII字符占据一个字节，第2、3字节定义的值有多大，则这部分的字节数量就为多少。最后若干字节是该标签的负载，负载包括了该标签的值。对于 #icon(name: "nbt-byte") 字节型，此部分的字节数为1；对于 #icon(name: "nbt-short") 短整型则为2；对于 #icon(name: "nbt-int") 整型则为4，对于 #icon(name: "nbt-long_array") 长整型则为8。四种数据类型的负载均包含有符号的值。

例如，数据@code:binary_format_1 的第1位为 `01`，这一位定义了数据类型，为 #icon(name: "nbt-byte") 字节型，第2、3位为 `00 05`，它定义了标签名的长度，说明该标签名有五个字节。往后数5位，第4 \~ 8位 `63 6f 75 61 74` 是标签名的字符，根据ASCII码，`63` 代表 `c`、`6f` 代表 `o`、`75` 代表 `u`、`61` 代表 `n`、`74` 代表 `t`，因此标签名为 `count`。最后一位 `01` 是负载，定义了该标签的值 `1`。综上所述，该标签为
#codebox("count: 1b")
===== 浮点数
对于单精度浮点数和双精度浮点数，它们的字节构成与上述整型数据类似，唯一不同之处在于浮点数的负载字节遵循IEEE 754-2008标准。对于 #icon(name: "nbt-float") 单精度浮点数，负载字节长4位；对于 #icon(name: "nbt-double") 双精度浮点数，负载字节长8位。

例如，对于如下的数据：
#codebox(text(blue)[05 ] + text(purple)[00 06 ] + text(red)[48 65 61 6c 74 68 ] + text(olive)[40 90 00 00])
由 `05 00 06 48 65 61 6c 74 68` 知该标签类型为 #icon(name: "nbt-float") 单精度浮点数，标签名为 `Health`，`40 90 00 00` 为负载，需将其转化为单精度浮点数。先将 `40 90 00 00` 转化为二进制
#codebox("01000000 10010000 00000000 00000000")
接下来按1位符号位、8位指数位、23位尾数位分割这个数据：
#codebox("0 10000001 00100000000000000000000")
最高位 `0` 表示该值为正数，`10000001` 是指数部分，指数可计算得$2^8+2^0-127=129-127=2$，`00100000000000000000000` 是尾数部分，可计算得$1+2^(-3)=1.125$，浮点数为$(-1)^0 times 2^2 times 1.125=4.5$。因此该标签为
#codebox("Health: 4.5f")
===== 字符串
#icon(name: "nbt-string") 字符串的二进制格式为：1位类型标识、2位标签名长度、若干位标签名字符、2位值长度、若干位负载。例如，对于如下的数据：
#codebox(text(blue)[08 ] + text(purple)[00 02 ] + text(red)[49 64 ] + text(fuchsia)[00 0e ] + text(olive)[6d 69 6e 65 63 72 61 66 74 3a 73 74 6f 6e 65])
`08` 表示该标签为 #icon(name: "nbt-string") 字符串类型，`00 02 69 64` 表示标签名为 `id`，`00 0e` 表示值有15个字符，后面的 `6d 69 6e 65 63 72 61 66 74 3a 73 74 6f 6e 65` 表示值为 `minecraft:stone`。故该标签为
#codebox("id: \"minecraft:stone\"")
===== 字节型数组、整型数组、长整型数组
对于这三类数组，二进制格式为：1位类型标识、2位标签名长度、若干位标签名字符、4位有符号整数表示数组的长度。若数组的长度为$n$，则最后使用$n times s$字节表示负载，其中$s$的值对于 #icon(name: "nbt-byte_array") 字节型数组而言为1，对于 #icon(name: "nbt-int_array") 整型数组是4，对于 #icon(name: "nbt-long_array") 长整型数组是8。例如：
#codebox(text(blue)[11 ] + text(purple)[00 04 ] + text(red)[55 55 49 44 ] + text(maroon)[00 00 00 04 ] + text(olive)[4d 90 3b 0b ] + text(teal)[2b 4b 98 b3 ] + text(olive)[0f 8e 7d 8e ] + text(teal)[f2 95 15 c3])
其中 11 表示该标签为 #icon(name: "nbt-int_array") 整型数组，`00 04` 表示该标签的标签名有4个字符，`55 55 49 44` 表示该标签的标签名为 `UUID`，`00 00 00 04` 表示该数组有4个元素，`4d 90 3b 0b 2b 4b 98 b3 0f 8e 7d 8e f2 95 15 c3` 存储了这4个元素的值，由于每个值均为整型，因此每4个字节为1个有符号整数，换算结果为 `188452941`、`-1281864917`、`-1904374257`、`-1021995534`，综上所述，该标签为
#codebox("UUID: [I; 188452941, -1281864917, -1904374257, -1021995534]")
===== 列表
#icon(name: "nbt-list") 列表的二进制格式在1位类型标识、2位标签名长度和若干位标签名字符后，又使用了1字节用于标识列表内元素的数据类型，其值仍按表@tab:data_type_and_binary_format 使用。然后是4位有符号整数表示数组的长度以及和长度相符的若干位负载。例如：
#codebox(text(blue)[09 ] + text(purple)[00 08 ] + text(red)[52 6f 74 61 74 69 6f 6e ] + text(navy)[05 ] + text(maroon)[00 00 00 02 ] + text(olive)[42 b4 00 00 ] + text(teal)[00 00 00 00])
`09` 代表该标签为 #icon(name: "nbt-list") 列表，`00 08 52 6f 74 61 74 69 6f 6e` 是该标签的标签名 `Rotation`，`05` 说明该列表内元素均为单精度浮点数，`00 00 00 02` 是列表长度，`42 b4 00 00` 和 `00 00 00 00` 分别为列表内的元素 `90`、`0`，故标签为
#codebox("Rotation: [90f, 0f]")
===== 复合标签
一个 #icon(name: "nbt-compound") 复合标签使用1字节标识数据类型，2字节标识标签名长度，若干字节表示标签名。紧随其后使用若干字节表示其子标签，各子标签的格式与上文所述完全一致，但复合标签末尾一定存在一个 `00` 字节。例如：
#codebox(text(blue)[0a ] + text(purple)[00 0d ] + text(red)[62 6c 65 6e 64 69 6e 67 5f 64 61 74 61 ] + text(blue)[03 ] + text(purple)[00 0b ] + text(red)[6d 61 78 5f 73 65 63 74 69 6f 6e ] + text(olive)[00 00 00 20 ] + text(blue)[03 ] + text(purple)[00 0b ] + text(red)[6d 69 6e 5f 73 65 63 74 69 6f 6e ] + text(olive)[ff ff ff fc ] + text(orange)[00])
其中 `0a` 标识了 #icon(name: "nbt-compound") 复合标签类型，`00 0d 62 6c 65 6e 64 69 6e 67 5f 64 61 74 61` 是标签名长度和标签名，为13个字符的 `blending_data`，`03` 是 `blending_data` 第一个子标签的数据类型，是为 #icon(name: "nbt-int") 整型。接下来的 `00 0b 6d 61 78 5f 73 65 63 74 69 6f 6e` 是第一个子标签的标签名 `max_section`，`00 00 00 04` 是这个标签的值 `20`。随后的 `03` 是 `blending_data` 第二个子标签的数据类型，是为 #icon(name: "nbt-int") 整型。第二个子标签的标签名可解读为 `max_section`，值为 `-4`。末尾的字节 `00` 是结束类型。故该标签为
#codebox("blending_data: {max_section: 20, min_section: -4}")
== 测试NBT标签<sec:testing_nbt>
对于一段已有的NBT数据，有时会需要检测它是否满足一定要求，检测方法是提供一段SNBT用于对比，这样的SNBT被称为#proper-noun(display: "测试NBT标签（Tseting NBT Tags）", "ce4 shi4 NBT biao1 qian1")。测试NBT标签主要在目标选择器的NBT参数和 `custom_data` 数据组件谓词中使用。本节将以目标选择器NBT参数为主描述测试NBT标签的匹配方法。#cite(<testing_nbt>, form: none)
==== 对普通标签的匹配
满足这一类匹配要求的标签类型为*除了 #icon(name: "nbt-compound") 复合标签和 #icon(name: "nbt-list") 列表外的其他所有类型*，#icon(name: "nbt-byte_array") 字节型数组、#icon(name: "nbt-int_array") 整型数组和 #icon(name: "nbt-long_array") 长整型数组均位于此列。对于这些标签，提供的测试NBT标签和接受对比的目标NBT必须在名称、标签类型和值上完全一致。

比如，对于一个目标NBT：
#codebox("bold: true")
能够与之匹配的测试NBT标签为 `bold: true` 或 `bold: 1b`，添加符号后缀也未尝不可，如 `bold: 1ub`。

如果一个目标NBT的值是命名空间ID：
#codebox("id: \"minecraft:stone\"")
#wrap-content(
  tips([写入NBT和检查NBT是两个完全不同的操作。由节@subsec:snbt_to_nbt，写入NBT时游戏会自动添加默认的命名空间前缀；检查NBT的时候则不会，所以需要写成完整的命名空间ID。], width: 19em),
  [

    能够与之匹配的测试NBT标签必须为完整的 `id: "minecraft:stone"`，省略命名空间前缀的写法 `id: "stone"` 无法匹配。*这是因为测试NBT标签不会像SNBT转换为NBT那样自动添加命名空间前缀，它只会检查标签本身是否匹配，`"stone"` 和 `"minecraft:stone"` 对它而言是不一样的值。*
  ],
  align: right
)
如果一个目标NBT的值是 #icon(name: "nbt-byte_array") 字节型数组、#icon(name: "nbt-int_array") 整型数组或 #icon(name: "nbt-long_array") 长整型数组，则数组内容必须完全一致才能匹配。比如：
#codebox("UUID: [I; 1, 2, 3, 4]")
能匹配的测试NBT标签：`UUID: [I; 1, 2, 3, 4]` #text(green)[✅]

不能匹配的测试NBT标签：

缺失元素 `UUID: [I; 1, 2, 3]` #text(red)[❎]

元素顺序调换 `UUID: [I; 4, 3, 2, 1]` #text(red)[❎]

更改数据类型 `UUID: [B; 1, 2, 3, 4]` #text(red)[❎]

写成 #icon(name: "nbt-list") 列表 `UUID: [1, 2, 3, 4]` #text(red)[❎]
==== 对复合标签的匹配
复合标签的匹配规则是：只要目标NBT存在测试NBT标签指定的标签，就匹配成功，无论复合标签内是否存在其他的标签。如果测试NBT标签是一个空标签 `{}`，则只要目标NBT是一个复合标签，就匹配成功。

例如，一个标记拥有如下的数据：
#codebox([{Motion: [0.0d, 0.0d, 0.0d], data: {test: {a: 1b, b: 0b}}, Pos: [-5.0d, 56.0d, -7.0d], Fire: 0s, Invulnerable: 0b, fall_distance: 0.0d, Air: 300s, OnGround: 0b, PortalCooldown: 0, UUID: [I; -1711511327, -910079775, -1565324410, 1666279971], Rotation: [0.0f, 0.0f]}]) <code:testing_nbt_example>
结构化表示为
#tree(
  (0, [#icon(name: "nbt-compound") 根标签]),
  (1, [#icon(name: "nbt-short") *Air*: `300`]),
  (1, [#icon(name: "nbt-compound") *data*]),
  (2, [#icon(name: "nbt-compound") *test*]),
  (3, [#icon(name: "nbt-bool") *a*: `true`]),
  (3, [#icon(name: "nbt-bool") *b*: `false`]),
  (1, [#icon(name: "nbt-double") *fall_distance*: `0.0`]),
  (1, [#icon(name: "nbt-short") *Fire*: `0`]),
  (1, [#icon(name: "nbt-bool") *Invulnerable*: `false`]),
  (1, [#icon(name: "nbt-list") *Motion*]),
  (2, [#icon(name: "nbt-double") `0.0`]),
  (2, [#icon(name: "nbt-double") `0.0`]),
  (2, [#icon(name: "nbt-double") `0.0`]),
  (1, [#icon(name: "nbt-bool") *OnGround*: `false`]),
  (1, [#icon(name: "nbt-int") *PortalCooldown*: `0`]),
  (1, [#icon(name: "nbt-list") *Pos*]),
  (2, [#icon(name: "nbt-double") `-5.0`]),
  (2, [#icon(name: "nbt-double") `56.0`]),
  (2, [#icon(name: "nbt-double") `-7.0`]),
  (1, [#icon(name: "nbt-list") *Rotation*]),
  (2, [#icon(name: "nbt-float") `0.0`]),
  (2, [#icon(name: "nbt-float") `0.0`]),
  (1, [#icon(name: "nbt-int_array") *UUID*: `[I; -1711511327, -910079775, -1565324410, 1666279971]`])
)
则能匹配的测试NBT标签（以下全部写成目标选择器）有：

空复合标签，因为根标签也是一个复合标签 `@e[nbt={}]` #text(green)[✅]

任意匹配的子标签 `@e[nbt={Air:300s}]` #text(green)[✅]

任意匹配的子标签的子标签 `@e[nbt={data:{test:{a:true}}}]` #text(green)[✅]

如果子标签为复合标签，空复合标签也可以匹配 `@e[nbt={data:{}}]` #text(green)[✅]

对于目标选择器，也可以用反选 `@e[nbt=!{Air:100s}]` #text(green)[✅]

不能匹配的情况：

子标签的值不匹配 `@e[nbt={Air:100s}]` #text(red)[❎]

子标签是数组，但数组不匹配 `@e[nbt={UUID:[I;-1711511327]}]` #text(red)[❎]

不存在的字段 `@e[nbt={SelectedItem:{}}]` #text(red)[❎]
==== 对列表的匹配
列表的匹配规则是：只要目标列表中存在测试NBT标签指定的元素，就匹配成功，且列表匹配不考虑元素顺序。但是*空列表只能匹配空列表，无法匹配有元素的列表*。

依旧以数据@code:testing_nbt_example 为例，其中有一个标签 `Pos: [-5.0d, 56.0d, -7.0d]`，则匹配的目标选择器有：

完全一致 `@e[nbt={Pos:[-5.0d,56.0d,-7.0d]}]` #text(green)[✅]

只匹配部分元素 `@e[nbt={Pos:[-5.0d]}]` #text(green)[✅]

调换元素顺序 `@e[nbt={Pos:[-7.0d,56.0d,-5.0d]}]` #text(green)[✅]

调换元素顺序并省略部分元素 `@e[nbt={Pos:[-7.0d,-5.0d]}]` #text(green)[✅]

不能匹配的情况：

空列表 `@e[nbt={Pos:[]}]` #text(red)[❎]

不存在的元素 `@e[nbt={Pos:[80.0d]}]` #text(red)[❎]
== NBT路径
= 文本组件<chap:text_component>
== 文本组件内容
=== 翻译文本<subsec:translate>
= 存档格式<chap:level_format>
== 存档文件夹的结构<sec:saves>
== 方块实体<sec:block_entity>
== 技术性实体<sec:technical_entity>
= 记分板
== 队伍与标签<sec:team_and_tag>
= 命令/execute<chap:command_execute>
#appendix
= 数据库
== 数据包和资源包版本号<sec:pack_format>
#split-table(
  caption: "数据包和资源包版本号总表",
  original-cols: (6fr, 2fr, 2fr),
  seperator: (3,),
  header: ([游戏版本名称], [数据包版本号], [资源包版本号]),
  data: (
    [13w41a], [-], [1],
    [13w41b], [-], [1],
    [13w42a], [-], [1],
    [13w42b], [-], [1],
    [13w43a], [-], [1],
    [1.7], [-], [1],
    [1.7.1], [-], [1],
    [1.7.2], [-], [1],
    [13w47a], [-], [1],
    [13w47b], [-], [1],
    [13w47c], [-], [1],
    [13w47d], [-], [1],
    [13w47e], [-], [1],
    [13w48a], [-], [1],
    [13w48b], [-], [1],
    [13w49a], [-], [1],
    [1.7.3], [-], [1],
    [1.7.4], [-], [1],
    [1.7.5], [-], [1],
    [1.7.6-pre1], [-], [1],
    [1.7.6-pre2], [-], [1],
    [1.7.6], [-], [1],
    [1.7.7], [-], [1],
    [1.7.8], [-], [1],
    [1.7.9], [-], [1],
    [1.7.10-pre1], [-], [1],
    [1.7.10-pre2], [-], [1],
    [1.7.10-pre3], [-], [1],
    [1.7.10-pre4], [-], [1],
    [1.7.10], [-], [1],
    [14w02a], [-], [1],
    [14w02b], [-], [1],
    [14w02c], [-], [1],
    [14w03a], [-], [1],
    [14w03b], [-], [1],
    [14w04a], [-], [1],
    [14w04b], [-], [1],
    [14w05a], [-], [1],
    [14w05b], [-], [1],
    [14w06a], [-], [1],
    [14w06b], [-], [1],
    [14w07a], [-], [1],
    [14w08a], [-], [1],
    [14w10a], [-], [1],
    [14w10b], [-], [1],
    [14w10c], [-], [1],
    [14w11a], [-], [1],
    [14w11b], [-], [1],
    [14w17a], [-], [1],
    [14w18a], [-], [1],
    [14w18b], [-], [1],
    [14w19a], [-], [1],
    [14w20a], [-], [1],
    [14w20b], [-], [1],
    [14w21a], [-], [1],
    [14w21b], [-], [1],
    [14w25a], [-], [1],
    [14w25b], [-], [1],
    [14w26a], [-], [1],
    [14w26b], [-], [1],
    [14w26c], [-], [1],
    [14w27a], [-], [1],
    [14w27b], [-], [1],
    [14w28a], [-], [1],
    [14w28b], [-], [1],
    [14w29a], [-], [1],
    [14w29b], [-], [1],
    [14w30a], [-], [1],
    [14w30b], [-], [1],
    [14w30c], [-], [1],
    [14w31a], [-], [1],
    [14w32a], [-], [1],
    [14w32b], [-], [1],
    [14w32c], [-], [1],
    [14w32d], [-], [1],
    [14w33a], [-], [1],
    [14w33b], [-], [1],
    [14w33c], [-], [1],
    [14w34a], [-], [1],
    [14w34b], [-], [1],
    [14w34c], [-], [1],
    [14w34d], [-], [1],
    [1.8-pre1], [-], [1],
    [1.8-pre2], [-], [1],
    [1.8-pre3], [-], [1],
    [1.8], [-], [1],
    [1.8.1-pre1], [-], [1],
    [1.8.1-pre2], [-], [1],
    [1.8.1-pre3], [-], [1],
    [1.8.1-pre4], [-], [1],
    [1.8.1-pre5], [-], [1],
    [1.8.1], [-], [1],
    [1.8.2-pre1], [-], [1],
    [1.8.2-pre2], [-], [1],
    [1.8.2-pre3], [-], [1],
    [1.8.2-pre4], [-], [1],
    [1.8.2-pre5], [-], [1],
    [1.8.2-pre6], [-], [1],
    [1.8.2-pre7], [-], [1],
    [1.8.2], [-], [1],
    [1.8.3], [-], [1],
    [1.8.4], [-], [1],
    [1.8.5], [-], [1],
    [1.8.6], [-], [1],
    [1.8.7], [-], [1],
    [1.8.8], [-], [1],
    [1.8.9], [-], [1],
    [15w31a], [-], [2],
    [15w31b], [-], [2],
    [15w31c], [-], [2],
    [15w32a], [-], [2],
    [15w32b], [-], [2],
    [15w32c], [-], [2],
    [15w33a], [-], [2],
    [15w33b], [-], [2],
    [15w33c], [-], [2],
    [15w34a], [-], [2],
    [15w34b], [-], [2],
    [15w34c], [-], [2],
    [15w34d], [-], [2],
    [15w35a], [-], [2],
    [15w35b], [-], [2],
    [15w35c], [-], [2],
    [15w35d], [-], [2],
    [15w35e], [-], [2],
    [15w36a], [-], [2],
    [15w36b], [-], [2],
    [15w36c], [-], [2],
    [15w36d], [-], [2],
    [15w37a], [-], [2],
    [15w38a], [-], [2],
    [15w38b], [-], [2],
    [15w39a], [-], [2],
    [15w39b], [-], [2],
    [15w39c], [-], [2],
    [15w40a], [-], [2],
    [15w40b], [-], [2],
    [15w41a], [-], [2],
    [15w41b], [-], [2],
    [15w42a], [-], [2],
    [15w43a], [-], [2],
    [15w43b], [-], [2],
    [15w43c], [-], [2],
    [15w44a], [-], [2],
    [15w44b], [-], [2],
    [15w45a], [-], [2],
    [15w46a], [-], [2],
    [15w47a], [-], [2],
    [15w47b], [-], [2],
    [15w47c], [-], [2],
    [15w49a], [-], [2],
    [15w49b], [-], [2],
    [15w50a], [-], [2],
    [15w51a], [-], [2],
    [15w51b], [-], [2],
    [16w02a], [-], [2],
    [16w03a], [-], [2],
    [16w04a], [-], [2],
    [16w05a], [-], [2],
    [16w05b], [-], [2],
    [16w06a], [-], [2],
    [16w07a], [-], [2],
    [16w07b], [-], [2],
    [1.9-pre1], [-], [2],
    [1.9-pre2], [-], [2],
    [1.9-pre3], [-], [2],
    [1.9-pre4], [-], [2],
    [1.9], [-], [2],
    [1.9.1-pre1], [-], [2],
    [1.9.1-pre2], [-], [2],
    [1.9.1-pre3], [-], [2],
    [1.9.1], [-], [2],
    [1.9.2], [-], [2],
    [16w14a], [-], [2],
    [16w15a], [-], [2],
    [16w15b], [-], [2],
    [1.9.3-pre1], [-], [2],
    [1.9.3-pre2], [-], [2],
    [1.9.3-pre3], [-], [2],
    [1.9.3], [-], [2],
    [1.9.4], [-], [2],
    [16w20a], [-], [2],
    [16w21a], [-], [2],
    [16w21b], [-], [2],
    [1.10-pre1], [-], [2],
    [1.10-pre2], [-], [2],
    [1.10], [-], [2],
    [1.10.1], [-], [2],
    [1.10.2], [-], [2],
    [16w32a], [-], [3],
    [16w32b], [-], [3],
    [16w33a], [-], [3],
    [16w35a], [-], [3],
    [16w36a], [-], [3],
    [16w38a], [-], [3],
    [16w39a], [-], [3],
    [16w39b], [-], [3],
    [16w39c], [-], [3],
    [16w40a], [-], [3],
    [16w41a], [-], [3],
    [16w42a], [-], [3],
    [16w43a], [-], [3],
    [16w44a], [-], [3],
    [1.11-pre1], [-], [3],
    [1.11], [-], [3],
    [16w50a], [-], [3],
    [1.11.1], [-], [3],
    [1.11.2], [-], [3],
    [17w06a], [-], [3],
    [17w13a], [-], [3],
    [17w13b], [-], [3],
    [17w14a], [-], [3],
    [17w15a], [-], [3],
    [17w16a], [-], [3],
    [17w16b], [-], [3],
    [17w17a], [-], [3],
    [17w17b], [-], [3],
    [17w18a], [-], [3],
    [17w18b], [-], [3],
    [1.12-pre1], [-], [3],
    [1.12-pre2], [-], [3],
    [1.12-pre3], [-], [3],
    [1.12-pre4], [-], [3],
    [1.12-pre5], [-], [3],
    [1.12-pre6], [-], [3],
    [1.12-pre7], [-], [3],
    [1.12], [-], [3],
    [17w31a], [-], [3],
    [1.12.1-pre1], [-], [3],
    [1.12.1], [-], [3],
    [1.12.2-pre1], [-], [3],
    [1.12.2-pre2], [-], [3],
    [1.12.2], [-], [3],
    [17w43a], [-], [3],
    [17w43b], [-], [3],
    [17w45a], [-], [3],
    [17w45b], [-], [3],
    [17w46a], [-], [3],
    [17w47a], [-], [3],
    [17w47b], [-], [3],
    [17w48a], [4], [4],
    [17w49a], [4], [4],
    [17w49b], [4], [4],
    [17w50a], [4], [4],
    [18w01a], [4], [4],
    [18w02a], [4], [4],
    [18w03a], [4], [4],
    [18w03b], [4], [4],
    [18w05a], [4], [4],
    [18w06a], [4], [4],
    [18w07a], [4], [4],
    [18w07b], [4], [4],
    [18w07c], [4], [4],
    [18w08a], [4], [4],
    [18w08b], [4], [4],
    [18w09a], [4], [4],
    [18w10a], [4], [4],
    [18w10b], [4], [4],
    [18w10c], [4], [4],
    [18w10d], [4], [4],
    [18w11a], [4], [4],
    [18w14a], [4], [4],
    [18w14b], [4], [4],
    [18w15a], [4], [4],
    [18w16a], [4], [4],
    [18w19a], [4], [4],
    [18w19b], [4], [4],
    [18w20a], [4], [4],
    [18w20b], [4], [4],
    [18w20c], [4], [4],
    [18w21a], [4], [4],
    [18w21b], [4], [4],
    [18w22a], [4], [4],
    [18w22b], [4], [4],
    [18w22c], [4], [4],
    [1.13-pre1], [4], [4],
    [1.13-pre2], [4], [4],
    [1.13-pre3], [4], [4],
    [1.13-pre4], [4], [4],
    [1.13-pre5], [4], [4],
    [1.13-pre6], [4], [4],
    [1.13-pre7], [4], [4],
    [1.13-pre8], [4], [4],
    [1.13-pre9], [4], [4],
    [1.13-pre10], [4], [4],
    [1.13], [4], [4],
    [18w30a], [4], [4],
    [18w30b], [4], [4],
    [18w31a], [4], [4],
    [18w32a], [4], [4],
    [18w33a], [4], [4],
    [1.13.1-pre1], [4], [4],
    [1.13.1-pre2], [4], [4],
    [1.13.1], [4], [4],
    [1.13.2-pre1], [4], [4],
    [1.13.2-pre2], [4], [4],
    [1.13.2], [4], [4],
    [18w43a], [4], [4],
    [18w43b], [4], [4],
    [18w43c], [4], [4],
    [18w44a], [4], [4],
    [18w45a], [4], [4],
    [18w46a], [4], [4],
    [18w47a], [4], [4],
    [18w47b], [4], [4],
    [18w48a], [4], [4],
    [18w48b], [4], [4],
    [18w49a], [4], [4],
    [18w50a], [4], [4],
    [19w02a], [4], [4],
    [19w03a], [4], [4],
    [19w03b], [4], [4],
    [19w03c], [4], [4],
    [19w04a], [4], [4],
    [19w04b], [4], [4],
    [19w05a], [4], [4],
    [19w06a], [4], [4],
    [19w07a], [4], [4],
    [19w08a], [4], [4],
    [19w08b], [4], [4],
    [19w09a], [4], [4],
    [19w11a], [4], [4],
    [19w11b], [4], [4],
    [19w12a], [4], [4],
    [19w12b], [4], [4],
    [19w13a], [4], [4],
    [19w13b], [4], [4],
    [19w14a], [4], [4],
    [19w14b], [4], [4],
    [1.14 Pre-Release 1], [4], [4],
    [1.14 Pre-Release 2], [4], [4],
    [1.14 Pre-Release 3], [4], [4],
    [1.14 Pre-Release 4], [4], [4],
    [1.14 Pre-Release 5], [4], [4],
    [1.14], [4], [4],
    [1.14.1 Pre-Release 1], [4], [4],
    [1.14.1 Pre-Release 2], [4], [4],
    [1.14.1], [4], [4],
    [1.14.2 Pre-Release 1], [4], [4],
    [1.14.2 Pre-Release 2], [4], [4],
    [1.14.2 Pre-Release 3], [4], [4],
    [1.14.2 Pre-Release 4], [4], [4],
    [1.14.2], [4], [4],
    [1.14.3 Pre-Release 1], [4], [4],
    [1.14.3 Pre-Release 2], [4], [4],
    [1.14.3 Pre-Release 3], [4], [4],
    [1.14.3 Pre-Release 4], [4], [4],
    [1.14.3], [4], [4],
    [1.14.4 Pre-Release 1], [4], [4],
    [1.14.4 Pre-Release 2], [4], [4],
    [1.14.4 Pre-Release 3], [4], [4],
    [1.14.4 Pre-Release 4], [4], [4],
    [1.14.4 Pre-Release 5], [4], [4],
    [1.14.4 Pre-Release 6], [4], [4],
    [1.14.4 Pre-Release 7], [4], [4],
    [1.14.4], [4], [4],
    [1.14.3 - Combat Test], [4], [4],
    [Combat Test 2], [4], [4],
    [Combat Test 3], [4], [4],
    [19w34a], [4], [4],
    [19w35a], [4], [4],
    [19w36a], [4], [4],
    [19w37a], [4], [4],
    [19w38a], [4], [4],
    [19w38b], [4], [4],
    [19w39a], [4], [4],
    [19w40a], [4], [4],
    [19w41a], [4], [4],
    [19w42a], [4], [4],
    [19w44a], [4], [4],
    [19w45a], [4], [4],
    [19w45b], [4], [4],
    [19w46a], [4], [4],
    [19w46b], [4], [4],
    [1.15 Pre-release 1], [5], [5],
    [1.15 Pre-Release 2], [5], [5],
    [1.15 Pre-release 3], [5], [5],
    [1.15 Pre-release 4], [5], [5],
    [1.15 Pre-release 5], [5], [5],
    [1.15 Pre-release 6], [5], [5],
    [1.15 Pre-release 7], [5], [5],
    [1.15], [5], [5],
    [1.15.1 Pre-release 1], [5], [5],
    [1.15.1], [5], [5],
    [1.15.2 Pre-Release 1], [5], [5],
    [1.15.2 Pre-release 1], [5], [5],
    [1.15.2], [5], [5],
    [Combat Test 4], [5], [5],
    [Combat Test 5], [5], [5],
    [Snapshot 20w06a], [5], [5],
    [20w07a], [5], [5],
    [20w08a], [5], [5],
    [20w09a], [5], [5],
    [20w10a], [5], [5],
    [20w11a], [5], [5],
    [20w12a], [5], [5],
    [20w13a], [5], [5],
    [20w13b], [5], [5],
    [20w15a], [5], [5],
    [20w16a], [5], [5],
    [20w17a], [5], [5],
    [20w18a], [5], [5],
    [20w19a], [5], [5],
    [20w20a], [5], [5],
    [20w20b], [5], [5],
    [20w21a], [5], [5],
    [20w22a], [5], [5],
    [1.16 Pre-release 1], [5], [5],
    [1.16 Pre-release 2], [5], [5],
    [1.16 Pre-release 3], [5], [5],
    [1.16 Pre-release 4], [5], [5],
    [1.16 Pre-release 5], [5], [5],
    [1.16 Pre-release 6], [5], [5],
    [1.16 Pre-release 7], [5], [5],
    [1.16 Pre-release 8], [5], [5],
    [1.16 Release Candidate 1], [5], [5],
    [1.16], [5], [5],
    [1.16.1], [5], [5],
    [20w27a], [5], [5],
    [20w28a], [5], [5],
    [20w29a], [5], [5],
    [20w30a], [5], [5],
    [1.16.2 Pre-release 1], [5], [5],
    [1.16.2 Pre-release 2], [5], [5],
    [1.16.2 Pre-release 3], [5], [5],
    [Combat Test 6], [5], [5],
    [1.16.2 Release Candidate 1], [6], [6],
    [1.16.2 Release Candidate 2], [6], [6],
    [1.16.2], [6], [6],
    [Combat Test 7], [6], [6],
    [Combat Test 7b], [6], [6],
    [Combat Test 7c], [6], [6],
    [Combat Test 8], [6], [6],
    [Combat Test 8b], [6], [6],
    [Combat Test 8c], [6], [6],
    [1.16.3 Release Candidate 1], [6], [6],
    [1.16.3], [6], [6],
    [1.16.4 Pre-release 1], [6], [6],
    [1.16.4 Pre-release 2], [6], [6],
    [1.16.4 Release Candidate 1], [6], [6],
    [1.16.4], [6], [6],
    [1.16.5 Release Candidate 1], [6], [6],
    [1.16.5], [6], [6],
    [20w45a], [6], [7],
    [20w46a], [7], [7],
    [20w48a], [7], [7],
    [20w49a], [7], [7],
    [20w51a], [7], [7],
    [21w03a], [7], [7],
    [21w05a], [7], [7],
    [21w05b], [7], [7],
    [21w06a], [7], [7],
    [21w07a], [7], [7],
    [21w08a], [7], [7],
    [21w08b], [7], [7],
    [21w10a], [7], [7],
    [21w11a], [7], [7],
    [21w13a], [7], [7],
    [21w14a], [7], [7],
    [21w15a], [7], [7],
    [21w16a], [7], [7],
    [21w17a], [7], [7],
    [21w18a], [7], [7],
    [21w19a], [7], [7],
    [21w20a], [7], [7],
    [1.17 Pre-release 1], [7], [7],
    [1.17 Pre-release 2], [7], [7],
    [1.17 Pre-release 3], [7], [7],
    [1.17 Pre-release 4], [7], [7],
    [1.17 Pre-release 5], [7], [7],
    [1.17 Release Candidate 1], [7], [7],
    [1.17 Release Candidate 2], [7], [7],
    [1.17], [7], [7],
    [1.17.1 Pre-release 1], [7], [7],
    [1.17.1 Pre-release 2], [7], [7],
    [1.17.1 Pre-release 3], [7], [7],
    [1.17.1 Release Candidate 1], [7], [7],
    [1.17.1 Release Candidate 2], [7], [7],
    [1.17.1], [7], [7],
    [1.18 Experimental Snapshot 1], [7], [7],
    [1.18 experimental snapshot 2], [7], [7],
    [1.18 experimental snapshot 3], [7], [7],
    [1.18 experimental snapshot 4], [7], [7],
    [1.18 experimental snapshot 5], [7], [7],
    [1.18 experimental snapshot 6], [7], [7],
    [1.18 experimental snapshot 7], [7], [7],
    [21w37a], [8], [7],
    [21w38a], [8], [7],
    [21w39a], [8], [8],
    [21w40a], [8], [8],
    [21w41a], [8], [8],
    [21w42a], [8], [8],
    [21w43a], [8], [8],
    [21w44a], [8], [8],
    [1.18 Pre-release 1], [8], [8],
    [1.18 Pre-release 2], [8], [8],
    [1.18 Pre-release 3], [8], [8],
    [1.18 Pre-release 4], [8], [8],
    [1.18 Pre-release 5], [8], [8],
    [1.18 Pre-release 6], [8], [8],
    [1.18 Pre-release 7], [8], [8],
    [1.18 Pre-release 8], [8], [8],
    [1.18 Release Candidate 1], [8], [8],
    [1.18 Release Candidate 2], [8], [8],
    [1.18 Release Candidate 3], [8], [8],
    [1.18 Release Candidate 4], [8], [8],
    [1.18], [8], [8],
    [1.18.1 Pre-release 1], [8], [8],
    [1.18.1 Release Candidate 1], [8], [8],
    [1.18.1 Release Candidate 2], [8], [8],
    [1.18.1 Release Candidate 3], [8], [8],
    [1.18.1], [8], [8],
    [22w03a], [8], [8],
    [22w05a], [8], [8],
    [22w06a], [8], [8],
    [22w07a], [8], [8],
    [Deep Dark Experimental Snapshot 1], [8], [8],
    [1.18.2 Pre-release 1], [9], [8],
    [1.18.2 Pre-release 2], [9], [8],
    [1.18.2 Pre-release 3], [9], [8],
    [1.18.2 Release Candidate 1], [9], [8],
    [1.18.2], [9], [8],
    [22w11a], [10], [9],
    [22w12a], [10], [9],
    [22w13a], [10], [9],
    [22w14a], [10], [9],
    [22w15a], [10], [9],
    [22w16a], [10], [9],
    [22w16b], [10], [9],
    [22w17a], [10], [9],
    [22w18a], [10], [9],
    [22w19a], [10], [9],
    [1.19 Pre-release 1], [10], [9],
    [1.19 Pre-release 2], [10], [9],
    [1.19 Pre-release 3], [10], [9],
    [1.19 Pre-release 4], [10], [9],
    [1.19 Pre-release 5], [10], [9],
    [1.19 Release Candidate 1], [10], [9],
    [1.19 Release Candidate 2], [10], [9],
    [1.19], [10], [9],
    [22w24a], [10], [9],
    [1.19.1 Pre-release 1], [10], [9],
    [1.19.1 Release Candidate 1], [10], [9],
    [1.19.1 Pre-release 2], [10], [9],
    [1.19.1 Pre-release 3], [10], [9],
    [1.19.1 Pre-release 4], [10], [9],
    [1.19.1 Pre-release 5], [10], [9],
    [1.19.1 Pre-release 6], [10], [9],
    [1.19.1 Release Candidate 2], [10], [9],
    [1.19.1 Release Candidate 3], [10], [9],
    [1.19.1], [10], [9],
    [1.19.2 Release Candidate 2], [10], [9],
    [1.19.2 Release Candidate 3], [10], [9],
    [1.19.2], [10], [9],
    [22w42a], [10], [11],
    [22w43a], [10], [11],
    [22w44a], [10], [11],
    [22w45a], [10], [12],
    [22w46a], [10], [12],
    [1.19.3 Pre-release 1], [10], [12],
    [1.19.3 Pre-release 2], [10], [12],
    [1.19.3 Pre-release 3], [10], [12],
    [1.19.3 Release Candidate 1], [10], [12],
    [1.19.3 Release Candidate 2], [10], [12],
    [1.19.3 Release Candidate 3], [10], [12],
    [1.19.3], [10], [12],
    [23w03a], [11], [12],
    [23w04a], [11], [12],
    [23w05a], [11], [12],
    [23w06a], [12], [12],
    [23w07a], [12], [12],
    [1.19.4 Pre-release 1], [12], [13],
    [1.19.4 Pre-release 2], [12], [13],
    [1.19.4 Pre-release 3], [12], [13],
    [1.19.4 Pre-release 4], [12], [13],
    [1.19.4 Release Candidate 1], [12], [13],
    [1.19.4 Release Candidate 2], [12], [13],
    [1.19.4 Release Candidate 3], [12], [13],
    [1.19.4], [12], [13],
    [23w12a], [13], [13],
    [23w13a], [13], [13],
    [23w14a], [13], [14],
    [23w16a], [14], [14],
    [23w17a], [14], [15],
    [23w18a], [15], [15],
    [1.20 Pre-release 1], [15], [15],
    [1.20 Pre-release 2], [15], [15],
    [1.20 Pre-release 3], [15], [15],
    [1.20 Pre-release 4], [15], [15],
    [1.20 Pre-release 5], [15], [15],
    [1.20 Pre-release 6], [15], [15],
    [1.20 Pre-release 7], [15], [15],
    [1.20 Release Candidate 1], [15], [15],
    [1.20], [15], [15],
    [1.20.1 Release Candidate 1], [15], [15],
    [1.20.1], [15], [15],
    [23w31a], [16], [16],
    [23w32a], [17], [17],
    [23w33a], [17], [17],
    [23w35a], [17], [17],
    [1.20.2 Pre-release 1], [18], [17],
    [1.20.2 Pre-release 2], [18], [18],
    [1.20.2 Pre-Release 3], [18], [18],
    [1.20.2 Pre-Release 4], [18], [18],
    [1.20.2 Release Candidate 1], [18], [18],
    [1.20.2 Release Candidate 2], [18], [18],
    [1.20.2], [18], [18],
    [23w40a], [19], [18],
    [23w41a], [20], [18],
    [23w42a], [21], [19],
    [23w43a], [22], [20],
    [23w43b], [22], [20],
    [23w44a], [23], [20],
    [23w45a], [24], [21],
    [23w46a], [25], [21],
    [1.20.3 Pre-Release 1], [26], [22],
    [1.20.3 Pre-Release 2], [26], [22],
    [1.20.3 Pre-Release 3], [26], [22],
    [1.20.3 Pre-Release 4], [26], [22],
    [1.20.3 Release Candidate 1], [26], [22],
    [1.20.3], [26], [22],
    [1.20.4 Release Candidate 1], [26], [22],
    [1.20.4], [26], [22],
    [23w51a], [27], [22],
    [23w51b], [27], [22],
    [24w03a], [28], [24],
    [24w03b], [28], [24],
    [24w04a], [29], [24],
    [24w05a], [30], [25],
    [24w05b], [30], [25],
    [24w06a], [31], [26],
    [24w07a], [32], [26],
    [24w09a], [33], [28],
    [24w10a], [34], [28],
    [24w11a], [35], [29],
    [24w12a], [36], [30],
    [24w13a], [37], [31],
    [24w14a], [38], [31],
    [1.20.5 Pre-Release 1], [39], [31],
    [1.20.5 Pre-Release 2], [40], [31],
    [1.20.5 Pre-Release 3], [41], [31],
    [1.20.5 Pre-Release 4], [41], [32],
    [1.20.5 Release Candidate 1], [41], [32],
    [1.20.5 Release Candidate 2], [41], [32],
    [1.20.5 Release Candidate 3], [41], [32],
    [1.20.5], [41], [32],
    [1.20.6 Release Candidate 1], [41], [32],
    [1.20.6], [41], [32],
    [24w18a], [42], [33],
    [24w19a], [43], [33],
    [24w20a], [44], [33],
    [24w21a], [45], [34],
    [1.21 Pre-Release 1], [46], [34],
    [1.21 Pre-Release 2], [47], [34],
    [1.21 Pre-Release 3], [48], [34],
    [1.21 Pre-Release 4], [48], [34],
    [1.21 Release Candidate 1], [48], [34],
    [1.21], [48], [34],
    [1.21.1 Release Candidate 1], [48], [34],
    [1.21.1], [48], [34],
    [24w33a], [49], [35],
    [24w34a], [50], [36],
    [24w35a], [51], [36],
    [24w36a], [52], [37],
    [24w37a], [53], [38],
    [24w38a], [54], [39],
    [24w39a], [55], [39],
    [24w40a], [56], [40],
    [1.21.2 Pre-Release 1], [57], [41],
    [1.21.2 Pre-Release 2], [57], [41],
    [1.21.2 Pre-Release 3], [57], [42],
    [1.21.2 Pre-Release 4], [57], [42],
    [1.21.2 Pre-Release 5], [57], [42],
    [1.21.2 Release Candidate 1], [57], [42],
    [1.21.2 Release Candidate 2], [57], [42],
    [1.21.2], [57], [42],
    [1.21.3], [57], [42],
    [24w44a], [58], [43],
    [24w45a], [59], [44],
    [24w46a], [60], [45],
    [1.21.4 Pre-Release 1], [60], [46],
    [1.21.4 Pre-Release 2], [61], [46],
    [1.21.4 Pre-Release 3], [61], [46],
    [1.21.4 Release Candidate 1], [61], [46],
    [1.21.4 Release Candidate 2], [61], [46],
    [1.21.4 Release Candidate 3], [61], [46],
    [1.21.4], [61], [46],
    [25w02a], [62], [47],
    [25w03a], [63], [48],
    [25w04a], [64], [49],
    [25w05a], [65], [50],
    [25w06a], [66], [51],
    [25w07a], [67], [52],
    [25w08a], [68], [53],
    [25w09a], [69], [53],
    [25w10a], [70], [54],
    [1.21.5 Pre-Release 1], [70], [55],
    [1.21.5 Pre-Release 2], [71], [55],
    [1.21.5 Pre-Release 3], [71], [55],
    [1.21.5 Release Candidate 1], [71], [55],
    [1.21.5 Release Candidate 2], [71], [55],
    [1.21.5], [71], [55],
    [25w15a], [72], [56],
    [25w16a], [73], [57],
    [25w17a], [74], [58],
    [25w18a], [75], [59],
    [25w19a], [76], [60],
    [25w20a], [77], [61],
    [25w21a], [78], [62],
    [1.21.6 Pre-Release 1], [79], [63],
    [1.21.6 Pre-Release 2], [79], [63],
    [1.21.6 Pre-Release 3], [80], [63],
    [1.21.6 Pre-Release 4], [80], [63],
    [1.21.6 Release Candidate 1], [80], [63],
    [1.21.6], [80], [63],
    [1.21.7 Release Candidate 1], [80], [63],
    [1.21.7 Release Candidate 2], [81], [64],
    [1.21.7], [81], [64],
    [1.21.8 Release Candidate 1], [81], [64],
    [1.21.8], [81], [64],
    [25w31a], [82.0], [65.0],
    [25w32a], [83.0], [65.1],
    [25w33a], [83.1], [65.2],
    [25w34a], [84.0], [66.0],
    [25w34b], [84.0], [66.0],
    [25w35a], [85.0], [67.0],
    [25w36a], [86.0], [68.0],
    [25w36b], [86.0], [68.0],
    [25w37a], [87.0], [69.0],
    [1.21.9 Pre-Release 1], [87.1], [69.0],
    [1.21.9 Pre-Release 2], [88.0], [69.0],
    [1.21.9 Pre-Release 3], [88.0], [69.0],
    [1.21.9 Pre-Release 4], [88.0], [69.0],
    [1.21.9 Release Candidate 1], [88.0], [69.0],
    [1.21.9], [88.0], [69.0],
    [1.21.10 Release Candidate 1], [88.0], [69.0],
    [1.21.10], [88.0], [69.0],
    [25w41a], [89.0], [70.0],
    [25w42a], [90.0], [70.1],
    [25w43a], [91.0], [71.0],
    [25w44a], [92.0], [72.0],
    [25w45a], [93.0], [73.0],
    [25w45a Unobfuscated], [93.0], [73.0],
    [25w45b], [93.1], [74.0],
    [25w45b Unobfuscated], [93.1], [743.0],
    [1.21.11 Pre-Release 1], [94.0], [75.0],
    [1.21.11 Pre-Release 1 Unobfuscated], [94.0], [75.0],
    [1.21.11 Pre-Release 2], [94.0], [75.0],
    [1.21.11 Pre-Release 2 Unobfuscated], [94.0], [75.0],
    [1.21.11 Pre-Release 3], [94.0], [75.0],
    [1.21.11 Pre-Release 3 Unobfuscated], [94.0], [75.0],
    [1.21.11 Pre-Release 4], [94.1], [75.0],
    [1.21.11 Pre-Release 4 Unobfuscated], [94.1], [75.0],
    [1.21.11 Pre-Release 5], [94.1], [75.0],
    [1.21.11 Pre-Release 5 Unobfuscated], [94.1], [75.0],
    [1.21.11 Release Candidate 1], [94.1], [75.0],
    [1.21.11 Release Candidate 1 Unobfuscated], [94.1], [75.0],
    [1.21.11 Release Candidate 2], [94.1], [75.0],
    [1.21.11 Release Candidate 2 Unobfuscated], [94.1], [75.0],
    [1.21.11 Release Candidate 3], [94.1], [75.0],
    [1.21.11 Release Candidate 3 Unobfuscated], [94.1], [75.0],
    [1.21.11], [94.1], [75.0],
    [1.21.11 Unobfuscated], [94.1], [75.0],
    [26.1 Snapshot 1], [95.0], [76.0],
    [26.1 Snapshot 2], [96.0], [77.0],
    [26.1 Snapshot 3], [97.0], [78.0],
    [26.1 Snapshot 4], [97.1], [78.1],
    [26.1 Snapshot 5], [98.0], [79.0]
  )
)<tab:pack_format>
== 方块状态<sec:block_state>
== 数据包标签<sec:tag_in_datapack>
= 索引
== 本书命令
#columns(2)[
  #make-index(entry-casing: k => k, indexes: ("command",), use-page-counter: true)
]
#pagebreak()
== 专有名词（汉语拼音顺序）
#columns(2)[
  #make-index(indexes: ("Default",), use-page-counter: true)
]
#pagebreak()
== 重要方法
#bibliography(
  "参考文献.bib",
  title: "参考文献",
  style: "gb-7714-2015-numeric"
)