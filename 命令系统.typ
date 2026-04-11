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
#theme.update(red)
#let theme_basic = red

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
= 绪论<chap:intro>
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
    [`SLOT_SOURCE_TYPE`], [槽位源类型], [`slot_source_type`], [],
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
    [`CAT_SOUND_VARIANT`], [猫音效变种], [`cat_sound_variant`],
    [`CAT_VARIANT`], [猫的变种], [`cat_variant`],
    [`CHAT_TYPE`], [聊天类型], [`chat_type`],
    [`CHICKEN_SOUND_VARIANT`], [鸡音效变种], [`chicken_sound_variant`],
    [`CHICKEN_VARIANT`], [鸡的变种], [`chicken_variant`],
    [`CONFIGURED_CARVER`], [已配置的雕刻器], [`worldgen/configured_carver`],
    [`CONFIGURED_FEATURE`], [已配置的地物], [`worldgen/configured_feature`],
    [`COW_SOUND_VARIANT`], [牛音效变种], [`cow_sound_variant`],
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
    [`PIG_SOUND_VARIANT`], [猪音效变种], [`pig_sound_variant`],
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
    [`WOLF_SOUND_VARIANT`], [狼音效变种], [`wolf_sound_variant`],
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
  table.cell(rowspan: 11)[资源包内容], [纹理图集], [位于资源包内路径 `atlases`],
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
  table.cell(colspan: 2)[命令存储], [可写，存储于存档文件夹中的 #icon("nbt") `data > <命名空间> > command_storage.dat`],
  table.cell(colspan: 2)[Boss栏], [可写，存储于存档文件夹中的 #icon("nbt") `data > minecraft > custom_boss_events.dat`],
  table.cell(colspan: 2)[随机序列], [可写，存储于存档文件夹中各自维度的 #icon("nbt") `data > minecraft > random_sequences.dat` 文件内],
  table.cell(colspan: 2)[秒表], [可写，存储于存档文件夹中各自维度的 #icon("nbt") `data > minecraft > stopwatches.dat` 文件内]
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
一个单独的命名空间ID只能映射至单独的一个对象，如果要同时映射多个对象，一般的做法是将对象分类，通过映射同一种类别的对象从而映射多个对象。这种将游戏资源分类的手段被称为#proper-noun(display: "数据包标签（Tags in data packs）", "shu4 ju4 bao1 biao1 qian1")，简称#proper-noun(display: "标签（Tag）", "biao1 qian1")。由于命令系统存在多个名为“标签”的概念，笔者不建议使用这样的简称以防止与其他概念的混淆。。原版游戏有一些既有数据包标签，数据包标签的名称大多拥有实际的意义：例如，数据包标签 `#fire` 映射至两种方块，即 `fire`（火焰）和 `soul_fire`（灵魂火焰）；`#mineable/axe` 映射至所有能被斧采集的方块。

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
    [`/trigger`], [0], [],
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
#proper-noun(display: "实体锚点（Entity anchor）", "shi2 ti3 mao2 dian3")是实体身上用于定位的*点*，有两个可用的实体锚点：脚部和眼部。故名思义，脚部位于实体碰撞箱的底部中心点，这个位置实际上就是实体本身的位置，也是*默认使用的实体锚点*。眼部位于实体眼睛高度处碰撞箱的中心点。眼部和脚部在水平方向上的位置是一样的，在$y$轴上，这个实体眼睛部位的高度就是眼部和脚部高度的差值。
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
) <tab:command_context>
#tips(
  [
    玩家的权限等级与其游戏模式无关，需要分情况讨论：
    + 若该玩家是服务器管理员，则他的权限等级由 #icon("json")  `ops.json` 中的值决定，默认为4级；
    + 若该玩家处于启用命令的单人世界中或为启用命令的局域网世界所有者，则他的权限等级为4级；
    + 若该玩家处于启用命令的局域网世界中，则他的权限等级为4级；
    + 非上述情况者权限等级一律为0级。
    函数的权限等级默认为2级，可在 #icon("file") `server.properties` 中修改。
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
    width: 12em
  ),
  [
    
    对于一个键，可以给其定义一个值。在书写时，JSON的所有键的键名必须用*双引号*引起。若有多个键值对，则需使用逗号将这些键值对分隔开来，最后一个键值对的后面不加逗号，如：
  ],
  align: right
)
#codebox("\"<键>\":<值>,\"<键>\":<值>")
在一个 `.json` 文件中，须使用花括号 `{}` 将所有的键值对封装包裹在一起，如：
#codebox("{\"<键>\":<值>,\"<键>\":<值>}")
对于值而言，每一个不同的键都需的值的类型不尽相同，比如键 `color` 可能需要的是颜色值，`bold` 可能需要的是布尔值，`text` 可能需要的是字符串，等等。JSON一共使用六种不同的数据类型：
===== #icon("json-string") #proper-noun(display: "字符串（String）", "zi4 fu2 chuan4")
常见的数据类型，可以包含任意字符（如空格），字符串由一对*（英文）双引号*定义，*不接受单引号*，用法举例：
#codebox("\"description\": \"The default data for Minecraft\"")
也可以使用中文：
#codebox("\"description\": \"我的世界默认数据包\"")
JSON同时也支持Unicode，表示方式为 `\uxxxx`，其中每一个 `x` 都为一个十六进制数字。例如，符号★的Unicode为 `U2605`，则在字符串中输入★的方式可以为：
#codebox("\"text\": \"\u2605\"")
这样便可以在字符串中输入一些生僻字或是在键盘上无法直接打出来的字符。但是Minecraft的字库是有限的，并非所有的字符都可以在Minecraft中显示。
===== #icon("json-bool") #proper-noun(display: "布尔值（Bool）", "bu4 er3 zhi2")
由 `true`（真）或 `false`（假）定义，这两者是JSON中的字面量符号，不需要使用双引号引起，举例：
#codebox("\"bold\": true")
#codebox("\"italic\": false")
===== #icon("json-number") #proper-noun(display: "数值（Number）", "shu4 zhi2")
由数字定义，允许使用整数、浮点数或是科学计数法表示的数，举例：
#codebox("\"min\": 1.0")
在JSON中使用的数值不需要注明它们的数据类型。
===== #icon("json-array") *数组（Array，或称为列表）*#index(display: "数组（Array）", "shu4 zu3")
由一对方括号定义，数组中元素与元素之间使用逗号隔开，*最后一个元素后不能有逗号*。这些元素可以是其他的数据类型，如字符串、布尔值、数值和对象，数组中甚至能嵌套数组。在定义其他的数据类型时，需注意这些数据类型的定义方法。以下为包含了数值的数组：
#codebox("\"frames\": [1, 2, 3, 4, 5]")
下面为包含了字符串的数组，字符串均由一对双引号定义：
#codebox("\"text\": [\"A\", \"B\", \"C\"]")
对于数组内的元素，其数据类型不必完全一致，例如：
#codebox("\"extra\": [1, {\"text\": \"2\"}, \"3\"]")
===== #icon("json-object") #proper-noun(display: "对象（Object）", "dui4 xiang4")
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
  (0, [#icon("json-object")]),
  (1, [#icon("json-string") *string*: `这是一个字符串`]),
  (1, [#icon("json-bool") *boolean*: `true`]),
  (1, [#icon("json-number") *number*: `5`]),
  (1, [#icon("json-array") *array*]),
  (2, [#icon("json-string") `这是数组的第一个元素，是一个字符串`]),
  (2, [#icon("json-object") ]),
  (3, [#icon("json-string") *string*: `这是对象内的一个字符串`]),
  (1, [#icon("json-object") ]),
  (2, [#icon("json-string") *string*: `这是对象内的一个字符串`])
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

      #icon("json-string") *field*: `这是一个字段`
      + 字段开头的 #icon("json-string")#icon("json-bool")#icon("json-number")#icon("json-array")#icon("json-object") 表示这个字段使用的数据类型。如果出现了多种数据类型，则表示这些数据类型均可使用。
      + 加粗红色的字表示这个字段的键名。
      + 冒号后面如果只有 `代码块`，表示此 `代码块` 是该字段使用的真实值。如果冒号后面是一段文字，则这是对于该字段的解释。如：

        #icon("json-string") *field*: 这是对于这个字段的解释。
      + 如果键名有下划线，则表示这个字段是必填项：

        #icon("json-string") *#underline[string]*: 此项为必选项。
  ],
  width: 100%
)
=== JSON的转义序列<subsec:json_esacpe>
使用JSON字符串时，如果字符串本身的内容中含有英文引号 `"`，如一个JSON字段 `text` 的值需要为 `"Hello World!"`，那该如何编写JSON呢？若使用如下的JSON：
#codebox("\"text\":\"\"Hello World!\"\"") <code:json_escape_error>
这样通常会产生报错，这是由于用于定义字符串的引号和值中的英文引号发生了配对从而导致了错误，因此需要使用#proper-noun(display: "转义字符（Escape character）", "zhuan3 yi4 zi4 fu2")`\` 对文本引号进行转义。转义的作用为：将被转义的字符转换成字符，被转换的引号便不再与用于定义字符串的引号发生配对。除用于转义英文引号外，反斜杠还可以用于转义反斜杠以及创造一些特定的转义序列。JSON中可用的转义序列如下：
#wrap-content(
  tips([`\b`、`\f`、`\n`、`\r`、`\t` 这些特殊的转义序列能在JSON中使用，但这不代表这些转义序列能在相应的游戏实例中真正起作用。例如，在物品修饰器中定义物品名称时，虽然JSON支持输入换行符 `\n`，但物品名称本身不支持换行。], width: 14em),
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
  (0, [#icon("json-string") *content*: `{"text":"Hello World!"}`])
)
字段 #icon("json-string") `content` 的值类型为字符串，两端一定需要一对引号。为了防止决定字符串的引号与值中的引号发生匹配混乱，会将值中的引号进行转义：
#codebox("\"content\": \"{\\\"text\\\":\\\"Hello World!\\\"}\"")
如果 #icon("json-string") `text` 字段的值也带有引号，如 `"Hello World!"`，则需要相应地添加反斜杠：
#tree(
  (0, [#icon("json-string") *content*: `{"text":"\"Hello World!\""}`])
)
这时如果把字段 #icon("json-string") `content` 写成如下的形式：
#codebox("\"content\": \"{\\\"text\\\":\\\"\\\"Hello World!\\\"\\\"}\"")
现在来手动分析这个字段。把 #icon("json-string") `content` 的值拆出来，对所有的转义序列都去掉反斜杠。首先，键 #icon("json-string") `text` 两端的引号被转义，因此能够正常匹配。其次，冒号 `:` 之后、字符 `H` 之前有两个已被转义的引号；而字符感叹号 `!` 后又有两个已被转义的引号，一共有四个被转义的引号：
#codebox("{\"text\":\"\"Hello World!\"\"}")
所以不可避免地又发生了引号匹配混乱的情况。现在要解决的问题就是如何让这些引号不发生匹配混乱。最有效的写法就是*从里层向外层书写，每嵌套一层，就在上一层所有需要被转义的字符（如 `"` 和 `\`）前添加反斜杠*。因此，对于里层的 `{"text":"\"Hello World!\""}`，需要在所有的 `"` 和 `\` 之前都添加一个反斜杠：
#codebox("\"content\": \"{\\\"text\\\":\\\"\\\\\\\"Hello World!\\\\\\\"\\\"}\"")<code:multilevel_escaping>
@code:multilevel_escaping 才是正确的写法。如果更进一步，将@code:multilevel_escaping 封装在对象中，让它作为另一个 #icon("json-string") `content` 的值，这样就又增加了一层嵌套，于是应在@code:multilevel_escaping 的每一个 `"` 和 `\` 之前都添加一个反斜杠：
#codebox("\"content\": \"{\\\"content\\\": \\\"{\\\\\\\"text\\\\\\\":\\\\\\\"\\\\\\\\\\\\\\\"Hello World!\\\\\\\\\\\\\\\"\\\\\\\"}\\\"}\"")
== 游戏文件
游戏的各项数据被零零散散地存放在各个游戏文件里，部分数据对于做技术性开发而言非常重要，因此有必要适当掌握游戏文件的结构。
=== 常用文件格式
存储Minecraft数据的文件格式有很多种，下面介绍一些常见的文件格式。
===== #icon("text") `.txt` 文件
`.txt` 文件是非常常见的文本文件，用Windows自带的记事本即可打开。这种文件通常被用于存储一些简易的文本，如游戏标题画面上的闪烁标语，有时也被用于存储游戏中的设置，在这些 `.txt` 文件中更改的内容会在游戏本体上有相应的改动。有时候 `.txt` 文件也可用于记录一些自定义的、不作为游戏数据的文本。有效的 `.txt` 文件必须为无BOM的UTF-8格式。
===== #icon("mcfunction") `.mcfunction` 文件
`.mcfunction` 文件，即函数文件，同样必须为无BOM的UTF-8格式。函数文件可以用Windows10自带的记事本打开并编辑，默认的Windows 10记事本已经为无BOM的UTF-8格式，这点从记事本页面下方的状态栏就可以看到。记事本无法指出函数中的语法错误，必须得手动检查，笔者更推荐在编译软件中打开函数文件。本教程推荐的辅助工具是 #icon("dhp") Data-pack Helper Plus（DHP），这是编译软件 #icon("vscode") Visual Studio Code（VS Code）的一个扩展，可在 #icon("vscode") VS Code的应用商店中找到。#icon("dhp") DHP是专门用于制作Minecraft数据包或资源包部分文件的辅助工具，在编写数据包或资源包的过程中，#icon("dhp") 提供了高亮显示，并为部分错误的语法提供解决方案。

《数据包》教程提供了该文件格式的具体编写规范。
===== #icon("json") `.json` 和 `.mcmeta` 文件
`.json` 和 `.mcmeta` 文件都是使用JSON格式的文件。这些文件中的JSON格式是允许换行的，且为了美观、可读性，编写者在习惯上会在所有的 `.json` 和 `.mcmeta` 文件中使用换行，并使得同一层级的字段在行前缩进上保持一致。`.json` 和 `.mcmeta` 文件没有专门用于注释的语法，若需要注释，则使用游戏不需要、不会被游戏识别的键，如 `_comment1`、`_comment2`。
===== #icon("nbt") `.mca`、`.dat`、`.dat_old` 和 `.nbt` 文件
`.mca`、`.dat`、`.dat_old` 和 `.nbt` 文件均是使用NBT格式的文件，通常用于存储世界的全局信息和结构信息。同样地，这两类文件不能用 #icon("dhp") DHP在编译软件内进行编辑，但可以在NBT编辑器内编辑，本教程推荐的编辑器为 #icon("nbtstudio") NbtStudio。一些无法由命令进行编辑的信息可以通过 #icon("nbtstudio") NbtStudio修改。
===== #icon("png") `.png` 文件
`.png` 文件是图片文件，被用于存储游戏中的绝大部分图像，包括但不限于图标、游戏截图、资源包纹理。可以使用Windows自带的 #icon("paint") 画图、#icon("ps") PS或 #icon("gimp") GIMP处理，但需要注意 #icon("paint") 画图不支持透明背景。
===== #icon("ogg") `.ogg` 文件
游戏中所有的声音文件都为 `.ogg` 格式，从外部导入声音时应注意格式转换。直接修改文件名后缀是无效的，可以使用
===== #icon("zip") `.zip` 文件
压缩文件，即 `.zip` 文件，也是常用的文件格式，通常被用于数据包和资源包的压缩。读者可自行选择合适的压缩软件对数据包或资源包进行压缩。
===== 其他的文件格式
Minecraft还使用其他一些文件格式，如 `.jfr` 文件、`.log` 文件等。具体见下文的说明。
=== .minecraft文件夹 \*<subsec:.minecraft>
`.minecraft` 文件夹，macOS上为 #icon("folder") `minecraft`，是存储Java版所有游戏数据的文件夹。

对于Windows系统，这个文件夹默认位于 #icon("folder") `C: Users\Admin\AppData\Roaming\.minecraft`，其中 #icon("folder") `AppData` 文件夹一般是隐藏的，可以在文件资源管理器 `查看` 工具栏，在 `显示 > 隐藏` 一项勾选 `隐藏的项目` 以显示这个文件夹。

对于Mac系统，这个文件夹默认位于 #icon("folder") `home\用户名\Library\Application Support\minecraft`。对于Linux系统，这个文件夹默认位于 #icon("folder") `home\用户名\.minecraft`，其中以 `.` 开头的文件夹默认是隐藏的，需要使用 `Ctrl` + `H` 切换是否可见。

第三方启动器会有其特殊的文件夹路径，具体见各启动器的设置。由官方启动器运行的游戏可以在启动器内手动修改存储路径，或者在默认存储路径处使用快捷方式重定向至自定义路径下。

随着游戏内容的增多、各种其他资源（如光影、模组）不断被下载到游戏中， #icon("folder") `.minecraft`中的子文件（夹）可能会持续增多。鉴于无法讲到所有可能出现的文件（夹），本节仅列举原版游戏使用文件（夹）。文件结构如下所示：
#tree(
  (0, [#icon("folder") *.minecraft*]),
  (1, [#icon("folder") *assets*: 存放原版资源包部分游戏资源的文件夹，如简体中文的语言文件、声音 `.ogg` 文件等，其中这些文件被称为*散列资源文件*。]),
  (2, [#icon("folder") *indexes*]),
  (3, [#icon("json") *\<版本号>.json*: 该版本号用于映射散列资源的哈希表。]),
  (2, [#icon("folder") *log_configs*]),
  (3, [#icon("file") *client-<版本号>.xml*]),
  (2, [#icon("folder") *objects*: 此文件夹专门用于存储声音、语言文件。]),
  (3, [#icon("folder") *\<哈希值前两位>*]),
  (4, [#icon("file") *\<哈希值>*: 散列资源文件。]),
  (2, [#icon("folder") *skins*]),
  (3, [#icon("folder") *\<哈希值前两位>*]),
  (4, [#icon("file") *\<哈希值>*: 散列资源文件。]),
  (2, [#icon("folder") *virtual*]),
  (1, [#tips(
  [
    #icon("folder") `assets` 文件夹内的资源文件都是用#proper-noun(display: "哈希值（Hash value，散列值）", "ha1 xi1 zhi2")加密的，以哈希表的方式映射资源位置。要查询 #icon("folder") `assets` 内的任意一个资源文件，需按照以下步骤：
    + 打开 #icon("folder") `indexes` 文件夹，找到需要提取资源的 #icon("json") `<版本号>.json` 文件。其中的内容大致如下所示：
    
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
    + 用编译软件的查询功能在 #icon("json") `<版本号>.json` 文件中查找所需资源，记录对应 #icon("json-string") `hash` 字段的值，此即为映射该资源的哈希值。
    + 打开 #icon("folder") `objects` 文件夹，找到匹配的 #icon("folder") `<哈希值前两位>` 文件夹，在此文件夹内找寻对应哈希值命名的文件，此即为需要找寻的资源。
  ]
)
#example(
  [在 #icon("folder") `assets` 文件夹内找到1.21.4版本（哈希表版本号显示为 `19`）简体中文语言的资源文件。],
  [
    在 #icon("json") `<19>.json` 文件中查询 `zh_cn`，可以找到一个键名为 `minecraft/lang/zh_cn.json` 的键值对：
    #codebox("\"minecraft/lang/zh_cn.json\": {
  \"hash\": \"4674523c91196e0898c24a06531f94154111f2a3\",
  \"size\": 459788
}")
    这时获取到哈希值 `4674523c91196e0898c24a06531f94154111f2a3`，其前两位是 `46`。然后打开文件夹 #icon("folder") `objects > 46`，在其中找到名为 #icon("file") `4674523c91196e0898c24a06531f94154111f2a3` 的文件，此即为简体中文的语言文件。
  ])], false, true),
  (1, [#icon("folder") *backups*: 存放备份存档的文件夹。]),
  (2, [#icon("zip") *\<日期>\_\<时间>\_\<存档名称>.zip*: 一个备份存档。]),
  (1, [#icon("folder") *bin*]),
  (2, [#icon("folder") *\<随机ID>*]),
  (3, [#icon("file") `.dll` 或 `.so` 文件]),
  (1, [#icon("folder") *crash-reports*: 存储游戏崩溃报告的文件夹。]),
  (2, [#icon("text") *crash-\<日期>\_\<时间>-\<逻辑端类型>.txt*: 一份#proper-noun(display: "崩溃报告（Crash Report）", "bengkuibaogao")文件。]),
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
  (1, [#icon("folder") *debug*: 存储函数调试结果的文件夹。]),
  (2, [#icon("text") *debug-trace-\<日期>\_\<时间>.txt*: 一份调试结果。]),
  (1, [#tips([命令 `/debug` 可用于函数的调试，并将调试的结果以 `.txt` 的文件格式存入 #icon("folder") `debug` 中。文件中的内容极为详细，可以以此观察函数的整个运行过程，并从中找到错误的地方。调试结果的具体内容如：
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
  (1, [#icon("folder") *libraries*: 按Maven仓库的标准目录结构组织和存储的第三方库。]),
  (2, [#icon("folder") 一个第三方库。]),
  (1, [#icon("folder") *logs*: 存储日志文件的文件夹。]),
  (2, [#icon("zip") *\<日期>-\<日志编号>.log.gz*: 压缩文件，可使用解压软件打开。]),
  (3, [#icon("file") *\<日期>-\<日志编号>.log*: 日志文件。]),
  (2, [#icon("file") *latest.log*: 最新一次游戏或当前正在进行的游戏所生成的日志文件。]),
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
  (1, [#icon("folder") *resourcepacks*: 存储所有资源包的文件夹，其基本结构见@sec:resourcepack，具体的制作方式将在《资源包》教程中给出。]),
  (1, [#icon("folder") *saves*: 存储游戏中所有存档的文件夹，具体结构见@sec:saves 。]),
  (2, [#icon("folder") *\<存档名称>*: 一个存档。]),
  (1, [#icon("folder") *screenshots*: 存储 `F2` 截屏图片的文件夹。]),
  (2, [#icon("png") *\<日期>\_\<时间>.png*: 一张截屏，名称可手动修改。]),
  (1, [#icon("folder") *versions*: 存储游戏不同版本游戏资源的文件夹。]),
  (2, [#icon("folder") *\<版本号>*: 一个游戏版本，可以是正式版，也可以是快照。]),
  (3, [#icon("jar") *\<版本号>.jar*: 物理客户端文件，是存放该版本号游戏源代码的地方。可以用压缩软件打开这个文件。]),
  (4, [#icon("folder") *assets*: 存放该版本号原版资源包内容的文件夹，它决定了客户端游戏内容的外观。在制作资源包时可以参考这个文件夹的结构。不含在 #icon("folder") `.minecraft > assets` 中存放的语言和声音文件。]),
  (4, [#icon("folder") *com*]),
  (4, [#icon("folder") *data*: 存放该版本号原版数据包内容的文件夹，它决定了可写注册表的内容，如进度、战利品表、配方、结构等。在制作数据包时可以参考这个文件夹的结构。]),
  (4, [#h(-2em)#icon("file") *flightrecorder-config.jfc*: Java Flight Recorder配置文件，可用于JFR分析。JFR分析，即使用Java Flight Recorder分析数据和某些自定义事件。自定义事件包括：
  #param-desc(
    prefix: "",
    [`minecraft.ServerTickTime` ], [采样事件。],
    [`minecraft.ChunkGeneration` ], [生成单个区块阶段所需的时间。],
    [`minecraft.PacketRead` 或 `minecraft.PacketSent` ], [网络流量。],
    [`minecraft.WorldLoadFinishedEvent` ], [初始化世界加载耗费的时间。]
  )
  #h(-2em)在游戏中可使用命令 `/jfr` 进行JFR分析，此命令用于开始或结束JFR分析，分析结果以JSON的格式写入日志或 `debug` 文件夹。该命令所需权限等级为4，语法为：#index(index: "command", "jfr")
  #codebox("jfr (start|stop)")]),
  (4, [#icon("folder") *META-INF*: `.jar` 文件的元数据。]),
  (5, [#icon("file") *LICENSE*: 游戏许可协议。]),
  (5, [#icon("file") *MANIFEST.MF*: 清单文件。]),
  (5, [#icon("file") *MOJANGCS.RSA*: 用于验证JAR的文件。]),
  (5, [#icon("file") *MOJANGCS.SF*: JAR签名。]),
  (4, [#icon("folder") *net*: 自25w45a起，Mojang发布的未经混淆的客户端其源代码均存储于该文件夹内。其中的类文件均未被混淆，可查看，是制作Mods的重要依据。]),
  (5, [#icon("folder") *minecraft*]),
  (6, [#icon("file") *\<名称>.class*: 一个未混淆的Java类文件。]),
  (4, [#h(-2em)#icon("png") *pack.png*: 原版资源包的图标。#figure(caption: [原版资源包的图标（pack.png）],image("图片/原版资源包的图标（pack.png）.png", width: 4em))]),
  (4, [#h(-2em)#icon("json") *versions.json*: 版本信息文件，存储该版本的信息。此文件的内容可由命令 `/version` 获取，此命令在单人游戏中所需的权限等级为0，多人游戏中为2。语法为：#index(index:"command","version")#codebox("version")#h(-2em)返回的内容大致如下所示：#codebox("Server version info:
id = 1.21.11
name = 1.21.11
data = 4671
series = main
protocol = 774 (0x306)
build_time = Tue Dec 09 20:20:42 CST 2025
pack_resource = 75.0
pack_data = 94.1
stable = yes")]),
  (3, [#icon("json") *\<版本号>.json*: 客户端清单文件。]),
  (1, [#icon("folder") *webcache2*]),
  (1, [#icon("text") *allowed_symlinks.txt*: 信任符号链接列表文件。]),
  (1, [#icon("text") *command\_history.txt*: 命令历史文件，最多只能保留50条记录。]),
  (1, [#icon("png") *debug.stitched\_items.png*]),
  (1, [#icon("png") *debug.stitched\_terrain.png*]),
  (1, [#icon("nbt") *hotbar.nbt*: 存储在创造模式中保存的快捷栏信息的文件，在创造模式中的快捷栏以 `C` + `<数字>` 存储，然后以 `X` + `<数字>` 调用。可以用NBT编辑器打开这个文件。]),
  (1, [#icon("text") *launcher\_cef\_log.txt*]),
  (1, [#icon("json") *launcher\_entitlements.json*]),
  (1, [#icon("json") *launcher\_gamer\_pics.json*]),
  (1, [#icon("json") *launcher\_msa\_credentials.json*]),
  (1, [#icon("json") *launcher\_profiles.json*: 启动器档案文件。]),
  (1, [#icon("json") *launcher\_quick\_play.json*: 启动器快速进入游戏存档信息文件。]),
  (1, [#icon("json") *launcher\_settings.json*: 启动器配置文件。]),
  (1, [#icon("json") *launcher\_skins.json*]),
  (1, [#icon("json") *launcher\_ui\_state.json*]),
  (1, [#h(-2em)#icon("text") *options.txt*: 该文件存储了游戏中设定的选项，可以通过更改该文件中的内容以更改在游戏中的设置。此外一些在选项界面中不存在的设置也可以通过该文件更改。文件中内容如下所示：#codefile(lang:"txt",title:".minecraft > options.txt","version:4189
ao:true
biomeBlendRadius:2
enableVsync:false
entityDistanceScaling:1.0
entityShadows:true")], true, true),
  (1, [#icon("file") *output-client.log*]),
  (1, [#icon("file") *output-server.log*]),
  (1, [#icon("json") *realms\_persistence.json*: 存储Realms数据的文件。]),
  (1, [#icon("nbt") *servers.dat*: 存储玩家添加到服务器列表的多人游戏服务器的数据。]),
  (1, [#icon("png") *textures\_0.png*]),
  (1, [#icon("png") *textures\_1.png*]),
  (1, [#icon("png") *textures\_2.png*]),
  (1, [#icon("png") *textures\_3.png*]),
  (1, [#icon("png") *textures\_4.png*]),
  (1, [#icon("json") *usercache.json*: 游戏为减少重复获取玩家档案信息所使用的缓存文件。])
)
== 数据包
Minecraft的命令系统虽然完善，但其功能十分有限。例如，命令没有办法直接指导游戏世界的生成；直接用命令模拟一些游戏机制也不够灵活。数据包可以看作是命令系统功能的延伸：它不仅为命令提供了程序化执行的环境，更开放了部分API以允许数据驱动内容。

#proper-noun(display: "数据包（Data pack）", "shu4 ju4 bao1")*允许玩家在不修改游戏代码的前提下覆盖既有的或添加自定义的游戏内容。*因此，*原版技术性开发从不添加任何不在可写注册表内的游戏内容，只会用各种手段模拟这些游戏内容*。数据包本质上是一个文件夹或压缩文件。一个数据包仅对特定的游戏世界有效，它被储存在 `.minecraft\saves\<存档名称>\datapacks` 中。数据包可以是文件夹，也可以是 `.zip` 类型的压缩文件。同一个 #icon("folder") `datapacks` 文件夹内能存放多个数据包。

数据包有两种添加方式——
===== 手动添加
直接将数据包添加至 `.minecraft\saves\<存档名称>\datapacks`。
===== 创建世界时添加数据包
在创建新的世界界面，选择 `更多`，点击 `数据包` 选项，此时会进入选择数据包窗口，类似于资源包选项的窗口，可在“可用”一栏内选用数据包，只有“已选”一栏的数据包有效，且数据包的加载顺序可以在该栏中调换。点击 `打开包文件夹` 选项后游戏会弹出一个临时的文件夹，此时可以将数据包拖入其中。
#figure(
  caption: [选择数据包窗口],
  image("图片/选择数据包窗口.png", width: 28em)
)
当一个存档中存在多个有效的已启用数据包时，游戏会根据数据包的顺序加载其内容，这里的“有效”是指数据包有合法的元数据且数据包内无任何语法错误。已启用数据包的加载顺序存储于 #icon("nbt") `level.dat` 中。在选择数据包窗口“已选”一栏的加载顺序表现为从下到上。

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
  [`<description>`（文本组件 `minecraft:component`）], [该数据包的描述，是为元数据 `pack.mcmeta` 内 #icon("json-string")#icon("json-array")#icon("json-object") `description` 的值。需要是文本组件，具体写法可参照@chap:text_component。]
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
对于非数据包标签、函数、进度、战利品表、物品修饰器、战利品表谓词或配方的注册项，进入存档会出现#proper-noun(display: "实验性设置（Experimental settings）", "shi2 yan4 xing4 she4 zhi4")的警告，此时可点击创建备份并加载或我知道我在做什么！。但若这些注册项出现各种各样的错误（不一定是语法错误），则进入存档会出现#proper-noun(display: "安全模式（Safe mode）", "an1 quan2 mo2 shi4")错误，可在官方启动器设置中打开“当《Minecraft：Java版》启动时输出日志”一项以随时获得错误日志，或在 `.minecraft > debug` 文件夹中获取 `.txt` 输出日志以检查存在的错误。

数据包的编写是一个极为繁琐的过程，需要不断地调试、纠错，有时甚至要对其底层逻辑进行重构。在编写数据包之前，读者应提前做好规划，对其可行性进行初步的研究，还要考虑数据包运行过程中的流畅性、玩家游玩过程中的平衡性。编写过程合理使用文件层级，对文件适当分类，以免内容混乱，降低文件可读性。

原版数据包位于 #icon("folder") `.minecraft > versions > <版本号> > <版本号>.jar > data`，是编写自定义数据包的重要依据，读者可参考之。
=== 数据包的基本结构<subsec:datapack_folder>
一个数据包拥有以下的基本结构：
#tree(
  (0, [#icon("folder") *\<数据包名称>*或 #icon("zip") *\<数据包名称>.zip*]),
  (1, [#icon("folder") *\<子数据包>*]),
  (2, [递归此文件夹结构]),
  (1, [#icon("folder") *data*: 数据包的主体内容。]),
  (1, [#icon("json") *#underline[pack.mcmeta]*: 数据包的元数据。]),
  (1, [#icon("png") *pack.png*: 可选，作为数据包的图标使用。])
)
如果该数据包以压缩文件的形式存在，则 #icon("zip") `<数据包名称>.zip` 和 #icon("folder") `<子数据包>`、#icon("folder") `assets`、#icon("json") `pack.mcmeta`、#icon("png") `pack.png` 这些文件（夹）之间不要插入其他层级的文件夹。
==== 元数据
#icon("json") `pack.mcmeta` 是数据包的#proper-noun(display: "元数据（Metadata）", "yuan2 shu4 ju4")。所谓元数据，就是用于决定 #icon("folder") `<数据包名称>` 或 #icon("zip") `<数据包名称>.zip` 这个文件（夹）是否为一个数据包的基本数据。只有当元数据存在时，游戏才能识别数据包。

#icon("json") `pack.mcmeta` 使用JSON格式，其包含的内容如下所示：
#tree(
  (0, [#icon("json-object") 文件封装]),
  (1, [#icon("json-object") *#underline[pack]*: 此数据包的基本信息。]),
  (2, [#icon("json-string")#icon("json-array")#icon("json-object") *#underline[description]*: 任意文本，使用文本组件格式，可用于对数据包的简单介绍。此段文本会出现在选项数据包中。使用 `/datapack list` 列举数据包时，将鼠标悬停于数据包名称上也会显示此文本。]),
  (2, [#icon("json-number")#icon("json-array") *#underline[max_format]*: 数据包最高兼容的版本号。若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon("json-number") 形式或在 #icon("json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0x7fffffff`。]),
  (2, [#icon("json-number")#icon("json-array") *#underline[min_format]*: 数据包最低兼容的版本号。若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon("json-number") 形式或在 #icon("json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0`。]),
  (2, [#icon("json-number") *pack_format*: 25w31a以前用于指定数据包版本号的字段，现已弃用，可用于兼容旧版数据包。]),
  (2, [#icon("json-number")#icon("json-array")#icon("json-object") *supported_formats*: 25w31a以前用于指定数据包版本号兼容范围的字段，现已弃用，可用于兼容旧版数据包。]),
  (3, [*若使用 #icon("json-number") 形式，则精确匹配，效果与 #icon("json-number") pack_format一致*], false),
  (3, [*若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为最低兼容的版本号，第二个为最高兼容的版本号*], false),
  (3, [*若使用 #icon("json-object") 形式，则有以下字段：*], false),
  (3, [#icon("json-number") *max_inclusive*: 最高兼容的版本号。]),
  (3, [#icon("json-number") *min_inclusive*: 最低兼容的版本号。]),
  (1, [#icon("json-object") *features*: 可选，用于启用实验性内容，若指定该键，则数据包必须在创建世界时添加。]),
  (2, [#icon("json-array") *#underline[enabled]*: 启用实验性内容数据包的列表。]),
  (3, [#icon("json-string") 一个实验性内容数据包的命名空间ID，当前版本可用值有 `minecraft:trade_rebalance`（村民交易平衡性调整）、`minecraft:redstone_experiments`（红石实验性内容）和 `minecraft:minecart_improvements`（矿车改进）。]),
  (1, [#icon("json-object") *filter*: 可选，用于指定在数据包加载列表中优先级低于该包的数据包内要禁用的内容。]),
  (2, [#icon("json-array") *block*: 禁用内容列表。]),
  (3, [#icon("json-object") 一项被禁用的内容。]),
  (4, [#icon("json-string") *namespace*: 要禁用的命名空间，若省略则禁用所有命名空间，可使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (4, [#icon("json-string") *path*: 要禁用的资源路径，若省略则禁用所有路径，可使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (1, [#icon("json-object") *overlays*: 可选，用于子数据包的识别。]),
  (2, [#icon("json-array") *#underline[entries]*: 可用子数据包的列表。]),
  (3, [#icon("json-object") 一个子数据包。]),
  (4, [#icon("json-string") *#underline[directory]*: 该子数据包相对于主数据包根目录的路径。允许使用的字符有：小写字母、`0123456789`、`_` 和 `-`。]),
  (4, [#icon("json-number")#icon("json-array") *max_format*: 该子数据包最高兼容的版本号。若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon("json-number") 形式或在 #icon("json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0x7fffffff`。]),
  (4, [#icon("json-number")#icon("json-array") *min_format*: 该子数据包最低兼容的版本号。若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon("json-number") 形式或在 #icon("json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0`。]),
  (4, [#icon("json-number")#icon("json-array")#icon("json-object") *formats*: 25w31a以前用于指定子数据包版本号兼容范围的字段，现已弃用，可用于兼容旧版数据包。]),
  (5, [*若使用 #icon("json-number") 形式，则精确匹配*], false),
  (5, [*若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为最低兼容的版本号，第二个为最高兼容的版本号*], false),
  (5, [*若使用 #icon("json-object") 形式，则有以下字段：*], false),
  (5, [#icon("json-number") *max_inclusive*: 最高兼容的版本号。]),
  (5, [#icon("json-number") *min_inclusive*: 最低兼容的版本号。])
)#cite(<datapack_merge>, form: none)
例如，下面是1.21.11版本的一个标准 #icon("json") `pack.mcmeta` 文件：
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
#index(index: "method", display: "禁用原版游戏资源", "jin4 yong4 yuan2 ban3 you2 xi4 zi1 yuan2")
#example(
  [尝试在1.21.11版本中禁用原版所有的进度。],
  [
    原版所有进度位于路径 #icon("nbt-compound") `data > minecraft > advancement`，命名空间为 `minecraft`，只需在元数据中配置：
    #codefile(
  lang: "json",
  title: "pack.mcmeta",
  "{
  \"pack\": {
    \"description\": \"The default data for Minecraft\",
    \"max_format\": 94.1,
    \"min_format\": 94.1,
  },
  \"filter\": {
    \"block\": [
      {
        \"namespace\": \"minecraft\",
        \"path\": \"advancement\"
      }
    ]
  }
}")
  ]
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
    [1.21.11], [94.1],
    [26.1], [101.1]
  )
) <tab:datapack_format>
游戏允许编写者在元数据内指定数据包版本号的区间以使数据包兼容多个版本。但由于在不同版本中 #icon("json") `pack.mcmeta` 本身的格式也会发生变化，数据包版本号需要进行校验。不过，*这个校验仅仅作为“门槛”，数据包能否运行取决于其实际内容，而非元数据声明。*在26.1以前，校验失败会现实“已损坏或不兼容”；而在26.1以后，校验失败会直接认为元数据无效，从而不识别此数据包。

校验规则以25w31a（1.21.9）为分水岭实行“新旧双轨制”，以下分类讨论：
===== 如果数据包仅适用于25w31a之前，则元数据中：
*必须使用的字段*：#icon("json-number") `pack_format`

*可以使用的字段*：#icon("json-number")#icon("json-array")#icon("json-object") `supported_formats`。若使用，则此区间必须包含 #icon("json-number") `pack_format` 的值，且最大值不能低于16，因为此字段是在23w31a引入的。

*不能使用的字段*：#icon("json-number") `max_format` 和 #icon("json-number") `min_format`
===== 如果数据包仅适用于25w31a及之后，则元数据中：
*必须使用的字段*：#icon("json-number") `max_format` 和 #icon("json-number") `min_format`

*不能使用的字段*：#icon("json-number") `pack_format` 和 #icon("json-number")#icon("json-array")#icon("json-object") `supported_formats`
===== 如果数据包同时适用于25w31a之前及之后，则必须同时指定 #icon("json-number") `pack_format`、#icon("json-number")#icon("json-array")#icon("json-object") `supported_formats`、#icon("json-number") `max_format` 和 #icon("json-number") `min_format`，且必须满足以下要求：
====== *区间验证：\ *#icon("json-number") `pack_format` 必须落在兼容区间内。
====== *对最低版本号的验证：*\ #icon("json-number")#icon("json-array")#icon("json-object") `supported_formats` 的下限必须与 #icon("json-number") `min_format` 相等。
====== *对最高版本号的验证，以下两种方案二选一：*\ 
======= #icon("json-number")#icon("json-array")#icon("json-object") `supported_formats` 的上限与 #icon("json-number") `max_format` 相等。
======= #icon("json-number")#icon("json-array")#icon("json-object") `supported_formats` 的上限固定为81，此时最高版本号由#icon("json-number") `max_format` 决定。
#example(
  [现需要编写一个适用于1.20.5至1.21.11的数据包，尝试编写其元数据。],
  [
    查@tab:datapack_format，1.20.5的版本号为41，1.21.11的版本号为94.1。因为此数据包同时适用于25w31a之前及之后的版本，需要同时指定 #icon("json-number") `pack_format`、#icon("json-number")#icon("json-array")#icon("json-object") `supported_formats`、#icon("json-number") `max_format` 和 #icon("json-number") `min_format`。

    首先，#icon("json-number") `pack_format` 的值需要在41和94.1之间，此处直接写41。其次，可将 #icon("json-number")#icon("json-array")#icon("json-object") `supported_formats` 的下限调整为与 #icon("json-number") `min_format` 一致，上限设为81，#icon("json-number") `max_format` 设为94.1。故元数据可写为：
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
数据包的基础功能有限，为了搭建一套复杂的体系，有时候会使用#proper-noun(display: "前置数据包（Library datapack）", "qian2 zhi4 shu4 ju4 bao1")。这就像是在写程序时引用“第三方库”，可以极大地降低开发难度，还避免了“重复造轮子”。这些前置数据包也是数据包，可用子数据包的形式将它们添加到开发的数据包中。

子数据包会在当前主数据包的基础上添加内容，同时也会*覆盖*主数据包相同路径的文件。不过，仅在主数据包文件夹的子层级添加一个数据包并不会让主数据包识别到这个子数据包，应当在元数据的 #icon("json-object") `overlays` 中配置。配置方式见上文的数据格式。注意，由于 #icon("json-string") `directory` 字段允许包含的字符仅有小写字母、`0123456789`、`_` 和 `-`，那么有效子数据包的名称及相对路径也只能包含这些字符。

子数据包的 #icon("json") `pack.mcmeta` 不会被识别，其元数据都应在主数据的元数据中配置。因此子数据包不能嵌套子数据包。
#example(
  [一个版本号为88.0的数据包需要使用 #icon("folder") `jigsaw_marker_v1.0` 这个前置数据包作为其子包，此前置数据包使用的数据包版本号也为88.0，尝试配置子数据包。],
  [
    首先，将数据包 #icon("folder") `jigsaw_marker_v1.0` 移入主数据包，文件夹结构如下：
    #tree(
      (0, [#icon("folder") *主数据包*]),
      (1, [#icon("folder") *jigsaw_marker_v1.0*]),
      (1, [#icon("folder") *data*]),
      (1, [#icon("json") *pack.mcmeta*])
    )
    其次，在 #icon("json") `pack.mcmeta` 中做如下配置：
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
子数据包的版本号也需要进行校验，校验规则为：
===== 如果一个子数据包仅适用于25w31a之前，则子数据包所在的 #icon("json-object") `overlays` 项：
*必须使用的字段*：#icon("json-number")#icon("json-array")#icon("json-object") `formats`

*不能使用的字段*：#icon("json-number") `max_format` 和 #icon("json-number") `min_format`
===== 如果一个子数据包仅适用于25w31a及之后，则子数据包所在的 #icon("json-object") `overlays` 项：
*必须使用的字段*：#icon("json-number") `max_format` 和 #icon("json-number") `min_format`

*关于 #icon("json-number")#icon("json-array")#icon("json-object") `formats`*：若存在其他适用于25w31a之前的子数据包，则此字段必须指定；若其他子数据包均仅适用于25w31a及之后，则此字段不能使用。
===== 如果一个子数据包同时适用于25w31a之前及之后，则子数据包所在的 #icon("json-object") `overlays` 项必须同时指定 #icon("json-number")#icon("json-array")#icon("json-object") `formats`、#icon("json-number") `max_format` 和 #icon("json-number") `min_format`，且必须满足以下要求：
====== *对最低版本号的验证：* #icon("json-number")#icon("json-array")#icon("json-object") `formats` 的下限必须与 #icon("json-number") `min_format` 相等。
====== *对最高版本号的验证，以下两种方案二选一：*
======= #icon("json-number")#icon("json-array")#icon("json-object") `formats` 的上限与 #icon("json-number") `max_format` 相等。
======= #icon("json-number")#icon("json-array")#icon("json-object") `formats` 的上限固定为81，此时最高版本号由#icon("json-number") `max_format` 决定。

除了添加前置数据包外，子数据包的机制也允许数据包作者在不同的版本之间做兼容。当游戏版本在元数据内某一个子数据包声明的适用版本之内时，该子数据包会起效，并按照列表 #icon("json-object") `overlays` 内子包从下到上的顺序覆盖主数据包的相应路径，从而将主数据包在当前游戏版本不可用的内容替换为子数据包适配此游戏版本的内容。

这是一种精细化配置，作者可以在主数据包内放通用逻辑，在子数据包内放随游戏版本变动的内容。通过元数据内的 #icon("json-object") `overlays` 信息配置多个版本的兼容内容，并在恰当的版本启用子数据包以覆盖主数据包。如此作者可以只发布一个总的数据包，而不必为每个游戏版本分别发布数据包。
#index(display: "数据包多版本兼容", index: "method", "shu4 ju4 bao1 duo1 ban3 ben3 jian1 rong2")
#example(
  [
    一个从24w44a适配到26.1-Snapshot-6（含）的数据包需要包含以下的文件（夹），尝试为此数据包配置元数据。
    #tree(
      (0, [#icon("folder") *主数据包*]),
      (1, [#icon("folder") *dime-25w42a-bef*: 该子包适用于24w44a到25w41a之间（含）的版本。]),
      (1, [#icon("folder") *dime-25w42a-aft*: 该子包适用于25w42a到26.1-Snapshot-6之间（含）的版本。]),
      (1, [#icon("folder") *left_click_listener-25w41a-aft*: 该子包适用于25w41a到26.1-Snapshot-6之间（含）的版本。]),
      (1, [#icon("folder") *data*]),
      (1, [#icon("json") *pack.mcmeta*]),
      (1, [#icon("png") *pack.png*])
    )
  ],
  [
    首先整理主数据包和各子数据包的数据包版本号，各游戏版本的快照也计入在内：
    #general-table(
      caption: "",
      colspan: 3,
      columns: (auto, auto, auto),
      header: ([数据包], [适用版本], [版本号区间]),
      [#icon("folder") `dime-25w42a-bef`], [24w44a \~ 25w41a], [58 \~ 89.0],
      [#icon("folder") `dime-25w42a-aft`], [25w42a \~ 26.1-Snapshot-6], [90.0 \~ 99.0],
      [#icon("folder") `left_click_listener-25w41a-aft`], [25w41a \~ 26.1-Snapshot-6], [89.0 \~ 99.0],
      [主数据包], [24w44a \~ 26.1-Snapshot-6], [58 \~ 99.0]
    )
    存在其他适用于25w31a之前的子数据包，故这些子数据包都需要 #icon("json-number")#icon("json-array")#icon("json-object") `formats` 字段。完整的元数据为：
    #codefile(
      lang: "json",
      title: "pack.mcmeta",
      "{
  \"pack\": {
    \"description\": \"例题数据包\",
    \"pack_format\": 95,
    \"supported_formats\": [58, 99],
    \"min_format\": 58,
    \"max_format\": 99
  },
  \"overlays\": {
    \"entries\": [
      {
        \"directory\": \"dime-25w42a-bef\",
        \"formats\": [58, 89],
        \"min_format\": 58,
        \"max_format\": [89, 0]
      },
      {
        \"directory\": \"dime-25w42a-aft\",
        \"formats\": [90, 99],
        \"min_format\": [90, 0],
        \"max_format\": [99, 0]
      },
      {
        \"directory\": \"left_click_listener-25w41a-aft\",
        \"formats\": [89, 99],
        \"min_format\": [89, 0],
        \"max_format\": [99, 0]
      }
    ]
  }
}"
    )
  ]
)
==== data文件夹
#icon("folder") `data` 文件夹是存储数据包主要内容的文件夹，下面展示了#icon("folder") `data` 文件夹的基本结构，这些文件（夹）就是@tab:writable_registry 所展示的可写注册表以及其他一些配置项的路径，它们不一定必须全部存在，游戏会根据指定的资源路径读取可写注册表中的内容，若相应的可写注册表需要存在，则必须有正确的资源路径和文件（夹）名称。

一个 #icon("folder") `data` 文件夹中可以存在多个不同的命名空间，而命名空间 `minecraft` 下的内容会覆盖原版游戏内容。

在命名空间下的这些文件夹中， #icon("folder") `function` 内的文件使用 `.mcfunction` 格式，#icon("folder") `structure` 内的文件使用 `.nbt` 格式，除 #icon("folder") `datapacks` 外其余文件夹内的文件一律使用 `.json` 格式，编写时务必使用正确的编译软件打开它们。此外，除了 #icon("folder") `datapacks` 的文件夹内部都是可以自由指定资源路径的，那么在各游戏资源的命名空间ID中就可以使用这些资源路径。可参考@exa:namespaced_id_in_datapack。
#tree(
  (0, [#icon("folder") *data*]),
  (1, [#icon("folder") *\<命名空间>*]),
  (2, [#icon("folder") *advancement*: 进度注册表]),
  (2, [#icon("folder") *banner_pattern*: 旗帜图案注册表]),
  (2, [#icon("folder") *cat_sound_variant*: 猫音效变种注册表]),
  (2, [#icon("folder") *cat_variant*: 猫的变种注册表]),
  (2, [#icon("folder") *chat_type*: 聊天类型注册表]),
  (2, [#icon("folder") *chicken_sound_variant*: 鸡音效变种注册表]),
  (2, [#icon("folder") *chicken_variant*: 鸡的变种注册表]),
  (2, [#icon("folder") *cow_sound_variant*: 牛音效变种注册表]),
  (2, [#icon("folder") *cow_variant*: 牛的变种注册表]),
  (2, [#icon("folder") *damage_type*: 伤害类型注册表]),
  (2, [#icon("folder") *datapacks*: 内置数据包，均为功能数据包]),
  (2, [#icon("folder") *dialog*: 对话框注册表]),
  (2, [#icon("folder") *dimension*: 维度注册表]),
  (2, [#icon("folder") *dimension_type*: 维度类型注册表]),
  (2, [#icon("folder") *enchantment*: 魔咒注册表]),
  (2, [#icon("folder") *enchantment_provider*: 魔咒提供器注册表]),
  (2, [#icon("folder") *frog_variant*: 青蛙的变种注册表]),
  (2, [#icon("folder") *function*: 函数]),
  (2, [#icon("folder") *instrument*: 山羊角乐器注册表]),
  (2, [#icon("folder") *item_modifier*: 物品修饰器注册表]),
  (2, [#icon("folder") *jukebox_song*: 唱片机曲目注册表]),
  (2, [#icon("folder") *loot_table*: 战利品表注册表]),
  (2, [#icon("folder") *painting_variant*: 画的变种注册表]),
  (2, [#icon("folder") *pig_sound_variant*: 猪音效变种注册表]),
  (2, [#icon("folder") *pig_variant*: 猪的变种注册表]),
  (2, [#icon("folder") *predicate*: 谓词注册表]),
  (2, [#icon("folder") *recipe*: 配方注册表]),
  (2, [#icon("folder") *structure*: 结构]),
  (2, [#icon("folder") *tags*: 数据包标签]),
  (2, [#icon("folder") *test_environment*: 测试环境注册表]),
  (2, [#icon("folder") *test_instance*: 测试实例注册表]),
  (2, [#icon("folder") *timeline*: 时间线注册表]),
  (2, [#icon("folder") *trade_set*: 交易集注册表]),
  (2, [#icon("folder") *trial_spawner*: 试炼刷怪笼配置注册表]),
  (2, [#icon("folder") *trim_material*: 盔甲纹饰材料注册表]),
  (2, [#icon("folder") *trim_pattern*: 盔甲纹饰图案注册表]),
  (2, [#icon("folder") *villager_trade*: 村民交易注册表]),
  (2, [#icon("folder") *wolf_sound_variant*: 狼音效变种注册表]),
  (2, [#icon("folder") *wolf_variant*: 狼的变种注册表]),
  (2, [#icon("folder") *world_clock*: 世界时钟注册表]),
  (2, [#icon("folder") *worldgen*: 世界生成模块]),
  (3, [#icon("folder") *biome*: 生物群系注册表]),
  (3, [#icon("folder") *configured_carver*: 已配置的雕刻器注册表]),
  (3, [#icon("folder") *configured_feature*: 已配置的地物注册表]),
  (3, [#icon("folder") *density_function*: 密度函数注册表]),
  (3, [#icon("folder") *flat_level_generator_preset*: 超平坦世界生成预设注册表]),
  (3, [#icon("folder") *multi_noise_biome_source_parameter_list*: 多噪声参数列表注册表]),
  (3, [#icon("folder") *noise*: 噪声注册表]),
  (3, [#icon("folder") *noise_settings*: 噪声设置注册表]),
  (3, [#icon("folder") *placed_feature*: 已放置的地物注册表]),
  (3, [#icon("folder") *processor_list*: 处理器列表注册表]),
  (3, [#icon("folder") *structure*: 已配置的结构地物注册表]),
  (3, [#icon("folder") *structure_set*: 结构集注册表]),
  (3, [#icon("folder") *template_pool*: 结构池注册表]),
  (3, [#icon("folder") *world_preset*: 世界预设注册表]),
  (2, [#icon("folder") *zombie_nautilus_variant*: 僵尸鹦鹉螺变种注册表])
)
=== 实验性内容 \*
自22w42a起，Minecraft部分更新内容会以内置数据包的形式加入游戏，使玩家可以提前体验这些内容。这些内容被称为#proper-noun(display: "实验性内容（Experiments）", "shi2 yan4 xing4 nei4 rong2")。在当前版本（26.1），可用的实验性内容有三项：村民交易平衡性调整、红石实验性内容和矿车改进。

所有实验性内容都是#proper-noun(display: "功能数据包（Feature datapack）", "gong1 neng2 shu4 ju4 bao1")的形式，启用这些实验性内容的方式有两种：一是在选择数据包窗口选择功能数据包；二是创建新世界时点击实验性内容从而操控这些实验性内容的开关。
#figure(
  caption: "试验性内容窗口",
  image("图片/试验性内容窗口.png", width: 28em)
)
数据包无法直接修改游戏代码，但功能数据包似乎“注册”了新的游戏内容，功能数据包是否有其独特的行为？其实，实验性内容分为硬编码内容和数据驱动内容，其中的硬编码内容被称为特定组别的#proper-noun(display: "功能元素（Feature Element）", "gong1 neng2 yuan2 su4")。#proper-noun(display: "功能开关（Feature Flag）", "gong1 neng2 kai1 guan1")则用于启用或禁用这些功能元素。当一个功能数据包被启用时，元数据中 `enabled` 字段启用，相应的功能开关被打开，其中的功能元素就能在游戏中正常运行。若一个功能数据包被关闭，则相应的功能元素被过滤。

实验性内容除了可在新创建存档时启用或禁用外，也可以通过修改 #icon("nbt") `level.dat` 中的 #icon("nbt-list") `enabled_features` 字段以在已创建的存档中启用或禁用。相应格式见@sec:saves 节的描述。

实验性内容中的数据驱动部分则交由数据包完成，这些功能数据包作为子数据包存在，存储于 #icon("folder") `datapacks` 文件夹，相应文件结构如下：
#tree(
  (0, [#icon("folder") *data*]),
  (1, [#icon("folder") *\<命名空间>*]),
  (2, [#icon("folder") *datapacks*]),
  (3, [#icon("folder") *\<数据包名称>*]),
  (4, [#icon("folder") *data*]),
  (4, [#icon("json") *pack.mcmeta*]),
  (4, [#icon("png") *pack.png*])
)
其中的 #icon("folder") `<数据包名称>` 即为一个功能数据包，其结构与正常数据包无异，也需要有元数据。但这些数据包无法由自定义的数据包添加，仅由游戏内部提供，仅作了解。
=== 数据包标签定义格式 <subsec:tag_definition>
小节@subsec:tag_in_datapack 已提出了#proper-noun(display: "数据包标签（Tags in data packs）", "shu4 ju4 bao1 biao1 qian1")的概念，它是将游戏资源分类的一种办法。玩家不仅可以使用原版数据包既有的数据包标签，也可以新增或删改原有的标签。数据包标签模块在数据包内的文件结构如下：
#tree(
  (0, [#icon("folder") *data*]),
  (1, [#icon("folder") *\<命名空间>*]),
  (2, [#icon("folder") *tags*]),
  (3, [#icon("folder") *\<注册表>*]),
  (4, [#icon("json") *\<标签>.json*])
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
    [自定义世界生成（生物群系）], [`worldgen > biome`],
    [自定义世界生成（超平坦预设）], [`worldgen > flat_level_generator_preset`],
    [自定义世界生成（结构）], [`worldgen > structure`],
    [自定义世界生成（世界预设）], [`worldgen > world_preset`]
  )
)
对于一个特定的数据包标签 #icon("json") `data > <命名空间> > tags > <注册名> > <标签>.json`，引用它的方式是带 `#` 号的命名空间ID，其中 `<注册表>` 层级不书写：
#codebox("#<命名空间>:<标签>")
若命名空间不写，则默认使用 `minecraft` 内的数据包标签。`<注册表>` 层级下可以添加一定的路径。例如，#icon("json") `data\<命名空间>\tags\<注册名>\<路径>\<标签>.json` 的引用格式为
#codebox("#<命名空间>:<路径>/<标签>")
所有的数据包标签 `.json` 文件，无论其所属的注册表，一律有如下的格式：
#tree(
  (0, [#icon("json-object") 文件封装]),
  (1, [#icon("json-bool") *replace*: 指定此标签的引用是否覆盖较低优先级数据包中同命名空间内的同名标签，若设为 `true`，则忽略较低优先级数据包内的引用；若设为 `false`，则此标签内的引用作为对同名标签内引用内容的补充。默认为 `false`。]),
  (2, [#icon("json-object") *#underline[values]*: 此标签引用的游戏资源，必须引用同类型的游戏资源。可以引用游戏资源本身，也可以引用其他的同类型数据包标签。]),
  (3, [#icon("json-string") 一个被引用游戏资源的命名空间ID。]),
  (3, [#icon("json-string") 一个被引用的同类型数据包标签，需要带 `#` 号。]),
  (3, [#icon("json-object") 引用游戏资源的完整格式。]),
  (4, [#icon("json-string") *#underline[id]*: 一个被引用游戏资源的命名空间ID或同类型数据包标签。]),
  (4, [#icon("json-bool") *required*: 用 `false` 表示该条目是可选的，若该条目 #icon("json-string") `id` 所述内容不存在，则不会使标签加载失败。默认为 `true`。])
)
#example(
  [原版存在一个名为 `#air` 的方块标签，有三种方块属于这个标签：空气、洞穴空气和虚空空气，试编写这个标签。],
  [
    这个标签没有使用命名空间，默认命名空间为 `minecraft`。首先确定这个标签的文件路径：
    #tree(
      (0, [#icon("folder") *data*]),
      (1, [#icon("folder") *minecraft*]),
      (2, [#icon("folder") *tags*]),
      (3, [#icon("folder") *block*]),
      (4, [#icon("json") *air.json*])
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
    #tree(
      (0, [#icon("folder") *data*]),
      (1, [#icon("folder") *the_backrooms*]),
      (2, [#icon("folder") *tags*]),
      (3, [#icon("folder") *worldgen*]),
      (4, [#icon("folder") *biome*]),
      (5, [#icon("json") *level_37.json*])
    )
    + 写出该标签的引用方式。
    + 同个数据包内已有如下的生物群系，尝试在该标签中引用这些生物群系。
      #tree(
        (0, [#icon("folder") *data*]),
        (1, [#icon("folder") *the_backrooms*]),
        (2, [#icon("folder") *worldgen*]),
        (3, [#icon("folder") *biome*]),
        (4, [#icon("folder") *level_37*]),
        (5, [#icon("json") *normal.json*]),
        (5, [#icon("json") *deep_water.json*]),
        (5, [#icon("json") *dark_zone.json*])
      )
  ],
  [
    + #icon("folder") `the_backrooms` 是命名空间，#icon("folder") `tags` 是标签的路径，#icon("folder") `worldgen` 和 #icon("folder") `biome` 是标签内注册表的路径，因此该标签的引用方式为 `#the_backrooms:level_37`。
    + #icon("folder") `the_backrooms` 是命名空间，#icon("folder") `worldgen` 和 #icon("folder") `biome` 是注册表的路径，因此这些生物群系的命名空间ID分别为 `the_backrooms:level_37/normal`、`the_backrooms:level_37/deep_water` 和 `the_backrooms:level_37/dark_zone`，现在在标签内引用它们：
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

#proper-noun(display: "资源包（Resource pack）", "zi1 yuan2 bao1")允许玩家在不修改源代码的情况下自定义纹理、模型、声音、语言等外观性资源，对客户端有效。资源包本质上是一个文件夹或压缩文件，被储存在 #icon("folder") `.minecraft > resourcepacks` 中，同一个 #icon("folder") `resourcepacks` 文件夹内能存放多个资源包。选项资源包窗口“可用”一栏仅罗列 #icon("folder") `resourcepacks` 文件夹内的所有的有效资源包，可在这一栏选用资源包，只有位于“已选”一栏的资源包有效。点击打开包文件夹后可以手动添加资源包。
#figure(
  caption: "选择资源包窗口",
  image("图片/选择资源包窗口.png", width: 28em)
)
在游戏中可以同时使用多个资源包，这些资源包按照“已选”一栏中从下到上的顺序依次加载，资源包的加载顺序可以在该栏中调换。和数据包类似，若这些资源包对同种资源的外观进行定义，则*后加载的资源包会对先加载的资源包进行覆盖*，*表明越靠后加载的资源包其优先级越高*。

资源包也可以以压缩包的形式存放在存档文件夹中，这时资源包作为#proper-noun(display: "世界指定资源包（World specific resources）", "shijiezhidingziyuanbao")使用，仅在当前存档起作用，且会使该资源包的优先级设为最高，并将已定义的资源外观覆盖选项资源包中已启用的资源包。有效的世界指定资源包必须以 #icon("zip") `resources.zip` 为压缩文件名。

在服务器中，管理员可在 #icon("file") `server.properties` 中的 `resource-pack` 一项指定一个 `.zip` 文件的下载地址，从而将此 `.zip` 文件设为服务器的指定资源包。若启用，则游戏会强制将该资源包设为最顶层资源包且无法更改位置。

原版资源包位于 #icon("folder") `.minecraft\versions\<版本号>\<版本号>.jar\assets`，是制作自定义资源包的重要依据，读者可参考之。
=== 资源包的基本结构
一个资源包拥有以下的基本结构：
#tree(
  (0, [#icon("folder") *\<资源包名称>*或 #icon("zip") *\<资源包名称>.zip*]),
  (1, [#icon("folder") *\<子资源包>*]),
  (2, [递归此文件夹结构]),
  (1, [#icon("folder") *assets*: 资源包的主体内容。]),
  (1, [#icon("json") *#underline[pack.mcmeta]*: 资源包的元数据。]),
  (1, [#icon("png") *pack.png*: 可选，作为资源包的图标使用。])
)
如果该资源包以压缩文件的形式存在，则 #icon("zip") `<资源包名称>.zip` 和 #icon("folder") `<子数据包>`、#icon("folder") `assets`、#icon("json") `pack.mcmeta`、#icon("png") `pack.png` 这些文件之间不要插入其他层级的文件夹。*若该资源包为世界指定资源包，则名称一定为 #icon("zip") `resources.zip`。*

资源包中 #icon("folder") `assets` 用于存放各种资源文件，#icon("json") `pack.mcmeta` 作为资源包的#proper-noun(display: "元数据（Metadata）", "yuan2 shu4 ju4")使用。和数据包一样，所谓元数据，就是用于决定 #icon("folder") `<资源包名称>` 或 #icon("zip") `<资源包名称>.zip` 这个文件（夹）是否为一个资源包，只有当元数据存在时，游戏才能识别资源包。

#icon("json") `pack.mcmeta` 包含的内容如下所示：
#tree(
  (0, [#icon("json-object") 文件封装]),
  (1, [#icon("json-object") *#underline[pack]*: 此资源包的基本信息。]),
  (2, [#icon("json-string")#icon("json-array")#icon("json-object") *#underline[description]*: 任意文本，使用文本组件格式，可用于对资源包的简单介绍。此段文本会出现在选项资源包中。]),
  (2, [#icon("json-number")#icon("json-array") *#underline[max_format]*: 资源包最高兼容的版本号。若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon("json-number") 形式或在 #icon("json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0x7fffffff`。]),
  (2, [#icon("json-number")#icon("json-array") *#underline[min_format]*: 资源包最低兼容的版本号。若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon("json-number") 形式或在 #icon("json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0`。]),
  (2, [#icon("json-number") *pack_format*: 25w31a以前用于指定资源包版本号的字段，现已弃用，可用于兼容旧版资源包。]),
  (2, [#icon("json-number")#icon("json-array")#icon("json-object") *supported_formats*: 25w31a以前用于指定资源包版本号兼容范围的字段，现已弃用，可用于兼容旧版资源包。]),
  (3, [*若使用 #icon("json-number") 形式，则精确匹配，效果与 #icon("json-number") pack_format一致*], false),
  (3, [*若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为最低兼容的版本号，第二个为最高兼容的版本号*], false),
  (3, [*若使用 #icon("json-object") 形式，则有以下字段：*], false),
  (3, [#icon("json-number") *max_inclusive*: 最高兼容的版本号。]),
  (3, [#icon("json-number") *min_inclusive*: 最低兼容的版本号。]),
  (1, [#icon("json-object") *language*: 可选，用于添加选项卡中的语言，可以添加多个语言。]),
  (2, [#icon("json-array") *\<语言代码>*: 一个新建的语言，键名按照 `<语言>_<地区>` 的格式，其与 #icon("folder") `assets\minecraft\lang` 中同名的 `.json` 文件相对应。]),
  (3, [#icon("json-bool") *bidirectional*: 布尔值，若为 `true`，则按照从右到左的格式显示。默认为 `false`。]),
  (3, [#icon("json-string") *#underline[name]*: 语言的名称。]),
  (3, [#icon("json-string") *#underline[reigon]*: 国家或地区的名称。]),
  (1, [#icon("json-object") *filter*: 可选，用于指定在资源包加载列表中优先级低于该包的资源包内要忽略的内容。]),
  (2, [#icon("json-array") *block*: 忽略内容列表。]),
  (3, [#icon("json-object") 一项被忽略的内容。若此项为空则完全忽略所有优先级低的资源包。]),
  (4, [#icon("json-string") *namespace*: 要忽略的命名空间，若省略则忽略所有命名空间，可使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (4, [#icon("json-string") *path*: 要忽略的资源路径，若省略则忽略所有路径，可使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (1, [#icon("json-object") *overlays*: 可选，用于子资源包的识别。]),
  (2, [#icon("json-array") *#underline[entries]*: 可用子资源包的列表。]),
  (3, [#icon("json-object") 一个子资源包。]),
  (4, [#icon("json-string") *#underline[directory]*: 该子资源包相对于主资源包根目录的路径。允许使用的字符有：小写字母、`0123456789`、`_` 和 `-`。]),
  (4, [#icon("json-number")#icon("json-array") *max_format*: 该子资源包最高兼容的版本号。若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon("json-number") 形式或在 #icon("json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0x7fffffff`。]),
  (4, [#icon("json-number")#icon("json-array") *min_format*: 该子资源包最低兼容的版本号。若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为主要版本号，第二个为次要版本号。若使用 #icon("json-number") 形式或在 #icon("json-array") 形式内只填写一个数值，则视为只写主要版本号，次要版本号默认为次要版本号 `0`。]),
  (4, [#icon("json-number")#icon("json-array")#icon("json-object") *formats*: 25w31a以前用于指定子资源包版本号兼容范围的字段，现已弃用，可用于兼容旧版资源包。]),
  (5, [*若使用 #icon("json-number") 形式，则精确匹配*], false),
  (5, [*若使用 #icon("json-array") 形式，则内部包含两个整数，第一个为最低兼容的版本号，第二个为最高兼容的版本号*], false),
  (5, [*若使用 #icon("json-object") 形式，则有以下字段：*], false),
  (5, [#icon("json-number") *max_inclusive*: 最高兼容的版本号。]),
  (5, [#icon("json-number") *min_inclusive*: 最低兼容的版本号。])
)
例如，下面是1.21.11版本的一个标准 #icon("json") `pack.mcmeta` 文件：
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
    [1.21.11], [75.0],
    [26.1], [84.0]
  )
)
资源包的版本号同样具有校验规则，也以25w31a（1.21.9）为分水岭实行“新旧双轨制”，以下分类讨论：
===== 如果资源包仅适用于25w31a之前，则元数据中：
*必须使用的字段*：#icon("json-number") `pack_format`

*可以使用的字段*：#icon("json-number")#icon("json-array")#icon("json-object") `supported_formats`。若使用，则此区间必须包含 #icon("json-number") `pack_format` 的值，且最大值不能低于16，因为此字段是在23w31a引入的。

*不能使用的字段*：#icon("json-number") `max_format` 和 #icon("json-number") `min_format`
===== 如果资源包仅适用于25w31a及之后，则元数据中：
*必须使用的字段*：#icon("json-number") `max_format` 和 #icon("json-number") `min_format`

*不能使用的字段*：#icon("json-number") `pack_format` 和 #icon("json-number")#icon("json-array")#icon("json-object") `supported_formats`
===== 如果资源包同时适用于25w31a之前及之后，则必须同时指定 #icon("json-number") `pack_format`、#icon("json-number")#icon("json-array")#icon("json-object") `supported_formats`、#icon("json-number") `max_format` 和 #icon("json-number") `min_format`，且必须满足以下要求：
====== *区间验证：\ *#icon("json-number") `pack_format` 必须落在兼容区间内。
====== *对最低版本号的验证：*\ #icon("json-number")#icon("json-array")#icon("json-object") `supported_formats` 的下限必须与 #icon("json-number") `min_format` 相等。
====== *对最高版本号的验证，以下两种方案二选一：*\ 
======= #icon("json-number")#icon("json-array")#icon("json-object") `supported_formats` 的上限与 #icon("json-number") `max_format` 相等。
======= #icon("json-number")#icon("json-array")#icon("json-object") `supported_formats` 的上限固定为64，此时最高版本号由#icon("json-number") `max_format` 决定。

和子数据包一样，子资源包的版本号也需要进行校验，校验规则与主资源包的校验规则类似，如下所示：
#reset-h5
===== 如果一个子资源包仅适用于25w31a之前，则子资源包所在的 #icon("json-object") `overlays` 项：
*必须使用的字段*：#icon("json-number")#icon("json-array")#icon("json-object") `formats`

*不能使用的字段*：#icon("json-number") `max_format` 和 #icon("json-number") `min_format`
===== 如果一个子资源包仅适用于25w31a及之后，则子资源包所在的 #icon("json-object") `overlays` 项：
*必须使用的字段*：#icon("json-number") `max_format` 和 #icon("json-number") `min_format`

*关于 #icon("json-number")#icon("json-array")#icon("json-object") `formats`*：若存在其他适用于25w31a之前的子资源包，则此字段必须指定；若其他子资源包均仅适用于25w31a及之后，则此字段不能使用。
===== 如果一个子资源包同时适用于25w31a之前及之后，则子资源包所在的 #icon("json-object") `overlays` 项必须同时指定 #icon("json-number")#icon("json-array")#icon("json-object") `formats`、#icon("json-number") `max_format` 和 #icon("json-number") `min_format`，且必须满足以下要求：
====== *对最低版本号的验证：* #icon("json-number")#icon("json-array")#icon("json-object") `formats` 的下限必须与 #icon("json-number") `min_format` 相等。
====== *对最高版本号的验证，以下两种方案二选一：*
======= #icon("json-number")#icon("json-array")#icon("json-object") `formats` 的上限与 #icon("json-number") `max_format` 相等。
======= #icon("json-number")#icon("json-array")#icon("json-object") `formats` 的上限固定为64，此时最高版本号由#icon("json-number") `max_format` 决定。
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
    #icon("json-number") `pack_format`、#icon("json-number")#icon("json-array")#icon("json-object") `supported_formats`、#icon("json-number") `max_format` 和 #icon("json-number") `min_format` 四个字段同时存在，说明此资源包同时适用于25w31a之前及之后。

    首先进行区间验证：#icon("json-number") `pack_format` 的值在兼容区间内。

    其次对最低版本号进行验证：#icon("json-number")#icon("json-array")#icon("json-object") `supported_formats` 的下限与 #icon("json-number") `min_format` 相等。

    最后对最高版本号进行验证，#icon("json-number")#icon("json-array")#icon("json-object") `supported_formats` 的上限与 #icon("json-number") `max_format` 不相等。再检查，#icon("json-number")#icon("json-array")#icon("json-object") `supported_formats` 的上限为64，#icon("json-number") `max_format` 是一个大于64的值。

    故此资源包的版本号编写正确。
  ]
)
下面展示了 #icon("folder") `assets` 文件夹的基本结构，这些文件（夹）不一定必须全部存在，游戏会根据指定的资源路径读取资源包中的内容，因此若相应的资源文件（夹）需要存在，则必须有正确的资源路径和文件（夹）名称。
#tree(
  (0, [#icon("folder") *assets*]),
  (1, [#icon("folder") *\<命名空间>*]),
  (2, [#icon("folder") *atlases*: 纹理图集]),
  (2, [#icon("folder") *blockstates*: 方块状态映射]),
  (2, [#icon("folder") *equipment*: 装备模型]),
  (2, [#icon("folder") *font*: 字体]),
  (2, [#icon("folder") *items*: 物品模型映射]),
  (2, [#icon("folder") *lang*: 语言]),
  (2, [#icon("folder") *models*: 烘焙模型]),
  (2, [#icon("folder") *particles*: 粒子纹理定义]),
  (2, [#icon("folder") *post_effect*: 后处理管线]),
  (2, [#icon("folder") *sounds*: 声音]),
  (2, [#icon("folder") *shaders*: 着色器]),
  (2, [#icon("folder") *texts*: 文本]),
  (2, [#icon("folder") *texture*: 纹理]),
  (2, [#icon("folder") *waypoint_style*: 路径点样式]),
  (2, [#icon("json") *gpu_warnlist.json*: GPU警告列表]),
  (2, [#icon("json") *regional_compliancies.json*: 地区合规性警告]),
  (2, [#icon("json") *sounds.json*: 声音事件定义文件]),
)
=== GPU警告列表 \*
资源包负责游戏的画面渲染。部分计算机显卡太旧、驱动版本不匹配，或者GPU属于某些已知会造成游戏崩溃的型号，因此资源包内存在 #icon("json") `gpu_warnlist.json` 这个用于自检硬件兼容性的配置文件。其格式如下所示：
#tree(
  (0, [#icon("json-object") 文件封装]),
  (1, [#icon("json-array") *#underline[renderer]*: 需要显示渲染器警告的渲染器名称（显卡型号）。]),
  (2, [#icon("json-string") 一个渲染器名称，使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (1, [#icon("json-array") *#underline[version]*: 需要显示渲染器版本警告的渲染器版本（通常为显卡驱动的版本号）。]),
  (2, [#icon("json-string") 一个渲染器版本，使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。]),
  (1, [#icon("json-array") *#underline[vendor]*: 需要显示渲染器厂商警告的渲染器生产厂商。]),
  (2, [#icon("json-string") 一个渲染器厂商，使用#link("https://www.runoob.com/regexp/regexp-syntax.html")[正则表达式]。])
)
例如，原版资源包的 #icon("json") `gpu_warnlist.json` 文件内容如下：
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
部分国家或地区针对游戏颁布了一定的法律法规，资源包内 #icon("json") `regional_compliancies.json` 可以相应地设置游戏在运行一段时间后出现的弹窗警告，其格式如下所示：
#tree(
  (0, [#icon("json-object") 文件封装]),
  (1, [#icon("json-array") *\<地区代码>*: 键名为#link("https://zh.wikipedia.org/wiki/ISO_3166-1%E4%B8%89%E4%BD%8D%E5%AD%97%E6%AF%8D%E4%BB%A3%E7%A0%81")[ISO 3166-1三位字母地区代码]，游戏会针对该系统地区进行弹窗。]),
  (2, [#icon("json-object") 一项弹窗。]),
  (3, [#icon("json-number") *delay*: 第一次弹窗时游戏的运行时间，单位为分钟，默认值为 `0`。]),
  (3, [#icon("json-number") *period*: 弹窗周期，单位为分钟。]),
  (3, [#icon("json-string") *title*: 弹窗标题，需要是一个翻译标识符，详见小节@subsec:translate。]),
  (3, [#icon("json-string") *message*: 弹窗的具体信息，需要是一个翻译标识符，详见小节@subsec:translate。])
)
原版资源包内的 #icon("json") `regional_compliancies.json` 内容如下：
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

物理服务端内的逻辑服务端又可被称为*专用服务器（Dedicated server，或译为独立服务端）*#index(display: "专用服务器（Dedicated server，独立服务端）", "zhuan1 yong4 fu2 wu4 qi4")，该逻辑服务端包含配置文件 #icon("file") `server.properties`，用于存储服务器的所有设置。专用服务器不会受到连接的逻辑客户端的影响。同局域网联机一样，专用服务器也拥有一个地址，其格式与语法@code:ipv4 所述一致。
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
$ "MSPT" times "TPS" lt.eq.slant 1000 $
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
  + *如果游戏世界被重新加载（如使用 `/reload`），则调用 `#minecraft:load` 中的函数，调用顺序与列表 #icon("json-array") `value` 中的函数顺序一致。*一个函数被调用时按 `.mcfunction` 文件内的命令顺序依次执行命令。<enu:gametick_order_reload> 
  + \**调用一次 `#minecraft:tick` 中的函数*，顺序与@enu:gametick_order_reload 中所述一致。
  + 遍历所有维度，遍历顺序为：主世界、下界、末地、有先后顺序的自定义维度。遍历到某个维度时，按以下流程计算：
    + 每隔20 gt对玩家同步一次该维度的时间。
    + 运行维度游戏刻逻辑，若计算出现异常，则游戏崩溃。游戏刻逻辑按以下流程计算：
      + 更新世界边界。
      + \*计算天气循环、更新降雨和雷暴计时器。
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
  [$d_"r"$], [在单人游戏中为渲染距离，原版的渲染距离必须为介于2和32之间（含）的整数。在多人游戏中为 #icon("file") `server.properties` 中 `view-distance` 的值。]
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
  header: (table.cell(rowspan: 2)[标签类型], table.cell(rowspan: 2)[注册名称], table.cell(colspan: 2)[基础等级], table.cell(rowspan: 2)[存活时间], table.cell(rowspan: 2)[持久化], table.cell(fill: theme_basic.lighten(20%))[#set text(fill: white, font: "Source Han Sans SC", weight: "bold")
  加载等级], table.cell(fill: theme_basic.lighten(20%))[#set text(fill: white, font: "Source Han Sans SC", weight: "bold")
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
  [$x_i$、$z_i$], [区块$i$的区块坐标，$i = 1,2,3 dots.h.c$。],
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

方块更新会向外传播，在执行更新的过程中可能在毗邻方块产生新的更新，一直到所有可用的更新都执行完毕，但是在更新无法完全清除的情况下可能会造成游戏崩溃。例如在只有一层沙子的超平坦世界中破坏任意沙子，则方块更新传播会持续进行，并且计算更新的方块数量越来越多，最终会不可避免地造成游戏崩溃。服务端配置文件 #icon("file") `server.properties` 的 `max-chained-neighbor-updates` 一项可用于设置最大的连锁更新数量，超过此值的新增更新将会被忽略。

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
#icon("file") `server.properties`，即*服务端配置文件*，文件中一个配置属性占据一行，每一行的格式为：
#codebox("<属性>=<值>")
例如：
#codebox("gamemode=survival")
#codebox("enable-command-block=false")
下表列举了所有可用的属性：
#general-table(
  caption: [ #icon("file") `server.properties` 可用属性表],
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
本小节讲述的一系列命令是对服务器管理有用的一类命令，仅能在多人游戏中使用。由于它们的权限等级均大于2，因此在命令方块上无法运行这些命令。如果 #icon("file") `server.properties` 中的 `function-permission-level` 没有设为足够的权限等级，那么数据包函数也是不能执行这些命令的。
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
此管理员权限等级由 #icon("file") `server.properties` 中的 `op-permission-level` 决定，详见@tab:server_properties。
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
此命令仅会发出请求，实际能否转移成功取决于目的服务器 #icon("file") `server.properties` 中的 `accepts-transfers` 配置，详见@tab:server_properties。`/transfer` 的语法为：
#codebox("transfer <hostname> [<port>] [<players>]")
#param-desc(
  [`<hostname>`（字符串 `brigadier:string`）], [目的服务器的主机名。],
  [`[<port>]`（整型 `brigadier:integer`）], [可选，目的服务器端口号，若不指定则为 `25565`。],
  [`[<players>]`（实体 `minecraft:entity`）], [可选，被转移的玩家，必须为玩家名、目标选择器或UUID。若不指定则默认为命令执行者。]
)
==== 命令 `/perf`
它用于记录服务器游戏刻执行时长和占用的堆内存大小等性能指标，并将结果保存于游戏文件 #icon("zip") `.minecraft\debug\profiling\<时间戳>.zip`。命令 `perf start` 即开始长达10秒的性能分析，`perf stop` 可以在10秒之前结束性能分析。此命令需要权限等级4。#index(index: "command", "perf")
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
#heading(level: 2, numbering: none, [第一章思考题与习题])<sec:chapter_1_exercise>
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
+ 将以下树状形式的数据写为JSON。<t:json_tree>
  #tree(
    (0, [#icon("json-object") 文件封装]),
    (1, [#icon("json-string") *condition*: `minecraft:entity_properties`]),
    (1, [#icon("json-string") *entity*: `this`]),
    (1, [#icon("json-object") *predicate*]),
    (2, [#icon("json-string") *type*: `minecraft:player`]),
    (2, [#icon("json-object") *flags*]),
    (3, [#icon("json-bool") *is\_{}sprinting*: `true`])
  )
+ 若一个字符串类型的JSON字段 #icon("json-string") `text` 需要的值分别如下所示，写出各自对应的字段。<t:json_text>
  + `分节符"\"的作用很大`
  + `\\"Hello World!\\"`
  + `JSON形式的文本组件为{"text":"\\Hello World!\\"}`
  + `在SNBT中，反斜杠\直接使用反斜杠\转义即可，即\\`
+ \*什么是 `.txt` 文件？#icon("folder") `.minecraft`文件夹中有哪些文件是以 `.txt` 的格式存在的？
+ \*任意列举10个需要使用JSON格式的文件。
+ \*如何在#icon("folder") `assets` 文件夹中寻找村民悠闲时的声音文件？
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
= 坐标<chap:coordinates>
Minecraft的游戏世界是三维的。在编写数据包的时候，有时需要确定实例所需的位置参数。这样的参数被称为#proper-noun(display:"坐标（Coordinate）","zuo4 biao1")。本章将详细介绍各种坐标参数以及这些参数在命令上的应用。
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

一个方块使用其*西北下角*的点作为它的#proper-noun(display:"方块坐标（Block position）","fang1 kuai4 zuo4 biao1")。若一个方块的西北下角顶点坐标为$(x,y,z)$，则该方块的方块坐标记为$(x,y,z)$，而这个方块位于$(x,y,z)$和$(x+1,y+1,z+1)$这两个坐标围成的立体几何图形之间。
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
#proper-noun(display:"三维坐标（Three-dimensional coordinates）","san1 wei2 zuo4 biao1")是精确表示一个位置的坐标参数，命令参数类型为 `minecraft:vec3`，用于表示坐标位置的三个元素均为双精度浮点数。三维坐标一般应用于实体，它也可能会在粒子生成和声音播放的时候被使用。例如，这是一个合法的三维坐标：
#codebox("5.0 56.0 17.0")
#h(-2em)这个坐标带有小数点，因为三维坐标的三个参数均是双精度浮点数。但是，这并不意味着三维坐标只能使用浮点数。也可以在三维坐标中使用整数形式，如：
#codebox("5 56 17")
注意，上述这两个坐标描述的位置并不是一致的。在实际操作中，可以发现参数 `5 56 17` 指定的坐标实际上是$(5.5,56.0,17.5)$，这个现象在 `/tp`、`/summon` 等命令使用的坐标参数中都可以观察到。如图，可以观察到$x$坐标和$z$坐标都发生了“偏移”，与实际坐标有所出入，而$y$坐标不受影响。
#figure(
  caption: [整数坐标发生的“偏移”],
  image("图片/整数坐标发生的“偏移”.png", width: 36em)
)
这些位置的偏移都位于相对方块两条对边的中心线上，这是因为三维坐标使用了#proper-noun(display:"中心校准（Center correct）","zhong1 xin1 jiao4 zhun3")，即使用整数形式的三维坐标，当其某一个坐标参数为$n$（$n∈Z$）时，其实际坐标为$n−0.5$，这样可以与方块的位置相适应。注意*中心校准仅适用于$x$坐标和$z$坐标。$y$坐标严格使用实际坐标*。

注意这里不使用“三维坐标根据方块坐标位于方块中心”的说法，是因为三维坐标的三个参数中整数和浮点数形式可以混用，并且使用小数形式的参数严格遵循实际坐标，整数形式的参数则使用中心校准。比如，位于 `5 56 17.0` 的玩家实际位于$(5.5,56,17.0)$。
==== 平面方块坐标
故名思义，平面方块坐标 `minecraft:column_pos` 就是二维的方块坐标，以西北角的二维坐标作为一个方块纵列的平面坐标，两个元素均为整数。
==== 二维坐标
即只由$x$坐标和$z$坐标构成的#proper-noun(display:"二维坐标（Two-dimensional coordinates）","er4 wei2 zuo4 biao1")。二维坐标的命令参数类型为 `minecraft:vec2`，两个元素均为双精度浮点数。二维坐标若为整数，则也使用中心校准。
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
    相对坐标规定命令方块所在的位置即为原点，在将相对坐标转换为绝对坐标时，只需要在绝对坐标的基础上做相应的加减，这个题中的方块坐标为$(-24+12,55-3,10-5)$，计算可得$(-12,52,5)$。

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

和相对偏航角一样，游戏也允许使用 `~` 和相对偏移量表示相对俯仰角，格式为：
#codebox("~[<pitch>]")
表示在原来俯仰角的基础上增加一定角度值后形成的俯仰角。由偏航角、俯仰角组成的朝向参数允许绝对朝向和相对朝向混用。
=== 命令/rotate
命令 `/rotate` 用于修改实体的朝向，以下是所有用法：#index(index: "command", "rotate")
===== 使实体旋转至特定的朝向
#codebox("rotate <target> <rotation>")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [需要被旋转的实体。],
  [`<rotation>`（朝向 `minecraft:rotation`）], [特定的朝向，含有两个参数，依次为偏航角、俯仰角。允许使用波浪号 `~` 以表示相对朝向。]
)
#example(
  [将最近的玩家修改为水平面向正南方。],
  [
    水平面向正南方的偏航角为 `0.0`，俯仰角为 `0.0`，因此命令为
    #codebox("rotate @p 0.0 0.0")
  ]
)
===== 使实体朝向特定的坐标
#codebox("rotate <target> facing <facingLocation>")
#param-desc(
  [`<facingLocation>`（三维坐标 `minecraft:vec3`）], [指定朝向的坐标，必须为精确的三维坐标，整数坐标会被中心校准。]
)
执行锚点会对该命令的执行结果造成影响，因为它会改变命令上下文。若该命令的执行者锚点为 `feet`，则以朝向位置对脚底的方向作为视线方向（如@fig:raycasting_by_anchor (a)），因此如果朝向位置的$y$坐标与指定实体脚底$y$坐标相等，理论上该指定实体的视线方向应是水平的；若该命令的执行者锚点为 `eyes`（如@fig:raycasting_by_anchor (b)），则以朝向位置对眼睛的方向作为视线方向 。若该命令单独使用，则默认锚点为 `feet`，如果需要将锚点设为 `eyes`，则可以用 `/execute` 命令修改：
#codebox("execute anchored eyes run rotate @s facing 0 70 0")
#sub-figure(
  caption: "锚点与朝向位置的关系对视线方向的影响",
  label: <fig:raycasting_by_anchor>,
  [#image("图片/锚点与朝向位置的关系对视线方向的影响a.png", height: 10em)\(a)],
  [#image("图片/锚点与朝向位置的关系对视线方向的影响b.png", height: 10em)\(b)]
)
===== 使实体朝向特定的实体
#codebox("rotate <target> facing entity <facingEntity> [<facingAnchor>]")
#param-desc(
  [`<facingEntity>`（实体 `minecraft:entity`）], [指定朝向的目标实体],
  [`[<facingAnchor>]`（实体锚点 `minecraft:entity_anchor`）], [指定朝向目标实体的锚点，可用值：\ `feet`（默认）朝向目标实体的脚部。\ `eyes`（默认）朝向目标实体的眼部。]
)
朝向的准则遵循@fig:raycasting_by_anchor 所示的规律，视线方向会严格按照锚点之间的位置关系。例如，单独使用如下的命令：
#codebox("rotate A facing entity B eyes")
这时指定实体A的锚点为 `feet`，而朝向为实体B的锚点 `eyes`，此时朝向实体的上方而不是实体B的眼睛部位，如@fig:command_tp_anchor_example 所示。
#figure(
  caption: [`/tp` 命令锚点例子],
  image("图片/tp命令锚点例子.png", height: 11em)
) <fig:command_tp_anchor_example>
只有当实体A的锚点为 `eyes` 时，才会朝向实体B的眼睛部位，这时需要使用命令 `/execute`。
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
===== 将指定实体传送至指定的坐标位置，并指定其朝向的实体，语法为：
#codebox("tp <targets> <location> facing entity <facingEntity> [<facingAnchor>]")
#param-desc(
  [`<facingEntity>`（实体 `minecraft:entity`）], [指定要朝向的实体。],
  [`[<facingAnchor>]`（实体锚点 `minecraft:entity_anchor`）], [可选，指定朝向实体的何种锚点，可以为 `eyes` 或 `feet`，默认为 `feet`。]
)
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
$ [floor(a/16), floor(b/16), floor(c/16)] $ <equ:block_position_to_chunk_coordinates>
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
= UUID与目标选择器<chap:target_selector>
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
设三个体积参数值分别为$"d"x$、$"d"y$、$"d"z$，理论上长方体区域的三条边长分别为$abs("d"x)$、$abs("d"y)$、$abs("d"z)$；但根据#link("https://bugs.mojang.com/browse/MC/issues/MC-123441")[MC-123441]，实际上三条边长分别为$abs("d"x)+1$、$abs("d"y)+1$、$abs("d"z)+1$，该特性至今仍存在于游戏中。这意味着若三个参数都设为0，目标选择器依旧会创建一个$1 times 1 times 1$大小的选区。

由于 `dx`、`dy` 和 `dz` 可以为负数，不能认为选区是以原点为基础往正方向延伸$abs("d"x)+1$、$abs("d"y)+1$和$abs("d"z)+1$长度，而是取以$(x,y,z)$和$(x+"d"x,y+"d"y,z+"d"z)$为顶点的长方体区域的西北下角顶点（坐标值最小点）为基础，往正方向延伸$abs("d"x)+1$、$abs("d"y)+1$和$abs("d"z)+1$长度。因此，选区的坐标值最小点为$(min{x,x+"d"x},min{y,y+"d"y},min{z,z+"d"z})$，坐标值最大点为$(max{x,x+"d"x}+1,max{y,y+"d"y}+1,max{z,z+"d"z}+1)$。
#figure(
  caption: "体积参数的选区",
  image("图片/体积参数的选区.png", width: 38em)
)
不同于其他的位置参数，当实体的碰撞箱与选取有重叠时，该实体就会被选择。
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
    #codebox("@r[x=-13,y=40,z=32,dx=22,dy=14,dz=34]")
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
    
    目标选择器变量 `@p` 和 `@r` 的数量参数默认为1，即分别选择距命令执行者最近和随机的一个实体。可以定义其他数量参数的值来扩大可选的实体数量，例如：`@p[limt=3]` 可用于选择距命令执行者最近的三个玩家。`@r[limit=5]` 可用于选择随机的五个玩家。#cite(<target_selector>, form: none)

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
其中 `<键>` 为所指定进度的ID，`<值>` 必须为布尔值或用花括号包括的键值对，若为布尔值，则目标选择器用于筛选 `true`（是）`false`（否）取得该进度的玩家。例如，选择取得进度 #icon("mine_stone") 石器时代 `story/mine_stone` 的玩家的目标选择器参数可以为
#codebox("[advancements={story/mine_stone=true}]")
若 `<值>` 的位置填充了用花括号包括的键值对，则语法又为：
#codebox("[advancements={<键>={<键>=<值>}}]")
在键值对中嵌套键值对的意义为：*根据进度JSON的格式，玩家取得一定进度一定是通过满足这个进度的某些准则达成的。*比如进度#icon("obtain_armor")整装上阵 `story/obtain_armor` 的准则之一为装备过铁头盔 `iron_helmet`，可以选择通过装备铁头盔以取得进度整装上阵的玩家：
#codebox("[advancements={story/obtain_armor={iron_helmet=true}}]")
*其中被选择的玩家当前不必正在装备铁头盔。*这些准则的具体情况可以查阅数据包内的进度定义文件，读者也可以使用自定义的进度及其准则。
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
+ 过获取黑石 `blackstone` 以取得进度 #icon("mine_stone") 石器时代 `story/mine_stone` 的所有玩家。
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
SNBT的标签名允许包含字母A \~ Z、a \~ z、数字0 \~ 9、下划线 `_` 、引号 `"`、冒号 `:`、空格、反斜杠 `\`、汉字等，对大小写敏感，比如，`tag` 和 `Tag` 是两个不同的标签名。

一般而言，标签名只使用英文字母、数字和下划线的组合，因为这种书写方式直接且无需添加额外的用于标识的字符。对于由多个单词组成的标签名，其命名方法一般有三种——#proper-noun(display: "大驼峰命名法（Upper camel case）", "da4 tuo2 feng1 ming4 ming2 fa3")，即所有单词首字母均大写，如 `CanDestory`；#proper-noun(display: "小驼峰命名法（Lower camel case）", "xiao3 tuo2 feng1 ming4 ming2 fa3")，即除首个单词外的所有单词首字母均大写，如 `maxUses`；#proper-noun(display: "蛇形命名法（Snake case）", "she2 xing2 ming4 ming2 fa3")，即所有字母均小写、单词之间用下划线隔开，如 `map_scale_direction`。近年来游戏新数据在标签名上一般采用蛇形命名法，且原有的数据标签名也逐步改为了蛇形命名法，为便于统一管理游戏数据，建议读者自己进行开发时，尽量使用蛇形命名法定义标签。

若标签名带有引号、冒号、空格、汉字等字符，则标签名需要被一对引号包裹，如 `"minecraft:item_model"`。可以使用单引号 `'` 或双引号 `"`。在必要的时候，标签名中的字符还需被转义。当标签名中只有双引号 `"` 时，可用单引号包裹标签名，如 `'tag"'`；当标签名中只有单引号 `'` 时，可用双引号包裹标签名，如 `"tag'"`；当标签名同时含有单引号和双引号时，可任意使用单引号或双引号包裹标签名，但标签名中对应种类的引号需要被转义，如 `"'Tag\""`。空格在标签名中也是可以接受的：`"a b"`，汉字同样如此：`"标签名"`。反斜杠不需要被引号包裹：`tag\`。
=== 数据类型与数据树<subsec:nbt_data_type>
在SNBT中，对于每一个诸如 `<标签名>:<值>` 这样形式的内容，称其为一个单独的#proper-noun(display: "标签（Tag）", "biao1 qian1")。一个标签由三部分组成：一是*标签类型*，它用于决定该标签需要使用什么类型的数据；二是*标签名*，它用于区分不同的标签；三是*该标签存储的数据*，对于不同类型的标签，其需要的数据也不尽相同。NBT本身一共存在13种数据类型，在SNBT中一共可以使用13种标签类型，其中包含一种较为特殊的标签类型。本教程在介绍SNBT的语法时，采用与Minecraft Wiki一致的结构化树状图。下面分类介绍所有的数据类型：
#continue-h5([整型类数据])
===== #icon("nbt-byte")#footnote[本教程使用这些图标表示各SNBT数据类型。] 字节型
#proper-noun(display: "字节型（Byte）", "zi4 jie2 xing2")占据1个字节，存储容量为$-128$ \~ 127，且数值必须为整数。在填写字节型数据时，可以在数值后面加一个字母 `b`，大小写均可，格式为：
#codebox("<标签名>:<值>b")
示例：
#codebox("Difficulty:2b")
结构化表示为
#tree(
  (0, [#icon("nbt-byte") *Difficulty*: `2`])
)
这个字母 `b` 被称为数据的后缀，后缀用于决定该数据为何种类型的数据，同时也有助于将SNBT转换为NBT。字母 `b` 决定了这个数据为字节型数据。不过后缀是可选的，因为NBT的数据类型是自动更正的。然而笔者还是强烈建议不要省略后缀以避免小概率解析不成功的情况。
===== #icon("nbt-bool") 布尔值
NBT本身并没有#proper-noun(display: "布尔值（Bool）", "bu4 er3 zhi2")这种数据类型，因此使用字节型数据的 `0b` 来表示布尔值中的“假”，用非 `0b` 的数据来表示布尔值中的“真”。但出于习惯，一般用 `1b` 来表示“真”。在SNBT中可以直接使用 `true` 和 `false`，它们分别能转换为NBT格式的\code `1b` 和 `0b`。事实上，在SNBT中直接使用字节形式的 `1b` 和 `0b` 也是可接受的。示例：
#codebox("NoAI:true")
或
#codebox("NoAI:1b")
结构化表示为
#tree(
  (0, [#icon("nbt-bool") *NoAI*: `true`])
)
===== #icon("nbt-short") 短整型
#proper-noun(display: "短整型（Short）", "duan3 zheng3 xing2")占据2个字节，存储容量为$-32768$ \~ 32767，且值必须为整数。该数据类型需要的后缀为 `s`，大小写均可。示例：
#codebox("Fire:10s")
结构化表示为
#tree(
  (0, [#icon("nbt-short") *Fire*: `10`])
)
===== #icon("nbt-int") 整型
#proper-noun(display: "整型（Int）", "zheng3 xing2")是非常常见的一种数据类型，被用于存储大量的标签数据。它占据4个字节，存储容量为$-2^31$ \~ $2^31-1$（即$-2147483648$ \~ 2147483647），值必须为整数。该数据类型需要的后缀为 `i`，大小写均可，也可以不写这个后缀。示例：
#codebox("Age:20")
结构化表示为
#tree(
  (0, [#icon("nbt-int") *Age*: `20`])
)
若在填写其他数据类型时没有加后缀，则实际上填写的数据类型默认为整型，因此需要经过更正才能被识别。如果数据不在整型可用范围内，则需使用 #icon("nbt-long") 长整型，并添加 #icon("nbt-long") 长整型的类型后缀。
===== #icon("nbt-long") 长整型
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
===== #icon("nbt-float") 单精度浮点数
#proper-noun(display: "单精度浮点数（Float）", "dan1 jing1 du4 fu2 dian3 shu4")采用IEEE754标准，占据4个字节，长度为32位。它用于存储一个实型数据，数据可以带符号，如 `1.2`、`-0.5` 等。单精度浮点数使用字母 `f` 作为它的数据后缀。
===== #icon("nbt-double") 双精度浮点数
#proper-noun(display: "双精度浮点数（Double）", "shuang1 jing1 du4 fu2 dian3 shu4")同样采用IEEE754标准。它占据8个字节，长度为64位，能用于存储精度比单精度浮点数更高的实型数据。双精度浮点数使用字母 `d` 作为它的数据后缀。

#linebreak()

浮点数小数点后面的位数不定，这取决于其所存储的数值的整数位数，但是双精度浮点数存储的数据一般带有更多的小数点位数。浮点数可以写成整数形式或小数形式，如 `2f`、`1.5f`、`10d` 等。虽然小数点不是必要的，但还是建议为数值为整数的浮点数加上小数点，可以精确到小数点后一位，比如，将 `1f` 写成 `1.0f` 的形式。不同于整型，浮点数的整数部分可以带有前导零，`1.0f` 和 `01.0f` 均可以识别。

带小数点的浮点数分为整数和小数两个部分，这两个部分都是可以省略的。若省略整数部分，则默认在整数部分补上0，如 `.4f` 会被识别为 `0.4f`；若省略小数部分，则默认会在小数部分补上0，如 `1.f` 会被识别为 `1.0f`。

浮点数还可以用科学计数法表示。数学上科学计数法一般写作$m times 10^n$，在浮点数中，科学计数法就可以写作 `<m>e<n>`，例如$1.2 times 10^(-2)$就可以写作 `1.2e-2`。其中，$m$被称为尾数，必须是带符号的浮点数，可以为整数也可以为小数；而$n$被称为指数，它只能是带符号的整数。此外，尾数和指数均必须有数值，不能为空。例如，`4.5e4`、`.2e-3`、`4.e+2`、`03e0`（允许带有前导零、指数可以为0）均为正确的科学计数法表示；而 `e9`（尾数缺失）、`-3e`（指数缺失）、`.2e-.2`（指数不能为浮点数）均为错误的科学计数法表示。
#continue-h5([字符串类数据])
===== #icon("nbt-string") 字符串
#proper-noun(display: "字符串（String）", "zi4 fu2 chuan4")为若干任意字符按特定顺序的排列，允许包含中文、标点符号、特殊字符等。字符串最多允许存储32767个字节的字符。字符串必须被一对双引号或单引号定义。

字符串存在一些特殊字符的转义序列：
====== 单引号 `'`、双引号 `"`
若使用双引号定义字符串，则字符串中所有的双引号都需要用反斜杠进行转义；若使用单引号定义字符串，则字符串中所有的单引号都需要用反斜杠进行转义。如果字符串中含有双引号，则可以用单引号来定义字符串而不必为字符串中的引号加上反斜杠，反之亦然。举例：
#codebox("Name:\"\\\" is a quotation mark\"") <code:snbt_string_example_1>
#codebox("Name:'\" is a quotation mark'") <code:snbt_string_example_2>
结构化表示为
#tree(
  (0, [#icon("nbt-string") *Name*: `" is a quotation mark`])
)
出于可读性要求、社区标准及 #icon("vscode") VSCode中 #icon("dhp") DHP扩展要求的书写规范，在字符串中一般需尽量规避转义行为，因此@code:snbt_string_example_1 的写法不符合可读性要求，应采用@code:snbt_string_example_2 的写法。若字符串中既有双引号又有单引号，则转义无法规避，此时正常使用反斜杠即可。
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
===== #icon("nbt-byte_array") 字节型数组
#proper-noun(display: "字节型数组（Byte array）", "zi4 jie2 xing2 shu4 zu3")将若干个*有序*字节型数据整合到一起。数组需要用方括号将所有数据包括起来，并在开头标上 `B;` 以定义该数组为字节型数组。`B;` 后面跟随若干个字节型数据，数据与数据之间用逗号 `,`（一定为英文逗号）隔开。数组末尾的数据后面允许添加且最多只能添加一个 `,`，其他数组类数据相同。格式为：
#codebox("[B;<字节型数据1>,<字节型数据2>,<字节型数据3>,…]")
数组内数据的顺序很重要，例如，`[B;1b,2b,3b]` 与 `[B;3b,2b,1b]` 是两个不同的标签数据。其中前者的结构化表示为
#tree(
  (0, [#icon("nbt-byte_array")]),
  (1, [`1`]),
  (1, [`2`]),
  (1, [`3`])
)
数组内的数据会假定与使用与定义一致的数据类型，如 `[B;1,2,3]` 会被识别为 `[B;1b,2b,3b]`。
===== #icon("nbt-int_array") 整型数组
#proper-noun(display: "整型数组（Int array）", "zheng3 xing2 shu4 zu3")是若干个整型数据构成的*有序列表*。其写法与上面字节型数组的写法类似，但数组开头为 `I;` 以定义该数组为整型数组。格式为：
#codebox("[I;<整型数据1>,<整型数据2>,<整型数据3>,…]")
===== #icon("nbt-long_array") 长整型数组
#proper-noun(display: "长整型数组（Long array）", "chang2 zheng3 xing2 shu4 zu3")是若干个长整型数据构成的*有序列表*。其写法与上面字节型、整型数组的写法类似，但数组开头为 `L;` 以定义该数组为长整型数组。格式为：
#codebox("[L;<长整型数据1>,<长整型数据2>,<长整型数据3>,…]")
数组可以接受可用范围比该数组的定义更小的值，例如 `[L;1b,2,3l]` 会被识别为 `[L;1l,2l,3l]`。短整型数组虽然还未使用，但允许在整型数组和长整型数组中使用短整型的数据，如 `[L;1s,2s,3s]` 会被识别为 `[L;1l,2l,3l]`。
===== #icon("nbt-list") 列表
#proper-noun(display: "列表（List）", "lie4 biao3")是若干个任意类型的数据构成的*有序列表*，NBT格式的列表内的数据类型需一致，但SNBT可接受类型不一致的异构列表，存储为NBT时会将不同的数据类型转换为相同的数据类型，例如列表内同时存在字节型数据和复合标签时，会将字节型数据按列表内位置套在另一个复合标签内再进行存储；从NBT读取为SNBT时，相同的数据类型并不会逆向转换为不同的数据类型。列表的开头不需要加任何的内容以表明它是哪种类型的数组，格式为：
#codebox("[<数据1>,<数据2>,<数据3>,…]")
若列表内的数据类型为字节型、整型或长整型，它们并不能视为 #icon("nbt-byte_array") 字节型数组、#icon("nbt-int_array") 整型数组或 #icon("nbt-long_array") 长整型数组。例如，`[I;1,2,3]` 与 `[1,2,3]` 是两个完全不同的标签数据，前者为 #icon("nbt-int_array") 整型数组，后者为 #icon("nbt-list") 列表。其中前者的结构化表示为
#tree(
  (0, [#icon("nbt-int_array")]),
  (1, [`1`]),
  (1, [`2`]),
  (1, [`3`])
)
#h(-2em)后者的结构化表示为
#tree(
  (0, [#icon("nbt-list")]),
  (1, [#icon("nbt-int") `1`]),
  (1, [#icon("nbt-int") `2`]),
  (1, [#icon("nbt-int") `3`])
)
#continue-h5([复合标签与数据树])
===== #icon("nbt-compound") 复合标签
#proper-noun(display: "复合标签（Compound）", "fu4 he2 biao1 qian1")使得标签和标签的嵌套成为可能，其基本格式为
#codebox("<标签名>:{子标签}")
现在对这个格式进行进一步的解释：标签名和冒号为一个标签写法的组成部分，值的部分为一个花括号。一般称这一整个标签为#proper-noun(display: "父标签（Parent tag）", "fu4 biao1 qian1")，花括号内的内容被称为#proper-noun(display: "子标签（Children tag）", "zi3 biao1 qian1")。子标签允许存在多个不同的标签，这些子标签之间使用逗号逗号 `,` 分割，最后一个子标签后面允许添加且最多只能添加一个 `,`。每一个标签都是父标签的子标签，于是复合标签的基本格式又可以写成如下的形式：
#codebox("<父标签名>:{<子标签名1>:<值>,<子标签名2>:<值>,…}")
花括号内的子标签也可以成为下一级标签的父标签，于是又可以在子标签内嵌套子标签。将这些子标签分层命名为第一级子标签、第二级子标签……经过层层嵌套，最终可以得到如下所示的树形结构，这便是#proper-noun(display: "数据树（Data tree）", "shu4 ju4 shu4")的基本结构。
#tree(
  (0, [#icon("nbt-compound") 父标签]),
  (1, [#icon("nbt-compound") 第一级子标签]),
  (2, [#icon("nbt-compound") 第二级子标签]),
  (3, [……]),
  (2, [#icon("nbt-compound") 第二级子标签]),
  (3, [……]),
  (1, [#icon("nbt-compound") 第一级子标签]),
  (2, [#icon("nbt-compound") 第二级子标签]),
  (3, [……]),
  (2, [#icon("nbt-compound") 第二级子标签]),
  (3, [……]),
)
然而，父标签和子标签的界限并不是明确的，它们只有相对的关系：一个父标签可能是上一级标签的子标签，一个子标签也可能是下一级标签的父标签，这就好比一棵树上分叉的树枝。不过，即使一棵树的枝干分叉再复杂、树枝的层级再多，它终究是有树干和根部的，这样的道理在数据树上仍成立。对于一个特定的游戏资源，如一个具有方块实体的方块、一个实体，游戏使用一棵数据树存储它所有的信息，在这棵数据树内存在一个标签，由这个标签衍生出所有的子标签，再经过层层嵌套、衍生，最终形成一棵数据树，这棵数据树就可以用于存储数据。对于这样的标签，可以给予其形象的名称：#proper-noun(display: "根标签（Root tag）", "gen1 biao1 qian1")，以将其比作一棵数据树的“根”。

在了解数据树的基本结构后，现在取数据树上一个小部分（可以不包含根标签）进行分析。假设一个标签 #icon("nbt-compound") `Me` 衍生出来的数据树如下所示：
#tree(
  (0, [#icon("nbt-compound") *Me*]),
  (1, [#icon("nbt-string") *Name*: `Mu_xian`]),
  (1, [#icon("nbt-string") *Game*: `Minecraft`]),
  (1, [#icon("nbt-compound") *Country*]),
  (2, [#icon("nbt-string") *Name*: `中国`]),
  (2, [#icon("nbt-string") *Area*: `Asia`]),
  (2, [#icon("nbt-string") *Language*: `汉语`])
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
可以看到，标签 #icon("nbt-compound") `Me` 一共有三个子标签，它们分别是 #icon("nbt-string") `Name`、#icon("nbt-string") `Game` 和 #icon("nbt-compound") `Country`，存储的数据类型分别为字符串、字符串和复合标签。可以理解为，这三个子标签分属父标签 #icon("nbt-compound") `Me` 的三个不同的属性，在查阅这些数据时，首先需要保证每种属性所对应标签的唯一性，不能让数据出现冲突、矛盾的地方。规定：*同一级子标签内不能存在标签名相同的标签。*

但是不难发现，标签 #icon("nbt-compound") `Country` 作为一个复合标签，其三个子标签中也有一个名为 #icon("nbt-string") `Name` 的标签，这是不是与上述规定有所冲突呢？答案是否定的。上述规定有一个前提——同一级子标签内，标签 #icon("nbt-compound") `Country` 的子标签 #icon("nbt-string") `Name` 与 #icon("nbt-compound") `Me` 的子标签 #icon("nbt-string") `Name` 不属于同一级子标签，因此标签名可以相同。*对于一个标签而言，其子标签的子标签不是它的子标签。*
  
标签 #icon("nbt-compound") `Me` 的三个子标签，它们的数据类型也不尽相同。这是因为复合标签是对父标签多个不同属性的内容的描述，与同样可以存储多个数据的数组（包括列表）相比，复合标签中允许存在不同数据类型的标签；而对列表而言，即使在SNBT中写为异构列表，存储为NBT时所有数据类型必须一致。复合标签与数组的另一个区别是，复合标签内的所有子标签是不论次序的，标签的先后顺序不会影响到数据的处理或存储。而数组内数据的先后顺序很重要，数据顺序的改动会影响到数据存储的位置。

在数据树中，复合标签与数组是可以相互嵌套的，这意味着复合标签中可以有数组，而数组内的数据类型也可以是复合标签。下面给出了 #icon("nbt") `<玩家>.dat` 数据树的一部分：
#tree(
  (0, [#icon("nbt-compound") *Player*]),
  (1, [#icon("nbt-int") *playerGameType*: `0`]),
  (1, [#icon("nbt-list") *Inventory*]),
  (2, [#icon("nbt-compound")]),
  (3, [#icon("nbt-int") *count*: `1`]),
  (3, [#icon("nbt-byte") *Slot*: `0`]),
  (3, [#icon("nbt-string") *id*: `minecraft:diamond_sword`]),
  (2, [#icon("nbt-compound")]),
  (3, [#icon("nbt-int") *count*: `45`]),
  (3, [#icon("nbt-byte") *Slot*: `1`]),
  (3, [#icon("nbt-string") *id*: `minecraft:bread`])
)
它的SNBT格式为：
#codebox("Player:{
  playerGameType:0,
  Inventory:[
    {count:1,Slot:0b,id:\"minecraft:diamond_sword\"},
    {count:45,Slot:1b,id:\"minecraft:bread\"}
  ]
}")
可以看到标签 #icon("nbt-compound") `Player` 的一个子标签 #icon("nbt-list") `Inventory` 为一个列表，列表中的数据类型为 #icon("nbt-compound") 复合标签，可以称它为复合标签的列表。#icon("nbt-list") 列表和 #icon("nbt-compound") 复合标签能相互嵌套形成非常复杂的数据树结构，但嵌套深度不能超过512。
===== 结束（End）
这种数据类型仅用于标记复合标签的结束，无存储容量。SNBT不使用这种数据类型。
=== SNBT操作
特别地、SNBT可以接受一些未经处理的数据，从而讲它们转换为NBT可以接受的值，这就是SNBT的语法糖——#proper-noun(display: "SNBT操作（SNBT Operations）", "SNBT cao1 zuo4")，大小写均可，格式为：
#codebox("<操作名>(<参数>)")
将其写在SNBT的值中：
#codebox("<标签名>:<操作名>(<参数>)")
现在一共有两种可用的SNBT操作：
===== 将参数转换为 #icon("nbt-bool") 布尔值，格式为
#codebox("bool(<arg>)")
其中 `<arg>` 必须为布尔值或数字。若输入布尔值，则直接使用该值；若输入数字，则将非 `0` 的数据转换为 `true`，`0` 转换为 `false`；若输入的不是布尔值或数字，则转换失败。例如：
====== `bold:bool(true)` → `bold:true`
====== `NoAI:bool(0)` → `NoAI:false`
====== `Invulnerable:bool(5)` → `Invulnerable:true`
====== `italic:bool("italic")` → 转换失败
===== 将有连字符的十六进制形式的UUID转换为 #icon("nbt-int_array") 整型数组，格式为
#codebox("uuid(<str>)")
其中 `<str>` 必须是有连字符的十六进制形式的UUID。例如：

`UUID:uuid("8890812a-c393-41e0-a9aa-4b93aa46927f")` → `UUID:[I;-2003795670,-1013759520,-1448457325,-1438215553]")`
=== SNBT转换为NBT \*<subsec:snbt_to_nbt>
对于一个输入的SNBT，游戏需要将其转换为NBT格式以使用。在转换的时候，游戏会对输入的SNBT做一定处理以适应目标程序对象的数据格式。转换行为可总结为以下四点：
===== 不能被程序对象使用的直接丢弃
若属性在程序对象中不存在（未被使用）或不可写，则输入的SNBT会被直接丢弃。此过程不会产生错误，但也不会保留数据。“不存在”的情况有如：实体的数据有一个字段 #icon("nbt-bool") `Invulnerable`，如果错误地把这个字段写为了 #icon("nbt-bool") `invulnerable`，此字段实体未使用，所以输入的 #icon("nbt-bool") `invulnerable` 会被丢弃。“不可写”的情况有如：方块实体的 #icon("nbt-string") `id` 不可被修改，传入的 #icon("nbt-string") `id` 也会被忽略。
===== 编码层级的错误会发生报错
如果一个字段本身存在，但其编码格式违反硬性约束，则会产生报错，并使命令执行失败。例如，一些字段需要使用文本组件作为其值，如果输入的文本组件有错误，则整个输入都会产生错误。以下命令会产生报错，即使传入的数据在SNBT的层面上是一个空复合标签：
#codebox("give @s ladder[minecraft:custom_name={}]")
===== 数据能转换就转换
如果输入的SNBT与期望的数据不符，若存在明确的转换规则，则会按照转换规则纠正输入数据：
====== *若期望的值是一个命名空间ID，而输入的值是一个省略命名空间前缀的字符串，则会为其添加默认的命名空间 `minecraft`。*如：
输入 `id: "stone"` $arrow.r$ 转换为 `id: "minecraft:stone"`
====== 若期望的值是 #icon("nbt-bool") 布尔值，而输入的值是 #icon("nbt-byte") 字节型、#icon("nbt-short") 短整型、#icon("nbt-int") 整型、#icon("nbt-long") 长整型、#icon("nbt-float") 单精度浮点数或 #icon("nbt-double") 双精度浮点数，则向下取整转换为字节型，非 `0b` 的值被视为 `1b`。
====== 若期望的值是 #icon("nbt-byte") 字节型、#icon("nbt-short") 短整型、#icon("nbt-int") 整型、#icon("nbt-long") 长整型、#icon("nbt-float") 单精度浮点数或 #icon("nbt-double") 双精度浮点数，而输入的值与目标类型不符，则自动转换为目标类型。若目标的类型是 #icon("nbt-byte") 字节型、#icon("nbt-short") 短整型、#icon("nbt-int") 整型或 #icon("nbt-long") 长整型，而输入的值是 #icon("nbt-float") 单精度浮点数或 #icon("nbt-double") 双精度浮点数，则会先向下取整再进行转换。
===== 不能转换的数据就归零或置空
如果输入的SNBT与期望的数据不符且无法转换，则：
====== 若期望的值是一个 #icon("nbt-bool")  布尔值，而输入的值是 #icon("nbt-list") 列表、#icon("nbt-byte_array") 字节型数组、#icon("nbt-int_array") 整型数组、#icon("nbt-long_array") 长整型数组、#icon("nbt-string") 字符串或 #icon("nbt-compound") 复合标签，则强制使用 `0b`。
====== 若期望的值是 #icon("nbt-byte") 字节型、#icon("nbt-short") 短整型、#icon("nbt-int") 整型、#icon("nbt-long") 长整型、#icon("nbt-float") 单精度浮点数或 #icon("nbt-double") 双精度浮点数，而输入的值是 #icon("nbt-list") 列表、#icon("nbt-byte_array") 字节型数组、#icon("nbt-int_array") 整型数组、#icon("nbt-long_array") 长整型数组、#icon("nbt-string") 字符串或 #icon("nbt-compound") 复合标签，则强制赋值为 `0`，具体数据类型取决于期望的类型。
====== 若期望的值是 #icon("nbt-string") 字符串，而输入的值不是字符串，则强制使用空字符串 `""`。
====== 若期望的值是 #icon("nbt-list") 列表、#icon("nbt-byte_array") 字节型数组、#icon("nbt-int_array") 整型数组或 #icon("nbt-long_array") 长整型数组，而输入的值不是对应的类型，则强制使用空列表 `[]` 或空数组。
====== 若期望的值是 #icon("nbt-compound") 复合标签，而输入的值不是复合标签，则强制使用空复合标签 `{}`。
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
  [1], [字节型], [#icon("nbt-byte")], [`01`],
  [2], [短整型], [#icon("nbt-short")], [`02`],
  [3], [整型], [#icon("nbt-int")], [`03`],
  [4], [长整型], [#icon("nbt-long")], [`04`],
  [5], [单精度浮点数], [#icon("nbt-float")], [`05`],
  [6], [双精度浮点数], [#icon("nbt-double")], [`06`],
  [7], [字节型数组], [#icon("nbt-byte_array")], [`07`],
  [8], [字符串], [#icon("nbt-string")], [`08`],
  [9], [列表], [#icon("nbt-list")], [`09`],
  [10], [复合标签], [#icon("nbt-compound")], [`0a`],
  [11], [整型数组], [#icon("nbt-int_array")], [`0b`],
  [12], [长整型数组], [#icon("nbt-long_array")], [`0c`]
) <tab:data_type_and_binary_format>
===== 结束
对于结束类型的数据，它只有一个字节的长度，且这个字节固定为 `00`，它一定会出现在复合标签的末尾。
===== 字节型、短整型、整型和长整型
对于这四种类型的数据，每一个标签都由四部分组成：第1个字节标识该标签的类型。第2、3字节标识该标签之标签名长度，必须为无符号整数，两个字节能存储的最大数值为65535，因此一个标签的标签名最多不能超过65535个字符。根据第2、3字节定义的标签名长度，接下来若干字节用于存储该标签的标签名，名称中每个ASCII字符占据一个字节，第2、3字节定义的值有多大，则这部分的字节数量就为多少。最后若干字节是该标签的负载，负载包括了该标签的值。对于 #icon("nbt-byte") 字节型，此部分的字节数为1；对于 #icon("nbt-short") 短整型则为2；对于 #icon("nbt-int") 整型则为4，对于 #icon("nbt-long_array") 长整型则为8。四种数据类型的负载均包含有符号的值。

例如，数据@code:binary_format_1 的第1位为 `01`，这一位定义了数据类型，为 #icon("nbt-byte") 字节型，第2、3位为 `00 05`，它定义了标签名的长度，说明该标签名有五个字节。往后数5位，第4 \~ 8位 `63 6f 75 61 74` 是标签名的字符，根据ASCII码，`63` 代表 `c`、`6f` 代表 `o`、`75` 代表 `u`、`61` 代表 `n`、`74` 代表 `t`，因此标签名为 `count`。最后一位 `01` 是负载，定义了该标签的值 `1`。综上所述，该标签为
#codebox("count: 1b")
===== 浮点数
对于单精度浮点数和双精度浮点数，它们的字节构成与上述整型数据类似，唯一不同之处在于浮点数的负载字节遵循IEEE 754-2008标准。对于 #icon("nbt-float") 单精度浮点数，负载字节长4位；对于 #icon("nbt-double") 双精度浮点数，负载字节长8位。

例如，对于如下的数据：
#codebox(text(blue)[05 ] + text(purple)[00 06 ] + text(red)[48 65 61 6c 74 68 ] + text(olive)[40 90 00 00])
由 `05 00 06 48 65 61 6c 74 68` 知该标签类型为 #icon("nbt-float") 单精度浮点数，标签名为 `Health`，`40 90 00 00` 为负载，需将其转化为单精度浮点数。先将 `40 90 00 00` 转化为二进制
#codebox("01000000 10010000 00000000 00000000")
接下来按1位符号位、8位指数位、23位尾数位分割这个数据：
#codebox("0 10000001 00100000000000000000000")
最高位 `0` 表示该值为正数，`10000001` 是指数部分，指数可计算得$2^8+2^0-127=129-127=2$，`00100000000000000000000` 是尾数部分，可计算得$1+2^(-3)=1.125$，浮点数为$(-1)^0 times 2^2 times 1.125=4.5$。因此该标签为
#codebox("Health: 4.5f")
===== 字符串
#icon("nbt-string") 字符串的二进制格式为：1位类型标识、2位标签名长度、若干位标签名字符、2位值长度、若干位负载。例如，对于如下的数据：
#codebox(text(blue)[08 ] + text(purple)[00 02 ] + text(red)[49 64 ] + text(fuchsia)[00 0e ] + text(olive)[6d 69 6e 65 63 72 61 66 74 3a 73 74 6f 6e 65])
`08` 表示该标签为 #icon("nbt-string") 字符串类型，`00 02 69 64` 表示标签名为 `id`，`00 0e` 表示值有15个字符，后面的 `6d 69 6e 65 63 72 61 66 74 3a 73 74 6f 6e 65` 表示值为 `minecraft:stone`。故该标签为
#codebox("id: \"minecraft:stone\"")
===== 字节型数组、整型数组、长整型数组
对于这三类数组，二进制格式为：1位类型标识、2位标签名长度、若干位标签名字符、4位有符号整数表示数组的长度。若数组的长度为$n$，则最后使用$n times s$字节表示负载，其中$s$的值对于 #icon("nbt-byte_array") 字节型数组而言为1，对于 #icon("nbt-int_array") 整型数组是4，对于 #icon("nbt-long_array") 长整型数组是8。例如：
#codebox(text(blue)[11 ] + text(purple)[00 04 ] + text(red)[55 55 49 44 ] + text(maroon)[00 00 00 04 ] + text(olive)[4d 90 3b 0b ] + text(teal)[2b 4b 98 b3 ] + text(olive)[0f 8e 7d 8e ] + text(teal)[f2 95 15 c3])
其中 11 表示该标签为 #icon("nbt-int_array") 整型数组，`00 04` 表示该标签的标签名有4个字符，`55 55 49 44` 表示该标签的标签名为 `UUID`，`00 00 00 04` 表示该数组有4个元素，`4d 90 3b 0b 2b 4b 98 b3 0f 8e 7d 8e f2 95 15 c3` 存储了这4个元素的值，由于每个值均为整型，因此每4个字节为1个有符号整数，换算结果为 `188452941`、`-1281864917`、`-1904374257`、`-1021995534`，综上所述，该标签为
#codebox("UUID: [I; 188452941, -1281864917, -1904374257, -1021995534]")
===== 列表
#icon("nbt-list") 列表的二进制格式在1位类型标识、2位标签名长度和若干位标签名字符后，又使用了1字节用于标识列表内元素的数据类型，其值仍按表@tab:data_type_and_binary_format 使用。然后是4位有符号整数表示数组的长度以及和长度相符的若干位负载。例如：
#codebox(text(blue)[09 ] + text(purple)[00 08 ] + text(red)[52 6f 74 61 74 69 6f 6e ] + text(navy)[05 ] + text(maroon)[00 00 00 02 ] + text(olive)[42 b4 00 00 ] + text(teal)[00 00 00 00])
`09` 代表该标签为 #icon("nbt-list") 列表，`00 08 52 6f 74 61 74 69 6f 6e` 是该标签的标签名 `Rotation`，`05` 说明该列表内元素均为单精度浮点数，`00 00 00 02` 是列表长度，`42 b4 00 00` 和 `00 00 00 00` 分别为列表内的元素 `90`、`0`，故标签为
#codebox("Rotation: [90f, 0f]")
===== 复合标签
一个 #icon("nbt-compound") 复合标签使用1字节标识数据类型，2字节标识标签名长度，若干字节表示标签名。紧随其后使用若干字节表示其子标签，各子标签的格式与上文所述完全一致，但复合标签末尾一定存在一个 `00` 字节。例如：
#codebox(text(blue)[0a ] + text(purple)[00 0d ] + text(red)[62 6c 65 6e 64 69 6e 67 5f 64 61 74 61 ] + text(blue)[03 ] + text(purple)[00 0b ] + text(red)[6d 61 78 5f 73 65 63 74 69 6f 6e ] + text(olive)[00 00 00 20 ] + text(blue)[03 ] + text(purple)[00 0b ] + text(red)[6d 69 6e 5f 73 65 63 74 69 6f 6e ] + text(olive)[ff ff ff fc ] + text(orange)[00])
其中 `0a` 标识了 #icon("nbt-compound") 复合标签类型，`00 0d 62 6c 65 6e 64 69 6e 67 5f 64 61 74 61` 是标签名长度和标签名，为13个字符的 `blending_data`，`03` 是 `blending_data` 第一个子标签的数据类型，是为 #icon("nbt-int") 整型。接下来的 `00 0b 6d 61 78 5f 73 65 63 74 69 6f 6e` 是第一个子标签的标签名 `max_section`，`00 00 00 04` 是这个标签的值 `20`。随后的 `03` 是 `blending_data` 第二个子标签的数据类型，是为 #icon("nbt-int") 整型。第二个子标签的标签名可解读为 `max_section`，值为 `-4`。末尾的字节 `00` 是结束类型。故该标签为
#codebox("blending_data: {max_section: 20, min_section: -4}")
== 测试NBT标签<sec:testing_nbt>
对于一段已有的NBT数据，有时会需要检测它是否满足一定要求，检测方法是提供一段SNBT用于对比，这样的SNBT被称为#proper-noun(display: "测试NBT标签（Tseting NBT Tags）", "ce4 shi4 NBT biao1 qian1")。测试NBT标签主要在目标选择器的NBT参数、`custom_data` 数据组件谓词和实体谓词中使用。本节将以目标选择器NBT参数为主描述测试NBT标签的匹配方法。#cite(<testing_nbt>, form: none)
==== 对普通标签的匹配
满足这一类匹配要求的标签类型为*除了 #icon("nbt-compound") 复合标签和 #icon("nbt-list") 列表外的其他所有类型*，#icon("nbt-byte_array") 字节型数组、#icon("nbt-int_array") 整型数组和 #icon("nbt-long_array") 长整型数组均位于此列。对于这些标签，提供的测试NBT标签和接受对比的目标NBT必须在名称、标签类型和值上完全一致。

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
如果一个目标NBT的值是 #icon("nbt-byte_array") 字节型数组、#icon("nbt-int_array") 整型数组或 #icon("nbt-long_array") 长整型数组，则数组内容必须完全一致才能匹配。比如：
#codebox("UUID: [I; 1, 2, 3, 4]")
+ 能匹配的测试NBT标签：`UUID: [I; 1, 2, 3, 4]` #text(green)[☑]
+ 不能匹配的测试NBT标签：
  + 缺失元素 `UUID: [I; 1, 2, 3]` #text(red)[☒]
  + 元素顺序调换 `UUID: [I; 4, 3, 2, 1]` #text(red)[☒]
  + 更改数据类型 `UUID: [B; 1, 2, 3, 4]` #text(red)[☒]
  + 写成 #icon("nbt-list") 列表 `UUID: [1, 2, 3, 4]` #text(red)[☒]
==== 对复合标签的匹配
复合标签的匹配规则是：只要目标NBT存在测试NBT标签指定的标签，就匹配成功，无论复合标签内是否存在其他的标签。如果测试NBT标签是一个空标签 `{}`，则只要目标NBT是一个复合标签，就匹配成功。

例如，一个标记拥有如下的数据：
#codebox([{Motion: [0.0d, 0.0d, 0.0d], data: {test: {a: 1b, b: 0b}}, Pos: [-5.0d, 56.0d, -7.0d], Fire: 0s, Invulnerable: 0b, fall_distance: 0.0d, Air: 300s, OnGround: 0b, PortalCooldown: 0, UUID: [I; -1711511327, -910079775, -1565324410, 1666279971], Rotation: [0.0f, 0.0f]}]) <code:testing_nbt_example>
结构化表示为
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-short") *Air*: `300`]),
  (1, [#icon("nbt-compound") *data*]),
  (2, [#icon("nbt-compound") *test*]),
  (3, [#icon("nbt-bool") *a*: `true`]),
  (3, [#icon("nbt-bool") *b*: `false`]),
  (1, [#icon("nbt-double") *fall_distance*: `0.0`]),
  (1, [#icon("nbt-short") *Fire*: `0`]),
  (1, [#icon("nbt-bool") *Invulnerable*: `false`]),
  (1, [#icon("nbt-list") *Motion*]),
  (2, [#icon("nbt-double") `0.0`]),
  (2, [#icon("nbt-double") `0.0`]),
  (2, [#icon("nbt-double") `0.0`]),
  (1, [#icon("nbt-bool") *OnGround*: `false`]),
  (1, [#icon("nbt-int") *PortalCooldown*: `0`]),
  (1, [#icon("nbt-list") *Pos*]),
  (2, [#icon("nbt-double") `-5.0`]),
  (2, [#icon("nbt-double") `56.0`]),
  (2, [#icon("nbt-double") `-7.0`]),
  (1, [#icon("nbt-list") *Rotation*]),
  (2, [#icon("nbt-float") `0.0`]),
  (2, [#icon("nbt-float") `0.0`]),
  (1, [#icon("nbt-int_array") *UUID*: `[I; -1711511327, -910079775, -1565324410, 1666279971]`])
)
+ 能匹配的测试NBT标签（以下全部写成目标选择器）有：
  + 空复合标签，因为根标签也是一个复合标签 `@e[nbt={}]` #text(green)[☑]
  + 任意匹配的子标签 `@e[nbt={Air:300s}]` #text(green)[☑]
  + 任意匹配的子标签的子标签 `@e[nbt={data:{test:{a:true}}}]` #text(green)[☑]
  + 如果子标签为复合标签，空复合标签也可以匹配 `@e[nbt={data:{}}]` #text(green)[☑]
  + 对于目标选择器，也可以用反选 `@e[nbt=!{Air:100s}]` #text(green)[☑]
+ 不能匹配的情况：
  + 子标签的值不匹配 `@e[nbt={Air:100s}]` #text(red)[☒]
  + 子标签是数组，但数组不匹配 `@e[nbt={UUID:[I;-1711511327]}]` #text(red)[☒]
  + 不存在的字段 `@e[nbt={SelectedItem:{}}]` #text(red)[☒]
==== 对列表的匹配
列表的匹配规则是：只要目标列表中存在测试NBT标签指定的元素，就匹配成功，且列表匹配不考虑元素顺序。但是*空列表只能匹配空列表，无法匹配有元素的列表*。

依旧以数据@code:testing_nbt_example 为例，其中有一个标签 `Pos: [-5.0d, 56.0d, -7.0d]`。
+ 匹配的目标选择器有：
  + 完全一致 `@e[nbt={Pos:[-5.0d,56.0d,-7.0d]}]` #text(green)[☑]
  + 只匹配部分元素 `@e[nbt={Pos:[-5.0d]}]` #text(green)[☑]
  + 调换元素顺序 `@e[nbt={Pos:[-7.0d,56.0d,-5.0d]}]` #text(green)[☑]
  + 调换元素顺序并省略部分元素 `@e[nbt={Pos:[-7.0d,-5.0d]}]` #text(green)[☑]
+ 不能匹配的情况：
  + 空列表 `@e[nbt={Pos:[]}]` #text(red)[☒]
  + 不存在的元素 `@e[nbt={Pos:[80.0d]}]` #text(red)[☒]
== NBT路径
有时，为了访问所要寻找的NBT数据，需要在数据树上确定该数据的地址，即形成该数据的路径。这个概念为#proper-noun(display: "NBT路径（NBT path）", "nbt lu4 jing4")，它用于通过特定的有序遍历路径指向指定的标签。基本思路为：在数据树中，从根标签起通过层层标签最终索引得到指定的标签。数据树中每一层级的标签为一个#proper-noun(display: "节点（Node）", "jie2 dian3")。NBT路径的基本语法为：
#codebox("<节点>.<节点>.….<节点>")
例如，路径
#codebox("a.b.c")
就指向标签 `b` 的子标签 `c`，其中标签 `b` 又为 `a` 的子标签。其中，`a`、`b`、`c` 为三个不同的节点，分别位于三级不同的子标签，由节点拼凑得到最终的地址。
=== 节点
由于标签有不同的数据类型，相应地，节点也有几种不同的类型。具体划分后，节点一共有六种基本类型；按照指向的内容分类，则一共可以将节点分为两大类。
==== 指向标签的节点类型
这类节点指向*一个完整的标签*。在命令 `/data get` 中使用这些节点时，返回的是标签的值。
===== #proper-noun(display: "根复合标签（Root compound tag）", "gen1 fu4 he2 biao1 qian1")
语法：
#codebox("{标签}")
#[
  #set align(center)
  #grid(
    align: center + horizon,
    column-gutter: 2pt,
    columns: (auto, 6em, auto),
    row-gutter: 4pt,
    [], [#place(dx: -2em, box(width: 10em, text(fill: theme_basic.lighten(20%), font: "Source Han Sans SC", size: 0.8em, weight: "bold", align(center)[语法中指定的标签\ ▼])))\ \ ], [],
    [根标签: {], box(baseline: 25%, fill: theme_basic.lighten(20%), inset: 0.4em, text(white)[子标签: 值 #place(dx: -5.8em, dy: -1.4em, box(height: 2em, radius: 5pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), width: 18em))]), [, 子标签: 值 }]
  )
  #text(fill: theme_basic.saturate(100%).darken(10%), font: "Source Han Sans SC", size: 0.8em, weight: "bold", [指向的根标签])
]
`标签` 处应为一个测试NBT标签，它的写法在节@sec:testing_nbt 中已讲过，需要匹配的标签必须为根标签的子标签，也可以为空。若标签处为空或指定的数据与标签的实际数据匹配时，则指向根标签；若不匹配则不指向任何标签。例如，标签处为一只绵羊的某一个标签 #icon("nbt-compound") `Brain`，这个标签为绵羊标签的子标签，则指向的是绵羊这个根标签。

用法示例：
====== 该节点指向该复合标签本身：
#codebox("{}")
====== 该节点会先判断根标签的子标签 #icon("nbt-bool") `main` 的值是否为 `true`，若是则指向根标签；若否则不指向任何内容：
#codebox("{main:true}")
===== #proper-noun(display: "某名称的标签（Named tag）", "mou3 ming2 cheng1 de biao1 qian1")
语法：
#codebox("标签名")
#[
  #set align(center)
  #grid(
    align: center + horizon,
    column-gutter: 2pt,
    columns: (3em, auto),
    row-gutter: 4pt,
    [#place(dx: -3.5em, box(width: 10em, text(fill: theme_basic.lighten(20%), font: "Source Han Sans SC", size: 0.8em, weight: "bold", align(center)[语法中指定的标签名\ ▼])))\ \ ], [],
    box(baseline: 25%, fill: theme_basic.lighten(20%), inset: 0.4em, text(white)[标签#place(dx: -1em, dy: -1.4em, box(height: 2em, radius: 5pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), width: 6em))]), [: 值]
  )
  #text(fill: theme_basic.saturate(100%).darken(10%), font: "Source Han Sans SC", size: 0.8em, weight: "bold", [指向的标签])
]
这种节点会直接指向拥有该标签名的标签，无论该标签的数据类型。如果标签名中带有单引号 `'`、双引号 `"`和空格，则这个节点需要被引号包裹，带有汉字和反斜杠则不需要。

用法举例：若有一个根标签的子标签名为 `a`，则下面的节点指向该标签：
#codebox("a")
===== #proper-noun(display: "某名称的复合标签（Named compound tag）", "mou3 ming2 cheng1 de fu4 he2 biao1 qian1")
语法：
#codebox("标签名{子标签}")
#[
  #set align(center)
  #grid(
    align: center + horizon,
    column-gutter: 2pt,
    columns: (auto, 6em, auto),
    row-gutter: 4pt,
    [], [#place(dx: -2em, box(width: 10em, text(fill: theme_basic.lighten(20%), font: "Source Han Sans SC", size: 0.8em, weight: "bold", align(center)[语法中指定的标签\ ▼])))\ \ ], [],
    [标签: {], box(baseline: 25%, fill: theme_basic.lighten(20%), inset: 0.4em, text(white)[子标签: 值 #place(dx: -4.8em, dy: -1.4em, box(height: 2em, radius: 5pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), width: 17em))]), [, 子标签: 值 }]
  )
  #text(fill: theme_basic.saturate(100%).darken(10%), font: "Source Han Sans SC", size: 0.8em, weight: "bold", [指向的标签])
]
用法与根复合标签类似，`子标签` 是一个测试NBT标签，可选填，指向不必为根标签的标签，且指向的标签必须为复合标签。注意，`标签名` 和 `{子标签}` 之间不能添加冒号。
用法举例：
====== 已知有一个标签 `main:{a:true,b:false}`，则：
======= 该节点指向 #icon("nbt-compound") `main` 标签：
#codebox("main{}")
======= 该节点会先判断子标签 #icon("nbt-bool") `a` 的值是否为 `true`，显然结果为是，因此也指向标签 #icon("nbt-compound") `main`：
#codebox("main{a:true}")
====== 已知有一个标签 `NoAI:true`，则该节点无法指向任何标签，因为 #icon("nbt-bool") `NoAI` 不是复合标签：
#codebox("NoAI{}")
==== 指向列表或数组中元素的节点类型
这类节点指向*一个列表或数组中的一个或多个元素*。由于一个列表或数组中的元素实际上是上一级标签的值，则这类节点实际指向标签的值而不是一个完整的标签。
===== #proper-noun(display: "当前列表或数组中的某个元素（Element of named list or array tag）", "dang1 qian2 lie4 biao3 huo4 shu4 zu3 zhong1 de mou3 ge4 yuan2 su4")
语法：
#codebox("标签名[索引]")
#h(-2em)或
#codebox("标签名.[索引]")
#[
  #set align(center)
  #grid(
    align: center + horizon,
    column-gutter: 2pt,
    columns: (auto, auto, auto),
    row-gutter: 4pt,
    [], [#place(dx: -3.5em, box(width: 10em, text(fill: theme_basic.saturate(100%).darken(10%), font: "Source Han Sans SC", size: 0.8em, weight: "bold", align(center)[`标签名[索引]` 指向的元素\ ▼])))\ \ ], [],
    [标签: \[], box(baseline: 25%, inset: 0.4em, radius: 5pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), [元素]), [, 元素, 元素 \]]
  )
]
用于指向数组类标签中某个元素，`索引` 指名为 `标签名` 的列表或数组中的第几个元素，需要是一个整数值。

设索引的值为$i$，若$i$为非负数，则指向该列表或数组的第$i+1$个元素：所以 `0` 指向列表或数组的第一个元素、`1` 指向第二个元素，以此类推。若$i$为负数，假设列表或数组的长度（即其包含的元素个数）为$n$，则指向该列表或数组的第$i+n$个元素：所以 `-1` 表示该列表或数组的倒数第一个元素、`-2` 表示倒数第二个元素，以此类推。
#general-table(
  caption: [长度为$n$的列表及数组的索引值],
  colspan: 7,
  columns: (auto, auto, auto, auto, auto, auto, auto),
  header: ([元素的位数], [1], [2], [3], […], [$bold(n-1)$], [$n$]),
  [非负索引值], [0], [1], [2], […], [$n-2$], [$n-1$],
  [负数索引值], [$-n$], [$1-n$], [$2-n$], […], [-2], [-1]
)
索引指向的地址不能超出列表或数组的长度，否则节点就不指向任何标签。

用法举例：假设有一个标签 #icon("nbt-byte_array") `a:[B;1,0,0,1]`，则
====== `a[0]` 指向第一个元素，值为 `1b`；
====== `a[3]` 指向第四个元素，值为 `1b`；
====== `a[-2]` 指向倒数第二个（即第三个）元素，值为 `0b`；
====== `a[4]` 指向的地址超出了数组的长度，故无效。
===== #proper-noun(display: "当前列表或数组中的所有元素（All elements of named list or array tag）", "dang1 qian2 lie4 biao3 huo4 shu4 zu3 zhong1 de suo3 you3 yuan2 su4")
语法：
#codebox("标签名[]")
#h(-2em)或
#codebox("标签名.[]")
#[
  #set align(center)
  #grid(
    align: center + horizon,
    column-gutter: 2pt,
    columns: (auto, auto, auto),
    row-gutter: 4pt,
    [], [#place(dx: -1em, box(width: 10em, text(fill: theme_basic.saturate(100%).darken(10%), font: "Source Han Sans SC", size: 0.8em, weight: "bold", align(center)[`标签名[]` 指向的元素\ ▼])))\ \ ], [],
    [标签: \[], box(baseline: 25%, inset: 0.4em, radius: 5pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), [元素, 元素, 元素]), [\]]
  )
]
指向具有该标签名的列表或数组中的所有元素，此标签必须为数组类标签。如果该列表或数组有多个元素，则指向的是多个元素。

用法举例：假设有一个字节型数组 `a:[B;1,0,0,1]`，则节点 `a[]` 指向 `1b`、`0b`、`0b`、`1b` 这四个元素。
===== #proper-noun(display: "当前列表或数组中的复合标签元素（Compound elements of named list tag）", "dang1 qian2 lie4 biao3 huo4 shu4 zu3 zhong1 de fu4 he2 biao1 qian1 yuan2 su4")
语法：
#codebox("标签名[{标签}]")
#h(-2em)或
#codebox("标签名.[{标签}]")
#[
  #set align(center)
  #grid(
    align: center + horizon,
    column-gutter: 2pt,
    columns: (auto, auto, auto),
    row-gutter: 4pt,
    [], [#place(dx: -2.5em, box(width: 10em, text(fill: theme_basic.saturate(100%).darken(10%), font: "Source Han Sans SC", size: 0.8em, weight: "bold", align(center)[`标签名[{标签}]` 指向的元素\ ▼])))\ \ ], [],
    [标签: \[], box(baseline: 25%, inset: 0.4em, radius: 5pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), [{ 标签: 值 }]), [, { 标签: 值 } \]]
  )
]
`{标签}` 处为选填内容，使用测试NBT标签，可以为空。为空时，则会指向具有该标签名的列表或数组中所有为 `{}` 的复合标签；不为空时，会先检查标签的数据是否匹配，若匹配则指向具有该标签名的列表或数组中所有与之匹配的复合标签，若不匹配则不指向任何内容。

注意，具有该标签名的标签必须为一个复合标签的列表，也就是列表中的元素必须为复合标签，否则不指向任何内容。

用法举例：
====== 假设有一个复合标签列表 `a:[{b:1},{c:2}]`，则：
======= `a[{}]` 不指向任何元素。
======= `a[{b:1}]` 与列表中的 `{b:1}` 匹配，故指向 `{b:1}` 这个复合标签。
======= `a[{b:2}]` 与列表中的元素都不匹配，故不指向任何内容。
====== 假设有一个字节型数组 `a:[B;1,0,0,1]`，则 `a[{}]` 不指向任何内容，因为标签 #icon("nbt-byte_array") `a` 不是复合标签的列表。
\

特别地、当列表内的元素均为子列表时，依旧可以使用这种节点的变形，形如
#codebox("标签名[索引或为空][索引或为空]…[索引或为一个标签]")
#h(-2em)或
#codebox("标签名.[索引或为空].[索引或为空].….[索引或为一个标签]")
其中不同层级列表之间的点 `.` 可以任意省略。如此该节点指向列表的子列表的所有元素，可以嵌套多层，由外向内分别为第1层、第2层……设指向元素的列表位于$n$层，则节点语法中的方括号就有$n$个。
#wrap-content(
  tips(
    width: 16em,
    [
      总结：在基本节点类型中，花括号中的内容一般为限定条件（检查数据是否匹配），方括号中的内容一般为数组的索引。
    ]
  ),
  [

    除最后一个方括号中的内容外，中间这些方括号中可以为一个索引值，指向规则与命名列表或数组标签的元素相同，若为空则指向所有元素。最后一个方括号中的内容可以为一个索引值或标签，其中标签的用法与命名列表标签的复合元素相同，不作赘述。

    用法举例：
  ],
  align: right
)
#reset-h6
====== `a[0][0]` 指向列表 #icon("nbt-list") `a` 的第一个子列表的第一个元素。
====== `a[0][{b:1}]` 指向列表 #icon("nbt-list") `a` 的第一个子列表的元素 `{b:1}`，当且仅当该子列表中存在复合标签 `{b:1}`。
=== 路径
路径是由若干个节点组成的，在编写路径时，一定要注意*从根标签开始编写*。
#example(
  [
    有一棵数据树如下所示，其中 #icon("nbt-compound") `Root` 为根标签。
    #tree(
      (0, [#icon("nbt-compound") *Root*]),
      (1, [#icon("nbt-byte") *TagA*: `1`]),
      (1, [#icon("nbt-int") *TagB*: `30`]),
      (1, [#icon("nbt-compound") *ComA*]),
      (2, [#icon("nbt-float") *TagC*: `0.6`]),
      (2, [#icon("nbt-list") *List*]),
      (3, [#icon("nbt-compound")]),
      (4, [#icon("nbt-string") *Str*: `OK`]),
      (4, [#icon("nbt-byte") *TagD*: `0`]),
      (3, [#icon("nbt-compound")]),
      (4, [#icon("nbt-string") *Str*: `yes`]),
      (4, [#icon("nbt-byte") *TagD*: `0`]),
      (2, [#icon("nbt-compound") *ComB*]),
      (1, [#icon("nbt-byte_array") *Array*: `[B; 0, 1, 0, 0, 1]`])
    )
    + 写出标签 `Root` 的值。
    + 分别表示下列地址：
      + #icon("nbt-byte_array") `Array` 的第四个元素；
      + #icon("nbt-compound") `ComB`；
      + #icon("nbt-list") `List` 中的所有元素；
      + 所有名为 #icon("nbt-string") `Str` 的标签；
      + 名为 `Str` 且值为 `yes` 的标签。
  ],
  [
    + 根标签 #icon("nbt-compound") `Root` 为一个复合标签，里面有 #icon("nbt-byte") `TagA`、#icon("nbt-int") `TagB`、#icon("nbt-compound") `ComA` 和 #icon("nbt-byte_array") `Array` 四个子标签，其中 #icon("nbt-compound") `ComA` 又为一个复合标签，含有二级子标签#icon("nbt-float") `TagC`、#icon("nbt-list") `List` 和 #icon("nbt-compound") `ComB`。#icon("nbt-list") `List` 是一个复合标签的列表，内部含有两个复合标签。因此 #icon("nbt-compound") `Root` 标签的值如下所示。
      #codebox("{
  TagA:1b,
  TagB:30,
  ComA:{
    TagC:0.6f,
    List:[
      {
        Str:\"OK\",
        TagD:0b
      },
      {
        Str:\"yes\",
        TagD:1b
      }
    ],
    ComB:{}
  },
  Array:[B;0,1,0,0,1]
}")
    + + #icon("nbt-byte_array") `Array` 是根标签 #icon("nbt-compound") `Root` 的子标签，对于根标签的子标签，其首先占据一个节点。其次，#icon("nbt-byte_array") `Array` 是一个长度为5的字节型数组，对于其第四个元素，可以写成 `Array[3]`，也可以认为它是倒数第二个元素，因此也可以写成 `Array[-2]`。
      + #icon("nbt-compound") `ComB` 是一个复合标签，它是 #icon("nbt-compound") `ComA` 的子标签，但不是根标签的子标签，#icon("nbt-compound") `ComA` 才是根标签的子标签，因此 #icon("nbt-compound") `ComA` 占据一个节点，#icon("nbt-compound") `ComB` 占据第二个节点。这里有两种基本的写法：一种是 `ComA.ComB`；另一种是 `ComA{}.ComB`。后者的第一个节点指向 #icon("nbt-compound") `ComA` 这个标签，由于 #icon("nbt-compound") `ComA` 是个复合标签，因此命名标签和命名复合标签两种基本节点类型都可以使用。当然，给花括号中添加限定条件也是可以的，本题中，`ComA{ComB:{}}.ComB` 路径也是正确的，同样正确的写法还有 `ComA{TagC:0.6f}.ComB}`。
      + #icon("nbt-list") `List` 为一个列表，要指向列表中的所有元素，则使用命名列表或数组标签的所有元素这种节点类型，于是该节点写为 `List[]`，而 #icon("nbt-list") `List` 是 #icon("nbt-compound") `ComA` 的子标签，因此路径为 `ComA.List[]`。
      +  #icon("nbt-string") `Str` 是复合标签列表 #icon("nbt-list") `List` 中的子标签，从数据树上看，它似乎比 #icon("nbt-list") `List` 低了两个等级。实际上它是包含它本身的复合列表的子标签，而列表中的所有复合标签都是同等级的，列表的存在不增加嵌套等级，列表只负责将这些复合标签统整到一起。因此这个路径只需要三个节点，即 `ComA.List[].Str`。
      + 名为 `Str` 且值为 `yes` 的标签存在于复合标签中，该复合标签是是列表 #icon("nbt-list") `List` 的第二个元素。因此对于第二个节点，可以使用命名列表或数组标签的元素类型，将节点写作 `List[1]`；或者使用命名列表标签的复合元素类型，这时候添加限定条件以指向列表的第二个元素，如 `List[{Str:"yes"}]`。所以最终路径为 `ComA.List[1].Str` 或 `ConA.List[{Str:"yes"}].Str`。
  ]
) <exa:nbt_path>
== 命令/data的语法<sec:command_data>
一些NBT数据是可以通过命令修改的。在进行修改之前，需要先了解NBT路径以明确需要修改的数据所处的位置，这便是上一节所讲述的内容。能够对NBT数据进行操作的命令有若干条，其中命令 `/data` 是其中应用范围最广的、操作性最强的，也是最基础的一条命令，本节将主要介绍命令 `/data` 的用法。

命令 `/data` 只能用于获取或修改*方块实体*、*实体*和*命令存储*的NBT数据，但是*无法修改玩家的任何数据*。`/data` 一共有四条子命令，它们分别是 `get`、`merge`、`modify` 和 `remove`，这四条子命令组成了最基本的 `/data` 语法结构。`/data` 所需的权限等级为2。#index(index: "command", "data")
=== get子命令
`/data get` 用于获取方块实体、实体或命令存储的NBT数据，语法为：
#codebox("data get (block <targetPos>|entity <target>|storage <target>) [<path>] [<scale>]") <code:command_data_get>
#param-desc(
  [`block <targetPos>` ], [需要修改数据的方块实体，首先需要明确的就是该方块实体所在方块的方块坐标，其中 `<targetPos>` 的参数类型为方块坐标 `minecraft:block_pos`。],
  [`entity <target>` ], [一共有三种选择实体的方法：即目标选择器、玩家名称或UUID，只能指定一个实体。`<target>` 的参数类型为实体 `minecraft:entity`。],
  [`storage <target>)` ], [以命令存储的命名空间ID指定需要修改的命令存储内容，`<target>` 的参数类型为命名空间ID `minecraft:resource_location`。],
  [`[<path>]`（NBT路径 `minecraft:nbt_path`）], [可选，需要获取的数据的NBT路径，若不指定则使用根标签。],
  [`[<scale>]`（双精度浮点数 `brigadier:double`）], [可选，将返回的值进行缩放的倍率。缩放操作为：先将NBT值向下取整，再乘以指定的缩放倍率。]
)
*若路径指向的是一个完整的标签，则返回的该标签的值；若路径指向的是列表或数组中的元素，则返回指向的元素。*如不符合下列要求，则 `/data get` 命令将无法执行：
+ 获取的NBT路径必须存在。
+ 返回的标签或数值必须少于两个，注意，不是指复合标签或数组中的标签必须少于两个，一个复合标签或一个数组被视为上一级标签的值。因此必须谨慎使用诸如命名列表或数组标签的所有元素这样的节点，因为这类节点通常指向的标签或数值大于一个。假设有一个字节型数组 `a:[B;1,0,0,1]`，由于路径 `a[]` 指向 `1b`、`0b`、`0b`、`1b` 这四个数值，因此不能在 `/data get` 中设置路径 `a[]`，但是路径 `a` 指向整个标签 #icon("nbt-byte_array") `a`，则返回的内容为标签 `a` 的值，即 `[B;1,0,0,1]`。
+ 若指定了倍率参数，则返回的内容必须为一个数值。
#example(
  [
    对于@exa:nbt_path 所示的数据树，假设该数据树是位于坐标$(0,56,0)$的方块的方块实体数据。写出命令 `/data get block 0 56 0 ComA.List[1].TagD 2` 返回的内容。
  ],
  [
    路径 `ComA.List[1].TagD` 指向标签 #icon("nbt-compound") `ComA` 的子标签 #icon("nbt-list") `List` 中第二个复合标签内名为 `TagD` 的标签，即指向标签 `TagD:1b`，于是返回该标签的值，即 `1b`。而命令的结尾又添加了一个倍率参数 `2`，即将 `1b` 乘以2，因此返回的内容为数值 `2`。

  ]
) <exa:command_data_1>
=== remove子命令
`/data remove` 用于移除指定方块实体、实体或命令存储的NBT数据，语法为：
#codebox("data remove (block <targetPos>|entity <target>|storage <target>) <path>	")
#param-desc(
  [`<targetPos>`、`<target>` ], [与语法@code:command_data_get 一致。],
  [`<path>`（NBT路径 `minecraft:nbt_path`）], [必填，需要移除的数据的NBT路径，不能指向根标签。]
)
=== merge子命令
`/data merge` 使方块实体、实体或命令存储的NBT数据与指定NBT发生合并，语法为：
#codebox("data merge (block <targetPos>|entity <target>|storage <target>) <nbt>")
#param-desc(
  [`<nbt>`（NBT复合标签 `minecraft:nbt_compound_tag`）], [需要指定的复合标签。与原本的根标签值进行合并，若合并后的值与原本的值相同则命令执行失败。]
)
在填写 `<nbt>` 时，需要用花括号将标签括起以表示它是根标签的值。一般来说根标签为复合标签，其子标签不止一个。现在令 `A`、`B`、`C` 为一个根标签的子标签，则该根标签的值为：
#codebox("{A,B,C}")
现在使用命令
#codebox("data merge … {B'}")
其中标签 `B'` 与 `B` 标签名相同，值不同。子命令 `merge` 使 `{B'}` 与 `{A,B,C}` 发生合并，覆盖掉原本的标签 `B`，而标签 `A` 和 `C` 不发生改变，所以修改后的根标签值为
#codebox("{A,B',C}")
=== modify子命令
`/data modify` 用于在原本方块实体、实体或命令存储的NBT数据基础上以标签为单位进行修改，修改后的值必须与原本的值不同，部分语法为：
#codebox("data modify (block <targetPos>|entity <target>|storage <target>) <targetPath> (append|insert <index>|merge|pretend|set) …") <code:command_data_modify>
#param-desc(
  [`<targetPath>`（NBT路径 `minecraft:nbt_path`）], [需要修改的标签，需要是合法的NBT路径。],
  [`(append|insert <index>|merge|pretend|set)` ], [规定NBT的修改方式，有五种不同的方式。若使用 `insert`，则需要指定一个 `<index>`（整型 `brigadier:integer`）值。]
)
下表为这五种修改方式的作用形式：
#general-table(
  caption: [`/data` 子命令 `modify` 的可用修改方式],
  colspan: 4,
  columns: (auto, auto, auto, auto),
  header: ([修改方式], [作用标签类型], [效果], [示例]),
  [`append`], [列表或数组], [在列表或数组的末尾插入一个元素。], [将一个值 `E` 以 `append` 的形式插入列表 `[A,B,C,D]`，则结果为 `[A,B,C,D,E]`。],
  [`insert <索引>`], [列表或数组], [在列表或数组的指定位置插入一个元素。设索引值为$i$，则元素会被插入到列表或数组的第$i$个位置。索引值可以为负以表示倒数第$i$个位置。列表或数组中原先第$i$个位置及之后的元素均向后移一位。], [对于列表 `[A,B,C,D]`，若以 `insert 1` 的语法将E插入其中，则结果为 `[A,E,B,C,D]`。],
  [`merge`], [复合标签], [将语法中的NBT与指定的复合标签进行合并。与 `merge` 子命令不同的是，`merge` 子命令作用于整个根标签，这里的 `merge` 修改方式作用于根标签下的子复合标签或多级子复合标签。], [-],
  [`pretend`], [列表或数组], [在列表或数组的首位插入一个元素。], [将一个值 `E` 以 `pretend` 的形式插入列表 `[A,B,C,D]`，则结果为 `[E,A,B,C,D]`。],
  [`set`], [任意类型的标签], [将指定的标签替换为新的值。在该修改方式中，NBT路径不能指向根标签。], [将标签 `A:1b` 的值以 `set` 的方式替换为 `0b`，则结果为 `A:0b`。]
)
命令 `/data modify` 还需要确定值的来源。来源可以是其他标签的值，也可以自己指定的一个值。
===== 若来源为其他标签的值，则语法@code:command_data_modify 省略号部分的语法为：
#codebox("from (block <sourcePos>|entity <source>|storage <source>) [<sourcePath>]")
#param-desc(
  [`<sourcePos>`（方块坐标 `minecraft:block_pos`）], [数据来源方块实体的方块坐标。],
  [`<source>`（`entity` 模式，实体 `minecraft:entity`）], [数据来源实体，可以为玩家名称、UUID或目标选择器，但只能指定一个实体。],
  [`<source>`（`storage` 模式，命名空间ID `minecraft:resource_location`], [数据来源命令存储，需要是该命令存储的命名空间ID。],
  [`[<sourcePath>]`（NBT路径 `minecraft:nbt_path`）], [可选，来源数据的NBT路径，若不指定则为根标签。]
)
===== 若来源的值需要为其他方块实体、实体或命令存储中的字符串，则可以使用下面的语法，字符串可以切片处理：
#codebox("string (block <sourcePos>|entity <source>|storage <source>) [<sourcePath>] [<start>] [<end>]")
#param-desc(
  [`[<start>]`（整型 `brigadier:integer`）], [索引值，开始截取的字符位置。从0开始计，可以使用负数索引值。],
  [`[<end>]`（整型 `brigadier:integer`）], [索引值，终止截取的字符位置。从0开始计，可以使用负数索引值。终止索引位置的字符不会被截取。若 `[<start>]` 值为$n$，`[<end>]` 值为$m$，则截取第$n$个至第$m-1$个字符会被截取（包括第$n$个和第$m-1$个字符）。]
)
#[
  #set align(center)
  #v(0.5em)
  #text(fill: theme_basic.saturate(100%).darken(10%), font: "Source Han Sans SC", size: 0.8em, weight: "bold", [#h(11em) 字符串切片])
  #v(0.5em)
  #grid(
    align: center,
    column-gutter: 0.5em,
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
    row-gutter: 1em,
    [], [字符], […], [字符], [字符], [字符], […], [字符], [字符], […],
    [字符的位数], [1], […], [$n$], [$n+1$], [$n+2$], […], [$m$], [$m+1$], […],
    [字符的索引值], [0], […], [$n-1$], [$n$], [$n+1$], […], [$m-1$], [$m$], […]
  )
  #place(
    dx: 19.8em,
    dy: -6.4em,
    box(
      height: 5.5em,
      radius: 4pt,
      stroke: 1pt + theme_basic.saturate(100%).darken(10%),
      width: 10.2em
    )
  )
  #v(1em)
]
#example(
  [命令存储 `custom:main` 中 #icon("nbt-string") `id:"minecraft:iron_ingot"` 的值是一个命名空间ID，试去除它的命名空间前缀、只保留ID，将结果存入 #icon("nbt-string") `name` 标签。],
  [
    显然需要使用字符串切片，需要去除的部分为 `minecraft:`，其后的 `i` 索引值为 `10`，从此处一直截取到最后一个字符，命令为
    #codebox("data modify storage custom:main name set string storage custom:main id 10 -1")
  ]
)
===== 若来源的值由玩家自己指定，则语法为：
#codebox("value <value>")
#param-desc(
  [`<value>`（NBT值 `minecraft:nbt_tag`）], [需要为SNBT的格式值，必须符合需要修改的标签所需的数据类型。]
)
#example(
  [在@exa:command_data_1 所述的情景中，编写一条命令使之在列表 #icon("nbt-list") `List` 第1和第2个复合标签之间插入一个新的复合标签，这个新的复合标签与列表 #icon("nbt-list") `List` 第1个复合标签相同。],
  [
    首先需要写出需要修改的标签的路径，即指向标签 #icon("nbt-list") `List`，由此写出：
    #codebox("data modify block 0 56 0 ComA.List")
    对列表型标签进行修改时，考虑在 `modify` 子命令中使用 `append`、`insert` 或 `pretend` 这三种修改方式。题目要求在第1和第2个复合标签之间插入一个新的复合标签，因此使用 `insert`。根据题意，新的复合标签会成为列表的第2个元素，因此可以写出：
    #codebox("data modify block 0 56 0 ComA.List insert 2")
    最后要指明标签的值来源为列表 #icon("nbt-list") `List` 的第1个复合标签。列表 #icon("nbt-list") `List` 的第1个复合标签属于位于$(0,56,0)$的方块实体的数据树。其路径为 `ComA.List[0]`。于是可以写出整条命令：
    #codebox("data modify block 0 56 0 ComA.List insert 2 from block 0 56 0 ComA.List[0]")
  ]
)
=== 命令/data的语法树
命令 `/data` 语法成分复杂，嵌套层级较多，为此笔者制作了如@fig:command_data 所示的完整语法树作为参考。其中虚线表示的部分为可选内容。
#figure(
  caption: [命令 `/data` 的语法树],
  image("图片/命令data的语法树.png", width: 100%)
) <fig:command_data>
== NBT与JSON
=== NBT和JSON格式的转换<subsec:nbt_and_json_conversion>
NBT和JSON格式结构类似，但还有很多不同之处，在一些情况下，游戏必须对这两种格式进行相互转换以满足计算的需要，即使这两种格式的转换可能会造成数据丢失。
===== NBT转换为JSON \*
#general-table(
  caption: "NBT转换为JSON",
  colspan: 2,
  columns: (auto, auto),
  header: ([NBT数据类型], [转换后的JSON数据类型]),
  [#icon("nbt-byte") #icon("nbt-short") #icon("nbt-int") #icon("nbt-long") #icon("nbt-float") #icon("nbt-double")], [#icon("json-number") 数值],
  [#icon("nbt-string")], [#icon("json-string") 字符串],
  [#icon("nbt-compound")], [#icon("json-object") 对象],
  [#icon("nbt-list") #icon("nbt-byte_array") #icon("nbt-int_array") #icon("nbt-long_array")], [#icon("json-array") 数组]
)
===== JSON转换为NBT
#general-table(
  caption: "JSON转换为NBT",
  colspan: 2,
  columns: (auto, auto),
  header: ([JSON数据类型], [转换后的NBT数据类型]),
  [#icon("json-bool") 布尔值], [#icon("nbt-byte")], 
  [#icon("json-number") 数值], [若位于字节型的取值范围内，则转换为 #icon("nbt-byte")；\ 否则，若位于短整型的取值范围内，则转换为 #icon("nbt-short")；\ 否则，若位于整型的取值范围内，则转换为 #icon("nbt-int")；\ 否则，若位于长整型的取值范围内，则转换为 #icon("nbt-long")；\ 否则，若其能精确存储为一个单精度浮点数，则转换为 #icon("nbt-float")；\ 若不为上述任意一者，则转换为 #icon("nbt-double")。],
  [#icon("json-string") 字符串], [#icon("nbt-string")],
  [#icon("json-array") 数组], [若JSON数组内元素的数据类型不同，则无法转换为NBT；\ 若JSON数组内元素被转换为 #icon("nbt-byte")，则将数组转换为 #icon("nbt-byte_array")；\ 若JSON数组内元素被转换为 #icon("nbt-int")，则将数组转换为 #icon("nbt-int_array")；\ 若JSON数组内元素被转换为 #icon("nbt-long")，则将数组转换为 #icon("nbt-long_array")；\ 若不为上述任意一者，则转换为 #icon("nbt-list")],
  [#icon("json-object") 对象], [#icon("nbt-compound")],
  [Null], [不转换]
) <tab:json_to_nbt>
有时候，开发过程中可能需要开发者手动转换格式。例如，数据包的战利品表、谓词和物品修饰器一般使用JSON格式定义，对于一些未在数据包中定义的战利品表、谓词和物品修饰器，可以用内联的方式在直接命令中定义，这时需要将战利品表、谓词和物品修饰器以SNBT的形式写在命令中。以下是内联定义的一个例子：
#example(
  [
    将以下的战利品表 `.json` 文件以内联的形式写入命令。
    #codefile(
      lang: "json",
      title: "data > minecraft > loot_table > blocks > granite.json",
      "{
  \"type\": \"minecraft:block\",
  \"pools\": [
    {
      \"bonus_rolls\": 0.0,
      \"conditions\": [
        {
          \"condition\": \"minecraft:survives_explosion\"
        }
      ],
      \"entries\": [
        {
          \"type\": \"minecraft:item\",
          \"name\": \"minecraft:granite\"
        }
      ],
      \"rolls\": 1.0
    }
  ],
  \"random_sequence\": \"minecraft:blocks/granite\"
}"
    )
  ],
  [
    先以树状图列出该文件的JSON数据：
    #tree(
      (0, [#icon("json-object") 文件封装]),
      (1, [#icon("json-string") *type*: `minecraft:block`]),
      (1, [#icon("json-array")]),
      (2, [#icon("json-object")]),
      (3, [#icon("json-number") *bonus_rolls*: `0.0`]),
      (3, [#icon("json-array") *conditions*]),
      (4, [#icon("json-object")]),
      (5, [#icon("json-string") *condition*: `minecraft:survives_explosion`]),
      (3, [#icon("json-array") *entries*]),
      (4, [#icon("json-object")]),
      (5, [#icon("json-string") *type*: `minecraft:item`]),
      (5, [#icon("json-string") *name*: `minecraft:granite`]),
      (3, [#icon("json-number") *rolls*: `1.0`]),
      (1, [#icon("json-string") *random_sequence*: `minecraft:blocks/granite`])
    )
    内联形式，即将JSON格式手动转换为SNBT格式，此时参考@tab:json_to_nbt 的转换方式，可得到相应的SNBT树形图：
    #tree(
      (0, [#icon("nbt-compound") 文件封装]),
      (1, [#icon("nbt-string") *type*: `minecraft:block`]),
      (1, [#icon("nbt-list")]),
      (2, [#icon("nbt-compound")]),
      (3, [#icon("nbt-float") *bonus_rolls*: `0.0`]),
      (3, [#icon("nbt-list") *conditions*]),
      (4, [#icon("nbt-compound")]),
      (5, [#icon("nbt-string") *condition*: `minecraft:survives_explosion`]),
      (3, [#icon("nbt-list") *entries*]),
      (4, [#icon("nbt-compound")]),
      (5, [#icon("nbt-string") *type*: `minecraft:item`]),
      (5, [#icon("nbt-string") *name*: `minecraft:granite`]),
      (3, [#icon("nbt-float") *rolls*: `1.0`]),
      (1, [#icon("nbt-string") *random_sequence*: `minecraft:blocks/granite`])
    )
    因此内联形式为
    #codebox("{
  type: \"minecraft:block\",
  pools: [
    {
      bonus_rools: 0.0f,
      conditions: [
        {
          condition: \"minecraft:survives_explosion\"
        }
      ],
      entries: [
        {
          type: \"minecraft:item\",
          name: \"minecraft:granite\"
        }
      ],
      rolls: 1.0f
    }
  ],
  random_sequence: \"minecraft:blocks/granite\"
}")
  ]
)
=== SNBT和JSON的嵌套<subsec:snbt_and_json_nesting>
==== 在SNBT中使用的JSON
部分情况下，SNBT值需要为一段完整的JSON，典型例子就是在25w02a之前的版本中在SNBT中使用的文本组件。SNBT与JSON本身不兼容，在SNBT中使用JSON时，一般值类型为字符串。根据字符串数据类型的定义方法，双引号和单引号均可用于定义字符串。若字符串中有单引号或双引号中的某一种引号，且用于定义字符串的引号与字符串中存在的引号类型相同，则必须为字符串中的引号添加转义字符。而大部分的JSON都是存在双引号的，根据社区规范，需尽量减少转义字符的使用，*定义SNBT值类型时一般使用单引号*，对于以下的JSON片段：
#tree(
  (0, [#icon("json-object")]),
  (1, [#icon("json-string") *text*: `Hello World!`]),
  (1, [#icon("json-string") *color*: `red`])
)
它作为SNBT的值时，写法可以为
#codebox("Name:'{\"text\":\"Hello World!\",\"color\":\"red\"}'")
使用转义字符的写法虽然符合语法，但不符合社区规范：
#codebox("Name:\"{\\\"text\\\":\\\"Hello World!\\\",\\\"color\\\":\\\"red\\\"}\"")
*在SNBT值内部的JSON中所有需要被转义的字符前都需要添加反斜杠*，如 `\` 和SNBT字符串定义使用的引号，无论这些字符在原本的JSON中是否起到实际作用。遇到嵌套层级较深的情况，可以*由内向外书写，一层层添加反斜杠*，并适当规避转义。例如，对于以下的JSON片段：
#tree(
  (0, [#icon("json-object")]),
  (1, [#icon("json-string") *text*: `"Hello World!"`]),
  (1, [#icon("json-string") *color*: `red`])
)
在JSON中它的写法为
#codebox("{\"text\":\"\\\"Hello World!\\\"\",\"color\":\"red\"}")
当这个JSON片段的值作为SNBT的值时，应在每个需要被转义的字符前添加反斜杠。但由于其中只有双引号，因此可以用单引号定义字符串以规避反斜杠：
#codebox("Name:'{\"text\":\"\\\"Hello World!\\\"\",\"color\":\"red\"}'") <code:json_in_snbt>
#example(
  [
    将以下的JSON片段写为SNBT字段 #icon("nbt-string") `raw` 的值：
    #codebox("{\"text\":\"A\\nB\",\"bold\":true}")
  ],
  [
    JSON中只有双引号，故用单引号定义SNBT字符串，并在 `\` 前加反斜杠，如：
    #codebox("raw:'{\"text\":\"A\\\\nB\",\"bold\":true}'")
  ]
)
#example(
  [
    将以下的JSON片段完整地写为SNBT字段 #icon("nbt-string") `Name` 的值。
    #tree(
      (0, [#icon("json-array")]),
      (1, [#icon("json-object")]),
      (2, [#icon("json-string") *text*: `\Hello World!\`]),
      (1, [#icon("json-object")]),
      (2, [#icon("json-string") *text*: `\"Hello World!\"`])
    )
  ],
  [
    先将树状图转换为JSON：
    #codebox("[
  {
    \"text\":\"\\\\Hello World!\\\\\"
  },
  {
    \"text\":\"\\\\\\\"Hello World!\\\\\\\"\"
  }
]")
    注意到其中只有双引号，所以用单引号定义SNBT字符串，然后在所有的 `\` 前加反斜杠，因此 #icon("nbt-string") `Name` 为
    #codebox("Name:'[{\"text\":\"\\\\\\\\Hello World!\\\\\\\\\"},{\"text\":\"\\\\\\\\\\\\\"Hello World!\\\\\\\\\\\\\"\"}]'") <code:json_in_snbt_field_name>
  ]
) <exa:json_in_snbt>
==== 在JSON中使用的SNBT
一些JSON需要的值为SNBT，这些JSON的数据类型基本上都是字符串，拥有定义字符串的双引号 `"`。这些SNBT中出现的*每一个* `"`、`\` 均需要被转义。
#example(
  [对于由@exa:json_in_snbt 得到的SNBT字段，在其外侧套一层复合标签后写入JSON字段 #icon("json-string") `nbt`。],
  [
    只需将代码@code:json_in_snbt_field_name 中每一个 `"` 和 `\` 前添加一个 `\` 即可，结果为
    #codebox("\"nbt\": \"{Name:'[{\\\"text\\\":\\\"\\\\\\\\\\\\\\\\Hello World!\\\\\\\\\\\\\\\\\\\"},{\\\"text\\\":\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\"Hello World!\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\"}]'}\"")
  ]
)
#heading(level: 2, numbering: none, [第四章思考题与习题])
+ 判断下列NBT数据值的写法是否正确。
  + `13us`
  + `128b`
  + `0.e+03`
  + `.2d`
  + `[I;000000001,000000001,0000000001,0000000001]`
+ 根据如下所示的SNBT，回答下列问题：
  #codebox("Player:{
  Inventory:[
    {count:1,Slot:0b,id:\"minecraft:diamond_sword\"},
    {count:45,Slot:1b,id:\"minecraft:bread\"}
  ]
}")
  + 标签 `count:1` 是否是标签 `Player` 的子标签？为什么？
  + 指出标签 `Inventory` 的数据类型。
+ 解释下列名词：节点、根复合标签、某名称的复合标签、索引、NBT路径。
+ 假设一个根标签 #icon("nbt-compound") `orange_banner` 的值如下所示：
  #codebox("{x:5,y:56,z:4,id:\"minecraft:banner\",patterns:[{pattern:\"diagonal_left\",color:\"magenta\"}]}")
  + 画出标签 #icon("nbt-compound") `orange_banner` 的树状图；
  + 写出下列路径指向的内容：
    + `x`;
    + `patterns[0]`；
    + `id`；
    + `patterns[0][0]`
+ 有一个数据的树状图如下所示，将它写成SNBT的形式。<t:snbt_tree>
  #tree(
    (0, [#icon("nbt-compound") *Chunk $bold([31,24])$ in world at $bold((-1,-6))$*]),
    (1, [#icon("nbt-int") *DataVersion*: `2865`]),
    (1, [#icon("nbt-compound") *Sections*]),
    (2, [#icon("nbt-compound") *3*]),
    (3, [#icon("nbt-list") *Records*]),
    (4, [#icon("nbt-compound") 内容未知]),
    (4, [#icon("nbt-compound") 内容未知]),
    (4, [#icon("nbt-compound")]),
    (5, [#icon("nbt-int") *free_tickets*: `1`]),
    (5, [#icon("nbt-compound") *type*: `minecraft:toolsmith`]),
    (5, [#icon("nbt-int_array") *pos*: 含有3个元素，内容未知]),
    (4, [#icon("nbt-compound") 内容未知]),
    (4, [#icon("nbt-compound") 内容未知]),
    (4, [#icon("nbt-bool") *Valid*: `true`]),
  )

+ 根据第@t:snbt_tree 题的树状图，试写出指向下列内容的路径：
  + 整个根标签；
  + #icon("nbt-list") `Records` 的第二个元素；
  + #icon("nbt-int_array") `pos`。
+ 对于@exa:nbt_path 所示的数据树，假设该数据树是位于坐标$(0,56,0)$的方块实体的数据。使用命令以进行如下的操作：
  + 获取标签 #icon("nbt-int") `TagB` 的数据；
  + 删除 #icon("nbt-list") `List` 的第二个元素；
  + 将标签 #icon("nbt-float") `TagC` 的值改为 `1.2f`；
  + 将列表 #icon("nbt-list") `List` 第一个复合标签的值复制到标签 #icon("nbt-compound") `ComB`；
  + 在数组 #icon("nbt-byte_array") `Array` 的第2个和第3个元素之间插入一个新的元素，要求来源为列表 #icon("nbt-list") `List` 第一个复合标签中标签 #icon("nbt-byte") `TagD` 的值。
+ 编写命令使@exa:nbt_path 所示的整棵数据树写入命令存储 `test:root`。
+ 将@chap:intro\思考题与习题第@t:json_tree 题的JSON改写为内联SNBT形式。
+ 将@chap:intro\思考题与习题第@t:json_text 题得到的各JSON字段分别完整地写作SNBT字段 #icon("nbt-string") `json` 的值。
+ 将代码@code:json_in_snbt 所示的SNBT作为一个字符串类型的JSON字段 #icon("json-string") `nbt` 需要的值，写出对应的JSON字段。
= 文本组件<chap:text_component>
Minecraft中有各式各样的文本，它们有不同的内容、不同的样式，有些文本甚至能够与玩家产生交互。本章将介绍这些文本使用的格式——文本组件。
#pagebreak()
== 概述<sec:text_component_overview>
#proper-noun(display: "文本组件（Text component）", "wen2 ben3 zu3 jian4")，旧称#proper-noun(display: "原始JSON文本（Raw JSON text）", "yuan2 shi3 JSON wen2 ben3")，是用于向玩家发送、显示富文本的一种格式。文本组件可以使用SNBT和JSON两种格式书写：在命令及SNBT中使用的文本组件应写为SNBT格式，在 `.json` 文件中使用的文本组件应写为JSON格式。

在25w02a以前的版本中，文本组件统一使用严格的JSON格式。对于一些接受文本组件作为值的SNBT字段，文本组件必须作为整个字符串 #icon("nbt-string") 写入SNBT字段，在SNBT内嵌套JSON的写法在小节@subsec:snbt_and_json_nesting 中已有说明，这样的嵌套需要注意引号的配对和转义字符的使用，在书写和维护的过程中很容易有疏忽。自25w02a起，文本组件可以从相应字段的节点开始直接存储为数据树的一部分，不再需要考虑两种格式的兼容性问题，此举更利于文本组件的编辑。

文本组件一共由以下三部分组成：
===== #proper-noun(display: "文本组件类型（Text component content）", "wen2 ben3 zu3 jian4 lei4 xing2")
定义文本类型、来源和解析规则，内容可以为空。
===== #proper-noun(display: "文本组件样式（Text component style）", "wen2 ben3 zu3 jian4 yang4 shi4")
定义文本的样式、字体、交互事件等信息，若不定义，则文本使用其载体的默认样式，不同载体的默认样式不同。交互事件默认不存在。
===== #proper-noun(display: "子组件（Text component children）", "zi3 zu3 jian4")
定义依附于当前文本的文本组件，子组件会继承父组件的样式。

文本组件可以接受的 #icon("nbt") SNBT数据类型为 #icon("nbt-string") *字符串*、#icon("nbt-list") *列表*和 #icon("nbt-compound") *复合标签*，对应的 #icon("json") JSON数据类型则为 #icon("json-string") *字符串*、#icon("json-array") *数组*和 #icon("json-object") *对象*，*其他的数据类型一概不接受*。

当文本组件使用 #icon("nbt-string")#icon("json-string") 字符串形式时，该组件被当作纯文本处理，不能添加任何样式。例如，组件@code:text_component_string_format\是一个 #icon("nbt-string")#icon("json-string") 字符串形式的文本组件，输入后返回的文本为#text_component([Hello World!])（字符串的引号不会被返回）：
#codebox("\"Hello World!\"") <code:text_component_string_format>
当使用 #icon("nbt-list") 列表/ #icon("json-array") 数组时，其中的元素可以是任意形式的文本组件，包括 #icon("nbt-string")#icon("json-string") 字符串、#icon("nbt-list") 列表/ #icon("json-array") 数组和 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象，同一 #icon("nbt-list") 列表/ #icon("json-array") 数组内元素的类型可以不同。例如，组件@code:text_component_list_format 返回的内容是#text_component([ABC])：
#codebox("[\"A\",\"B\",\"C\"]") <code:text_component_list_format>
#icon("nbt-list") 列表/ #icon("json-array") 数组内的任一元素不能为文本组件不接受的数据形式。例如，组件@code:text_component_list_format_wrong_1 无法被解析，因为 #icon("nbt-list") 列表/ #icon("json-array") 数组内的所有元素均为 #icon("nbt-int") 整型/ #icon("json-number") 数值：
#codebox("[1,2,3]") <code:text_component_list_format_wrong_1>
组件@code:text_component_list_format_wrong_2 也无法被解析，因为 #icon("nbt-list") 列表/ #icon("json-array") 数组有元素为 #icon("nbt-int") 整型/ #icon("json-number") 数值，即使数组内已有能被解析的 #icon("nbt-string")#icon("json-string") 字符串类型的数据：
#codebox("[1,\"2\",3]") <code:text_component_list_format_wrong_2>
当使用 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象时，允许在其中指定文本组件类型和文本组件样式，数据格式为#footnote[这里同时提供了SNBT和JSON的格式，后续教程皆如此。]：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [文本组件类型]),
  (1, [文本组件样式])
)
其中文本组件类型是必填项目，文本组件样式可选。如果不需要使用特别的组件类型和定义特别的样式，为了节省命令长度，一般使用字符串形式的文本组件而不使用 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象。在游戏解析过程中，*无样式和子组件的纯文本内容会被序列化成 #icon("nbt-string")#icon("json-string") 字符串形式的文本组件。*例如，输入的文本组件为：
#codebox("{text:\"Hello World!\"}")
#h(-2em)再次提取这个数据，就会发现它已被序列化成：
#codebox("\"Hello World!\"")
使用文本组件编写的文本在样式上会很丰富。使用文本组件的物件主要有命令 `/tellraw`、命令 `/title`、告示牌、成书、文本展示实体、对话框等，由于告示牌、成书、文本展示实体是存档格式的一部分，因此将在后面@chap:level_format\中详细介绍。下面先介绍两条命令的语法。
#reset-h5
===== 命令 `/tellraw`#index(index: "command", "tellraw")
该命令用于在聊天栏中对指定的目标显示文本，所需的参数等级为2，语法为：
#codebox("tellraw <targets> <messages>")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [指定文本接受者，可以为玩家名称、UUID或目标选择器，但必须指定玩家。],
  [`<messages>`（文本组件 `minecraft:component`）], [要显示的富文本，使用文本组件，可以在其中使用换行符 `\n`。]
)
#example(
  [向所有玩家的聊天栏显示文本#text_component([Hello World!])。],
  [
    命令为
    #codebox("tellraw @a \"Hello World!\"")
  ]
)
===== 命令 `/title`#index(index: "command", "title")
该命令用于在玩家的屏幕上显示一行大号的字体，共有三个位置可共显示。标题文本的大小取决于页面大小设置，过长的标题*不会*自动换行，只会溢出屏幕。它需要的权限等级为2，以下是所有用法：
====== 对指定的玩家在特定的位置文本，语法为：
#codebox("title <targets> (title|subtitle|actionbar) <title>")
#param-desc(
  [`(title|subtitle|actionbar)`], [显示位置，分别为 `title`（#proper-noun(display: "主标题（Screen title）", "zhu3 biao1 ti2")）、`subtitle`（#proper-noun(display: "副标题（Subtitle）", "fu4 biao1 ti2")）和 `actionbar`（#proper-noun(display: "动作栏（Action bar）", "dong4 zuo4 lan2")），这三个显示位置如@fig:title_position 所示。其中*副标题只有当主标题存在时才会显示*。动作栏是显示玩家一些操作的位置，如使用音乐唱片、睡觉、骑乘实体等，这些操作信息会覆盖用命令 `/title` 设置的文本。],
  [`<title>`（文本组件 `minecraft:component`）], [要显示的富文本，使用文本组件，*不可以在其中使用换行符 `\n`*。]
)
#figure(
  caption: "各标题显示的位置",
  image("图片/各标题显示的位置.png", width: 28em)
) <fig:title_position>
====== 对指定的玩家设置主标题和副标题渐入、保持和渐出的时间，语法为：
#codebox("title <targets> times <fadeIn> <stay> <fadeOut>") <code:command_title_times>
#param-desc(
  [`<fadeIn>`、`<stay>`、`<fadeOut>`（时间 `minecraft:time`）], [分别为标题的渐入、保持和渐出的时间，均使用带单位的时间参数，不写单位则默认为游戏刻，其默认时长分别为10gt、70gt和20gt。注意，*该命令不能用于设置动作栏的渐入、保持和渐出的时间，动作栏默认在其显示后3秒左右淡出。*]
)
====== 对指定的玩家，将其标题的渐入、保持、渐出时间参数恢复为默认值，语法为：
#codebox("title <targets> reset")
====== 对指定的玩家移除其正在显示的所有标题，语法为：
#codebox("title <targets> clear")
#example(
  [对所有玩家显示主标题#text_component([Level 0])，副标题#text_component([前厅])。],
  [
    命令为
    #codebox("title @a title \"Level 0\"")
    #codebox("title @a subtitle \"前厅\"")
  ]
)
#example(
  [对所有玩家而言，标题渐入、保持和渐出的时间已被修改，若需要将其改回默认值，则需要的命令为何？],
  [
    由于不存在直接重置标题显示时间的命令，因此需要使用语法@code:command_title_times 手动修改，命令可以为
    #codebox("title @a times 10 70 20")
  ]
)
== 文本组件类型<sec:text_component_content>
文本组件一共有七种可用的组件类型：*纯文本*、*翻译文本*、*记分板分数*、*实体名称*、*按键绑定*、*NBT值*和*精灵图*，这部分数据的结构为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-string")#icon("json-string") *type*: 可选，标识此对象使用的组件类型，它使用组件类型的ID作为它需要的值，因此有效值有 `text`（纯文本）、`translatable`（翻译文本）、`score`（记分板分数）、`selector`（实体名称）、`keybind`（按键绑定）和 `nbt`（NBT值）。]),
  (1, [对于指定的 #icon("nbt-string")#icon("json-string") `type` 使用的相应额外字段。])
)
对于一个指定的 #icon("nbt-string")#icon("json-string") `type`，同一个 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象内必须存在相应额外字段，如@tab:text_component_content 所示。
#general-table(
  caption: "组件类型",
  colspan: 4,
  columns: (auto, auto, auto, auto),
  header: ([优先级], [#icon("nbt-string")#icon("json-string") #text(black)[`type`] 的值], [相应的额外字段], [组件类型]),
  [1], [`text`], [#icon("nbt-string")#icon("json-string") `text`], [纯文本],
  [2], [`translatable`], [#icon("nbt-string")#icon("json-string") `translate`], [翻译文本],
  [3], [`keybind`], [#icon("nbt-string")#icon("json-string") `keybind`], [按键绑定],
  [4], [`score`], [#icon("nbt-compound")#icon("json-object") `score`], [记分板分数],
  [5], [`selector`], [#icon("nbt-string")#icon("json-string") `selector`], [实体名称],
  [6], [`nbt`], [#icon("nbt-string")#icon("json-string") `nbt`], [NBT值],
  [7], [`object`], [#icon("nbt-string")#icon("json-string") `object`], [精灵图]
) <tab:text_component_content>
例如，若指定
#codebox("type:\"text\"")
#h(-2em)这说明组件标识了纯文本，那么在同一个 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象内就需要使用字段 #icon("nbt-string")#icon("json-string") `text` 以说明纯文本的具体内容，如：
#codebox("{type:\"text\",text:\"Alpha\"}")
然而，字段 #icon("nbt-string")#icon("json-string") `type` 在文本组件中并不是必须的，使用 #icon("nbt-string")#icon("json-string") `type` 只是为了提高组件解析、检查错误的速度。如果 #icon("nbt-string")#icon("json-string") `type` 不指定值、或是 #icon("nbt-string")#icon("json-string") `type` 的值不属于上述有效值中的任何一者、亦或是 #icon("nbt-string")#icon("json-string") `type` 标识的组件类型在同一个 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象内不存在相应的额外字段，则组件类型会依次检查对象内的如下键：#icon("nbt-string")#icon("json-string") `text`、#icon("nbt-string")#icon("json-string") `translate`、#icon("nbt-compound")#icon("json-object") `score`、#icon("nbt-string")#icon("json-string") `selector`、#icon("nbt-string")#icon("json-string") `keybind`、#icon("nbt-string")#icon("json-string") `nbt`，最终使用第一个检查得到的有效键作为该组件使用的组件类型。

例如，对于以下的文本组件：
#codebox("{text:\"A\"}")
#h(-2em)它没有使用 #icon("nbt-string")#icon("json-string") `type` 而是直接指定了 #icon("nbt-string")#icon("json-string") `text`，那么这个组件识别的组件类型为纯文本。而对于下面的文本组件：
#codebox("{type:\"score\",translate:\"addServer.add\"}")
#h(-2em)指定的 #icon("nbt-string")#icon("json-string") `type` 为 `score`，而使用的键却为 #icon("nbt-string")#icon("json-string") `translate`，此时识别的结果为翻译文本而不是记分板分数。

如果 #icon("nbt-string")#icon("json-string") `type` 不指定值且 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象内存在多种组件类型，则按照@tab:text_component_content 所示的优先级，选择表中最靠上的一种组件类型。组件类型所属键出现在 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象中的先后顺序不会影响组件类型的优先级。例如，下面的文本组件
#codebox("{
  keybind:\"key.left\",
  score:{objective:\"A\",name:\"*\"},
  selector:\"@p\"
}")
#h(-2em)出现了三种组件类型：按键、记分板分数、实体名称，根据@tab:text_component_content，记分板分数的优先级最高，故返回记分板分数。
此外，如果一个 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象中出现了多个同种类型的文本时，则会优先使用 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象中最靠后的文本类型字段。例如，
#codebox("{text:\"1\",text:\"2\",text:\"3\"}")
#h(-2em)返回的文本为#text_component([3])
=== 纯文本组件
显而易见，#proper-noun(display: "纯文本组件（Plain text）", "chun2 wen2 ben3 zu3 jian4")用于直接输出一段固定的文本。格式为：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-string")#icon("json-string") *type*: `text`]),
  (1, [#icon("nbt-string")#icon("json-string") *#underline[text]*: 具体的文本内容。])
)
#example(
  [在所有玩家的主标题显示纯文本#text_component([Hello World!])。],
  [
    如果使用 #icon("nbt-string")#icon("json-string") `text`，则命令为
    #codebox("title @a title {type:\"text\",text:\"Hello world!\"}")
    然而，节@sec:text_component_overview 指出，对于命令中没有任何样式的纯文本 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象，游戏总是会将它序列化成 #icon("nbt-string")#icon("json-string") 字符串，即
    #codebox("title @a title \"Hello world!\"") <code:text_component_string_recommended>
    这样的写法也是有效的，并且因为它输入的字符少，通常更推荐如@code:text_component_string_recommended 这样的写法。
  ]
)
纯文本内允许包含各种转义序列，如Unicode、换行符 `\n`。例如下面的命令：
#codebox("tellraw @a {text:\"\\u2605\\nCiallo~\"}")
#h(-2em)它会在聊天栏中返回#text_component([★\ Ciallo\~])。

如果还需在其中使用引号和转义字符，则参考节@subsec:json_esacpe 和@subsec:nbt_data_type 说明的转义方式。
=== 翻译文本组件<subsec:translate>
*翻译文本组件（Translated text，或译本地化文本组件）*#index(display: "翻译文本组件（Translated text，本地化文本组件）", "fan1 yi4 wen2 ben3 zu3 jian4")通过翻译标识符返回一段已翻译的文本，文本显示的语言为客户端当前的语言。这种组件类型的作用在于，可以让一段文本转换为不同玩家所需要的语言。例如，翻译标识符 `commands.forceload.added.failure` 的简体中文 `zh_cn` 显示为“没有被标记为强制加载的区块”，而在使用美式英语 `en_us` 的客户端中，这段文本就被显示为“No chunks were marked for force loading”。

#proper-noun(display: "翻译标识符（Translation identifier，本地化键名）", "fan1 yi4 biao1 shi2 fu2")存在于资源包语言文件中，用于表示一段已翻译的文本，一个翻译标识符大致按照以下的格式书写：
#codebox("<内容>.<内容>.<内容>.…")
它们被存储在 #icon("folder") `assets\minecraft\lang\xx_xx.json` 中，每一个翻译标识符后面都有一个值，这些值便是在当前语言中的翻译文本。在 #icon("json") `en_us.json` 中，部分翻译标识符如下所示：
#codefile(
  lang: "json",
  title: "assets > minecraft > lang > en_us.json",
  "{
  \"commands.clone.success\": \"Successfully cloned %s blocks\",
  \"commands.debug.started\": \"Started tick profiling\"
}"
)
简体中文语言文件 #icon("json") `zh_cn.json` 相应的部分如下所示：
#codefile(
  lang: "json",
  title: "assets > minecraft > lang > zh_cn.json",
  "{
  \"commands.clone.success\": \"已成功复制%s个方块\",
  \"commands.debug.started\": \"已开始刻分析\"
}"
)
如果自制的资源包需要支持多语言，应该在资源包 #icon("folder") `lang` 路径下添加语言文件，所有命名空间均可用，不仅限于 `minecraft`。一般而言至少应支持简体中文和美式英语：#cite(<vanilla_mod>, form: none)
#tree(
  (0, [#icon("folder") *assets*]),
  (1, [#icon("folder") *\<命名空间>*]),
  (2, [#icon("folder") *lang*]),
  (3, [#icon("json") *en_us.json*]),
  (3, [#icon("json") *zh_cn.json*])
)
翻译标识符及其翻译的内容可完全自定义。翻译内容允许各种转义序列，如Unicode码、换行符 `\n` 等。

在翻译文本文本组件中，决定组件类型的键为 #icon("nbt-string")#icon("json-string") `translate`，数据格式如下：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-string")#icon("json-string") *type*: `translatable`]),
  (1, [#icon("nbt-string")#icon("json-string") *#underline[translate]*: 翻译标识符。若输入正确，则会返回和客户端当前语言一致的已翻译文本，即返回在相应语言 `.json` 文件中该翻译标识符的值。也可以不使用资源包，直接填入允许带译文变量的一段文本，此时文本内的译文变量有效。]),
  (1, [#icon("nbt-string")#icon("json-string") *fallback*: 若相应的语言文件中没有需要的翻译标识符，则显示 `en_us.json` 中的内容，即美式英语的文本。若在 `en_us.json` 中也没有找到该翻译标识符，则可以使用这个字段以输出替代的文本，它需要的值为字符串，因此不能添加格式，但可以使用格式化代码。]),
  (1, [#icon("nbt-list")#icon("json-array") *with*: 一些翻译标识符的值中含有 `%s` 的字样，这些被称为标识符中的*译文变量（英文原文为Slots，槽位）*#index(display: "译文变量（Slots）", "yi4 wen2 bian4 liang4")。若不定义此字段，则这些译文变量的位置会显示为无文本。可以使用这个字段对这些译文遍历进行自定义。]),
  (2, [一个文本组件，允许使用字符串、数组、对象等组件。])
)
对于翻译标识符值中的译文变量，参数列表 #icon("nbt-list")#icon("json-array") `with` 给它们分配参数的规则如下：
+ 对于出现的第$n$个 `%s`，其会被分配参数列表中的第$n$个参数。
+ 对于 `%n$s`，其会被分配参数列表中的第$n$个参数。
下面的例子解释了这种分配规则：
#example(
  [
    已知翻译标识符 `translation.test.complex` 对应字段在 #icon("json") `zh_cn.json` 为
    #codebox("\"translation.test.complex\":\"前缀，%s%2$s 然后是 %s 和 %1$s 最后是 %s 还有 %1$s！\"")
    写出文本组件
    #codebox("{translate:\"translation.test.complex\",with:[\"1\",\"2\",{text:\"3\",bold:true},\"4\"]}")
    #h(-2em)返回的文本。
  ],
  [
    参数列表中一共有4个参数，它们分别是：
    #general-table(
      caption: "参数列表",
      colspan: 4,
      columns: (auto, auto, auto, auto),
      header: ([第1个参数], [第2个参数], [第3个参数], [第4个参数]),
      text_component(shadow-offset: (0.1em, -0.25em), text(white)[1]), text_component(shadow-offset: (0.1em, -0.25em), text(white)[2]), text_component(shadow-offset: (0.1em, -0.25em), text(white)[#set text(weight: "bold")
      3]), text_component(shadow-offset: (0.1em, -0.25em), text(white)[4])
    )
    对于所有的 `%s`，给它们按顺序分别分配参数列表中的参数：
    #[
      #set align(center)
      #grid(
        align: center + horizon,
        column-gutter: 2pt,
        columns: (auto, 2em, auto, 2em, auto, 2em, auto),
        row-gutter: 4pt,
        [], text(0.9em)[#place(dx: -1.5em, box(width: 5em, [第1个参数]))\ ▼], [], text(0.9em)[#place(dx: -1.5em, box(width: 5em, [第2个参数]))\ ▼], [], text(0.9em)[#place(dx: -1.5em, box(width: 5em, [第3个参数]))\ ▼], [],
        [前缀，], box(inset: 0.4em, radius: 4pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), [%s]), [%2\$s 然后是 ], box(inset: 0.4em, radius: 4pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), [%s]), [ 和 %1\$s 最后是 ], box(inset: 0.4em, radius: 4pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), [%s]), [ 还有 %1\$s！]
      )
    ]
    对于 `%n$s`，给它们强制分配参数列表中第$n$个参数：
    #[
      #set align(center)
      #grid(
        align: center + horizon,
        column-gutter: 2pt,
        columns: (auto, 3em, auto, 3em, auto, 3em, auto),
        row-gutter: 4pt,
        [], text(0.9em)[#place(dx: -1em, box(width: 5em, [第2个参数]))\ ▼], [], text(0.9em)[#place(dx: -1em, box(width: 5em, [第1个参数]))\ ▼], [], text(0.9em)[#place(dx: -1em, box(width: 5em, [第1个参数]))\ ▼], [],
        [前缀，%s], box(inset: 0.4em, radius: 4pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), [%2\$s]), [ 然后是 %s 和 ], box(inset: 0.4em, radius: 4pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), [%1\$s]), [ 最后是 %s 还有 ], box(inset: 0.4em, radius: 4pt, stroke: 1pt + theme_basic.saturate(100%).darken(10%), [%1\$s]), [！]
      )
    ]
    于是返回的内容为#text_component([前缀，12 然后是 2 和 1 最后是 #[#set text(weight: "bold")
    3] 还有 1！])。第4个参数虽然存在于列表中，但并没有使用。
  ]
)
若 #icon("nbt-string")#icon("json-string") `fallback` 也没有指定值，则返回翻译标识符本身。例如，`custom.1` 是原版资源包中任何一个语言文件中都没有的翻译标识符，那么在不定义 #icon("nbt-string")#icon("json-string") `fallback` 时，文本组件
#codebox("{translate:\"custom.1\"}")
返回的内容为#text_component([custom.1])。读者可以通过在资源包中添加这些自定义的翻译标识符，并为这些翻译标识符编写相应的值。
#index(display: "检测资源包是否安装并显示不同的文本", index: "method", "jian3 ce4 zi1 yuan2 bao1 shi4 fou3 an1 zhuang1 bing4 xian3 shi4 bu4 tong2 de wen2 ben3")
#example(
  [一张冒险地图需要配合资源包使用，玩家进入游戏时地图会向玩家展示主标题，若玩家启用了正确的资源包，则主标题文本为#text_component([资源包已启用])；若玩家未使用资源包，则主标题文本为#text_component([请安装正确的资源包！])。试实现这个效果。],
  [
    要使客户端在装载资源包前后显示不同的文本，不妨使用翻译文本组件。当资源包启用的时候，按照翻译标识符显示对应的文本；当资源包未启用的时候，翻译标识符不存在，从而显示 #icon("nbt-string")#icon("json-string") `fallback` 中的内容。

    首先在资源包中定义一个 #icon("folder") `zh_cn.json` 语言文件，在其中任意定义一个翻译标识符：
    #codefile(
      lang: "json",
      title: "assets > tutorial > lang > zh_cn.json",
      "{
  \"resourcePack.loaded\": \"资源包已启用\"
}"
    )
    其次在文本组件中写：
    #codebox("{translate:\"resourcePack.loaded\",fallback:\"请安装正确的资源包！\"}")
    接下来只需要在主标题中显示：
    #codebox("title @a title {translate:\"resourcePack.loaded\",fallback:\"请安装正确的资源包！\"}")
  ]
)
#example(
  [显示文本#text_component([\<A>胜利，\<B>失败！\<A>获得\<x>金币，\<B>获得\<y>金币])，其中 `<A>` 的值为 `kyifyuy`，`<B>` 的值为 `planet00shaper`，`<x>` 的值为 `78`，`<y>` 的值为 `13`。],
  [
    不妨可以用翻译文本组件的译文变量将参数传入至文本，此处不用资源包，直接将带译文变量的文本填入 #icon("nbt-string")#icon("json-string") `translate`：
    #codebox("{translate:\"%1$s胜利，%2$s失败！%1$s获得%3$s金币，%2$s获得%4$s金币\",with:[\"kyifyuy\",\"planet00shaper\",\"78\",\"13\"]}")
    因为带有重复的参数，因此译文变量写成了 `%n$s` 的形式。

    不过，在实际的应用情境中，本题的所有变量都会是动态的，`<A>`、`<B>` 很有可能需要实体名称组件，`<x>`、`<y>` 很有可能需要记分板分数组件。这些组件类型的写法见后文的说明。
  ]
)
=== 按键绑定组件
#proper-noun(display: "按键绑定组件（Keybind）", "an4 jian4 bang3 ding4 zu3 jian4")用于返回可设置键位的动作当前设置的键位，返回的内容会随着玩家的键位设置而改变，数据结构为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-string")#icon("json-string") *type*: `keybind`]),
  (1, [#icon("nbt-compound")#icon("json-object") *#underline[keybind]*: 需要返回的键位，值为#proper-noun(display: "键位标识符（Keybind identifier）", "jian4 wei4 biao1 shi2 fu2")。所有可用的键位标识符如@tab:keybind_identifier 所示：])
)
#general-table(
  caption: "可用键位标识符",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([键位标识符], [控制], [默认键位]),
  [`key.advancements`], [进度], [`L`],
  [`key.attack`], [攻击/摧毁], [`鼠标左键`],
  [`key.back`], [向后移动], [`S`],
  [`key.chat`], [打开聊天栏], [`T`],
  [`key.command`], [输入命令], [`/`],
  [`key.debug.clearChat`], [清除聊天信息], [`F3` + `H`],
  [`key.debug.copyLocation`], [按维度复制当前坐标], [`F3` + `C`],
  [`key.debug.copyRecreateCommand`], [复制指向的方块数据], [`F3` + `I`],
  [`key.debug.crash`], [按住10秒强制触发崩溃], [`F3` + `C`],
  [`key.debug.debugOptions`], [调试选项], [`F3` + `F6`],
  [`key.debug.dumpDynamicTextures`], [保存动态纹理], [`F3` + `S`],
  [`key.debug.dumpVersion`], [显示版本信息], [`F3` + `V`],
  [`key.debug.focusPause`], [控制失去焦点时游戏暂停], [`F3` + `P`],
  [`key.debug.fpsCharts`], [FPS图表], [`F3` + `2`],
  [`key.debug.modifier`], [调试功能组合用键], [`F3`],
  [`key.debug.networkCharts`], [网络图表], [`F3` + `3`],
  [`key.debug.overlay`], [显示调试屏幕], [`F3`],
  [`key.debug.profiling`], [开始/停止性能分析], [`F3` + `L`],
  [`key.debug.profilingChart`], [分析图表], [`F3` + `1`],
  [`key.debug.reloadChunk`], [重新加载区块], [`F3` + `A`],
  [`key.debug.reloadResourcePacks`], [重新加载资源包], [`F3` + `T`],
  [`key.debug.showAdvancedTooltips`], [显示物品高级提示框], [`F3` + `H`],
  [`key.debug.showChunkBorders`], [显示区块边界], [`F3` + `G`],
  [`key.debug.showHitboxes`], [显示判定箱], [`F3` + `B`],
  [`key.debug.spectate`], [在上一个游戏模式和旁观模式之间切换], [`F3` + `N`],
  [`key.debug.switchGameMode`], [使用游戏模式切换器], [`F3` + `F4`],
  [`key.drop`], [丢弃所选物品], [`Q`],
  [`key.forward`], [向前移动], [`W`],
  [`key.fullscreen`], [全屏显示切换], [`F11`],
  [`key.hotbar.1`\ `key.hotbar.2`\ `key.hotbar.3`\ `key.hotbar.4`\ `key.hotbar.5`\ `key.hotbar.6`\ `key.hotbar.7`\ `key.hotbar.8`\ `key.hotbar.9`], [快捷栏1 \~ 9], [`1`\ `2`\ `3`\ `4`\ `5`\ `6`\ `7`\ `8`\ `9`],
  [`key.inventory`], [开启/关闭物品栏], [`E`],
  [`key.jump`], [跳跃], [`Space`],
  [`key.left`], [向左移动], [`A`],
  [`key.loadToolbarActivator`], [创造模式加载物品工具栏], [`X`],
  [`key.pickItem`], [选取方块], [`鼠标中键`],
  [`key.playerlist`], [玩家列表], [`Tab`],
  [`key.quickActions`], [对话框快捷操作], [`G`],
  [`key.right`], [向右移动], [`D`],
  [`key.saveToolbarActivator`], [创造模式保存物品工具栏], [`C`],
  [`key.screenshot`], [截图], [`F2`],
  [`key.smoothCamera`], [切换电影视角], [无],
  [`key.sneak`], [潜行], [左 `Shift`],
  [`key.socialInteractions`], [打开社交屏幕], [`P`],
  [`key.spectatorHotbar`], [旁观模式呼出快捷栏], [`鼠标中键`],
  [`key.spectatorOutlines`], [旁观模式高亮玩家], [无],
  [`key.sprint`], [疾跑], [左 `Ctrl`],
  [`key.swapOffhand`], [交换手中的物品], [`F`],
  [`key.toggleGui`], [隐藏/显示HUD], [`F1`],
  [`key.togglePerspective`], [切换视角], [`F5`],
  [`key.toggleSpectatorShaderEffects`], [切换旁观者着色器效果], [`F4`],
  [`key.use`], [使用物品/放置方块], [`鼠标右键`]
) <tab:keybind_identifier>
#example(
  [试编写一段翻译文本组件，大意为按使用键（默认为 `鼠标右键`）使用物品。],
  [
    首先配置语言文件，此处配置了简体中文和美式英文：
    #codefile(
      lang: "json",
      title: "assets > tutorial > lang > zh_cn.json",
      "{
  \"item.use\": \"按下以%s使用\"
}"
    )
    #codefile(
      lang: "json",
      title: "assets > tutorial > lang > en_us.json",
      "{
  \"item.use\": \"Press %s to use\"
}"
    )
    然后在翻译文本组件的 #icon("nbt-list")#icon("json-array") `with` 中定义传入的参数，显然需要传入按键绑定组件：
    #codebox("{keybind:\"key.use\"}")
    组合起来得到完整的文本组件：
    #codebox("{translate:\"item.use\",with:[{keybind:\"key.use\"}]}")
  ]
)
=== 记分板分数组件
#proper-noun(display: "记分板分数组件（Scoreboard value）", "ji4 fen1 ban3 fen1 shu4 zu3 jian4")这种组件类型用于返回指定分数持有者在指定记分项上的分数。若该分数持有者在指定记分项上没有分数，则不会返回任何内容。这种组件类型需要被解析。数据格式为：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-string")#icon("json-string") *type*: `score`]),
  (1, [#icon("nbt-compound")#icon("json-object") *#underline[score]*: 需要显示的记分板分数。]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[name]*: 可以是一个实体名称，也可以是一个目标选择器。但是一个记分板分数文本组件只能解析一个分数持有者在一个指定记分项上的分数，因此目标选择器必须将选择的目标数量限定为一个，仅使用 `@a`、`@e` 这样的目标选择器变量是不可接受的。除了实体名称和目标选择器外，`name` 还可以接受 `*` 作为它的值。若值为 `*`，则会返回观察者（这里指观察这段文本的实体）自己在指定记分项上的分数，这样可以让不同的玩家分别观察到他们自己的分数。]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[objective]*: 指定的记分项。])
)
#example(
  [已知玩家 `Mu_xian` 在记分项 `[test]` 上的分数为1，`IIIIfrit` 在记分项 `[test]` 上的分数为2。编写命令在这些玩家各自的客户端内返回各自的分数。],
  [
    命令为
    #codebox("tellraw @a {score:{name:\"*\",objective:\"test\"}}")
    在 `Mu_xian` 的客户端中返回的文本为#text_component([1])，在 `IIIIfrit` 的客户端中返回的文本为#text_component([2])。
  ]
)
=== 实体名称组件
#proper-noun(display: "实体名称组件（Entity names）", "shi2 ti3 ming2 cheng1 zu3 jian4")用于返回所有被选中实体的名称，需要被解析，可返回多个实体。数据格式为：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-string")#icon("json-string") *type*: `selector`]),
  (1, [#icon("nbt-string")#icon("json-string") *#underline[selector]*: 返回的实体，需要的值为目标选择器。]),
  (1, [#icon("nbt-string")#icon("json-string")#icon("nbt-list")#icon("json-array")#icon("nbt-compound")#icon("json-object") *separator*: 可选，表示显示时分割各实体名称的文本，值可以是文本组件可接受的任意数据类型。默认值为 `{"text":", ","color":"gray"}`，显示的是灰色的分隔符#text_component(shadow-offset: (0.1em, -0.25em),text(gray)[,])。])
)
#example(
  [在聊天栏中显示所有玩家的名字，名字之间用#text_component([|])分隔。],
  [
    命令为
    #codebox("tellraw @a {selector:\"@a\",separator:\"|\"}")
  ]
)
=== NBT组件
#proper-noun(display: "NBT组件（NBT values）", "NBT zu3 jian4")这种组件类型用于返回*方块实体*、*实体*或*命令存储*的指定NBT值，需要被解析，数据格式为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-string")#icon("json-string") *type*: `nbt`]),
  (1, [#icon("nbt-string")#icon("json-string") *source*: NBT值的来源，可用值 `block`（方块实体）、`entity`（实体）和 `storage`（命令存储）。若该字段不存在，则会根据 #icon("nbt-string")#icon("json-string") `nbt` 自动确定来源。]),
  (1, [#icon("nbt-string")#icon("json-string") *block*: 获取方块实体数据的方块坐标，可以为绝对坐标、相对坐标或局部坐标，坐标值之间用空格分隔。]),
  (1, [#icon("nbt-string")#icon("json-string") *entity*: 获取实体数据的实体，需要为目标选择器，可以选择多个实体。]),
  (1, [#icon("nbt-string")#icon("json-string") *storage*: 获取命令存储数据的命令存储的命名空间ID。]),
  (1, [#icon("nbt-string")#icon("json-string") *#underline[nbt]*: 所返回NBT值的路径。]),
  (1, [#icon("nbt-bool")#icon("json-bool") *interpret*: 是否将从NBT获取的值当作文本组件解析，若解析失败则什么内容都不会返回。默认值为 `false`]),
  (1, [#icon("nbt-bool")#icon("json-bool") *plain*: 默认情况下返回的SNBT会有语法高亮，此字段为 `true` 时只会以纯文本的形式显示返回内容。默认值为 `false`。不能与 #icon("nbt-bool")#icon("json-bool") `interpret` 同时为 `true`。]),
  (1, [#icon("nbt-string")#icon("json-string")#icon("nbt-list")#icon("json-array")#icon("nbt-compound")#icon("json-object") *separator*: 可选，表示显示时分割各NBT值的文本，值可以是文本组件可接受的任意数据类型。默认值为 `", "`，显示的是白色的分隔符#text_component(shadow-offset: (0.1em, -0.25em),text(white)[,])。])
)
在一个同级文本组件 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象中，NBT数据值组件类型只能从 #icon("nbt-string")#icon("json-string") `block`、#icon("nbt-string")#icon("json-string") `entity` 和 #icon("nbt-string")#icon("json-string") `storage` 中选择一个，且这三个字段必须存在任何一者。若在同一个对象中出现多个，则它们按照如下顺序的优先级决定最终选择的键：#icon("nbt-string")#icon("json-string") `block`、#icon("nbt-string")#icon("json-string") `entity`、#icon("nbt-string")#icon("json-string") `storage`。
#example(
  [获取方块坐标为$(0,0,0)$之方块实体 #icon("nbt-list") `Items` 标签的值。],
  [
    文本组件为
    #codebox("{source:\"block\",nbt:\"Items\",block:\"0 0 0\"}")
  ]
)
#example(
  [返回所有实体 #icon("nbt-list") `Rotation` 标签的值。],
  [
    文本组件为
    #codebox("{source:\"entity\",nbt:\"Rotation\",entity:\"@e\"}")
  ]
)
#example(
  [返回存储 `test:a` 中 #icon("nbt-int") `test` 标签的值。],
  [
    文本组件为
    #codebox("{source:\"storage\",nbt:\"test\",storage:\"test:a\"}")
  ]
)
=== 精灵图组件
#proper-noun(display: "精灵图组件（Object）", "jing1 ling2 tu2 zu3 jian4")用于显示当前客户端的精灵图，可显示纹理图集精灵图和玩家皮肤精灵图。显示的精灵图会被转换为字体基准的$8 times 8$像素大小。
==== 纹理图集精灵图
格式为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-string")#icon("json-string") *type*: `object`]),
  (1, [#icon("nbt-string")#icon("json-string")#icon("nbt-list")#icon("json-array")#icon("nbt-compound")#icon("json-object") *fallback*: 若该精灵图渲染失败，则使用此文本组件作为替代内容。]),
  (1, [#icon("nbt-string")#icon("json-string") *object*: `atlas`]),
  (1, [#icon("nbt-string")#icon("json-string") *atlas*: 使用的纹理图集，默认为 `blocks`。]),
  (1, [#icon("nbt-string")#icon("json-string") *#underline[sprite]*: 精灵图在纹理图集中的命名空间ID。])
)
纹理图集的概念将在《资源包》教程中给出，以下直接以例题说明此组件的用法。
#example(
  [用文本组件显示苹果的精灵图 #icon("sprite-apple")。],
  [
    苹果是物品，使用 `items` 这个纹理图集，相应片段如下：
    #codefile(
      lang: "json",
      title: "assets > minecraft > atlases > items.json",
      "{
  \"sources\": [
    {
      \"type\": \"minecraft:directory\",
      \"prefix\": \"item/\",
      \"source\": \"item\"
    }
  ]
}"
    )
    资源包内苹果纹理的地址为 #icon("png") `assets > minecraft > textures > item > apple.png`，它在纹理图集内的命名空间ID为 `minecraft:apple`。故文本组件应写为
    #codebox("{object:\"atlas\",atlas:\"items\",sprite:\"minecraft:item/apple\"}")
  ]
)
#example(
  [尝试显示 #icon("sprite-heart_full")。],
  [
    #icon("sprite-heart_full") 是GUI图集所属的精灵图，此纹理在资源包内的位置为

    #icon("png") `assets > minecraft > textures > gui > sprites > hud > heart > full.png`

    GUI纹理图集的内容如下所示：
    #codefile(
      lang: "json",
      title: "assets > minecraft > atlases > gui.json",
      "{
  \"sources\": [
    {
      \"type\": \"minecraft:directory\",
      \"prefix\": \"\",
      \"source\": \"gui/sprites\"
    },
    {
      \"type\": \"minecraft:directory\",
      \"prefix\": \"mob_effect/\",
      \"source\": \"mob_effect\"
    }
  ]
}")
    故这个精灵图在纹理图集内的命名空间ID为 `minecraft:hud/heart/full`，完整的文本组件为
    #codebox("{object:\"atlas\",atlas:\"gui\",sprite:\"minecraft:hud/heart/full\"}")
  ]
)
==== 玩家皮肤精灵图
实际上，这种精灵图显示的是玩家的头而非完整的玩家模型或玩家皮肤，格式为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-string")#icon("json-string") *type*: `object`]),
  (1, [#icon("nbt-string")#icon("json-string")#icon("nbt-list")#icon("json-array")#icon("nbt-compound")#icon("json-object") *fallback*: 若该精灵图渲染失败，则使用此文本组件作为替代内容。]),
  (1, [#icon("nbt-string")#icon("json-string") *object*: `player`]),
  (1, [#icon("nbt-bool")#icon("json-bool") *hat*: 是否渲染皮肤的帽子，默认为 `true`。]),
  (1, [#icon("nbt-string")#icon("json-string")#icon("nbt-compound")#icon("json-object") *#underline[player]*: 要显示的玩家皮肤。有 #icon("nbt-string")#icon("json-string") 字符串和 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象两种格式。]),
  (2, [*当使用 #icon("nbt-string")#icon("json-string") 字符串形式时，需要为玩家名称，格式要求与 #icon("nbt-compound")#icon("json-object") 形式中的 #icon("nbt-string")#icon("json-string") `name` 一致。*], false),
  (2, [*当使用 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象形式时，具有以下字段：*], false),
  (2, [#icon("nbt-int_array")#icon("json-array") *id*: 玩家的UUID。]),
  (2, [#icon("nbt-string")#icon("json-string") *name*: 玩家名称，不能超过16个字符。若此项不使用，则按 #icon("nbt-int_array")#icon("json-array") `id` 字段确定玩家。]),
  (2, [#icon("nbt-list")#icon("json-array")#icon("nbt-compound")#icon("json-object") *properties*: 玩家游戏档案。]),
  (3, [*若使用 #icon("nbt-list") 列表/ #icon("json-array") 数组形式，则可用带签名的游戏档案，并具有以下字段：*], false),
  (3, [#icon("nbt-compound")#icon("json-object") 一项游戏档案属性。]),
  (4, [#icon("nbt-string")#icon("json-string") *#underline[name]*: 该属性的名称。]),
  (4, [#icon("nbt-string")#icon("json-string") *#underline[value]*: 该属性的值，是Base64编码的JSON数据。]),
  (4, [#icon("nbt-string")#icon("json-string") *Signature*: 该属性的签名。]),
  (3, [*若使用 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象形式，则具有以下字段：*], false),
  (3, [#icon("nbt-list")#icon("json-array") *\<游戏档案属性名称>*: 一个游戏档案属性。]),
  (4, [#icon("nbt-string")#icon("json-string") 该属性的值，是Base64编码的JSON数据。]),
  (2, [*以下字段均可选，若填写了则会在上述玩家档案数据的基础上进行修改，用于定制玩家皮肤。其中的纹理均可用资源包指定，对客户端有效。*], false),
  (2, [#icon("nbt-string")#icon("json-string") *cape*: 披风的纹理，使用命名空间ID，地址从 #icon("folder") `assets\<命名空间>\textures` 开始计。]),
  (2, [#icon("nbt-string")#icon("json-string") *elytra*: 鞘翅的纹理，使用命名空间ID，地址从 #icon("folder") `assets\<命名空间>\textures` 开始计。]),
  (2, [#icon("nbt-string")#icon("json-string") *model*: 玩家模型的类型，有效值 `wide`（宽型）和 `slim`（纤细型）。]),
  (2, [#icon("nbt-string")#icon("json-string") *texture*: 皮肤的纹理，使用命名空间ID，地址从 #icon("folder") `assets\<命名空间>\textures` 开始计。])
)
#example(
  [用文本组件显示玩家 `Mu_xian` 的头 #icon("sprite-Mu_xian") 。],
  [
    组件为
    #codebox("{object:\"player\",player:\"Mu_xian\"}")
  ]
)
=== 组件解析
*记分板分数组件*、*实体名称组件*和*NBT组件*这三种组件类型并不是在任何情况下都有效的，它们需要从游戏中索取数据，将数据渲染成静态的文本，这一过程被称为#proper-noun(display: "组件解析（Component resolution）", "zu3 jian4 jie3 xi1")，解析后游戏才会将组件内容发送至各自的客户端。*这些经过解析产生的文本是一种非动态的文本，简单地说，这些文本不会随着游戏内容的改变而产生更新，它们只反映游戏在组件解析发生那一刻的结果。*

组件解析依赖于一个“触发实体”，这个实体会提供上下文，文本组件中使用的 `@s`、`*` 指代的实体即为这些触发实体。例如，文本展示实体中的文本组件触发实体为这个文本展示实体本身，故其中所有的 `@s` 都是这个文本展示实体：
#codebox("summon text_display ~ ~ ~ {text:{selector:\"@s\"}}")
#h(-2em)无论这个命令在书写的时候是否被修改了执行者，文本组件中的 `@s` 依旧是这个文本展示实体：
#codebox("execute as @a run summon text_display ~ ~ ~ {text:{selector:\"@s\"}}")
#h(-2em)此时文本展示实体的内容会被解析为文本展示实体本身的自定义名称。

对于一些没有触发实体的情况，部分组件会行为异常或受限。

所有能够发生组件解析的情况列于@tab:component_resolution_context，同时该表也提供了相应的上下文，作为对@tab:command_context\的补充。
#page(flipped: true)[
  #set align(horizon)
  #general-table(
    caption: "组件解析上下文",
    colspan: 9,
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
    header: ([情况], [触发实体], [权限等级], [执行者实体], [执行者名称], [执行位置], [执行朝向], [执行锚点], [执行维度]),
    [`/tellraw`\ `/title`], [接收文本的各客户端的玩家], table.cell(rowspan: 2)[命令执行时的权限等级], table.cell(rowspan: 2)[命令执行时的执行者实体], table.cell(rowspan: 2)[命令执行时的执行者名称], table.cell(rowspan: 2)[命令执行时的执行位置], table.cell(rowspan: 2)[命令执行时的执行朝向], table.cell(rowspan: 2)[命令执行时的执行锚点], table.cell(rowspan: 2)[命令执行时的执行维度],
    [`/bossbar`\ `/scoreboard`\ `/team`], [此命令的执行者],
    [告示牌], [*无*], [2], [无], [`Sign`], [告示牌所在方块正中心], [水平向南], [脚部], [告示牌所在维度],
    [玩家打开成书], [该玩家], [玩家的权限等级], [玩家], [玩家的名称], [玩家所在位置], [玩家的朝向], [脚部], [玩家所在维度],
    [讲台上放入成书], [*无*], [2], [无], [`Lectern`], [讲台所在方块正中心], [水平向南], [脚部], [讲台所在维度],
    [文本展示实体], [该文本展示实体], [2], [该文本展示实体], [该文本展示实体的名称], [该文本展示实体所在位置], [该文本展示实体的朝向], [脚部], [该文本展示实体所在维度],
    [物品修饰器的\ `set_lore` 和\ `set_name`], [#icon("json-string") `entity` 指定的实体], [2], [#icon("json-string") `entity` 指定的实体], [#icon("json-string") `entity` 指定实体的名称], [#icon("json-string") `entity` 指定实体所在的位置], [#icon("json-string") `entity` 指定实体的朝向], [脚部], [#icon("json-string") `entity` 指定实体所在的维度]
  ) <tab:component_resolution_context>
]
以下情况无法进行组件解析：
===== 自定义物品的名称
例如，执行以下命令以给予一个苹果：
#codebox("give @s minecraft:apple[minecraft:custom_name={selector:\"@s\"}]")
#h(-2em)此时苹果的名称显示为 #text_component([_\@s_])，它并没有发生解析。
===== 对话框
对话框中的所有记分板分数组件、实体名称组件和NBT组件都不能解析，要想显示这些数据，只能用宏函数将数据传递进去。
===== 进度的标题和描述
== 文本组件样式
文本组件样式，包括文字的样式、字体和交互事件，主要用于修饰文字。
=== 样式与字体
基本的样式可应用于所有内容类型，其数据结构为：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-bool")#icon("json-bool") *bold*: 是否将文字变为#proper-noun(display: "粗体（Bold）", "cu1 ti3")。]),
  (1, [#icon("nbt-string")#icon("json-string") *color*: 文本本身的渲染颜色，可用值见下文的说明。]),
  (1, [#icon("nbt-string")#icon("json-string") *font*: 渲染文字使用的字体，可用值见下文的说明。]),
  (1, [#icon("nbt-bool")#icon("json-bool") *italic*: 是否将文字变为#proper-noun(display: "斜体（Italic）", "xie2 ti3")。]),
  (1, [#icon("nbt-bool")#icon("json-bool") *obfuscated*: 否将文字#proper-noun(display: "模糊化（Obfuscated）", "mo2 hu2 hua4")处理，使文本渲染为动态的随机字符（乱码）。]),
  (1, [#icon("nbt-int")#icon("json-number")#icon("nbt-list")#icon("json-array") *shadow_color*: 文本阴影的颜色，可以直接用 #icon("nbt-int") 整型/ #icon("json-number") 数字形式指定ARGB颜色，也可以用 #icon("nbt-list") 列表/ #icon("json-array") 数组内的浮点数作为不同通道的分量以表示颜色。]),
  (2, [*若使用 #icon("nbt-list")列表/ #icon("json-array") 数组形式，则包含以下字段：*], false),
  (2, [#icon("nbt-float")#icon("json-number") A通道分量，这个通道表示不透明度，有效值 `0` \~ `1`（含）。]),
  (2, [#icon("nbt-float")#icon("json-number") R通道分量，这个通道表示红色值，有效值 `0` \~ `1`（含）。]),
  (2, [#icon("nbt-float")#icon("json-number") G通道分量，这个通道表示绿色值，有效值 `0` \~ `1`（含）。]),
  (2, [#icon("nbt-float")#icon("json-number") B通道分量，这个通道表示蓝色值，有效值 `0` \~ `1`（含）。]),
  (1, [#icon("nbt-bool")#icon("json-bool") *strikethrough*: 是否为文字添加#proper-noun(display: "删除线（Strikethrough）", "shan1 chu2 xian4")。]),
  (1, [#icon("nbt-bool")#icon("json-bool") *underlined*: 是否为文字添加#proper-noun(display: "下划线（Underline）", "xia4 hua2 xian4")。])
)
==== 颜色与背景颜色
#wrap-content(
  tips(
    width: 20em,
    [应用在不同物件上的文本组件默认颜色不同。命令 `/title` 和 `/tellraw` 的默认颜色为白色，成书和告示牌则为黑色。]
  ),
  [
    
    字段 #icon("nbt-compound")#icon("json-object") `color` 可用的值包括Minecraft预设的16种颜色值、使用 `#<HEX>` 格式的6位十六进制颜色值以及用于重置颜色为默认颜色的 `reset`。预设的16种颜色如下表所示：
  ],
  align: right
)
#split-table(
  caption: "颜色值表",
  original-cols: (auto, auto, auto),
  seperator: (3,),
  header: ([颜色], [值], [HEX]),
  data: (
    [黑色], [`black`], [\#000000 #color_block(black)],
    [深蓝], [`dark_blue`], [\#0000AA #color_block(dark_blue)],
    [深绿], [`dark_green`], [\#00AA00 #color_block(dark_green)],
    [湖蓝], [`dark_aqua`], [\#00AAAA #color_block(dark_aqua)],
    [深红], [`dark_red`], [\#AA0000 #color_block(dark_red)],
    [紫色], [`dark_purple`], [\#AA00AA #color_block(dark_purple)],
    [金色], [`gold`], [\#FFAA00 #color_block(gold)],
    [灰色], [`gray`], [\#AAAAAA #color_block(gray)],
    [深灰], [`dark_gray`], [\#555555 #color_block(dark_gray)],
    [蓝色], [`blue`], [\#5555FF #color_block(blue)],
    [绿色], [`green`], [\#55FF55 #color_block(green)],
    [天蓝], [`aqua`], [\#55FFFF #color_block(aqua)],
    [红色], [`red`], [\#FF5555 #color_block(red)],
    [粉红], [`light_purple`], [\#FF55FF #color_block(light_purple)],
    [黄色], [`yellow`], [\#FFFF55 #color_block(yellow)],
    [白色], [`white`], [\#FFFFFF #color_block(white)]
  )
) <tab:color>
#example(
  [使用正红色 `#FF0000` 渲染纯文本#text_component(text(rgb("ff0000"))[Hello World!])。],
  [
    文本组件为#footnote[组件中的颜色块仅用于表示文字使用的颜色，实际编写时不存在这个色块。]
    #codebox([{text:\"Hello World!\",color:\"#color_block(rgb("ff0000"))\#FF0000\"}])
  ]
)
#index(display: "在聊天栏显示虚假的广播信息", index: "method", "zai4 liao2 tian1 lan2 xian3 shi4 xu1 jia3 de guang3 bo1 xin4 xi1")
#example(
  [编写一条命令以实现Herobrine进入游戏的假象。],
  [
    玩家在进入游戏的时候会在聊天栏中显示黄色的文字#text_component(text(yellow)[\<玩家>加入了游戏])（中文）或#text_component(text(yellow)[\<player> joined the game])（英文）。在使用命令制造“玩家进入游戏”的事件时，实际上不是真的有其他玩家加入了游戏，而是使用命令 `/tellraw` 造成的假信息。可以使用 `/tellraw` 在聊天栏中显示一段黄色的文本，并且运用翻译标识符以支持多种语言。在 #icon("json") `en_us.json` 中，玩家加入游戏的翻译文本由以下字段控制：
    #codebox("\"multiplayer.player.joined\": \"%s joined the game\"")
    对其中的 `%s` 定义文本 `Herobrine`，并添加样式，则所需的命令为
    #codebox([tellraw \@a {translate:\"multiplayer.player.joined\",with:[\"Herobrine\"],color:\"#color_block(yellow)yellow\"}])
    顺着这条思路还可以制造出其他效果。比如，在游戏中传播假死信息：\ #text_component([Mu_xian从高处摔了下来])\ 玩家的死亡信息为白色不加粗字体，在使用文本组件编写时只需使用默认样式即可，命令可以为：
    #codebox("tellraw @a {translate:\"death.fell.accident.generic\",with:[\"Mu_xian\"]}")
  ]
)
背景颜色使用ARGB格式，由于它有一个A通道，因此可以指定背景颜色的透明度。#icon("nbt-list") 列表/ #icon("json-array") 数组形式可以分别指定各通道，如果是 #icon("nbt-int") 整型/ #icon("json-number") 数字形式，这个值可按以下的方式计算：

每一个通道都是介于0 \~ 255（含）之间的值。若使用十六进制表示，则是一个八位数，每两位数为一个通道，从高到低位依次是A、R、G、B通道。也可以使用二进制表示，如此每个通道都是8位，一共32位。在SNBT格式中可以用二进制和十六进制，但是在JSON格式中必须把这个数据转换为十进制。
#example(
  [为文本#text_component(shadow-color: blue, text(white)[Hello World!])添加蓝色背景（FF0000FF #color_block(rgb("0000ff"))）。],
  [
    在SNBT中直接用十六进制即可：
    #codebox([{text:\"Hello World!\",shadow_color:#color_block(rgb("0000ff"))0xff0000ff}])
    或者使用二进制：
    #codebox([{text:\"Hello World!\",shadow_color:#color_block(rgb("0000ff"))0b11111111000000000000000011111111}])
    在JSON中就只能用十进制了：
    #codebox([{\"text\":\"Hello World!\",\"shadow_color\":#color_block(rgb("0000ff"))4278190335}])
  ]
)
==== 字体
字段 #icon("nbt-string")#icon("json-string") `font` 用于渲染文字的字体，值需要为所用字体的命名空间ID，若不指定，则使用Minecraft默认的字体，即Mojanglas，对于Mojanglas没有的码位，则使用Unifont字体。
#figure(
  caption: "原版使用的Mojanglas字体",
  image("图片/原版使用的Mojanglas字体.png", width: 12em)
)
字体文件夹一般存在于资源包中，地址为 #icon("json") `assets\<命名空间>\font\<字体>.json`。默认渲染的字体为 `minecraft:default`，在原版资源包中还存在其他字体，如Unifont字体、alt字体（附魔台文字）。可以通过在资源包中编写字体 `.json` 文件以添加新的字体。

Minecraft中的字体本质上是图像，如果设计巧妙，则可以将任意字符的字体设计成图像以实现一些视觉效果。具体内容见《资源包》。
==== 其他文字处理效果
#example(
  [
    将文本#text_component(text(dark_red)[#underline[#set text(font: "Minecraft", weight: "bold")
    Hello World!]])设置为深红色粗体字，并带有下划线。
  ],
  [
    文本组件为
    #codebox([{text:\"Hello World!\",color:\"#color_block(dark_red)dark_red\",bold:true,underlined:true}])
  ]
)
#example(
  [将文本#text_component([#strike[Hello World!]])模糊化处理，并设置删除线。],
  [
    文本组件为
    #codebox("{text:\"Hello World!\",strikethrough:true,obfuscated:true}")
    这段文本的效果可能为#text_component([#strike[TBilRoa|\*@\$c|]])，它实际上是动态的。
  ]
)
=== 格式化代码
在标准的文本组件中，为了给一段文本添加样式，通常的做法是在其后面添加各种样式的字段。其实在Minecraft中可以*直接在文本中添加所需的样式*，不一定需要在文本组件样式中定义，这时需要用到的工具便是#proper-noun(display: "格式化代码（Formatting code）", "ge2 shi4 hua4 dai4 ma3")，其作用是为文本本身添加格式信息。对于一些不支持文本组件的地方，可以使用格式化代码以定义文本的格式。

格式化代码使用分节符 `§` 作为其标识，介于分节符无法直接从键盘上输入，且原版客户端不支持分节符的输入，可以在允许Unicode的地方使用其Unicode码作为替代，即U+00A7。在聊天栏或命令控制台中写成 `\u00a7`，而使用编译软件编写数据包时可以直接写为 `§`。格式化代码大致可分为两类：一类是 `§0` \~ `§9`、`§a` \~ `§f` 的颜色代码，另一类是其余控制文本样式的格式代码。所有的格式化代码及其效果如下表所示：
#split-table(
  caption: "格式化代码表",
  original-cols: (auto, auto, auto),
  seperator: (3,),
  header: ([格式化代码], [效果], [HEX]),
  data: (
    [`§0`], [黑色], [\#000000 #color_block(black)],
    [`§1`], [深蓝], [\#0000AA #color_block(dark_blue)],
    [`§2`], [深绿], [\#00AA00 #color_block(dark_green)],
    [`§3`], [湖蓝], [\#00AAAA #color_block(dark_aqua)],
    [`§4`], [深红], [\#AA0000 #color_block(dark_red)],
    [`§5`], [紫色], [\#AA00AA #color_block(dark_purple)],
    [`§6`], [金色], [\#FFAA00 #color_block(gold)],
    [`§7`], [灰色], [\#AAAAAA #color_block(gray)],
    [`§8`], [深灰], [\#555555 #color_block(dark_gray)],
    [`§9`], [蓝色], [\#5555FF #color_block(blue)],
    [`§a`], [绿色], [\#55FF55 #color_block(green)],
    [`§b`], [天蓝], [\#55FFFF #color_block(aqua)],
    [`§c`], [红色], [\#FF5555 #color_block(red)],
    [`§d`], [粉红], [\#FF55FF #color_block(light_purple)],
    [`§e`], [黄色], [\#FFFF55 #color_block(yellow)],
    [`§f`], [白色], [\#FFFFFF #color_block(white)],
    [`§k`], [随机字符], [-],
    [`§l`], [粗体], [-],
    [`§m`], [删除线], [-],
    [`§n`], [下划线], [-],
    [`§o`], [斜体], [-],
    [`§r`], [重制文字样式], [-]
  )
) <tab:formatting_code>
当想要对一段文本应用样式时，只需在文本前添加相应的格式化代码。例如，下面的命令也可用于输出深红色的#text_component(text(dark_red)[Hello World!])文本，其与应用了文本组件相应键的命令效果相同：
#codebox("§4Hello World!")
*在一段文本中间使用的颜色代码会使从此处起至下一个颜色代码之前的文本应用相应的颜色。*例如，在下面的文本中，#text_component(text(dark_red)[World!])为深红色，而前面的文本为默认颜色（聊天栏中为白色）。
#codebox("Hello §4World!")
下面的文本使#text_component(text(dark_red)[Wo])为深红色，#text_component(text(blue)[rld!])为蓝色，前面的文本为默认颜色。
#codebox("Hello §4Wo§9rld!")
使用 `§r` 能使之后的文本恢复为默认颜色。下面的文本中#text_component(text(dark_red)[Wo])为深红色，而其余文本均为默认颜色。
#codebox("Hello §4Wo§rrld!")
一段文本中位于后面的颜色代码会覆盖掉之前的颜色代码，因为一段文本不能同时拥有两种颜色。而其余的文本格式是可以重叠的，因此格式代码不会覆盖。在下面的文本中，#text_component([#set text(font: "Minecraft", weight: "bold")
Hello ])为粗体，而#text_component([#set text(font: "Minecraft", weight: "bold")
_World!_])既为粗体又为斜体：
#codebox("§lHello §oWorld!")
若要取消这些文本格式，则须要使用 `§r`。接着上面的这个例子，若想要对#text_component([_rld!_])文本取消粗体，则格式化代码需要这样写：
#codebox("§7lHello §oWo§r§orld!")
由于 `§r` 取消了粗体和斜体两种格式，而斜体需要保留，因此需要紧随其后重新加上 `§o`。注意，把 `§r§o` 写成 `§o§r` 是错误的，*格式化代码遵循从左到右的应用准则*，在编写的时候需要确定先后关系。在这个例子中需要先去除所有格式再加上要保留的格式。

当颜色代码和格式代码发生混用时，*颜色代码会重置文本格式，使上一个格式代码的作用终止。*例如，`§4§oHello §1World!` 显示的文本为#text_component(text(dark_red)[_Hello _#set text(fill: blue)
World!])。格式代码需要在颜色代码重置的时候重新使用，如 `§4§oHello §1§oWorld!` 显示的文本为#text_component(text(dark_red)[_Hello _#set text(fill: blue)
_World!_])

若要使颜色代码和格式代码在同一个字符处开始产生作用，应该把颜色代码写在前面，例如，一个深红色、粗体的字符#text_component(text(dark_red)[#set text(font: "Minecraft", weight: "bold")
H])需要这么写：
#codebox("§4§lH")
写成 `§l§4H` 只会使字符#text_component(text(dark_red)[H])渲染为深红色，而没有粗体的效果。
#example(
  [编写一段含格式化代码的文本组件，使其输出后实现效果：#text_component([#text(gold)[_He_#set text(font: "Minecraft", weight: "bold")
  _llo _]Wo#text(green)[rld#set text(fill: aqua, font: "Minecraft", weight: "bold")
  !]])],
  [
    首先分析这段文本的颜色：#text_component([#text(gold)[_Hello_]])为金色 `§6`，#text_component([#text(black)[Wo]])为黑色 `§0`，#text_component([#text(black)[rld]])为绿色 `§a`，#text_component([#text(aqua)[!]])为天蓝色 `§b`。当只考虑颜色时，文本可以这么写：
    #codebox("§6Hello §0Wo§arld§b!")
    接着考虑字符格式，可以看到#text_component([_Hello_])为斜体 `§o`，#text_component([#set text(font: "Minecraft", weight: "bold")
    llo ])和#text_component([#set text(font: "Minecraft", weight: "bold")
    !])为粗体 `§l`，而#text_component([World])没有格式，不过#text_component([W])这里启用了新的颜色代码，故可用颜色代码重置格式，因此完整的文本如下：
    #codebox("§6§oHe§lllo §0Wo§arld§b§l!")
  ]
)
=== 交互事件
交互事件是文本组件最重要的功能之一。有了这项功能后，文本不再仅限于显示信息，它还具有和玩家产生互动的能力。交互事件一共有三种不同的类型——即填入事件、点击事件和悬停事件，这三种事件分别在玩家按住 `Shift` 点击文字、直接点击文字和将鼠标光标移动至文本之上时发生。

对于命令 `/tellraw`、命令 `/title`、告示牌、成书、文本展示实体、对话框等，并非所有交互事件都是可用的，其中所有的事件对于命令 `/title` 而言均不可用。下文将具体说明各事件的可用性。
==== 填入事件
#proper-noun(display: "填入事件（Insertion）", "tian2 ru4 shi4 jian4")：当玩家按住 `Shift` 点击文字时触发，用于将一串特定的文本填入玩家的聊天框中。填入聊天框的内容不会将原有的文本覆盖，只会在光标显示的位置插入。例如，聊天框的文本#text_component([AB])中，光标位于字符#text_component([A])之后、#text_component([B])之前，若填入的文本为#text_component([C])，则聊天框中的文本会变为#text_component([ACB])。注意，这些只是填入聊天框的文本，不代表已经发送出去的文本。。

填入事件的数据格式为：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-string")#icon("json-string") *insertion*: 填入的文本。])
)
例如，命令
#codebox("tellraw @a {\"text\":\"点击这里发生问候\",\"insertion\":\"Hello World!\"")
#h(-2em)返回的文本为#text_component([点击这里发生问候])，对这段文本按住 `Shift` 的同时点击，则会在玩家的聊天框中自动填入#text_component([Hello World!])字样，按下消息发送键后即可将消息以玩家的名义发出。
==== 点击事件
#proper-noun(display: "点击事件（Click event）", "dian3 ji1 shi4 jian4")是最常用的交互事件类型，也是与玩家最直接发生互动的事件类型，玩家只需要直接点击文本就可产生相关的事件。格式为：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *click_event*: 点击事件。]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: 玩家点击文本后触发的动作事件，具体见下文。]),
  (2, [各动作事件的额外字段])
)
点击事件一共有以下8种不同的动作事件：
===== `change_page`：将成书翻至特定的页数，*仅在成书中可用*，数据格式为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *click_event*]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: `change_page`]),
  (2, [#icon("nbt-int")#icon("json-number") *#underline[page]*: 指定的页数。])
)
#example(
  [为成书设计一段文本#text_component(text(green)[[To Page 2]])，使得玩家点击后将成书翻至第2页。],
  [
    文本组件为
    #codebox([{text:\"[To page 2]\",color:\"#color_block(green)green\",click_event:{action:\"change_page\",page:2}}])
  ]
)
===== `copy_to_clipboard`：将指定内容复制至剪切板，*在 `/tellraw` 和成书中可用*，数据格式为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *click_event*]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: `copy_to_clipboard`]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[value]*: 指定要复制的文本内容。])
)
===== `custom`：向服务端发送封包，*在 `/tellraw`、告示牌和成书中可用*，一般用于自定义的服务端，对原版服务端基本没有实质效果。数据格式为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *click_event*]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: `custom`]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[id]*: 需要发送的封包的命名空间ID。]),
  (2, [*payload*: 需要发送的自定义网络负载，可以是任意类型的数据。嵌套不超过16层，序列化后长度不超过32768字节。])
)
===== `open_file`：用于打开指定的文件，出于安全原因，这种点击事件禁止玩家使用，仅用于客户端内部，比如截图后在聊天栏中出现的带横线文本，当点击这段文本的时候就会打开截图的图片文件。数据格式为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *click_event*]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: `open_file`]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[path]*: 要打开的文件的路径。])
)
===== `open_url`：用于打开对应的网址，*在 `/tellraw` 和成书中可用。*
若 #icon("text") `options.txt` 中 `chatLinks` 的值为 `false`，此点击事件不生效；若 `chatLinksPrompt` 的值为 `true`，则打开网址时不会有待确认对话框。数据格式为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *click_event*]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: `open_file`]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[url]*: 需要打开的网址。])
)
#example(
  [设计文本#text_component([Minecraft])，使玩家在点击该文本的时候打开Minecraft的官网。],
  [
    Minecraft的官网地址为https://www.minecraft.net，只需将其作为字段 #icon("nbt-int")#icon("json-number") `url` 的值即可。
    #codebox("{text:\"Minecraft\",click_event:{action:\"open_url\",url:\"https://www.minecraft.net\"}}")
  ]
)
===== `run_command`：在点击文本的时候执行命令，*在 `/tellraw`、告示牌、成书和非配置阶段的对话框中可用*，数据格式为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *click_event*]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: `run_command`]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[command]*: 要执行的命令，可以省略 `/` 前缀。])
)
在命令 `/tellraw` 、成书和对话框中使用该点击事件*等价于使用此点击事件的玩家在聊天栏输入命令，受到聊天栏中最多输入256个字符的限制*。各种情况执行命令的上下文参数按@tab:command_context 确定，*需要额外确认命令所需的权限等级以及使用此点击事件的玩家自身的权限等级，若执行权限等级过低，可使用触发器命令以规避*，详情参见节@subsec:trigger 所作的说明。

若在告示牌中使用，则只允许父组件具有该点击事件，子组件不得使用该点击事件，此时可以通过点击告示牌来执行命令。命令上下文依旧按照@tab:command_context 确定。告示牌一共有四行可用的文本，因此可以应用四个不同的点击事件。当玩家点击告示牌时，不会识别玩家点击告示牌的哪一行文本。所以当玩家点击告示牌时，告示牌上所有的点击事件会按从上到下的顺序同时发生。
#example(
  [设计一段文本#text_component([Minecraft])，使玩家在点击该文本的时候对此玩家显示主标题#text_component([Hello Minecraft!])。],
  [
    主标题#text_component([Hello Minecraft!])的显示也需要文本组件，因此需要在文本组件内嵌套文本组件。若使用SNBT形式的文本组件，则字段 #icon("nbt-string")#icon("json-string") `command` 可以用单引号定义字符串，从而在内部的文本组件中使用双引号定义的字符串：
    #codebox("{text:\"Minecraft\",click_event:{action:\"run_command\",command:'title @s title \"Hello Minecraft!\"'}}")
    同样也可以在 #icon("nbt-string")#icon("json-string") `command` 中用双引号定义字符串，从而在内部的文本组件中使用单引号定义的字符串。

    若整个文本组件使用JSON格式，则必须使用双引号，此时内部命令中的文本组件可以用单引号规避转义：
    #codebox("{\"text\":\"Minecraft\",\"click_event\":{\"action\":\"run_command\",\"command\":\"title @s title 'Hello Minecraft!'\"}}")
  ]
) <exa:click_event>
===== `show_dialog`：向玩家显示一个对话框，*在 `/tellraw`、告示牌和成书中可用*，数据格式为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *click_event*]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: `show_dialog`]),
  (2, [#icon("nbt-string")#icon("json-string")#icon("nbt-compound")#icon("json-object") *#underline[dialog]*: 要打开的对话框，可以用命名空间ID指定数据包内已有的对话框，也可以在此处用 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象形式直接内联定义一个。])
)
===== `suggest_command`：将文本填入聊天框中并覆盖原先的文本，与填入事件不同。此事件在 `/tellraw` 中可用，*在成书中不可用*，数据格式为
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *click_event*]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: `suggest_command`]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[command]*: 要填入的文本，不必为命令。若不为命令，则按文本填入聊天框；若为需要执行的命令，则需要添加斜杠 `/`。])
)
==== 悬停事件
#proper-noun(display: "悬停事件（Hover event）", "xuan2 ting2 shi4 jian4")使玩家将他们的鼠标光标移动到文本上时显示悬停在该文本上的提示框，所有悬浮事件仅在命令 `/tellraw` 和成书中可用，效果大致如图所示：
#figure(
  caption: "悬停文本",
  image("图片/悬停文本.png", width: 15em)
) <fig:hover_text>
悬停事件一共分为3种，分别可显示文本、物品和实体信息，数据格式为：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *hover_event*: 悬停事件。]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: 悬停事件的名称，具体见下文。]),
  (2, [各悬停事件的额外字段])
)
字段 #icon("nbt-string")#icon("json-string") `action` 一共有3种有效值，分别对应不同的动作事件。
===== `show_entity`：用于显示实体提示框。
显示包括实体的名称、类型和UUID三条信息，显示的效果与使用实体名称这种内容类型时将光标移动到返回的实体名称上显示的信息相同。显示的实体不必真实存在，数据格式为：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *hover_event*: 悬停事件。]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: `show_entity`]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[id]*: 所显示实体的命名空间ID]),
  (2, [#icon("nbt-string")#icon("json-string")#icon("nbt-list")#icon("json-array")#icon("nbt-compound")#icon("json-object") *name*: 所显示实体的名称，需要为一个文本组件。若不指定，则不显示名称。]),
  (2, [#icon("nbt-string")#icon("json-string")#icon("nbt-int_array")#icon("json-array") *#underline[uuid]*: 所显示实体的UUID，这个字段必须存在。若使用 #icon("nbt-string")#icon("json-string") 字符串形式，则UUID格式为有连字符的十六进制。若使用 #icon("nbt-int_array") 整型数组/ #icon("json-array") 数组格式，则UUID格式为整型数组。])
)
===== `show_item`：用于显示物品提示框。
显示的内容与玩家将鼠标光标移动至物品栏中的物品上时显示的内容相同。比如当显示钻石剑的信息时，提示信息为

#h(-2em)#text_component(background: black, shadow-color: black.transparentize(100%), text(white)[钻石剑\ #text(gray)[在主手时：\ ] #text(dark_green)[7攻击伤害\ 1.6攻击速度\ ] #text(dark_gray)[minecraft:diamond_sword\ 9个组件]])

#h(-2em)显示的物品不必真实存在，数据格式为：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *hover_event*: 悬停事件。]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: `show_item`]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[id]*: 所显示物品的命名空间ID。]),
  (2, [#icon("nbt-compound")#icon("json-object") *components*: 物品堆叠组件，部分组件信息会显示在提示框中。若文本组件为SNBT格式，则根据节@sec:data_components 直接使用SNBT格式的物品堆叠组件；若文本组件为JSON格式，则需要按照节@subsec:nbt_and_json_conversion 办法将SNBT格式的物品堆叠组件转换为JSON格式。]),
  (3, [一个物品堆叠组件]),
  (2, [#icon("nbt-int")#icon("json-number") *count*: 所显示物品的堆叠数量，数量不会直接在提示框中显示。])
)
===== `show_text`：用于显示文本提示框，数据格式为：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") *hover_event*: 悬停事件。]),
  (2, [#icon("nbt-string")#icon("json-string") *#underline[action]*: `show_text`]),
  (2, [#icon("nbt-string")#icon("json-string")#icon("nbt-list")#icon("json-array")#icon("nbt-compound")#icon("json-object") *#underline[value]*: 要显示的文本，使用文本组件。此处无法使用点击事件 #icon("nbt-compound")#icon("json-object") `click_event` 和悬停事件 #icon("nbt-compound")#icon("json-object") `hover_event`。])
)
#example(
  [用命令实现如@fig:hover_text 所示的效果。],
  [
    这是聊天栏中的文本，需使用 `/tellraw`，命令可以为
    #codebox("tellraw @a {text:\"显示悬停文字\",hover_event:{action:\"show_text\",value:\"这是一段悬停文字\"}}")
    如果想给悬停文字添一些样式，比如，将@fig:hover_text 中的悬停文字变成红色，则只需在字段 `value` 中使用 #icon("nbt-compound") 复合标签/ #icon("json-object") 对象，命令可以写为：
    #codebox([tellraw \@a {text:\"显示悬停文字\",hover_event:{action:\"show_text\",value:{text:\"这是一段悬停文字\",color:\"#color_block(red)red\"}}}])
  ]
)
== 子组件
前面所讲到的文本组件类型和文本组件样式，都只能将它们写在同一个对象中，虽然不同样式是可以随意组合的。因为一个对象中只能使用一种内容类型，而组合后的样式只能作用于一个对象中的文本。这意味着，返回一段文本时，整段文本使用的样式都是同一种。如果需要在一段文本的不同位置应用多种样式组合，比如，如何输出一段文本#text_component(text(red)[Hello #text(blue)[World!]])，使#text_component(text(red)[Hello ])为红色，而#text_component(text(blue)[World!])为蓝色呢？在不使用格式化代码的情况下，显然需要使用多个对象并分别对这些对象应用不同的样式。子组件提供了允许多种样式或交互事件同时存在于一段文本内的可能。文本组件中的 #icon("nbt-list") 列表/ #icon("json-array") 数组和字段 #icon("nbt-list")#icon("json-array") `extra` 有助于实现这一功能。
=== 数组
使用 #icon("nbt-list") 列表/ #icon("json-array") 数组形式的文本组件有如下的数据格式：
#tree(
  (0, [#icon("nbt-list")#icon("json-array") 文本组件]),
  (1, [文本组件]),
  (1, [文本组件]),
  (1, […])
)
因此可以将多个文本组件一起放到数组中：
#tree(
  (0, [#icon("nbt-list")#icon("json-array") 文本组件]),
  (1, [#icon("nbt-compound")#icon("json-object") 复合标签/对象形式的文本组件]),
  (1, [#icon("nbt-string")#icon("json-string") 字符串形式的文本组件]),
  (1, [#icon("nbt-list")#icon("json-array") 数组/列表形式的文本组件])
)
规定：*#icon("nbt-list") 列表/ #icon("json-array") 数组中第一个元素为父组件，其他的元素均为子组件。*可以在这些对象中使用不同的内容类型，也可以对不同的组件应用不同的样式。下面的一些例子有助于对数组的理解：
#example(
  [编写一段文本组件，使之输出一段文本#text_component(text(red)[Hello #text(blue)[World!]])，其中#text_component(text(red)[Hello ])为红色，而#text_component(text(blue)[World!])为蓝色。],
  [
    在这个例子中，首先需要编写一段纯文本，并应用样式为红色；再编写一段应用样式为蓝色的纯文本，因此需要使用两个文本组件。第1个可以写为：
    #codebox([{text:\"Hello \",color:\"#color_block(red)red\"}])
    第2个可以写为：
    #codebox([{text:\"World!\",color:\"#color_block(blue)blue\"}])
    接着用 #icon("nbt-list") 列表/ #icon("json-array") 数组将它们整合到一起形成一个列表：
    #codebox([[{text:\"Hello \",color:\"#color_block(red)red\"},{text:\"World!\",color:\"#color_block(blue)blue\"}]])
    于是就可以输出#text_component(text(red)[Hello #text(blue)[World!]])。输出文本时数组中元素与元素之间是不会有空格的，在这个例子中，#text_component(text(red)[Hello])和#text_component(text(blue)[World!])之间的空格是直接算在第1个文本组件中的。而空格也被赋予了红色的样式，但由于这个字符是个空格，因此红色的样式不会直接表现。
  ]
)
#example(
  [一张冒险地图的过场动画允许玩家按使用键（默认为 `鼠标右键`）以跳过，试设计提示所需的文本。],
  [
    现文本设计为#text_component([按鼠标右键以跳过动画])，显示在动作栏，键位标识符查@tab:keybind_identifier 可得 `key.use`。由于其他文本没有设计样式，使用 #icon("nbt-string")#icon("json-string") 字符串即可。命令为
    #codebox("title @a actionbar [\"按\",{keybind:\"key.use\"},\"以跳过动画\"]")
  ]
)
#example(
  [
    在聊天栏中编写一段命令，要求能返回命令执行者自己在记分项 `[personal_score]` 上面的分数。返回文本可以如下所示，其中分数显示为红色：

    #h(-2em)#text_component([\<玩家>的个人分数为：#text(red)[\<分数>]#text(green)[ [对分数有疑惑？]]])

    #h(-2em)若玩家将鼠标光标移至#text_component(text(green)[ [对分数有疑惑？]])上，则显示悬停的文本提示框，内容为

    #h(-2em)#text_component([被刷新的分数也计入个人分数])
  ],
  [
    要求的文本内容一共有三种类型：#text_component([\<玩家>])很明显是要求输出实体名称，#text_component([的个人分数为：])和#text_component(text(green)[ [对分数有疑惑？]])是纯文本，其中#text_component(text(green)[ [对分数有疑惑？]])还带有悬停事件，而#text_component(text(red)[\<分数>])则要求输出记分板分数。因此需要有4个文本组件，所以需要使用数组将这4个组件包括起来。对于第1个组件，它的类型为实体名称，根据题意要求返回命令执行者自己的名称，因此写为：
    #codebox("{selector:\"@s\"}")
    对于第2个组件，它是无样式的纯文本，因此写为：
    #codebox("\"的个人分数为：\"")
    对于第3个组件，它的类型为记分板分数。要求输出命令执行者自己在 `[personal_score]` 上的分数，而命令执行者同时也为文本的观察者。加上题目要求的红色样式，因此可以写为：
    #codebox([{score:{objective:\"test\",name:\"\*\"},color:\"#color_block(red)red\"}])
    对于第4个组件，为它添加悬停事件：
    #codebox([{text:\" [对分数有疑惑？]\",color:\"#color_block(green)green\",hover_event:{action:\"show_text\",value:\"被刷新的分数也计入个人分数\"}}])
    将它们整合起来，于是命令可以写为：
    #codebox([tellraw \@s [{selector:\"\@s\"},\"的个人分数为：\",{score:{objective:\"test\",name:\"\*\"},color:\"#color_block(red)red\"},{text:\" [对分数有疑惑？]\",color:\"#color_block(green)green\",hover_event:{action:\"show_text\",value:\"被刷新的分数也计入个人分数\"}}]])
  ]
)
=== 字段extra
字段 #icon("nbt-list")#icon("json-array") `extra` 是为一个组件添加附加文本组件的工具。在使用 #icon("nbt-list")#icon("json-array") `extra`时，必须得保证同一个文本组件中必须存在它所依附的文本，因为 #icon("nbt-list")#icon("json-array") `extra` 不能单独出现在一个文本组件中。若一个对象中只存在一个文本，则可以为它添加 #icon("nbt-list")#icon("json-array") `extra`，作为文本的补充内容使用。数据格式为：
#tree(
  (0, [#icon("nbt-compound")#icon("json-object") 文本组件]),
  (1, [文本组件类型]),
  (1, [文本组件样式]),
  (1, [#icon("nbt-list")#icon("json-array") *extra*: 附加的文本组件。]),
  (2, [文本组件])
)
规定：*被依附的文本组件为父组件，#icon("nbt-list")#icon("json-array") `extra` 内的组件均为子组件。*当文本组件被成功解析时，返回的内容中子组件的内容一定是跟在父组件内容的后面。在写法上，字段 #icon("nbt-list")#icon("json-array") `extra` 不一定必须放在其所依附文本的后面，放在其前面也是可以的，此时它的内容物依旧均为子组件。

*如果一个父组件中存在多个 #icon("nbt-list")#icon("json-array") `extra`，则只有位置处于最后面的 #icon("nbt-list")#icon("json-array") `extra` 才会被使用。*
#example(
  [
    下列文本组件分别返回什么文本？
    #codebox("{text:\"A\",extra:[\"B\",{text:\"C\"}]}") <code:extra_example_1>
    #codebox("{extra:[\"A\",{text:\"B\"}],text:\"C\"}") <code:extra_example_2>
    #codebox("{text:\"A\",extra:[\"B\",{text:\"C\"}],text:\"D\"}") <code:extra_example_3>
    #codebox("{text:\"A\",extra:[\"B\"],text:\"C\",extra:[\"D\"]}") <code:extra_example_4>
  ],
  [
    在文本组件@code:extra_example_1 中，可以清晰地看到一段纯文本#text_component([A])及其子组件内容，即 #icon("nbt-list")#icon("json-array") `extra` 中的文本#text_component([BC])。因此输出文本为#text_component([ABC])。
    
    文本组件@code:extra_example_2 是 #icon("nbt-list")#icon("json-array") `extra` 与文本交换位置的情况，即使文本组件中的子组件在父组件的前面，输出时 #icon("nbt-list")#icon("json-array") `extra` 的文本也只能跟在父组件文本的后面，因此输出文本#text_component([CAB])。
    
    文本组件@code:extra_example_3 的情况有些特殊，一个对象中使用了两个纯文本和一个 #icon("nbt-list")#icon("json-array") `extra`。那么子组件所依附的是哪一个父组件呢？根据节@sec:text_component_content 对同一个对象的多个文本中判断优先选择输出哪一个文本的讲述，组件会使用类型优先级最高且位置最靠后的那个文本。于是父组件为纯文本#text_component([D])，#icon("nbt-list")#icon("json-array") `extra` 便作为了它的子组件，因此输出的文本为#text_component([DBC])。文本#text_component([A])被直接忽略，优先级的准则使得它无法作为一个父组件。
    
    在文本组件@code:extra_example_4 中，文本#text_component([C])为父组件，文本#text_component([D])由最后一个 #icon("nbt-list")#icon("json-array") `extra` 输出，因此输出文本为#text_component([CD])。
  ]
)
=== 继承
子组件使多个文本组件存在于同一段文本中。当存在多个组件时，自然可以为每一个组件分别指定一些样式。但是，这些组件之间并不是相互独立的，它们的样式会产生影响。这种发生在组件之间对样式产生影响的行为，一般称之为样式的#proper-noun(display: "继承（Inherit）", "ji4 cheng2")。

继承发生在组件与组件之间，且通常由一个组件对另一个组件产生作用，这意味着继承具有单向性，组件与组件之间的样式和交互事件不是相互影响的。继承具有以下几条准则：
+ 若子组件没有指定任何样式，则其将继承父组件的所有样式。
+ 子组件和子组件之间相互独立，彼此之间的样式不会相互影响。
+ 若子组件指定了若干种类的样式，则该子组件将使用自己指定的样式，对于自己指定的这些样式，父组件的相应样式会被直接忽略。
+ 若子组件没有指定一些的样式，则父组件将这些没有指定的样式继承到子组件。
#figure(
  caption: "继承的规律",
  image("图片/继承的规律.png", width: 22em)
) <fig:inherit>
继承的实质是，*子组件将父组件的所有样式作为它的默认样式（颜色、字体、字体处理方式和交互事件）使用*。对于@fig:inherit 中的四种情况，所有未指定的样式均使用默认样式：父组件使用系统本身的默认样式（所有交互事件均默认不存在），子组件将父组件的样式作为默认样式。但子组件的样式2已指定，因此不使用父组件给它的默认样式；而子组件的样式1未指定，因此使用父组件给它的默认样式。
==== 数组的继承
#icon("nbt-list") 列表/ #icon("json-array") 数组中第一个元素为父组件，其他的元素均为子组件。
#example(
  [
    判断下面的文本组件输出的文本样式。
    #codebox([[\
  #h(1em){text:\"A\",color:\"#color_block(red)red\"},\
  #h(1em)\"B\",\
  #h(1em){text:\"C\",bold:true},\
  #h(1em){text:\"D\",color:\"#color_block(blue)blue\"}\
]])
  ],
  [
    列表一共包含了4个文本组件，列表中第一个组件即为父组件，现列出这个父组件表现的样式和父组件的系统默认样式：
    #general-table(
      caption: "",
      colspan: 4,
      columns: (auto, auto, auto, auto),
      header: ([], [纯文本（#text(black)[`text`]）], [颜色（#text(black)[`color`]）], [粗体（#text(black)[`bold`]）]),
      [父组件的系统默认样式], [-], [默认颜色], [否（`false`）],
      [父组件表现的样式], [A], [红色（`red`）#color_block(red)], [默认（`false`）]
    )
    父组件的样式即为子组件的默认样式。列表中第二个组件为字符串，其等效于 `{text:"B"}`，整理得：
    #general-table(
      caption: "",
      colspan: 4,
      columns: (auto, auto, auto, auto),
      header: ([], [纯文本（#text(black)[`text`]）], [颜色（#text(black)[`color`]）], [粗体（#text(black)[`bold`]）]),
      [子组件的默认样式], [-], [红色（`red`）#color_block(red)], [否（`false`）],
      [子组件1], [B], [默认（`red`）#color_block(red)], [默认（`false`）],
      [子组件2], [C], [默认（`red`）#color_block(red)], [是（`true`）],
      [子组件3], [D], [蓝色（`blue`）#color_block(blue)], [默认（`false`）]
    )
    所以输出的文本为#text_component(text(red)[AB#set text(font:"Minecraft",weight:"bold")
    C#set text(font:"Minecraft",weight:"medium")
    #text(blue)[D]])。
  ]
)
有时候，为了取消列表中第一个文本组件的样式对后面文本组件的影响，可以让列表第一个组件不使用任何的样式。但这个时候，第一个文本组件返回的文本就只会使用系统的默认样式了。于是*通常将第一个文本组件设为空值*，采用如下的写法：
#codebox("[\"\",<文本组件2>,<文本组件3>,…]")
从第2个文本组件开始写起，既可以防止父组件对后面所有子组件样式的影响，又可以让第一个有文本的文本组件拥有特定的样式。
==== extra的继承
被 #icon("nbt-list")#icon("json-array") `extra` 依附的文本组件为父组件，#icon("nbt-list")#icon("json-array") `extra` 内的组件均为子组件。注意，#icon("nbt-list")#icon("json-array") `extra` 虽然为一个文本组件列表，但是该列表的第一个文本组件不会对后面的文本组件造成影响。
#example(
  [
    判断下面的文本组件输出的文本样式。
    #codebox([{\
  #h(1em)text:\"A\",\
  #h(1em)color:\"#color_block(red)red\",\
  #h(1em)bold:true,\
  #h(1em)hover_event:{action:\"show\_text\",value:\"A\"\},\
  #h(1em)extra:[\
  #h(2em){text:\"B\",color:\"#color_block(green)green\",italic:true\},\
  #h(2em)\"C\",\
  #h(2em){text:\"D\",color:\"#color_block(blue)blue\",bold:false},\
  #h(2em){text:\"E\",hover_event:{action:\"show_text\",value:\"E\"}}\
  #h(1em)]\
}])
  ],
  [
    先整理出父组件表现的样式和父组件的系统默认样式：
    #general-table(
      caption: "",
      colspan: 3,
      columns: (auto, auto, auto),
      header: ([], [父组件的系统默认样式], [父组件表现的样式]),
      [纯文本（`text`）], [-], [`A`],
      [颜色（`color`）], [默认颜色], [红色（`red`）#color_block(red)],
      [粗体（`bold`）], [否（`false`）], [是（`true`）],
      [斜体（`italic`）], [否（`false`）], [默认（`false`）],
      [悬停事件（`hover_event`）], [无], [文本提示框 `A`]
    )
    再依次整理出所有子组件的表现格式：
    #general-table(
      caption: "",
      colspan: 6,
      columns: (auto, auto, auto, auto, auto, auto),
      header: ([], [子组件的系统默认样式], [子组件1], [子组件2], [子组件3], [子组件4]),
      [纯文本（`text`）], [-], [B], [C], [D], [E],
      [颜色（`color`）], [红色（`red`）#color_block(red)], [绿色（`green`）#color_block(green)], [默认（`red`）#color_block(red)], [蓝色（`blue`）#color_block(blue)], [默认（`red`）#color_block(red)],
      [粗体（`bold`）], [是（`true`）], [默认（`true`）], [默认（`true`）], [否（`false`）], [默认（`true`）],
      [斜体（`italic`）], [否（`false`）], [是（`true`）], [默认（`false`）], [默认（`false`）], [默认（`false`）],
      [悬停事件（`hover_event`）], [文本提示框 `A`], [文本提示框 `A`], [文本提示框 `A`], [文本提示框 `A`], [文本提示框 `E`]
    )
    所以输出的文本格式为#text_component(text(fill:red,weight:"bold")[A#text(green)[_B_]C#text(fill:blue,weight:"medium")[D]E])，其中#text_component(text(fill:red,weight:"bold")[A#[#text(green)[_B_]]C#text(fill:blue,weight:"medium")[D]])均有悬停文本#text_component([A])，#text_component(text(fill:red,weight:"bold")[E])有悬停文本#text_component([E])。
  ]
)
=== 组件序列化
*写入数据的时候，文本组件允许使用 #icon("nbt-list") 列表/ #icon("json-array") 数组格式，但在存储阶段，其中的数据会被统一序列化为 #icon("nbt-list")#icon("json-array") `extra` 模式。*例如，写入的文本组件为：
#codebox([[{text:\"Hello \",color:\"#color_block(red)red\"},{text:\"World!\",color:\"#color_block(blue)blue\"}]])
#h(-2em)存储的形式为：
#codebox([{text:\"Hello \",color:\"#color_block(red)red\"},extra:[{text:\"World!\",color:\"#color_block(blue)blue\"}]}])
因此，若这个文本组件是一个NBT字段 `text` 的值，要用NBT路径访问#text_component(text(blue)[World!])的颜色，不能写成 `text[1].color`，要写成 `text.extra[0].color`。
== 应用实例
文本组件专门用于显示文本，因此它在冒险地图或服务器中承载了大量的信息，用于剧情推进、提示说明等。在冒险地图中使用文本组件是一项必要的技能。本节提供了若干实例用于说明文本组件的一些应用。
#example(
  [
    编写一段文本组件，使之在聊天栏中返回如下文本：
    #text_component([#text(dark_red)[1] | #text(red)[2] | #text(gold)[3] | #text(yellow)[4] | #text(green)[5] | #text(dark_green)[6] | #text(dark_aqua)[7] | #text(blue)[8] | #text(dark_blue)[9] | #text(dark_purple)[0]])
  ],
  [
    首先观察：这段文本一共有11种不同的颜色，其中数字 `1` \~ `0` 均为不同的颜色，而竖线为白色（聊天栏文本的默认颜色）。文本本身是可以通过格式化代码赋予一些格式信息的。如果使用格式化代码，则允许只使用一个父组件便实现不同的样式。而这段文本含有聊天栏的默认颜色，则可以使用 `§r` 对样式进行重制。现在按照从左到右的方向依次为文本中的字符带上格式化代码：
    #codebox("§41§r | §c2§r | §63§r | §e4§r | §a5§r | §26§r | §37§r | §98§r | §19§r | §50")
    上面便是含有格式化代码的字符串形式文本组件，当然也可以写成对象的格式，这时候只要使用纯文本即可。若因分节符输入困难而不使用格式化代码，则需要用含有多个文本组件的列表。注意，若列表第一个组件内容为深红色的#text_component(text(dark_red)[1])，则后面的所有组件均会认深红色为其默认颜色，这时候所有白色竖线文本就需要更改颜色至白色，这样会使命令的长度大大增加。因此对父组件使用白色的样式，这样列表中其他组件的格式就不会相互影响：
    #codebox([[\
  #h(1em)\"\",\
  #h(1em){text:\"1\",color:\"#color_block(dark_red)dark_red\"},\
  #h(1em)\" | \",\
  #h(1em){text:\"2\",color:\"#color_block(red)red\"},\
  #h(1em)\" | \",\
  #h(1em){text:\"3\",color:\"#color_block(gold)gold\"},\
  #h(1em)\" | \",\
  #h(1em){text:\"4\",color:\"#color_block(yellow)yellow\"},\
  #h(1em)\" | \",\
  #h(1em){text:\"5\",color:\"#color_block(green)green\"},\
  #h(1em)\" | \",\
  #h(1em){text:\"6\",color:\"#color_block(dark_green)dark_green\"},\
  #h(1em)\" | \",\
  #h(1em){text:\"7\",color:\"#color_block(dark_aqua)dark_aqua\"},\
  #h(1em)\" | \",\
  #h(1em){text:\"8\",color:\"#color_block(blue)blue\"},\
  #h(1em)\" | \",\
  #h(1em){text:\"9\",color:\"#color_block(dark_blue)dark_blue\"},\
  #h(1em)\" | \",\
  #h(1em){text:\"0\",color:\"#color_block(dark_purple)dark_purple\"},\
  #h(1em)\" | \",\
]])
  ]
)
#example(
  [
    编写一段文本组件使在聊天栏中实现如下文本：\ 
    #text_component([#text(green)[[提示]] 在下面的选项中选择其一以推进后续的剧情。\ ========= ★ 请 ★ 选 ★ 择 ★ =========\ #text(green)[#h(1em) [上前与之对话]#h(1em) [绕道去学校]]\ ===================================])\ 
    其中#text_component(text(green)[[上前与之对话]])有悬停文本提示框#text_component(background:black,text(white)[走上前去与“大仙”对话，\ 说不定能问到些什么])，并设置点击事件为执行命令 `function main:story/talk`；#text_component(text(green)[[绕道去学校]])有悬停文本提示框#text_component(background:black,text(white)[学校的事情急，\ 还是先去学校吧，\ 这个人就不去管他了])，并设置点击事件为执行命令 `function main:story/school`。
  ],
  [
    对于一段文本中含有多个样式的情况，一律使用文本组件列表进行编写。先将列表中第一个组件设为空值。#text_component(text(green)[[提示]])为绿色文本，单独使用一个文本组件：
    #codebox([{text:\"[提示]\",color:\"#color_block(green)green\"}])
    #text_component([#text(green)[[提示]] 在下面的选项中选择其一以推进后续的剧情。\ ========= ★ 请 ★ 选 ★ 择 ★ =========])这两行文本的样式一致，故使用同一个文本组件。鉴于五角星的符号不容易输入，故可以用五角星的Unicode码代替。不同文本行之间用换行符 `\n` 隔开：
    #codebox("\" 在下面的选项中选择其一以推进后续的剧情。\n========= \u2605 请 \u2605 选 \u2605 择 \u2605 =========\"")
    接下来是一个换行符和一段空格，从效果上看不出应用的样式，故可与上一个文本组件进行合并，写入上一个组件，同时换行符不能忘记：
    #codebox([\" 在下面的选项中选择其一以推进后续的剧情。\\n========= \\u2605 请 \\u2605 选 \\u2605 择 \u2605 =========\\n#h(1em)\"])
    #text_component(text(green)[[上前与之对话]])这段文本不仅有绿色的样式，还有悬停事件和点击事件。注意悬浮的文字中虽然有双引号，但是不需要加转义字符。这是因为文本中的双引号为中文的引号，不会与英文的引号发生匹配，只有英文的引号才需要加转义字符。于是该文本组件可以写为：
    #codebox([text:\"[上前与之对话]\",color:\"#color_block(green)green\",hover_event:{action:\"show_text\",value:\"走上前去与“大仙”对话，\\n说不定能问到些什么\"},click_event:{action:\"run_command\",command:\"function main:story/talk\"}}])
    下面是一段空格，在此不做赘述。#text_component(text(green)[[绕道去学校]])与#text_component(text(green)[[上前与之对话]])的编写方式相同，在此也不做赘述。最后是换行符加一段文本。将上面所有的文本组件组合起来，可以得到文本组件：
    #codebox([[\
    #h(1em)\"\",\
    #h(1em){text:\"[提示]\",color:\"#color_block(green)green\"},\
    #h(1em)\" 在下面的选项中选择其一以推进后续的剧情。\\n========= \\u2605 请 \\u2605 选 \\u2605 择 \u2605 =========\\n#h(1em)\"\
    #h(1em){\
    #h(2em)text:\"[上前与之对话]\",\
    #h(2em)color:\"#color_block(green)green\",\
    #h(2em)hover_event:{\
    #h(3em)action:\"show_text\",\
    #h(3em)value:\"走上前去与“大仙”对话，\\n说不定能问到些什么\"\
    #h(2em)},\
    #h(2em)click_event:{\
    #h(3em)action:\"run_command\",\
    #h(3em)command:\"function main:story/talk\"\
    #h(2em)}\
    #h(1em)},\
    #h(1em)\"#h(1em)\",\
    #h(1em)\{\
    #h(2em)text:\"[绕道去学校]\",\
    #h(2em)color:\"#color_block(green)green\",\
    #h(2em)hover_event:{\
    #h(3em)action:\"show\_text\",\
    #h(3em)value:\"学校的事情急，\\n还是先去学校吧，\\n这个人就不去管他了\"\
    #h(2em)},\
    #h(2em)click_event:\{\
    #h(3em)action:\"run_command\",\
    #h(3em)command:\"function main:story/school\"\
    #h(2em)}\
    #h(1em)},\
    #h(1em)\"\\n===================================\"\
    ]])
  ]
)
== 聊天类型
#proper-noun(display: "聊天（Chat）", "liao2 tian1")是玩家发送文本内容、输入命令的一项功能。相比于通过 `/tellraw` 在聊天栏中发送内容，用聊天功能发送的文本在内容和样式上相对单调且固定，但开发者依然可以像文本组件那样有限地为聊天文本设计内容和样式。
=== 基本聊天类型
Minecraft一共有以下几种#proper-noun(display: "聊天类型（Chat type）", "liao2 tian1 lei4 xing2")：
===== 玩家发送聊天信息
这种类型只需玩家按 `T` 键呼出聊天栏，在其中输入文本后发送即可，默认的格式为：\
#text_component([\<sender> content])
===== 使用 `/me` 命令发送信息
`/me` 通常用于展示命令执行者的状态或是动作，成功执行后返回文本的默认格式为#text_component([\* sender content])。这个动作需要的字符串可以是随意的，比如玩家Steve向所有玩家公布自己正在制作地图，则Steve在聊天栏中输入的命令可以为 `/me 正在制作地图`，则返回的结果是#text_component([\* Steve 正在制作地图])。该命令所需权限等级为0，语法为：#index(index:"command","me")
#codebox("me <action>")
#param-desc(
  [`<action>`（字符串 `brigadier:string`）], [所展示的动作。]
)
===== 发送私信
`/msg`、`/tell` 和 `/w` 三条命令用于发送私聊信息给指定的玩家，它们的语法完全相同，可相互替代，所需权限等级均为0：#index(index:"command","msg")#index(index:"command","tell")#index(index:"command","w")
#codebox("msg <targets> <message>")
#codebox("tell <targets> <message>")
#codebox("w <targets> <message>")
#param-desc(
  [`<message>`（文本 `minecraft:message`）], [需要发送的信息。可以接受目标选择器，如果在这些部分中指定了某些实体且权限等级大于等于2，则返回结果时会显示这些实体的名字。]
)
消息在发送者聊天栏中的默认格式为#text_component(text(gray)[#skew(ax:-12deg,"你悄悄地对target说：content")])，在接收者处的默认格式为#text_component(text(gray)[#skew(ax:-12deg,"sender悄悄地对你说：content")])。
===== 使用 `/say` 命令发送信息
命令 `/say` 用于向所有玩家发送信息，所需权限等级为2，语法为：#index(index:"command","say")
#codebox("say <message>")
#param-desc(
  [`<message>`（文本 `minecraft:message`）], [贪婪词组，可以接受目标选择器，如果在这些部分中指定了某些实体，则返回结果时会显示这些实体的名字。]
)
在默认情况下执行该命令后游戏会在聊天栏显示#text_component([[sender] content])。在命令方块中执行该命令时，命令执行者是命令方块本身，返回的结果会显示命令方块的名称。如果命令方块没有名称，则会显示 `@` 以代替命令方块的名称。
#example(
  [用 `/say` 命令显示消息#text_component([Hello world!])。], [命令为#codebox("say Hello world!")]
)
===== 向队内成员发送信息
`/teammsg` 和 `/tm` 这两条命令用于向同一队伍中的所有成员发送消息，可以相互代替，所需权限等级为0，语法为：#index(index:"command","teammsg")#index(index:"command","tm")
#codebox("teammsg <message>")
#codebox("tm <message>")
#param-desc(
  [`<message>`（文本 `minecraft:message`）], [需要发送的信息。可以接受目标选择器，如果在这些部分中指定了某些实体且权限等级大于等于2，则返回结果时会显示这些实体的名字。]
)
消息在发送者聊天栏中的默认格式为#text_component([-> target \<sender> content])，在接收者处的默认格式为#text_component([target \<sender> content])。
=== 聊天类型的定义
上述聊天类型返回的文本都可以通过数据包修改，即可写注册表 `chat_type`。原版存在七个聊天类型，分别对应的聊天类型如下所示：
#general-table(
  caption: "原版聊天类型",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([注册项], [聊天类型], [默认格式]),
  [`chat`], [玩家发送聊天信息], [`<sender> content`],
  [`emote_command`], [使用 `/me` 命令发送信息], [`* sender content`],
  [`msg_command_incoming`], [`/msg`、`/tell` 和 `/w` 私信的接收者], [`sender悄悄地对你说：content`],
  [`msg_command_outgoing`], [`/msg`、`/tell` 和 `/w` 私信的发送者], [`你悄悄地对target说：content`],
  [`say_command`], [使用 `/say` 命令发送信息], [`[sender] content`],
  [`team_msg_command_incoming`], [`/teammsg` 和 `/tm` 队内消息的接收者], [`target <sender> content`],
  [`team_msg_command_outcoming`], [`/teammsg` 和 `/tm` 队内消息的发送者], [`-> target <sender> content`],
)
虽然 `chat_type` 是可写注册表，但游戏实际使用的也就以上7种聊天类型，且它们的命名空间ID都是 `minecraft` 。所以有效的聊天类型配置文件必须使用如下的数据包路径：
#tree(
  (0, [#icon("folder") *data*]),
  (1, [#icon("folder") *minecraft*]),
  (2, [#icon("folder") *chat_type*]),
  (3, [#icon("json") *chat.json*]),
  (3, [#icon("json") *emote_command.json*]),
  (3, [#icon("json") *msg_command_incoming.json*]),
  (3, [#icon("json") *msg_command_outgoing.json*]),
  (3, [#icon("json") *say_command.json*]),
  (3, [#icon("json") *team_msg_command_incoming.json*]),
  (3, [#icon("json") *team_msg_command_outcoming.json*])
)
#h(-2em)其他任何的路径都不会被游戏识别，因此只能对原有的这7个配置文件做修改。

一个聊天类型配置文件的格式如下所示：
#tree(
  (0, [#icon("json-object") 文件封装]),
  (1, [#icon("json-object") *#underline[chat]*: 聊天信息在聊天栏内显示的内容和样式。]),
  (2, [#icon("json-string") *#underline[translation_key]*: 聊天信息的内容，需要是一个翻译标识符或一个允许包含译文变量的文本。]),
  (2, [#icon("json-array") *#underline[parameters]*: 传入到聊天内容中的参数。]),
  (3, [#h(-2em)#icon("json-string") 一个参数，有效值只能是 `content`、`sender` 或 `target`。三种有效值的意义如下表所示：#general-table(
    caption: "聊天信息的可用参数",
    colspan: 3,
    columns: (auto, auto, auto),
    header: ([参数], [意义], [可用]),
    [`content`], [聊天信息的文本], [所有聊天类型均可用],
    [`sender`], [聊天信息的发送者], [所有聊天类型均可用],
    [`target`], [聊天信息的接收者], [仅适用于聊天类型 `msg_command_outgoing`、`team_msg_command_incoming` 和 `team_msg_command_outcoming`]
  )]),
  (2, [#icon("json-object") *style*: 聊天信息的样式，默认没有样式。]),
  (3, [文本组件样式]),
  (1, [#icon("json-object") *#underline[narration]*: 聊天信息在复述功能中复述的内容。]),
  (2, [#icon("json-string") *#underline[translation_key]*: 聊天信息的内容，需要是一个翻译标识符或一个允许包含译文变量的文本。]),
  (2, [#icon("json-array") *#underline[parameters]*: 传入到聊天内容中的参数。]),
  (3, [#icon("json-string") 一个参数，有效值只能是 `content`、`sender` 或 `target`。]),
  (2, [#icon("json-object") *style*: 聊天信息的样式，对复述功能无效。]),
  (3, [文本组件样式])
)
例如，若 #icon("json-string") `translation_key` 的值为 `%s%s%s`，#icon("json-array") `parameters` 为 `["sender", "content", "sender"]`，则返回的内容为 #text_component("sender content sender")。*#icon("json-array") `parameters` 中的参数可以重复。*
#example(
  [修改玩家发送的聊天信息，使之呈现的样式为#text_component("sender：content")],
  [
    如下所示：
    #codefile(
      lang: "json",
      title: "data > minecraft > chat_type > chat.json",
      "{
  \"chat\": {
    \"parameters\": [
      \"sender\",
      \"content\"
    ],
    \"translation_key\": \"%s：%s\"
  },
  \"narration\": {
    \"parameters\": [
      \"sender\",
      \"content\"
    ],
    \"translation_key\": \"chat.type.text.narrate\"
  }
}"
    )
  ]
)
#heading(level: 2, numbering: none, [第五章思考题与习题])
+ 针对下面的输出内容，分别写出其不带格式化代码的SNBT文本组件。
  + #text_component(text(red)[MC-CMD])
  + #text_component("分节符\"\\\"的作用很大")
  + #text_component(text(green)[纯文本JSON语法为：{\"text\":\"\<文本>\"}])
  + #text_component(text(gray)[#skew(ax:-12deg,"游戏规则keep_inventory已更新")])
  + #text_component(text(yellow)[#strike[错误的语法]])
  + #text_component("\\\\\"Hello World!\\\\\"")
  + #text_component(text(blue)[/\\\ \\/])
+ 针对下面的输出内容，分别写出其不带格式化代码的SNBT文本组件。
  + #text_component(text(green)[[任务]#text(black)[合成一个钻石镐]])
  + #text_component(text(red)[红色#text(weight:"bold")[粗体]#box(text(black)[#skew(ax:-12deg,"斜体")])])
  + #text_component(text(blue)[123#text(red)[45]#text(yellow)[6#underline[7]]#text(green)[#underline[8]9]])
  + #text_component(text(black)[\\#text(blue)[\"\\]#text(yellow)[He]#text(weight:"bold")[llo #text(red)[Wor]]#text(red)[ld]#text(green)[\\\"\\]])
+ 判断下列说法是否正确。
  + #icon("nbt-string")#icon("json-string") `translate` 字段的值可以包含 `%s`。
  + 一个命令方块中有如下的命令：`tellraw @a {score:{name:"*",objective:"test"}}`，激活该命令方块，此时不会有任何玩家看到返回的分数。
  + 触发实体为玩家时，该文本组件无法被解析：`{selector:"@e[type=villager]"}`
+ 文本组件
  #codebox("{score:\"@r\",nbt:\"Items\",block:\"~ ~1 ~\",entity:\"@r\",translate:\"commands.debug.stopped\",with:[4,7,5],text:\"OK!\",text:\"NO\",entity:\"@e\"}")
  返回的文本内容为#blank。
+ 若有一翻译标识符 `custom.1`，其在 #icon("json") `zh_cn.json` 的值如下所示：
  #codebox("%s%3$s%s%s%6$s%1$s%s%s%2$s%s")
  + 写出该文本组件返回的文本：
    #codebox("{translate:\"custom.1\",with:[1,true,\"7\",\"A\",[9,\"6\"],{text:false},\"5\"]}")
  + 要想返回文本#text_component("FfalseOKfalse8F20OKtext")，写出使用翻译标识符 `custom.1` 的文本组件。
+ 在下表中填写各种事件的可用性，填写的内容在命令 `/tellraw`、命令 `/title`、告示牌、成书和文本展示实体中选择。
  #general-table(
    caption: "",
    colspan: 3,
    columns: (auto, auto, auto),
    header: ([事件类型], [值], [可用性]),
    table.cell(colspan: 2)[填入事件], [#blank#blank],
    table.cell(rowspan: 7)[点击事件], [`change_page`], [#blank#blank],
    [`copy_to_clipboard`], [#blank#blank],
    [`custom`], [#blank#blank],
    [`open_url`], [#blank#blank],
    [`run_command`], [#blank#blank],
    [`show_dialog`], [#blank#blank],
    [`suggest_command`], [#blank#blank],
    table.cell(rowspan: 3)[悬停事件], [`show_entity`], [#blank#blank],
    [`show_item`], [#blank#blank],
    [`show_text`], [#blank#blank],
  )
+ 编写一段在 `/tellraw` 中运行的文本组件，使返回的文本#text_component("show")拥有悬浮文字，悬浮文字显示一个石头的物品信息，其中石头的数据组件为
  #codebox("{\"minecraft:custom_name\":\"show\"}")
+ 编写一段在 `/tellraw` 中运行的文本组件，使返回的文本#text_component("click here")拥有点击事件，点击该文本后返回一段仍能够被点击的文本#text_component("click again!")，点击这段文本后才返回红色的#text_component(text(red)[Hello!])文本。
= 存档格式<chap:level_format>
Minecraft具体的游戏数据，如某个位置的箱子里存储的物品、一个实体的位置、世界边界的大小、Boss栏、玩家已达成的进度……这些数据绝大部分都以NBT的形式存储在游戏存档里，是为#proper-noun(display: "存档格式（Level format）", "cun2 dang3 ge2 shi4")。本章将对这些游戏数据的结构、编辑方法做具体的阐述。
#pagebreak()
== 概述<sec:saves>
*存档（Level，又称地图、世界）*#index(display: "存档（Level，地图，世界）", "cun2 dang4")是独立运行游戏世界的基本单位，它以文件夹的形式存储于 #icon("folder") `saves` 内。每个存档都可以自由移动，因此可以在 #icon("folder") `saves` 文件夹内增添或删除存档，这为冒险地图的下载和安装提供了可能，也允许玩家将他们的存档备份到其他地方。#icon("folder") `saves` 的路径在小节@subsec:.minecraft 中已有说明，其基本结构是：
#tree(
  (0, [#icon("folder") *saves*]),
  (1, [#icon("folder") *\<存档名称>*: 一个存档。])
)
#h(-2em)其中存档文件夹的名称会显示在游戏存档页面的第二行，文件夹的名称允许使用格式化代码以应用样式。例如，下图所示存档的文件夹名称为 `§b§l跃动晶界§c2  §aby Mu_xian§f§k`。
#figure(
  caption: "存档名称",
  image("图片/存档名称.png", width: 30em)
)
存档文件夹的结构在26.1-Snapshot-6发生过变动，自26.1-Snapshot-6起，一个存档文件夹的基本结构如下所示：
#tree(
  (0, [#icon("folder") *\<存档名称>*]),
  (1, [#icon("folder") *data*: 存档数据。]),
  (2, [#icon("folder") *\<命名空间>*: 任意命名空间下的存档数据。]),
  (3, [#icon("folder") *maps*: 地图数据。]),
  (4, [#icon("nbt") *last_id.dat*: 地图计数文件，游戏在使用地图时，会给每张独立的地图分配一个地图编号。]),
  (4, [#icon("nbt") *\<地图ID>.dat*: 地图数据文件，地图数据不在物品数据中存储，而是在此处存储。使用地图计数文件存储的地图ID。]),
  (3, [#icon("nbt") *command_storage.dat*: 命令存储文件，数据格式见小节@subsec:command_storage。]),
  (3, [#icon("nbt") *custom_boss_events.dat*: 存储自定义Boss栏的文件，数据格式见小节@subsec:bossbar。]),
  (3, [#icon("nbt") *game_rules.dat*: 存储当前存档游戏规则的文件。]),
  (3, [#icon("nbt") *random_sequences.dat*: 随机序列数据文件，数据格式见小节@subsec:random_sequence。]),
  (3, [#icon("nbt") *scheduled_events.dat*: 计划事件数据文件。]),
  (3, [#icon("nbt") *scoreboard.dat*: 记分板数据文件，数据格式见小节@subsec:scoreboard_data。这个文件内还有队伍相关的数据。]),
  (3, [#icon("nbt") *stopwatches.dat*: 秒表数据文件，数据格式见小节@subsec:stopwatch。]),
  (3, [#icon("nbt") *wandering_trader.dat*: 流浪商人数据文件。]),
  (3, [#icon("nbt") *weather.dat*: 天气数据文件，数据格式见小节@subsec:weather。]),
  (3, [#icon("nbt") *world_clocks.dat*: 世界时钟数据文件。]),
  (3, [#icon("nbt") *world_gen_settings.dat*: 存储世界生成设置的文件。]),
  (1, [#icon("folder") *datapacks*: 世界指定数据包。]),
  (2, [#icon("folder")#icon("zip") *\<数据包名称>[.zip]*: 一个数据包。文件（夹）结构已在小节@subsec:datapack_folder 给出，其中文件的编写方式会在《数据包》教程详细给出。]),
  (1, [#icon("folder") *dimensions*: 维度数据。]),
  (2, [#icon("folder") *\<命名空间>*: 任意命名空间下的维度数据。]),
  (3, [#icon("folder") *\<维度ID>*: 一个维度，可以添加路径。内容详见节@subsec:dimension_and_region。]),
  (4, [#icon("folder") *data*: 该维度的零散数据。]),
  (5, [#icon("folder") *minecraft*: 命名空间，必须为 `minecraft`，无论自定义维度的自身命名空间。]),
  (6, [#icon("nbt") *chunk_tickets.dat*: 区块标签数据文件。]),
  (6, [#icon("nbt") *raids.dat*: 袭击数据文件。]),
  (6, [#icon("nbt") *ender_dragon_fight.dat*: 末影龙战斗数据文件，此文件仅存在于末地或其他可发生末影龙战斗的维度。]),
  (6, [#icon("nbt") *world_border.dat*: 该维度的世界边界数据文件。]),
  (4, [#icon("folder") *entities*: 该维度的实体数据。]),
  (5, [#icon("nbt") *r.\<x>.\<z>.mca*: 区域文件。]),
  (5, [#icon("nbt") *c.\<x>.\<z>.mcc*: 区域额外文件。]),
  (4, [#icon("folder") *poi*: 该维度的兴趣点数据。]),
  (5, [#icon("nbt") *r.\<x>.\<z>.mca*: 区域文件。]),
  (5, [#icon("nbt") *c.\<x>.\<z>.mcc*: 区域额外文件。]),
  (4, [#icon("folder") *region*: 该维度的区块基础数据。]),
  (5, [#icon("nbt") *r.\<x>.\<z>.mca*: 区域文件。]),
  (5, [#icon("nbt") *c.\<x>.\<z>.mcc*: 区域额外文件。]),
  (1, [#icon("folder") *generated*: 世界生成数据。]),
  (2, [#icon("folder") *\<命名空间>*: 任意命名空间下的世界生成数据。]),
  (3, [#icon("folder") *structure*: 结构模板注册表。这部分数据的使用方法可见附录@sec:structure_block。]),
  (4, [#icon("nbt") *\<名称>.nbt*: 一个结构模板，可以添加路径。]),
  (1, [#icon("folder") *players*: 玩家所有数据。]),
  (2, [#icon("folder") *advancements*: 存储玩家达成进度的文件夹。]),
  (3, [#icon("json") *\<玩家UUID>.json*: 存储进入过该存档的此玩家达成的进度。]),
  (2, [#icon("folder") *data*: 存储基本的玩家数据的文件夹。]),
  (3, [#icon("nbt") *\<玩家UUID>.dat[\_old]*: 一个进入过该存档的玩家的数据。]),
  (2, [#icon("folder") *stats*: 存储统计信息的文件夹。]),
  (3, [#icon("json") *\<玩家UUID>.json*: 一个进入过该存档的玩家的统计信息数据，这些数据会显示在菜单的统计信息页面。]),
  (1, [#icon("folder") *resourcepacks*: 世界指定资源包。]),
  (2, [#icon("zip") *resources.zip*: 世界指定资源包，该资源包的内容仅在该存档可用。必须为 #icon("zip") `.zip` 格式的压缩文件，名称必须为 `resources.zip`。]),
  (1, [#icon("png") *icon.png*: 存档的图标，必须是$64 times 64$像素大小的图片。]),
  (1, [#icon("nbt") *level.dat[\_old]*: 世界全局信息数据文件。只有存在该文件时，#icon("folder") `<存档名称>` 才会被识别为一个有效的存档。]),
  (1, [#icon("file") *session.lock*: 存档会话锁文件，存储最后一次访问此存档的时间戳和访问权限。])
)
#example(
  [
    将以下的图片设为存档的图标。
    #figure(
      caption: "",
      image("图片/存档图标例题.png", width: 4em)
    )
  ],
  [
    将这张图片命名为 #icon("png") `icon.png`，并将其放于路径 `<存档名称> > icon.png`。注意，这张图必须保证是$64 times 64$像素大小。

  ]
)
#example(
  [将一个资源包 #icon("folder") `跃动晶界跑酷地图专用资源包` 做成存档 #icon("folder") `§b§l跃动晶界§c2  §aby Mu_xian§f§k` 的世界专用资源包。],
  [
    首先将文件夹形式的资源包转换成压缩文件，有效压缩文件形式的资源包根目录 #icon("zip") `跃动晶界跑酷地图专用资源包` 和 #icon("folder") `assets`、#icon("json") `pack.mcmeta` 之间不能有额外的文件夹。
    
    其次将压缩文件重命名为 #icon("zip") `resources.zip`，并将其放在 #icon("zip") `§b§l跃动晶界§c2  §aby Mu_xian§f§k > resourcepacks > resources.zip`。
  ]
)
#icon("file") `level.dat` 和 #icon("file") `level.dat_old` 是存档的全局信息数据，#icon("file") `level.dat_old` 是数据的实时备份版本，当 #icon("file") `level.dat` 因为各种原因损坏时，这个文件能确保存档全局信息不丢失。在游戏数据发生变动时，两个文件的存在能确保安全更替。#icon("file") `level.dat` 和 #icon("file") `level.dat_old` 的数据结构一致，都是NBT格式的文件，格式如下所示：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *#underline[Data]*: 存档的全局信息数据。]),
  (2, [#icon("nbt-bool") *allowCommands*: 该存档是否启用命令。若此字段不存在，则检查字段 #icon("nbt-int") `GameType`，若其值为 `1`（创造模式），则此字段为 `true`，否则为 `false`。]),
  (2, [#icon("nbt-compound") *DataPacks*: 存档启用和禁用的数据包。]),
  (3, [#icon("nbt-list") *Disabled*: 未启用的数据包列表。]),
  (4, [#icon("nbt-string") 一个未启用的数据包名称。]),
  (3, [#icon("nbt-list") *Enabled*: 已启用的数据包列表，加载顺序为从上到下。]),
  (4, [#icon("nbt-string") 一个已启用的数据包名称。]),
  (3, [#icon("nbt-int") *DataVersion*: 游戏数据版本。]),
  (2, [#icon("nbt-compound") *difficulty_settings*: 游戏数据版本。]),
  (3, [#icon("nbt-string") *difficulty*: 游戏难度，有效值 `peaceful`（和平）、`easy`（简单）、`normal`（普通）、`hard`（困难），默认值为 `normal`。]),
  (3, [#icon("nbt-bool") *hardcore*: 是否启用极限模式，控制玩家在死亡之后是否自动转变为旁观模式，默认值为 `false`。]),
  (3, [#icon("nbt-bool") *locked*: 是否在此存档内锁定游戏难度，默认值为 `false`。]),
  (2, [#icon("nbt-list") *enabled_features*: 启用的功能开关。此字段不一定存在，若不存在，则仅启用 `vanilla` 功能。]),
  (3, [#icon("nbt-string") 一项启用的功能开关，有效值有 `vanilla`（原版）、`trade_rebalance`（村民交易平衡性调整）、`redstone_experiments`（红石实验性内容）和 `minecart_improvements`（矿车改进）。]),
  (2, [#icon("nbt-int") *GameType*: 该存档的默认游戏模式，有效值 `0`（生存模式）、`1`（创造模式）、`2`（冒险模式）、`3`（旁观模式），默认值为 `0`。]),
  (2, [#icon("nbt-bool") *initialized*: 存档是否被正确初始化并生成奖励箱，默认值为 `true`。]),
  (2, [#icon("nbt-long") *LastPlayed*: 上次保存游戏的时间戳，默认值为 `0`。]),
  (2, [#icon("nbt-string") *LevelName*: 存档名称，允许使用格式化代码。]),
  (2, [#icon("nbt-int_array") *singleplayer_uuid*: 单人游戏的所有者玩家UUID，只在单人游戏使用，专用服务器不使用这个字段。]),
  (2, [#icon("nbt-list") *removed_features*: 用于崩溃中的 `Removed feature flags` 部分记录。]),
  (3, [#icon("nbt-string") 一条记录。]),
  (2, [#icon("nbt-list") *ServerBrands*: 打开过此存档的服务端的铭牌列表。]),
  (3, [#icon("nbt-string") 一个服务端铭牌。]),
  (2, [#icon("nbt-compound") *spawn*: 世界出生点数据。]),
  (3, [#icon("nbt-string") *dimension*: 世界出生点的维度，默认值为 `minecraft:overworld`（主世界）。]),
  (3, [#icon("nbt-int_array") *pos*: 世界出生点的坐标，依次为$x$、$y$、$z$坐标，默认值为 `[I;0,0,0]`。]),
  (3, [#icon("nbt-float") *pitch*: 在世界出生点出生时玩家的俯仰角，默认值为 `0.0f`。]),
  (3, [#icon("nbt-float") *yaw*: 在世界出生点出生时玩家的偏航角，默认值为 `0.0f`。]),
  (2, [#icon("nbt-long") *Time*: 存档的游戏时间，单位为游戏刻，默认值为 `0`。]),
  (2, [#icon("nbt-int") *#underline[version]*: 存档区块文件的版本，对于Anvil文件格式（当前）为 `19133`，对于MCRegion格式为 `19132`。]),
  (2, [#icon("nbt-compound") *#underline[Version]*: 该存档的详细版本信息。]),
  (3, [#icon("nbt-int") *Id*: 游戏数据版本。]),
  (3, [#icon("nbt-string") *Name*: 游戏版本名称。]),
  (3, [#icon("nbt-string") *Series*: 开发系列，正式版和快照为 `main`。]),
  (3, [#icon("nbt-bool") *Snapshot*: 此版本是否为快照。]),
  (2, [#icon("nbt-bool") *WasModded*: 存档是否被修改过的客户端或服务端加载并保存，默认值为 `false`。])
)
== 存档数据
自26.1-Snapshot-6起，存档数据，即位于存档文件夹 #icon("folder") `data` 中的数据都按照带命名空间父目录的格式存储。但是，大部分数据都只存储在 `minecraft` 命名空间，无论这些资源本身使用的命名空间。
#figure(
  caption: [Boss栏 `foo:test` 的命名空间为 `foo`，但其数据存储于 `minecraft` 命名空间],
  image("图片/Boss栏footest的命名空间为foo，但其数据存储于minecraft命名空间.png", width: 28em)
)
=== 命令存储<subsec:command_storage>
对于大部分的游戏数据，玩家可以修改这些字段的值，但不能自由添加或删去这些字段，而*#proper-noun(display: "命令存储（Command storage）", "ming4 ling4 cun2 chu3")允许玩家在文件中写入、修改任意的数据，便于存储、处理适用于全局游戏的自定义数据。它与方块实体、实体构成三种能使用命令访问的数据。*使用命令存储数据可以摆脱方块实体和实体的限制，可以制定任意的标签、数据类型。每一个命令存储由不同的命名空间ID区分。

命令存储文件位于 #icon("nbt") `<存档名称> > data > <命名空间> > command_storage.dat`，这里的 `.dat` 文件是NBT格式的文件。`<命名空间>` 即为命令存储的命名空间（不包含ID），默认为 `minecraft`，允许存在多个不同命名空间的 `.dat` 文件。一个 #icon("nbt") `command_storage.dat` 文件的数据树如下所示：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *data*: 存储该命名空间下不同ID的命令存储数据。]),
  (2, [#icon("nbt-compound") *contents*: 允许存在多个不同的标签 #icon("nbt-compound") `<ID>` 以支持同一个命名空间下的不同ID。]),
  (3, [#icon("nbt-compound") *\<ID>*: 标签名为一个命令存储的ID。命令 `/data` 可以读取、编辑或写入一个命令存储，这些数据都会被存储到标签 #icon("nbt-compound") `<ID>` 内。如果一个命名空间ID的命令存储地址不存在，则会自动创建该命名空间ID。因此一个命令存储文件下可以包含多个相同命名空间而ID不同的具体的命令存储。此时一般称这个标签为拥有该命名空间ID的命令存储的根标签。]),
  (4, [任意NBT数据]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。])
)
#example(
  [
    一个命令存储文件 #icon("nbt") `data > tutorial > command_storage.dat` 的数据结构如下所示：
    #tree(
      (0, [#icon("nbt-compound") 根标签]),
      (1, [#icon("nbt-compound") *data*]),
      (2, [#icon("nbt-compound") *contents*]),
      (3, [#icon("nbt-compound") *a*]),
      (4, [#icon("nbt-byte") *yes*: `1`]),
      (1, [#icon("nbt-int") *DataVersion*: `4777`])
    )
    回答下列问题：
    + 该命令存储的命名空间ID为#blank。
    + 假设该命令存储的初始值为空，若要使该命令存储的所存储的数据如上所示，写出可行的命令。
  ],
  [
    + 此命令存储的命名空间为 `tutorial`，而ID为标签 #icon("nbt-compound") `contents` 子标签的标签名。所以该命令存储的命名空间ID为 `tutorial:a`。
    + 写入一个命令存储需要命令 `/data merge` 或 `/data modify`，注意命令存储 `tutorial:a` 的数据从标签 #icon("nbt-compound") `a` 开始。使用 `/data merge` 的命令可以为
      #codebox("data merge storage minecraft:a {yes:1b}")
  ]
)
#example(
  [
    在一张后室主题的冒险地图中，命令存储文件 #icon("nbt") `data > the_backrooms > command_storage.dat` 的数据如下所示：
    #tree(
      (0, [#icon("nbt-compound") 根标签]),
      (1, [#icon("nbt-int") *DataVersion*: `4777`]),
      (1, [#icon("nbt-compound") *data*]),
      (2, [#icon("nbt-compound") *contents*]),
      (3, [#icon("nbt-compound") *main*]),
      (4, [#icon("nbt-compound") *game_data*]),
      (5, [#icon("nbt-list") *spawnpoint*]),
      (6, [#icon("nbt-compound")]),
      (7, [#icon("nbt-int_array") *Pos*: `[I;0,5,0]`]),
      (7, [#icon("nbt-string") *level*: `level_0`]),
      (5, [#icon("nbt-list") *player_data*]),
      (6, [#icon("nbt-compound")]),
      (7, [#icon("nbt-int") *san*: `10812`]),
      (7, [#icon("nbt-int") *serial_number*: `1219`]),
      (7, [#icon("nbt-string") *current_level*: `level_0`]),
      (6, [#icon("nbt-compound")]),
      (7, [#icon("nbt-int") *san*: `976`]),
      (7, [#icon("nbt-int") *serial_number*: `1220`]),
      (7, [#icon("nbt-string") *current_level*: `level_0`]),
    )
    其中复合标签的列表 #icon("nbt-list") `spawnpoint` 存储了后室各层级的玩家出生点，子标签 #icon("nbt-int_array") `Pos` 按$x$、$y$、$z$坐标的顺序存储了出生点坐标，#icon("nbt-string") `level` 是该出生点坐标所处的层级。#icon("nbt-list") `player_data` 存储了与玩家有关的数据，其中的每个复合标签均为一个具体玩家的数据：#icon("nbt-list") `san` 是玩家当前的SAN值，#icon("nbt-list") `serial_number` 是该玩家的编号，#icon("nbt-string") `current_level` 是该玩家当前所处的层级。按要求对其中的命令存储内容进行操作：
    + 获取编号为1219的玩家的SAN值；
    + 将层级Level 0（命令存储格式中为 `level_0`）的玩家出生点$y$坐标改为 `10`。
  ],
  [
    + 显然获取值的操作需要使用命令 `/data get`。编号为1219的玩家数据可以从数据树上找到：<enu:backrooms_data>
      #tree(
        (0, [#icon("nbt-compound")]),
        (1, [#icon("nbt-int") *san*: `10812`]),
        (1, [#icon("nbt-int") *serial_number*: `1219`]),
        (1, [#icon("nbt-string") *current_level*: `level_0`]),
      )
      这个复合标签是列表 #icon("nbt-list") `player_data` 的第一个元素，该玩家的SAN值也可以从这个复合标签中获取。虽然使用节点 `player_data[0]` 可以直接定位到这个元素，但是这样的做法不值得提倡，因为在数据的处理过程中无法保证这个复合标签一定位于列表的第1个。因此不妨使用当前列表或数组中的复合标签元素，节点写成 `player_data[{serial_number:1219}]`，这样无论该复合标签在列表的什么位置，都可以精确地定位到这个复合标签。
      
      `/data get` 中的完整NBT路径为 `game_data.player_data[{serial_number:1219}].san`，而命令存储的命名空间ID为 `backrooms:main`，因此完整的命令为
      #codebox("data get storage backrooms:main game_data.player_data[{serial_number:1219}].san")
    + 该小题适用命令 `/data modify`。由题意，Level 0的玩家出生点数据存储在如下的数据树中：
      #tree(
        (0, [#icon("nbt-compound")]),
        (1, [#icon("nbt-int_array") *Pos*: `[I;0,5,0]`]),
        (1, [#icon("nbt-string") *level*: `level_0`]),
      )
      同第@enu:backrooms_data 小题之理，定位这个复合标签时也应该使用当前列表或数组中的复合标签元素。定位到 #icon("nbt-int_array") `Pos` 中的$y$坐标时，由于题目已经规定了三个坐标值在数组中的顺序，因此可直接使用节点 `Pos[1]`。完整的命令为：
      #codebox("data modify storage backrooms:main game_data.spawnpoint[{level:\"level_0\"}].Pos[1] set value 10")
  ]
)
命令存储一般用于存储全局性的数据，因为它自身不具备将数据绑定至各个玩家的能力，因此在实际编写时必须手动维护一套将数据映射至各个玩家的算法。显然记分板更适用于存储玩家各自的数据。
=== Boss栏<subsec:bossbar>
#proper-noun(display: "Boss栏（Boss bar）", "Boss lan2")是显示在HUD#footnote[即平视显示器（Heads-up display），是叠加在游戏视野上的画面。]顶端中央的一个可被填充的条式图形，通常用于显示末影龙和凋零的血量。除了用于显示Boss的血量，Boss栏在多人游戏和冒险地图中也被用于显示倒计时、游戏进展等。如果设计得当，可以用Boss栏制造出很好的效果。

一个Boss栏拥有一个*最大值*和一个*当前值*，这两个值决定了Boss栏被填充的比例。在GUI和HUD大小不变的情况下，一个Boss栏的长度是不变的，只有Boss栏中填充的内容发生变化，填充的比例为当前值与最大值的比。例如，最大值为20、当前值为10的Boss栏填充占比为50%。当前值不必比最大值小，若当前值大于或等于最大值，则Boss栏中的填充固定为100%。
==== 命令 `/bossbar`
手动创建和修改BOSS栏可以通过命令 `/bossbar` 完成，它需要的权限等级为2，下面是命令 `/bossbar` 的所有用法：#index(index: "command", "bossbar")
===== 添加一个Boss栏，语法为
#codebox("bossbar add <id> <name>")
#param-desc(
  [`<id>`（命名空间ID `minecraft:resource_location`）], [被添加Boss栏的命名空间ID，可自由指定。若不填写命名空间，则默认命名空间为 `minecraft`。Boss栏的ID在系统内部使用，作为与其他Boss栏区分的凭证。],
  [`<name>`（文本组件 `minecraft:component`）], [Boss栏的显示名称，必须为文本组件。显示名称会显示在HUD的Boss栏上方。]
)
===== 查询一个Boss栏的信息，语法为
#codebox("bossbar get <id> (max|players|value|visible)")
#param-desc(
  [`(max|players|value|visible)` ], [查询的信息，有效值如下。\ `max`：Boss栏的最大值。\ `players`：这个Boss栏对哪些玩家显示。\ `value`：Boss栏的当前值。\ `visible`：Boss栏是否可见。]
)
===== 列出所有的Boss栏，语法为
#codebox("bossbar list")
===== 移除一个Boss栏，语法为
#codebox("bossbar remove <id>")
===== 编辑Boss栏
====== 编辑Boss栏填充的颜色，语法为
#codebox("bossbar set <id> color (blue|green|pink|purple|red|white|yellow)")
#param-desc(
  [`(blue|green|pink|purple|red|white|yellow)` ], [填充的颜色。]
)
#figure(
  caption: "Boss栏的不同颜色",
  image("图片/Boss栏的不同颜色.png", width: 20em)
)
====== 编辑Boss栏的最大值，语法为
#codebox("bossbar set <id> max <max>")
#param-desc(
  [`<max>`（整型 `brigadier:integer`）], [设置的最大值，默认值为 `100`。]
)
====== 编辑Boss栏的显示名字，语法为
#codebox("bossbar set <id> name <name>")
====== 编辑Boss栏可被哪些玩家看见，语法为
#codebox("bossbar set <id> players [<targets>]")
#param-desc(
  [`[<targets>]`（实体 `minecraft:entity`）], [可选，指定Boss栏可以被哪些玩家看到，必须指定玩家。若不定义，则对所有玩家显示此Boss栏。]
)
====== 编辑Boss栏显示的样式，语法为
#codebox("bossbar set <id> style (notched_6|notched_10|notched_12|notched_20|progress)")
#param-desc(
  [`(notched_6|notched_10|notched_12|notched_20|progress)` ], [显示样式，有效值如下。\ `notched_6`：分为6段。\ `notched_10`：分为10段。\ `notched_12`：分为12段。\ `notched_20`：分为20段。\ `progress`：不做任何分段，为默认样式。]
)
#figure(
  caption: "Boss栏的不同样式",
  image("图片/Boss栏的不同样式.png", width: 20em)
)
====== 编辑Boss栏的当前值，语法为
#codebox("bossbar set <id> value <value>")
#param-desc(
  [`<value>`（整型 `brigadier:integer`）], [设置的当前值。]
)
====== 编辑Boss栏的可见性，语法为
#codebox("bossbar set <id> visible <visible>")
#param-desc(
  [`<visible>`（布尔值 `brigadier:bool`）], [设置Boss栏是否可见。]
)
==== Boss栏NBT格式 \*
Boss栏数据被存储在 #icon("nbt") `data > minecraft > custom_boss_events.dat`。无论Boss栏自身的命名空间为何，#icon("nbt") `custom_boss_events.dat` 只存储于 `minecraft` 命名空间。这部分数据格式如下：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *#underline[data]*: 存储的多个自定义Boss栏数据。]),
  (2, [#icon("nbt-compound") *\<Boss栏命名空间ID>*: 一项Boss栏。]),
  (3, [#icon("nbt-string") *#underline[Color]*: Boss栏的填充颜色，有效值 `blue`、`green`、`pink`、`purple`、`red`、`white`、`yellow`。]),
  (3, [#icon("nbt-bool") *#underline[CreateWorldFog]*: 该Boss栏是否使天空暗淡。]),
  (3, [#icon("nbt-bool") *#underline[DarkenScreen]*: 该Boss栏是否创建迷雾效果。]),
  (3, [#icon("nbt-int") *#underline[Max]*: Boss栏最大值。]),
  (3, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *#underline[Name]*: Boss栏的显示名字，是一个文本组件。]),
  (3, [#icon("nbt-string") *#underline[Overlay]*: Boss栏的显示样式，有效值 `notched_6`、`notched_10`、`notched_12`、`notched_20`、`progress`。]),
  (3, [#icon("nbt-bool") *#underline[PlayBossMusic]*: 是否播放Boss音乐。]),
  (3, [#icon("nbt-list") *#underline[Players]*: 可以看见该Boss栏的玩家列表。]),
  (4, [#icon("nbt-int_array") 一个玩家的UUID。]),
  (3, [#icon("nbt-int") *#underline[Value]*: Boss栏当前值。]),
  (3, [#icon("nbt-bool") *#underline[Visible]*: 该Boss栏是否对玩家可见。]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。])
)
=== 随机序列<subsec:random_sequence>
#proper-noun(display: "随机序列（Random sequences）", "sui2 ji1 xu4 lie4")是游戏中可控的随机数发生器，在游戏中的应用主要在战利品表上，如实体、方块的掉落物、猪灵的以物易物等。
==== 命令 `/random`
`/random` 是用于生成随机数以及修改随机序列的命令，以下是所有用法。#index(index: "command", "random")
===== 获取一个随机数
#codebox("random (value|roll) <range> [<sequence>]")
#param-desc(
  [`(value|roll)` ], [产生随机数时，设为 `value` 会将结果仅显示给执行命令的玩家；设为 `roll` 会将结果通知给所有玩家。],
  [`<range>`（整数范围 `minecraft:int_range`）], [生成的随机数在该参数指定的范围内，范围可以包含负数。此范围能够产生的数值个数必须介于 `2` 和 `2147483646` 之间（含），比如参数 `1` 只能产生1这个随机数，因此无效；参数 `1..2` 能产生1、2两个随机数，因此是有效的。],
  [`[<sequence>]`（命名空间ID `minecraft:resource_location`）], [可选。每一个随机数的产生都使用了一个随机序列，这些序列是独一无二的，因此可以自定义命名空间ID来指定这些序列，这样就可以用命名空间ID唯一地指定特定地序列。如果指定的序列不存在，则游戏会现场创建一个随机序列使用。如指定了该参数，则命令 `/random` 所需权限等级为2；不指定则为0。]
)
===== 重制随机数规则
#codebox("random reset (*|<sequence>) [<seed>] [<includeWorldSeed>] [<includeSequenceId>]")
#param-desc(
  [`(*|<sequence>)` ], [指定要重制规则的随机数序列。若设为 `*`，则重制所有的随机序列；若使用参数 `<sequence>`，则是要重制规则的随机数序列的命名空间ID。],
  [`[<seed>]`（长整型 `brigadier:long`）], [用于重制随机序列的种子。在同一个序列中使用相同的种子得到的随机数是一样的。],
  [`[<includeWorldSeed>]`（布尔值 `brigadier:bool`）], [可选，用于决定在重制随机序列的种子中是否掺入世界种子。],
  [`[<includeSequenceId>]`（布尔值 `brigadier:bool`）], [可选，用于决定在重制随机序列的种子中是否掺入随机序列ID。]
)
==== 随机序列数据文件 \*
随机序列的数据存储于 #icon("nbt") `data > minecraft > random_sequences.dat`。无论随机序列自身的命名空间为何，#icon("nbt") `random_sequences.dat` 只存储于 `minecraft` 命名空间。随机序列的数据格式为
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *#underline[data]*: 随机序列的数据。]),
  (2, [#icon("nbt-bool") *include_sequence_id*: 计算随机序列时是否掺入随机序列的命名空间ID。]),
  (2, [#icon("nbt-bool") *include_world_seed*: 计算随机序列时是否掺入世界种子。]),
  (2, [#icon("nbt-int") *salt*: 初始化随机序列时掺入的盐。#proper-noun(display: "盐（Salt）", "yan2")是一种将散列内容插入到数据任意位置的手段，用于加密。]),
  (2, [#icon("nbt-compound") *#underline[sequences]*: 存储游戏中的所有随机序列。]),
  (3, [#icon("nbt-compound") *\<随机序列命名空间ID>*: 一个随机序列。]),
  (4, [#icon("nbt-long_array") *#underline[source]*: 随机数源。]),
  (5, [#icon("nbt-long") 随机数种子的低64位。]),
  (5, [#icon("nbt-long") 随机数种子的高64位。]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。])
)
=== 秒表<subsec:stopwatch>
#proper-noun(display: "秒表（Stopwatch）", "miao3 biao3")用于记录真实的时间流逝而非游戏刻，因此秒表的计时与游戏刻并不完全一致。计时的单位为*毫秒*。只要服务端开启，这些秒表就会开始计时。只有当服务端被关闭时，秒表才会停止计时。因此，以下情况都会让秒表持续计时：#cite(<stopwatch>, form: none)
+ 在单人或多人游戏进入游戏暂停界面。
+ 服务端发生掉刻。
+ 使用 `/tick freeze` 冻结游戏刻。
+ 没有玩家在独立服务端内进行游戏。
+ 计算机休眠。
==== 命令 `/stopwatch`
命令 `/stopwatch` 用于管理游戏中存在的秒表，它需要的权限等级为2，以下是所有用法。
===== 创建一个新的秒表
#codebox("stopwatch create <id>")
#param-desc(
  [`<id>`（命名空间ID `minecraft:resource_location`）], [秒表的命名空间ID。如果指定的秒表不存在，则游戏会现场创建一个秒表使用。]
)
===== 查询特定秒表的时间
#codebox("stopwatch query <id> [<scale>]")
#param-desc(
  [`[<scale>]`（双精度浮点数 `brigadier:double`）], [可选，将返回的值进行缩放的倍率。缩放操作为：先乘以此值，再向下取整。]
)
此命令查询得到的时间单位为秒，但精确到小数点后3位，所以实际上能够得到精确的毫秒数据。
===== 重置指定的秒表
#codebox("stopwatch restart <id>")
此命令会让指定命名空间ID的秒表归零，但由于它不能让秒表停止计时，因此秒表归零后会立即开始从零计时。
===== 移除指定的秒表
#codebox("stopwatch remove <id>")
==== 秒表数据文件 \*
秒表的数据存储于 #icon("nbt") `data > minecraft > stopwatches.dat`。无论秒表自身的命名空间为何，#icon("nbt") `stopwatches.dat` 只存储于 `minecraft` 命名空间。秒表的数据格式为
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *#underline[data]*: 秒表的数据。]),
  (2, [#icon("nbt-compound") *#underline[stopwatches]*: 存储游戏中的所有秒表。]),
  (3, [#icon("nbt-long") *\<秒表命名空间ID>*: 一个秒表的当前计时，单位为毫秒。]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。])
)
=== 天气<subsec:weather>
#proper-noun(display: "天气（Weather）", "tian1 qi4")是游戏中的全局性事件，所有维度的天气会保持一致。游戏中一共有3种天气：晴天、降雨和雷暴。
==== 命令 `/weather`
命令 `/weather` 可用于直接更改游戏内天气，也可用于重置降雨计时器和雷暴计时器，所需权限等级为2，语法为：#index(index: "command", "weather")
#codebox("weather (clear|rain|thunder) [<duration>]")
#param-desc(
  [`(clear|rain|thunder)` ], [用于指定天气为晴天、雨天（温度值低于0.15的区域会下雪）或雷暴。],
  [`[<duration>]`（时间 `minecraft:time`）], [可选，指定天气的持续时间，格式为：`<单精度浮点数>[<单位>]`，单位可以为：`t`（游戏刻），`s`（秒）或 `d`（游戏日），无单位默认为游戏刻。如不填写，则按指定的天气随机取值：\ 对于 `clear`：随机取 `12000` 到 `180000` 之间（含）的值。\ 对于 `rain`：随机取 `12000` 到 `24000` 之间（含）的值。\ 对于 `thunder`：随机取 `3600` 到 `15600` 之间（含）的值。]
)
使用 `/weather` 改变天气会导致降雨计时器和雷暴计时器被重置为相同的值，因此晴天过后总是为雷暴。

若游戏规则 `advance_weather` 为 `false`，则游戏中的天气只能通过此命令更改。
==== 天气数据文件 \*
天气的数据存储于 #icon("nbt") `data > minecraft > weather.dat`，数据格式为
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *#underline[data]*: 天气的数据。]),
  (2, [#icon("nbt-int") *clear_weather_time*: 存档内世界晴天剩余时间，默认值为 `0`。]),
  (2, [#icon("nbt-bool") *raining*: 当前世界是否为降雨天气，默认值为 `false`。]),
  (2, [#icon("nbt-int") *rain_time*: 如果世界当前不处于降雨天气，此值代表距离下一次降雨的时间；如果当前正处于降雨天气，此值代表距离降雨结束的时间。]),
  (2, [#icon("nbt-bool") *thundering*: 当前世界是否为雷暴天气，默认值为 `false`。]),
  (2, [#icon("nbt-int") *rain_time*: 如果世界当前不处于雷暴天气，此值代表距离下一次雷暴的时间；如果当前正处于雷暴天气，此值代表距离雷暴结束的时间。]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。])
)
== 维度与区域文件<subsec:dimension_and_region>
一个游戏世界存在多个维度，因此游戏存储数据时首先需要对维度进行区分。Minecraft原版存在三个维度：主世界、下界和末地，使用数据包可以添加一些自定义维度。所有维度的数据都按该维度的命名空间ID存储于 #icon("folder") `<存档名称> > dimensions > <命名空间> > … > <ID>` 中。

维度的命名空间ID允许使用任意的路径。例如，`minecraft:overworld`（主世界）维度的文件夹路径为
#tree(
  (0, [#icon("folder") *dimensions*]),
  (1, [#icon("folder") *minecraft*]),
  (2, [#icon("folder") *overworld*])
)
#h(-2em)自定义维度 `the_backrooms:level_0/red_rooms` 的文件夹路径为
#tree(
  (0, [#icon("folder") *dimensions*]),
  (1, [#icon("folder") *the_backrooms*]),
  (2, [#icon("folder") *level_0*]),
  (3, [#icon("folder") *red_rooms*])
)
维度数据可以分为区块数据和零散数据，其中存储区块信息的文件被称为#proper-noun(display: "区域文件（Region file）", "qu1 yu4 wen2 jian4")，或称#proper-noun(display: "Anvil文件（Anvil file）", "Anvil wen2 jian4")，这些文件均使用NBT格式，其后缀为 `.mca`。Anvil文件以 #icon("nbt") `r.<x>.<z>.mca` 的名字命名，一个Anvil文件存储了一个#proper-noun(display: "区域（Region）", "qu1 yu4")内所有区块的相关信息，其中一个区域包含$32 times 32$个区块。如果一个区域的信息量过大，则游戏会创建一个对应的区域额外文件，这个文件被命名为 #icon("nbt") `c.<x>.<z>.mcc`。游戏存储区块数据时，不会将这个区块的所有数据都存储在一个Anvil文件中，而是将这些数据拆分为区块基础数据、实体数据和兴趣点数据，并将它们分配到不同的文件夹内存储。其中 #icon("folder") `region` 文件夹存储区块全局信息；#icon("folder") `entities` 文件夹存储实体信息；#icon("folder") `poi` 文件夹存储兴趣点信息。维度零散数据则存储于 #icon("folder") `data` 中。因此，完整的维度数据文件结构如下所示：
#tree(
  (0, [#icon("folder") *dimensions*: 维度数据。]),
  (1, [#icon("folder") *\<命名空间>*: 任意命名空间下的维度数据。]),
  (2, [#icon("folder") *\<维度ID>*: 一个维度，可以添加路径。]),
  (3, [#icon("folder") *data*: 该维度的零散数据。]),
  (4, [#icon("folder") *minecraft*: 命名空间，必须为 `minecraft`，无论自定义维度的自身命名空间。]),
  (5, [#icon("nbt") *chunk_tickets.dat*: 区块标签数据文件。]),
  (5, [#icon("nbt") *raids.dat*: 袭击数据文件。]),
  (5, [#icon("nbt") *ender_dragon_fight.dat*: 末影龙战斗数据文件，此文件仅存在于末地或其他可发生末影龙战斗的维度。]),
  (5, [#icon("nbt") *world_border.dat*: 该维度的世界边界数据文件。]),
  (3, [#icon("folder") *entities*: 该维度的实体数据。]),
  (4, [#icon("nbt") *r.\<x>.\<z>.mca*: 区域文件。]),
  (4, [#icon("nbt") *c.\<x>.\<z>.mcc*: 区域额外文件。]),
  (3, [#icon("folder") *poi*: 该维度的兴趣点数据。]),
  (4, [#icon("nbt") *r.\<x>.\<z>.mca*: 区域文件。]),
  (4, [#icon("nbt") *c.\<x>.\<z>.mcc*: 区域额外文件。]),
  (3, [#icon("folder") *region*: 该维度的区块基础数据。]),
  (4, [#icon("nbt") *r.\<x>.\<z>.mca*: 区域文件。]),
  (4, [#icon("nbt") *c.\<x>.\<z>.mcc*: 区域额外文件。]),
)
=== Anvil文件
对于一个Anvil文件 #icon("nbt") `r.<x>.<z>.mca`，文件名中的$x$和$z$均为常量（$x$、$z in ZZ$），现定义$(x,z)$为 #icon("nbt") `r.<x>.<z>.mca` 所存储区域$Omega$的区域坐标，记该区域内某个区块的（绝对）区块坐标为$[x_"c",z_"c"]$（$x_"c"$、$z_"c"in ZZ$），则满足
$ cases(
  32x lt x_"c" lt 32x+31,
  32z lt z_"c" lt 32z+31
) $
#h(-2em)因此有
$ cases(
  x = floor(x_"c"\/32),
  z = floor(z_"c"\/32)
) $ <equ:chunk_coordinates_in_region_coordinates>
#figure(
  caption: [区域和区块坐标，其中每一个方格均代表一个区域，内包含$32 times 32$个区块],
  image("图片/区域和区块坐标，其中每一个方格均代表一个区域，内包含32×32个区块.png", width: 35em)
)
根据这个式子，仅凭一个区块坐标就能找到存储该区块或方块的Anvil文件和该区块所在的标签。
#example(
  [已知一个区块的区块坐标为$[312,-109]$，计算这个区块的数据所处的区域文件。],
  [
    直接代入@equ:chunk_coordinates_in_region_coordinates，得$x=floor(312\/32)=9$，$z=floor(-109\/32)=-4$，因此区域坐标为$(9,-4)$，相应的区域文件为 #icon("nbt") `r.9.-4.mca`。

  ]
)
由于区块位于区域$Omega$内，其数据都被存储在 #icon("nbt") `r.<x>.<z>.mca` 内，而这些Anvil文件又是相互独立的，内部的标签名可以相同。因此可以不必使用绝对的区块坐标，仅表示该区块位于区域$Omega$内的位置即可。现定义$[x'_"c",z'_"c"]$（$x'_"c"$、$z'_"c"in ZZ$）为相对于区域$Omega$的区块坐标，称为相对区块坐标，则满足
$ cases(
  x_"c"-32x=x'_"c",
  z_"c"-32z=z'_"c"
) $
将@equ:chunk_coordinates_in_region_coordinates\代入，得相对区块坐标
$ cases(
  x'_"c"=x_"c"-32floor(x_"c"\/32),
  z'_"c"=z_"c"-32floor(z_"c"\/32)
) $ <equ:relative_chunk_coordinates>
如果使用 #icon("nbtstudio") NBTStudio打开Anvil文件，可以看到其中有很多名为 #icon("nbt-compound") `Chunk [x'c,z'c] in world at (xc,zc)` 的复合标签，一个复合标签存储一个区块的信息，其中该复合标签存储区块的绝对区块坐标为$[x_"c",z_"c"]$，相对区块坐标为$[x'_"c",z'_"c"]$。

对于任意一个二维的方块坐标$(x_0,z_0)$，将@equ:block_position_to_chunk_coordinates\的计算结果代入@equ:chunk_coordinates_in_region_coordinates，它所在的区域坐标可计算为：
$ cases(
  x = floor(floor(x_0\/16)\/32),
  z = floor(floor(z_0\/16)\/32)
) $ <equ:block_position_to_region_coordinates>
将@equ:block_position_to_chunk_coordinates\代入@equ:relative_chunk_coordinates，相应地、该方块坐标所在区块的在区域内的相对区块坐标$[x'_"c",z'_"c"]$为
$ cases(
  x'_"c"=floor(x_0\/16)-32floor(floor(x_0\/16)\/32),
  z'_"c"=floor(z_0\/16)-32floor(floor(z_0\/16)\/32)
) $ <equ:block_position_to_relative_chunk_coordinates>
#example(
  [已知一个方块的方块坐标为$(3247,98,-1030)$，求存储该方块的数据的Anvil文件名和区块标签名],
  [
    首先代入@equ:block_position_to_chunk_coordinates，计算此方块坐标所属绝对区块坐标
    #align(center)[$x_"c"=floor(3247\/16)=202$，$z_"c"=floor(-1030\/16)=-65$]
    #h(-2em)接下来代入@equ:block_position_to_region_coordinates，计算此方块坐标所属区域坐标
    #align(center)[$x=floor(floor(3247\/16)\/32)=6$，$z=floor(floor(-1030\/16)\/32)=-3$]
    #h(-2em)因此对应的Anvil文件名为 #icon("nbt") `r.6.-3.mca`。
    
    又根据@equ:block_position_to_relative_chunk_coordinates，可得局部区块坐标
    #align(center)[$x'_"c"=floor(3247\/16)-32floor(floor(3247\/16)\/32)=10$]
    #align(center)[$z'_"c"=floor-1030\/16)-32floor(floor(-1030\/16)\/32)=31$]
    #h(-2em)于是存储区块的复合标签的标签名为 `Chunk [10,31] in world at (202,-65)`。
  ]
) <exa:block_position_to_anvil_file>
=== 维度数据 \*
一个维度拥有以下的数据格式。
==== 区块基础数据
区块基础数据存储的是这个区块的方块、地形、高度图、光照等基本信息。存储位置为 #icon("folder") `region`，@exa:block_position_to_anvil_file\所述的Anvil文件路径就为 #icon("nbt") `dimensions > <命名空间> > <维度ID> > region > r.6.-3.mca`。区块基础数据的格式如下：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *below_zero_retrogen*: 仅在1.18之前的世界更新为1.18及之后的世界时使用，用于在高度为负的区域生成方块。]),
  (2, [#icon("nbt-long_array") *missing_bedrock*: 从区块内部$(0,0)$位置起先沿$x$轴正方向、再沿$z$轴正方向遍历所有水平位置以检查是否缺失基岩，从而决定是否重新生成此位置下的方块。由于一个区块有256个可用的水平位置，每一个位置都用一个二进制位表示是否缺失基岩，这些二进制位会被转换为4个长整型整数，依次存入该数组内。]),
  (2, [#icon("nbt-string") *#underline[target_status]*: 重新生成方块时区块的目标状态，可用值有 `empty`（尚未进行区块生成）、`structure_starts`（生成结构范围）、`structure_references`（计算结构引用）、`biomes`（填充生物群系）、`noise`（填充初始噪声地形）、`surface`（应用表面规则）、`carvers`（地形雕刻）、`features`（生成地物）、`initialize_light`（初始化光照计算）、`light`（计算初始光照）、`spawn`（生成初始实体）和 `full`（区块生成完毕）。]),
  (1, [#icon("nbt-compound") *blending_data*: 用于新旧区块平滑过渡的混合数据。]),
  (2, [#icon("nbt-list") *heights*: 混合数据中元胞的高度值，有16个值。]),
  (3, [#icon("nbt-double") 一个高度值。]),
  (2, [#icon("nbt-int") *#underline[max_section]*: 混合数据中最高区段的$y$坐标。]),
  (2, [#icon("nbt-int") *#underline[min_section]*: 混合数据中最低区段的$y$坐标。]),
  (1, [#icon("nbt-list") *#underline[block_entities]*: 存储区块内所有方块实体信息。]),
  (2, [#icon("nbt-compound") 一个方块实体。这部分数据格式见节@sec:block_entity。]),
  (3, [方块实体格式]),
  (1, [#icon("nbt-list") *#underline[block_ticks]*: 存储区块中的方块计划刻。]),
  (2, [#icon("nbt-compound") 一项方块计划刻。]),
  (3, [#icon("nbt-string") *i*: 方块的命名空间ID。]),
  (3, [#icon("nbt-int") *p*: 计划刻的处理优先级，该值越低，则此计划刻会被优先处理。]),
  (3, [#icon("nbt-int") *t*: 此计划刻将要执行的倒计时。]),
  (3, [#icon("nbt-int") *x*: 方块的$x$坐标。]),
  (3, [#icon("nbt-int") *y*: 方块的$y$坐标。]),
  (3, [#icon("nbt-int") *z*: 方块的$z$坐标。]),
  (1, [#icon("nbt-long_array") *carving_masks*: 区块雕刻时的标记，仅在区块生成时使用。位置使用YZX编码。YZX编码的计算方式为 `y<<8|z<<4|x`。]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。]),
  (1, [#icon("nbt-list") *entities*: 生成实体时使用的信息，实体生成完毕后该字段被删除。]),
  (2, [#icon("nbt-compound") 一个实体。这部分数据格式见节@sec:entity。]),
  (3, [实体格式]),
  (1, [#icon("nbt-list") *#underline[fluid_ticks]*: 存储区块中的流体计划刻。]),
  (2, [#icon("nbt-compound") 一项流体计划刻。]),
  (3, [#icon("nbt-string") *i*: 流体的命名空间ID。]),
  (3, [#icon("nbt-int") *p*: 计划刻的处理优先级，该值越低，则此计划刻会被优先处理。]),
  (3, [#icon("nbt-int") *t*: 此计划刻将要执行的倒计时。]),
  (3, [#icon("nbt-int") *x*: 流体的$x$坐标。]),
  (3, [#icon("nbt-int") *y*: 流体的$y$坐标。]),
  (3, [#icon("nbt-int") *z*: 流体的$z$坐标。]),
  (1, [#icon("nbt-compound") *HeightMaps*: 从区块内部$(0,0)$位置起先沿$x$轴正方向、再沿$z$轴正方向遍历所有水平位置以存储区块的高度图信息。]),
  (2, [#icon("nbt-long") *MOTION_BLOCKING*: 最高的能阻挡移动的方块，包括流体方块。]),
  (2, [#icon("nbt-long") *MOTION_BLOCKING_NO_LEAVES*: 最高的能阻挡移动的方块，不包括树叶。]),
  (2, [#icon("nbt-long") *OCEAN_FLOOR*: 最高的能阻挡移动的非流体方块。]),
  (2, [#icon("nbt-long") *OCEAN_FLOOR_WG*: 最高的能阻挡移动的非流体方块，仅用于世界生成，生成完毕即被删除。]),
  (2, [#icon("nbt-long") *WORLD_SURFACE*: 最高的非空气方块。]),
  (2, [#icon("nbt-long") *WORLD_SURFACE_WG*: 最高的非空气方块，仅用于世界生成，生成完毕即被删除。]),
  (1, [#icon("nbt-long") *#underline[InhabitedTime]*: 所有玩家在此区块停留的总时间之和，用于区域难度计算。]),
  (1, [#icon("nbt-bool") *isLightOn*: 区块是否已经正常完成光照计算。]),
  (1, [#icon("nbt-long") *LastUpdate*: 此区块最后一次保存时的游戏时间。]),
  (1, [#icon("nbt-list") *#underline[PostProcessing]*: 存储区块生成完毕后需要进行更新的位置。]),
  (2, [#icon("nbt-list") 一个区段内需要进行更新的位置，存储区段的顺序从低到高。]),
  (3, [#icon("nbt-short") 一个需要更新的方块的位置，使用ZYX编码。ZYX编码计算同上文YZX编码的计算方式类似。]),
  (1, [#icon("nbt-list") *#underline[sections]*: 区块中所有区段的信息。]),
  (2, [#icon("nbt-compound") 一个区段的信息。]),
  (3, [#icon("nbt-compound") *biome*: 此区段的生物群系信息。]),
  (4, [#icon("nbt-long_array") *data*: 以元胞为单位存储生物群系信息。存储方式为建立“调色板”以保存方块状态与数字的映射，即以下的 #icon("nbt-list") `palette` 字段，#icon("nbt-list") `palette` 内元素的索引作为对应生物群系的ID，此ID仅在本子区块有效。并将数字按照YZX编码按顺序存储到此字段。为节省空间，如果该区段只存在一种生物群系，则此项不存在。]),
  (4, [#icon("nbt-list") *palette*: 生物群系的集合。]),
  (5, [#icon("nbt-string") 一个生物群系的命名空间ID。]),
  (3, [#icon("nbt-compound") *block_states*: 此区段的方块状态信息。]),
  (4, [#icon("nbt-long_array") *data*: 存储区段内所有方块的方块状态。存储方式与上文生物群系存储方式完全一致。如果该区段只存在一种方块状态，则此项不存在。]),
  (4, [#icon("nbt-long_array") *palette*: 方块状态的集合。]),
  (5, [#icon("nbt-compound") 一个方块状态。]),
  (6, [#icon("nbt-string") *#underline[Name]*: 方块的命名空间ID。]),
  (6, [#icon("nbt-compound") *Properties*: 可选，由若干方块属性组成的方块状态。]),
  (7, [#icon("nbt-string") *\<方块属性>*: 标签名为方块状态的属性，值使用字符串表示。]),
  (3, [#icon("nbt-byte_array") *BlockLight*: 存储区段内所有方块光照亮度信息。使用YZX编码。]),
  (3, [#icon("nbt-byte_array") *SkyLight*: 存储区段内所有天空光照亮度信息。使用YZX编码。]),
  (3, [#icon("nbt-byte") *#underline[Y]*: 区段的$y$坐标。]),
  (1, [#icon("nbt-bool") *shouldSave*: 在加载区块后是否要标记此区块已被修改。]),
  (1, [#icon("nbt-string") *#underline[Status]*: 存储该区块当前在世界生成中的状态。可用值有 `empty`（尚未进行区块生成）、`structure_starts`（生成结构范围）、`structure_references`（计算结构引用）、`biomes`（填充生物群系）、`noise`（填充初始噪声地形）、`surface`（应用表面规则）、`carvers`（地形雕刻）、`features`（生成地物）、`initialize_light`（初始化光照计算）、`light`（计算初始光照）、`spawn`（生成初始实体）和 `full`（区块生成完毕）。]),
  (1, [#icon("nbt-compound") *#underline[structures]*: 存储该区块内的结构。]),
  (2, [#icon("nbt-compound") *#underline[References]*: 包含 #icon("nbt-compound") `starts` 中结构的区块坐标。]),
  (3, [#icon("nbt-long_array") *\<结构命名空间ID>*: 包含此结构生成点的区块坐标。]),
  (2, [#icon("nbt-compound") *#underline[starts]*: 未生成完毕的结构，生成完毕后该字段会被删除。]),
  (3, [#icon("nbt-compound") *\<结构命名空间ID>*: 一项结构和它生成时需要的数据。]),
  (4, [#icon("nbt-list") *Children*: 组成此结构的、还未被生成的结构片段。]),
  (5, [#icon("nbt-compound") 一个结构片段。]),
  (6, [结构片段格式]),
  (4, [#icon("nbt-int") *ChunkX*: 结构的起始区块$x$坐标。]),
  (4, [#icon("nbt-int") *ChunkZ*: 结构的起始区块$z$坐标。]),
  (4, [#icon("nbt-string") *#underline[id]*: 结构的命名空间ID。如果结构已经生成，则该值为 `INVALID`。]),
  (4, [#icon("nbt-int") *references*: 与此结构关联的引用计数。]),
  (1, [#icon("nbt-compound") *UpgradeData*: 区块更新的数据。]),
  (2, [#icon("nbt-compound") *Indices*: 需要更新的位置，包含了一个区块中所有区段的信息。]),
  (3, [#icon("nbt-int_array") *\<区段序号>*: 区段内需要更新的方块位置信息。每个整数都代表了一个位置，位置使用YZX编码。]),
  (2, [#icon("nbt-list") *neighbor_block_ticks*: 更新时需要保存的方块计划刻。]),
  (3, [#icon("nbt-compound") 一项方块计划刻。]),
  (4, [#icon("nbt-string") *i*: 方块的命名空间ID。]),
  (4, [#icon("nbt-int") *p*: 计划刻的处理优先级，该值越低，则此计划刻会被优先处理。]),
  (4, [#icon("nbt-int") *t*: 此计划刻将要执行的倒计时。]),
  (4, [#icon("nbt-int") *x*: 方块的$x$坐标。]),
  (4, [#icon("nbt-int") *y*: 方块的$y$坐标。]),
  (4, [#icon("nbt-int") *z*: 方块的$z$坐标。]),
  (2, [#icon("nbt-list") *neighbor_fluid_ticks*: 更新时需要保存的流体计划刻。]),
  (3, [#icon("nbt-compound") 一项流体计划刻。]),
  (4, [#icon("nbt-string") *i*: 流体的命名空间ID。]),
  (4, [#icon("nbt-int") *p*: 计划刻的处理优先级，该值越低，则此计划刻会被优先处理。]),
  (4, [#icon("nbt-int") *t*: 此计划刻将要执行的倒计时。]),
  (4, [#icon("nbt-int") *x*: 流体的$x$坐标。]),
  (4, [#icon("nbt-int") *y*: 流体的$y$坐标。]),
  (4, [#icon("nbt-int") *z*: 流体的$z$坐标。]),
  (2, [#icon("nbt-byte") *#underline[Sides]*: 使用二进制位表示是否对某一方向上的区块进行更新升级，从低位到高位分别表示北、东北、东、东南、南、西南、西、西北。]),
  (1, [#icon("nbt-int") *#underline[xPos]*: 此区块的$x$坐标。]),
  (1, [#icon("nbt-int") *#underline[yPos]*: 此区块中最低区段的$y$坐标。]),
  (1, [#icon("nbt-int") *#underline[zPos]*: 此区块的$z$坐标。])
)
==== 实体数据
实体数据存储的是这个区块的实体信息。存储位置为 #icon("folder") `entities`，文件内的数据格式如下：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。]),
  (1, [#icon("nbt-list") *#underline[Entities]*: 存储区块内所有实体的数据。]),
  (2, [#icon("nbt-compound") 一个实体。这部分数据格式见节@sec:entity。]),
  (3, [实体格式]),
  (1, [#icon("nbt-int_array") *#underline[Position]*: 该区块的区块坐标，依次为$x$坐标、$z$坐标。])
)
==== 兴趣点数据
#proper-noun(display: "兴趣点（Point of Interest，POI）", "xing4 qu4 dian3")是指对部分实体有吸引力的一个点，通常由单个方块构成。兴趣点方块可以是村民的工作站方块，也可以是蜜蜂的工作方块、避雷针等。兴趣点数据存储于 #icon("folder") `poi` 文件夹内的Anvil文件，其数据格式为
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。]),
  (1, [#icon("nbt-compound") *Sections*: 所有区段的数据。]),
  (2, [#icon("nbt-compound") *\<区段$y$坐标>*:单个区段的数据。]),
  (3, [#icon("nbt-list") *#underline[Records]: 区段内的所有兴趣点。*]),
  (4, [#icon("nbt-compound") 一个兴趣点。]),
  (5, [#icon("nbt-int") *free_tickets*: 此兴趣点剩余的认领数。为 `0` 时该兴趣点认领名额已满。]),
  (5, [#icon("nbt-int_array") *#underline[pos]*: 兴趣点坐标，依次为$x$、$y$、$z$坐标。]),
  (5, [#icon("nbt-string") *#underline[type]*: 兴趣点的命名空间ID。]),
  (3, [#icon("nbt-bool") *Valid*: 该兴趣点是否有效。])
)
==== 维度零散数据
这一部分数据均存储于存储于 #icon("folder") `data > minecraft` 文件夹内，被放置在命名空间之下。但是无论维度自身使用什么命名空间，其零散数据只存储于 `minecraft` 命名空间。例如，维度 `the_backrooms:level_0` 的零散数据位于 #icon("folder") `dimensions > the_backrooms > level_0 > data > minecraft`。

零散数据包括区块标签数据、袭击数据和世界边界数据。
===== 区块标签数据
区块标签数据文件，即 #icon("nbt") `data > minecraft > chunk_tickets.dat`，是存储区块加载标签的文件，其数据格式为
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *#underline[data]*]),
  (2, [#icon("nbt-list") *#underline[tickets]*: 区块加载标签数据。]),
  (3, [#icon("nbt-compound") 一个加载标签。]),
  (4, [#icon("nbt-long") *#underline[chunk_pos]*: 拥有该加载标签的区块的位置。]),
  (4, [#icon("nbt-int") *#underline[level]*: 加载标签的等级，可能为加载等级或计算等级，或者两者都是。]),
  (4, [#icon("nbt-long") *ticks_left*: 标签的存活时间，为 `0` 时为永久性标签。]),
  (4, [#icon("nbt-string") *#underline[type]*: 标签类型，是一个命名空间ID。]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。]),
)
===== 袭击数据
袭击数据文件是存储袭击事件相关数据的文件，文件位于 #icon("nbt") `data > minecraft > raids.dat`。其数据格式为
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *#underline[data]*: 袭击数据。]),
  (2, [#icon("nbt-int") *#underline[next_id]*: 下一次袭击的编号，每次袭击发生后就增加1，未发生过袭击时此值为 `1`。]),
  (2, [#icon("nbt-list") *#underline[raids]*: 此维度存在的袭击。]),
  (3, [#icon("nbt-compound") 一个袭击事件。]),
  (4, [#icon("nbt-bool") *#underline[active]*: 该袭击是否处于激活状态。]),
  (4, [#icon("nbt-int_array") *#underline[center]*: 袭击中心的坐标，依次为$x$、$y$、$z$坐标。]),
  (4, [#icon("nbt-int") *#underline[cooldown_ticks]*: 距离下一波袭击的游戏刻数。上一波袭击结束或袭击开始时此值为初始值 `300`。]),
  (4, [#icon("nbt-int") *#underline[groups_spawned]*: 袭击已进行的波数。]),
  (4, [#icon("nbt-int") *#underline[group_count]*: 该袭击的总波数。]),
  (4, [#icon("nbt-list") *#underline[heroes_of_the_village]*: 袭击胜利后要给予村庄英雄效果的玩家。]),
  (5, [#icon("nbt-int_array") 一个玩家的UUID。]),
  (4, [#icon("nbt-int") *#underline[id]*: 袭击的编号。]),
  (4, [#icon("nbt-int") *#underline[post_raid_ticks]*: 袭击所有波次结束后至游戏宣布袭击胜利并给予玩家村庄英雄效果的冷却时间。]),
  (4, [#icon("nbt-int") *#underline[raid_omen_level]*: 该袭击所用的袭击之兆等级。]),
  (4, [#icon("nbt-bool") *#underline[started]*: 袭击是否已经开始。]),
  (4, [#icon("nbt-string") *#underline[status]*: 该袭击当前的状态，有效值有 `ongoing`（正在进行）、`victory`（胜利）、`loss`（失败）和 `stopped`（已结束）。]),
  (4, [#icon("nbt-int") *#underline[ticks_active]*: 袭击从开始到此文件保存时运行的非冻结游戏刻数，此值超过 `48000` 时袭击被判定为平局。]),
  (4, [#icon("nbt-int") *#underline[total_health]*: 本袭击波次中所有生物的最大生命值总量。]),
  (2, [#icon("nbt-int") *#underline[tick]*: 存档从创建至此运行的游戏刻数，不计入游戏刻冻结的时间。]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。])
)
===== 世界边界数据
世界边界数据文件位于 #icon("nbt") `data > minecraft > world_border.dat`，其数据格式为
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *#underline[data]*: 世界边界数据。]),
  (2, [#icon("nbt-double") *center_x*: 世界边界中心$x$坐标。]),
  (2, [#icon("nbt-double") *center_z*: 世界边界中心$z$坐标。]),
  (2, [#icon("nbt-double") *damage_per_block*: 缓冲区外每增加一层伤害区每秒钟对玩家造成的伤害增量。]),
  (2, [#icon("nbt-double") *lerp_target*: 世界边界直径的更改量。]),
  (2, [#icon("nbt-long") *lerp_time*: 世界边界直径发生变化所需的时间。]),
  (2, [#icon("nbt-double") *safe_zone*: 缓冲区的宽度。]),
  (2, [#icon("nbt-double") *size*: 世界边界直径。]),
  (2, [#icon("nbt-int") *warning_blocks*: 产生警告时玩家距离边界墙的距离。]),
  (2, [#icon("nbt-int") *warning_time*: 距离边界墙到达该位置的倒计时，若玩家在该位置，则产生警告。]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。])
)
== 方块实体<sec:block_entity>
方块实体数据以NBT的格式存储在 #icon("nbt") `regions` 文件夹下的Anvil文件中。其中有一个字段名为 #icon("nbt-list") `block_entities`，是一个复合标签的列表，这便是专门用于存储方块实体的标签。每一个复合标签承载一个方块的方块实体信息，视复合标签为该方块实体的根标签。

所有拥有方块实体的数据列举于附录@sec:block_entity_data 中，供读者参考。
=== 方块实体共通标签 \*
一般来说，不同的方块实体拥有不同的标签数据，如告示牌的文本、箱子容纳的物品等，但是所有方块实体一定包含几种特定的标签，这些标签是所有方块实体所共同拥有的，于是称这些标签为#proper-noun(display: "方块实体共通标签（Tags common to all block entities）", "fang1 kuai4 shi2 ti3 gong4 tong2 biao1 qian1")。这些标签无法被命令 `/data` 所修改，使用像 `/setblock` 这样的命令放置方块时也无法指定这些共通标签的值。但是除标签 #icon("nbt-bool") `keepPacked` 外，其他标签均可被命令 `/data get` 查询。下面列出了所有的方块实体共有的字段：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *components*: 使用此方块实体对应的物品放置此方块实体时，如果物品带有非默认的且不会被继承处理的数据组件，则数据会被复制存储入此标签内。]),
  (2, [一个特定的物品堆叠组件，使用与之匹配的数据类型。]),
  (1, [#icon("nbt-string") *#underline[id]*: 该方块的命名空间ID。]),
  (1, [#icon("nbt-bool") *#underline[keepPacked]*: 该方块是否“有效”。“有效”的判定条件是，在区块加载的时候被立即放置。这个标签无法被 `/data get` 查询。]),
  (1, [#icon("nbt-int") *#underline[x]*: 该方块的$x$坐标。]),
  (1, [#icon("nbt-int") *#underline[y]*: 该方块的$y$坐标。]),
  (1, [#icon("nbt-int") *#underline[z]*: 该方块的$z$坐标。])
)
每个方块实体的数据格式由共通标签和各自的特有字段组成：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [方块实体共通标签]),
  (1, [各方块实体的特有字段])
)
=== 方块实体数据的应用实例
不是所有方块都有方块实体，下面的例子仅仅列举了其中一些方块实体的数据应用。
#example(
  [灾厄旗帜由于其图案的样式超出了合成次数的上限，因此无法被自然合成，但它可以通过命令来获取。写出放置一个灾厄旗帜需要的命令（方块实体的名称不需要）。],
  [
    查阅附录@sec:block_entity_data 的数据知旗帜的特有标签为
    #tree(
      (0, [#icon("nbt-compound") 根标签]),
      (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 可选，该旗帜的自定义名称，需要为文本组件。]),
      (1, [#icon("nbt-list") *patterns*: 可选，按顺序使用的旗帜图案。列表中复合标签的次序越靠前，其对应的图案在旗帜上的层级就越往下。]),
      (2, [#icon("nbt-compound") 一个单独的旗帜图案。]),
      (3, [#icon("nbt-string") *#underline[color]*: 图案的颜色。有效值有 `black`（黑色）、`blue`（蓝色）、`brown`（棕色）、`cyan`（青色）、`gray`（灰色）、`green`（绿色）、`light_blue`（淡蓝色）、`light_gray`（淡灰色）、`lime`（黄绿色）、`magenta`（品红色）、`orange`（橙色）、`pink`（粉红色）、`purple`（紫色）、`red`（红色）、`white`（白色）、`yellow`（黄色）。]),
      (3, [#icon("nbt-string")#icon("nbt-compound") *#underline[pattern]*: 图案的类型，当使用 #icon("nbt-string") 字符串形式时，值为图案的命名空间ID。旗帜图案可由数据包自定义，在数据包内的相应文件为 #icon("json") `data > <命名空间> > banner_pattern > <ID>.json`。也可以以内联SNBT的形式直接在此处定义一个图案类型，此时使用 #icon("nbt-compound") 复合标签形式。]),
      (4, [*若使用 #icon("nbt-compound") 复合标签形式，则以下字段：*], false),
      (4, [#icon("nbt-string") *asset_id*: 资源包内旗帜图案纹理的命名空间ID，文件路径为 #icon("png") `assets > <命名空间> > textures > entity > banner > <路径>.png`。]),
      (4, [#icon("nbt-string") *translation_key*: 该旗帜图案的翻译标识符前缀，游戏解析时会加上 #icon("nbt-string") `color` 字段的值作为后缀。])
    )
    灾厄旗帜为白色旗帜，其图案样式为：青色菱形、底淡灰横条、中灰竖条、淡灰色方框边、中黑横条、淡灰色上半方形、淡灰色圆形和黑色方框边。图案样式的顺序不可变化，则 #icon("nbt-list") `patterns` 的数据为
    #codebox("patterns:[
  {color:\"cyan\",pattern:\"minecraft:rhombus\"},
  {color:\"light_gray\",pattern:\"minecraft:stripe_bottom\"},
  {color:\"gray\",pattern:\"minecraft:stripe_center\"},
  {color:\"light_gray\",pattern:\"minecraft:border\"},
  {color:\"black\",pattern:\"minecraft:stripe_middle\"},
  {color:\"light_gray\",pattern:\"minecraft:half_horizontal\"},
  {color:\"light_gray\",pattern:\"minecraft:circle\"},
  {color:\"black\",pattern:\"minecraft:border\"}
]")
    在实际编写命令时，不要使用换行符和进位符。本题要求放置一个灾厄旗帜，则在本地坐标放置灾厄旗帜的命令为
    #codebox("setblock ~ ~ ~ white_banner{patterns:[{color:\"cyan\",pattern:\"minecraft:rhombus\"},{color:\"light_gray\",pattern:\"minecraft:stripe_bottom\"},{color:\"gray\",pattern:\"minecraft:stripe_center\"},{color:\"light_gray\",pattern:\"minecraft:border\"},{color:\"black\",pattern:\"minecraft:stripe_middle\"},{color:\"light_gray\",pattern:\"minecraft:half_horizontal\"},{color:\"light_gray\",pattern:\"minecraft:circle\"},{color:\"black\",pattern:\"minecraft:border\"}]}")
  ]
)
#example(
  [在$(0,56,0)$放置一个站立的橡木告示牌，使之正面呈现的文本为#text_component(background:rgb("#b69b62"),shadow-color:black.transparentize(100%),text(red)[#align(center)[准备好了吗？\ #text(green)[[点击这里开始游戏]\ \ \ ]]])。点击该告示牌后，将告示牌替换为文本#text_component(background:rgb("#b69b62"),shadow-color:black.transparentize(100%),text(black)[\ Loading...\ \ \ ])。],
  [
    查阅附录@sec:block_entity_data，告示牌的方块实体数据如下：
    #tree(
      (0, [#icon("nbt-compound") 根标签]),
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
    不考虑点击事件的情况下，原告示牌第一和第二行的文本分别为
    #codebox([{text:\"准备好了吗？\",color:\"#color_block(red)red\"}])
    #codebox([{text:\"[点击这里开始游戏]\",color:\"#color_block(green)green\"}])
    告示牌上的文本组件可以添加点击事件，点击告示牌的任意位置均可触发点击事件，无论拥有点击事件的文本组件所处的行数。当一个告示牌上有多个点击事件时，点击告示牌会触发所有事件。这里的点击事件所处的位置随意，可以选择在第二行的文本组件添加点击事件，#icon("nbt-string") `command` 值先空着：
    #codebox([{text:\"[点击这里开始游戏]\",color:\"#color_block(green)green\",click_event:{action:\"run_command\",command:\"\"}}])
    点击事件会将该告示牌的内容替换掉。告示牌的文本是存储在方块实体中的，可以很容易想到用命令 `/data` 修改告示牌上的文本：
    #codebox("data merge block …")
    玩家在点击告示牌的时候，命令执行者为玩家，执行的位置为告示牌所处的位置，因此用 `~ ~ ~` 表示修改数据的告示牌为当前位置上的告示牌。告示牌修改文本后，第一行内容为空，第二行为默认样式的#text_component(background:rgb("#b69b62"),shadow-color:black.transparentize(100%),text(black)[Loading...])，于是整个 `/data` 命令可以写为
    #codebox("data merge block ~ ~ ~ {front_text:{messages:[\"\",\"loading...\",\"\",\"\"]}}")
    这里 `/data` 使用到了双引号，不妨将定义 #icon("nbt-string") `command` 的引号写成单引号以规避转义，所以告示牌第二行的文本组件为
    #codebox([{text:\"[点击这里开始游戏]\",color:\"#color_block(green)green\",click_event:{action:\"run_command\",command:'data merge block \~ \~ \~ {front_text:{messages:[\"\",\"loading...\",\"\",\"\"]}}}}])
    综上所述，放置告示牌需要的完整命令为
    #codebox([setblock 0 56 0 oak_sign{front_text:{message:[{text:\"准备好了吗？\",color:\"#color_block(red)red\"},{text:\"[点击这里开始游戏]\",color:\"#color_block(green)green\",click_event:{action:\"run_command\",command:'data merge block \~ \~ \~ {front_text:{messages:[\"\",\"loading...\",\"\",\"\"]}}'}},\"\",\"\"]}}])
  ]
)
#index(index: "method", display: "获取现实时间", "huo4 qu3 xian4 shi2 shi2 jian1")
#example(
  [在游戏中获取计算机上的现实时间。],
  [
    命令方块的方块实体数据有这样一条字段：#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") `LastOutput`，这条字段会存储上一个命令的输出。当上一条命令执行有误的时候，会有如下的输出：`[时:分:秒]错误内容`，其中 `[时:分:秒]` 便是计算机系统上的现实时间。

    因此需要放置一个命令方块，在其中执行错误的命令，随后获取命令方块的 #icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") `LastOutput` 数据，将时间截取出来。放置的命令方块可以为保持开启的循环型命令方块以每刻获取当前时间。

    首先不妨在$(0,0,0)$（确保该位置已被加载）放置一个保持开启的循环型命令方块，控制台中含有以下的错误命令：
    #codebox("advancement")
    #h(-2em)命令方块是否保持开启由字段 #icon("nbt-bool") `auto` 控制，保持开启需要的值为 `true`。控制台命令由 #icon("nbt-string") 存储。放置此命令方块所需的命令为
    #codebox("setblock 0 0 0 repeating_command_block{auto:true,Command:\"advancement\"}")
    然后高频获取 #icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") `LastOutput`，此时的 #icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") `LastOutput` 内容大致如下所示：
    #codebox("{extra: [{color: \"red\", extra: [{click_event: {action: \"suggest_command\", command: \"/advancement\"}, color: \"gray\", extra: [\"...\", \"dvancement\", {color: \"red\", italic: 1b, translate: \"command.context.here\"}], text: \"\"}], text: \"\"}], text: \"[16:40:25] \"}
")
    #h(-2em)其中的 `[16:40:25]` 需要被截取，这是一个字符串，可以用字符串切片得到任意的形式。比如，将整个时间切出来、去除外侧的方括号，将结果存入命令存储 `foo:test` 的自定义字段 #icon("nbt-string") `system_time`，显然需要从第2个字符切到第9个，命令为：
    #codebox("data modify storage foo:test system_time set string block 0 0 0 LastOutput.text 1 9")
    #h(-2em)现在就可以用文本组件将这个结果显示出来：
    #codebox("{source:\"storage\",nbt:\"system_time\",storage:\"foo:test\}")
    或者也可以单独将时、分、秒截取出来：
    #codebox("data modify storage foo:clock system_time.hour set string block 0 0 0 LastOutput.text 1 3")
    #codebox("data modify storage foo:clock system_time.minute set string block 0 0 0 LastOutput.text 4 6")
    #codebox("data modify storage foo:clock system_time.second set string block 0 0 0 LastOutput.text 7 9")
    #h(-2em)不过，字符串切片得到的结果都是字符串，如果需要对这些时间数据进行运算，则需要使用宏将它们转换成数值：
    #codefile(
      lang: "mcfunction",
      title: "data > foo > function > clock.mcfunction",
      "function foo:clock_macro with storage foo:clock system_time"
    )
    #codefile(
      lang: "mcfunction",
      title: "data > foo > function > clock_macro.mcfunction",
      "$scoreboard players set #system_time_hour var $(hour)
$scoreboard players set #system_time_minute var $(minute)
$scoreboard players set #system_time_second var $(second)"
    )
  ]
)
#cite(<get_system_time>, form: none)
== 实体<sec:entity>
存储实体格式的Anvil文件位于文件夹 #icon("folder") `entities` 下，相应字段能够存储绝大部分种类的实体数据，只有玩家的数据不在此处，因此本节所讲述的实体格式不会包含任何与玩家有关的信息。
=== 处理实体的命令
==== 命令 `/summon`
通常地、如果需要生成一个实体，除了用创造模式物品栏里的刷怪蛋外，还可以用命令 `/summon` 生成一个自定义的实体，这使得实体的性质更丰富。命令 `/summon` 需要的参数等级为2，语法为：#index(index: "command", "summon")
#codebox("summon <entity> [<pos>] [<nbt>]")
#param-desc(
  [`<entity>`（召唤实体 `minecraft:entity_summon`）], [生成实体的命名空间ID，必须为可召唤实体的命名空间ID。],
  [`[<pos>]`（三维坐标 `minecraft:vec3`）], [可选，生成该实体的坐标，坐标使用中心点校准。如不指定，则使用命令执行位置。命令中坐标的位置必须已经加载。],
  [`[<nbt>]`（NBT复合标签 `minecraft:nbt_compound_tag`）], [可选，该实体的NBT数据，必须为SNBT，是根标签的值。如不指定，则会在坐标的位置生成一个默认的实体。]
)
例如，在命令执行者的位置生成一只猪：
#codebox("summon pig")
#h(-2em)或
#codebox("summon pig ~ ~ ~")
当然也可以在命令后面添加SNBT以自定义这只猪的各项性质，下面的内容将重点介绍实体SNBT的写法。
==== 命令 `/kill`
命令用于清除实体，所需权限等级为2，语法为：#index(index: "command", "kill")
#codebox("kill [<targets>]")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [可选，需要是玩家名称、UUID或目标选择器。不指定则清除命令执行者自身。]
)
==== 命令 `/ride`
命令 `/ride` 用于控制实体的骑乘关系，它需要的权限等级为2，以下是所有用法：#index(index: "command", "ride")
===== 让指定骑手骑乘指定坐骑，语法为
#codebox("ride <target> mount <vehicle>")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [骑手，可以为玩家名称、UUID或目标选择器。],
  [`<vehicle>`（实体 `minecraft:entity`）], [坐骑，可以为玩家名称、UUID或目标选择器。]
)
注意，遇到下列情况即命令执行失败：
====== *坐骑为玩家或标记*；
====== 骑手已骑乘了其他坐骑；
====== 骑手和坐骑为同一实体；
====== 骑手和坐骑有直接或间接的骑乘关系。
#example(
  [让最近的物品展示实体骑乘最近的狼。],
  [
    命令为
    #codebox("ride @n[type=item_display] mount @n[type=wolf]")
  ]
)
===== 让指定骑手取消骑乘当前的坐骑，语法为
#codebox("ride <target> dismount")
#wrap-content(
  tips(
    width: 20em,
    [
      + 可以多层嵌套骑乘实体，如：让狼作为坐骑，物品展示实体骑乘狼，标记骑乘物品展示实体。
      + 常用的坐骑为狼，常用的骑手为展示实体。狼提供移动方式，也可以跟随玩家；展示实体能提供自定义的外观和动画。
      + 标记不能作为坐骑！如果需要用到标记，请将它作为骑手使用。
    ]
  ),
  [

    对原版技术性开发而言，骑乘是常用的组合实体的手段。通常是将一个能够提供移动方式的实体作为坐骑，提供外观的实体作为骑手，这样就能创建自定义实体。在编辑其数据的时候，也可以用 `/execute on` 子命令精确地指向具有骑乘关系的实体。
  ],
  align: left
)
==== 命令 `/swing`
命令 `/swing` 用于控制实体手臂的挥动，注意，动作仅在渲染意义上有效，并不会有攻击或交互的效果。此命令所需的权限等级为2，语法为：#index(index: "command", "swing")
#codebox("swing [<targets>] [mainhand|offhand]")
#param-desc(
  [`[<targets>]`（实体  `minecraft:entity`）], [需要挥动手臂的实体，只对生物有效，可以为玩家名称、UUID或目标选择器。],
  [`[mainhand|offhand]` ], [指定挥动的是主手 `mainhand` 还是副手 `offhand`，默认为主手。]
)
=== 实体共通标签
与方块实体类似，所有实体的根标签下一定有一些共同存在的子标签，这些标签不会因为实体种类的变化而有所改变，于是称这类标签为#proper-noun(display: "实体共通标签（Tags common to all entities）", "shi2 ti3 gong4 tong1 biao1 qian1")。下面列举了所有的实体共有的字段，注意，不是所有的实体共通标签都能被命令 `/data` 所修改。
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-short") *Air*: 该实体剩余的空气值。]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 该实体的自定义名称，未指定名称时该标签不存在。需要是一个文本组件。]),
  (1, [#icon("nbt-bool") *CustomNameVisible*: 该实体的自定义名称能否总是显示在该实体的上方，未指定名称时不存在。]),
  (1, [#icon("nbt-string")#icon("nbt-compound") *data*: 任意自定义数据。写入数据的时候可以使用 #icon("nbt-string") 字符串形式，但存储的时候一律存储为 #icon("nbt-compound") 复合标签形式。]),
  (2, [自定义数据结构]),
  (1, [#icon("nbt-double") *#underline[fall_distance]*: 该实体已下坠的距离。]),
  (1, [#icon("nbt-short") *#underline[Fire]*: 该实体身上的火焰距熄灭的剩余游戏刻时长。对于未着火的玩家，此值为 `-20s`，对于未着火的其他实体，此值为 `-1s`。]),
  (1, [#icon("nbt-bool") *Glowing*: 该实体是否发光。]),
  (1, [#icon("nbt-bool") *HasVisualFire*: 该实体是否在外观上有着火效果。]),
  (1, [#icon("nbt-string") *#underline[id]*: 该实体的命名空间ID，此值不可被修改。]),
  (1, [#icon("nbt-bool") *#underline[Invulnerable]*: 该实体是否会受到伤害。这里的伤害是指除创造模式玩家造成的伤害和属于伤害类型标签 `#bypasses_invulnerability` 以外的其他伤害。]),
  (1, [#h(-2em)#icon("nbt-list") *#underline[Motion]*: 列表中存在三个元素，均为双精度浮点数，用于表示该实体在当前游戏刻的速度。在三维空间中将速度矢量分解为沿三个坐标轴的速度矢量，即$"d"x$、$"d"y$和$"d"z$，分别用此列表第一、二、三个元素表示。#figure(caption:"速度矢量的分解",image("图片/速度矢量的分解.png",width:12em))]),
  (1, [#icon("nbt-bool") *NoGravity*: 该实体是否会受到重力影响。]),
  (1, [#icon("nbt-bool") *#underline[OnGround]*: 该实体是否接触地面。]),
  (1, [#icon("nbt-list") *Passengers*: 骑乘该实体的实体。]),
  (2, [#icon("nbt-compound") 一个骑乘该实体的实体。]),
  (3, [实体格式]),
  (1, [#icon("nbt-int") *#underline[PortalCooldown]*: 该实体距下次被允许穿过下界传送门前往另一维度的游戏刻。]),
  (1, [#icon("nbt-list") *#underline[Pos]*: 该实体的三维坐标，列表内元素顺序不可改变。]),
  (2, [#icon("nbt-double") $x$坐标。]),
  (2, [#icon("nbt-double") $y$坐标。]),
  (2, [#icon("nbt-double") $z$坐标。]),
  (1, [#icon("nbt-list") *#underline[Rotation]*: 该实体的朝向，列表内元素顺序不可改变。]),
  (2, [#icon("nbt-float") 偏航角。]),
  (2, [#icon("nbt-float") 俯仰角。]),
  (1, [#icon("nbt-bool") *Silent*: 该实体是否会发出声音。]),
  (1, [#icon("nbt-list") *Tags*: 该实体的所有记分板标签。]),
  (2, [#icon("nbt-compound") 一个记分板标签。]),
  (1, [#icon("nbt-int") *TicksFrozen*: 可能不存在，表示实体已冷冻的时间。当实体在细雪中时每游戏刻增加 `1`，离开细雪则每游戏刻减少 `2`。为 `0` 时此标签不存在。]),
  (1, [#icon("nbt-int_array") *#underline[UUID]*: 该实体的UUID。])
)
如果一个实体属于生物一类（Java类名LivingEntity），则它拥有如下的共同标签，这些标签被称为*生物共通标签*：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-float") *#underline[AbsorptionAmount]*: 此生物的伤害吸收值。]),
  (1, [#icon("nbt-list") *active_effects*: 该生物拥有的状态效果列表。]),
  (2, [#icon("nbt-compound") 一个状态效果。]),
  (3, [格式见节@sec:active_effects。]),
  (1, [#icon("nbt-list") *attributes*: 该实体的属性列表。]),
  (2, [#icon("nbt-compound") 一个属性。]),
  (3, [格式见节@sec:attribute。]),
  (1, [#icon("nbt-compound") *Brain*: 生物记忆的相关信息，用于AI计算。不使用生物记忆的实体该项标签为空。具体格式见附录@sec:entity_data 的相关说明。]),
  (2, [#icon("nbt-compound") *#underline[memories]*: 生物记忆。此处存储长期记忆，不存储短期记忆，短期记忆仅存在于内存中临时使用。]),
  (3, [#icon("nbt-compound") *\<生物记忆类型命名空间ID>*: 一项长期记忆。]),
  (4, [#icon("nbt-long") *ttl*: 该记忆距离过期的游戏刻数。每种生物记忆的初始过期时间都不同，此值为 `0l` 时该记忆被删除。]),
  (4, [#icon("nbt-bool")#icon("nbt-int")#icon("nbt-long")#icon("nbt-int_array")#icon("nbt-list")#icon("nbt-compound") *value*: 记忆的值，每种生物记忆的值类型都不同。]),
  (1, [#icon("nbt-list") *current_explosion_impact_pos*: 此生物被所有形式的爆炸击退时的坐标，列表内元素顺序不可改变。#icon("nbt-int") `current_impulse_context_reset_grace_time` 为 `0` 时此字段被删除。]),
  (2, [#icon("nbt-double") $x$坐标。]),
  (2, [#icon("nbt-double") $y$坐标。]),
  (2, [#icon("nbt-double") $z$坐标。]),
  (1, [#icon("nbt-int") *#underline[current_impulse_context_reset_grace_time]*: 爆炸击退减少摔落伤害的最长时间，单位为游戏刻。]),
  (1, [#icon("nbt-short") *#underline[DeathTime]*: 距离生物死亡而被删除的时间。生物存活时该值为 `0s`，死亡后每游戏刻增加 `1s`，直到该值达到 `20s` 时生物被删除。]),
  (1, [#icon("nbt-compound") *equipment*: 生物的装备。]),
  (2, [#icon("nbt-compound") *\<槽位>*: 在此槽位上装备的物品。有效的槽位有 `mainhand`、`offhand`、`feet`、`legs`、`chest`、​`head`、`body` 和 `saddle`。]),
  (3, [无槽位物品格式，见节@sec:item_stack。]),
  (1, [#icon("nbt-bool") *FallFlying*: 该生物是否处于滑翔状态。]),
  (1, [#icon("nbt-float") *Health*: 该生物的生命值。]),
  (1, [#icon("nbt-int") *#underline[HurtByTimestamp]*: 以该生物生成的时间为准，存储该生物上次被伤害的时间。]),
  (1, [#icon("nbt-short") *#underline[HurtTime]*: 该生物受伤后伤害免疫阶段（变红）的剩余时间，初始为10 gt，每游戏刻减1。]),
  (1, [#icon("nbt-int_array") *last_hurt_by_mob*: 当前最后一次攻击该生物的生物的UUID。]),
  (1, [#icon("nbt-int_array") *last_hurt_by_player*: 当前最后一次攻击该生物的玩家的UUID。]),
  (1, [#icon("nbt-int") *last_hurt_by_player_memory_time*: 生物被玩家攻击后该值为 `100`（单位为游戏刻），每游戏刻减少1，此值降到 `0` 以下后清除 #icon("nbt-int_array") `last_hurt_by_player` 的数据，并删除此字段。]),
  (1, [#icon("nbt-compound") *locator_bar_icon*: 生物的路径点图标。]),
  (2, [#icon("nbt-int")#icon("nbt-list") *color*: 此生物路径点的图标颜色，可以用 #icon("nbt-int") 整型指定RGB颜色，对二进制而言，每八位表示一个通道，从高到低依次为R、G、B通道。也可以用 #icon("nbt-list") 列表分别指定每个通道。游戏在存储时一律存储为 #icon("nbt-int") 整型。]),
  (3, [*若使用 #icon("nbt-list") 列表形式，则包含以下字段：*], false),
  (3, [#icon("nbt-float") R通道分量，表示红色值。]),
  (3, [#icon("nbt-float") G通道分量，表示绿色值。]),
  (3, [#icon("nbt-float") B通道分量，表示蓝色值。]),
  (2, [#icon("nbt-string") *style*: 路径点样式的命名空间ID。]),
  (1, [#icon("nbt-int_array") *sleeping_pos*: 该生物所睡床的坐标，依次为$x$、$y$、$z$坐标。该生物不睡觉时此标签不存在。]),
  (1, [#icon("nbt-string") *Team*: 可选，该生物所在的队伍。]),
  (1, [#icon("nbt-int") *ticks_since_last_hurt_by_mob*: 生物最近一次被生物攻击后距离上次攻击的游戏刻数。])
)
具体到每一个实体时，除了上述的共通标签，还可以使用实体自身特有的标签，由于篇幅限制，本章无法对所有实体的所有标签进行分析，故将它们列举于附录@sec:entity_data 中，供读者查阅。
=== 实体数据的应用实例
实体种类、可用字段繁多，以下列举一些应用实例以说明实体数据的使用。
#example(
  [生成一个有双臂、没有基座的盔甲架。],
  [
    查阅附录@sec:entity_data，盔甲架的两种标签：#icon("nbt-bool") `ShowArms` 和#icon("nbt-bool") `NoBasePlate` 分别控制盔甲架是否显示双臂、是否使基座不可见。易知生成有双臂、没有基座的盔甲架的命令可以为
    #codebox("summon minecraft:armor_stand ~ ~ ~ {ShowArms:true,NoBasePlate:true}")
  ]
)
#example(
  [对于世界中所有的棕色绵羊，使用命令将其中任意一只变成粉红色绵羊。],
  [
    在这个例子中，需要用命令进行两个行为：一是选择目标，二是对目标的数据进行更改。前者即为@chap:target_selector\所讲的目标选择器，显然选择世界中任意一只绵羊的目标选择器为
    #codebox("@e[type=sheep,sort=random,limit=1]")
    其次要对选择的绵羊进行进一步的限定。根据附录@sec:entity_data，控制绵羊外观颜色的标签为 #icon("nbt-byte") `Color`，使用颜色的数字ID，这也是扁平化后少数还存留数字ID的地方，其对应关系如下表所示：
    #split-table(
      caption: "颜色数字ID表",
      original-cols: (auto, auto),
      seperator: (2,),
      header: ([数值], [颜色]),
      data: (
        [`0`], [白色],
        [`1`], [橙色],
        [`2`], [品红],
        [`3`], [淡蓝],
        [`4`], [黄色],
        [`5`], [黄绿],
        [`6`], [粉红],
        [`7`], [灰色],
        [`8`], [淡灰],
        [`9`], [青色],
        [`10`], [紫色],
        [`11`], [蓝色],
        [`12`], [棕色],
        [`13`], [绿色],
        [`14`], [红色],
        [`15`], [黑色]
      )
    )
    其中棕色对应数据值 `12`。根据选择器NBT参数的语法，将这个目标选择器写为
    #codebox("@e[type=sheep,sort=random,limit=1,nbt={Color:12b}]")
    第二步为更改目标实体的数据，很明显需要使用命令 `/data merge` 或 `/data modify`。本例使用 `/data merge` 的写法，粉红色的数据值为 `6`，于是最终的命令为
    #codebox("data merge entity @e[type=sheep,sort=random,limit=1,nbt={Color:12b}] {Color:6b}")
  ]
)
#example(
  [
    数据包AMR Bot的无人机是由多个实体通过骑乘拼接起来的自定义实体。在设计上无人机需要跟随玩家，因此根实体选用狼，现生成这个自定义实体，要求狼有以下的性质：
    + 隐形；
    + 静音；
    + 无法受到伤害；
    + 被一个物品展示实体骑乘，这个物品展示实体又被一个交互实体骑乘。其中物品展示实体展示的是一个使用物品模型 `astrbot:bot` 的追溯指针，交互实体拥有记分板标签 `astrbot.interaction`。
    #figure(
      caption: "AMR Bot数据包",
      image("图片/AMR Bot数据包.png", width: 5em)
    )
  ],
  [
    首先确定这个自定义实体的类型为狼，其次对于这个自定义实体的特征，可以逐个分析出实现这些特征所需要的标签：
    + 隐形：狼的可用字段中并没有直接控制它是否隐形的，因此需要使用状态效果。在 #icon("nbt-list") `active_effects` 直接给狼定义无限时长的隐身状态效果，不显示粒子效果。
      #codebox("active_effects:[{id:\"minecraft:invisibility\",duration:-1,show_particles:false}]")
    + 静音：由字段 #icon("nbt-bool") `Silent` 定义。
      #codebox("Silent:true")
    + 无法受到伤害：由字段 #icon("nbt-bool") `Invulnerable` 定义。
      #codebox("Invulnerable:true")
    + 被一个物品展示实体骑乘，这个物品展示实体又被一个交互实体骑乘：实体的骑乘由实体共通标签 #icon("nbt-list") `Passengers` 存储，内部每一个元素都是一个完整的实体格式，写法如下所示。
      #codebox("Passengers: [ { id: \"minecraft:item_display\", item: { components: { \"minecraft:item_model\": \"astrbot:bot\" }, id: \"minecraft:recovery_compass\" }, Passengers: [ { id: \"minecraft:interaction\", Tags: [\"astrbot.interaction\"] } ] } ]")
    将上面的所有标签整合到一起，放在命令 `/summon` 中，可得到
    #codebox("summon wolf ~ ~ ~ {
  active_effects:[
    {
      id:\"minecraft:invisibility\",
      duration:-1,
      show_particles:false
    }
  ],
  Silent:true,
  Invulnerable:true,
  Passengers:[
    {
      id:\"minecraft:item_display\",
      item:{
        components:{
          \"minecraft:item_model\":\"astrbot:bot\"
        },
        id:\"minecraft:recovery_compass\"
      },
      Passengers:[
        {
          id:\"minecraft:interaction\",
          Tags: [\"astrbot.interaction\"]
        }
      ]
    }
  ]
}") <code:summon_amr_bot>
    关于已生成无人机的具体编辑操作，见@exa:modify_amr_bot。
  ]
) <exa:amr_bot>
#example(
  [
    生成一个潜行的Mu_xian玩家模型。
    #figure(
      caption: "",
      image("图片/潜行Mu_xian.png", width: 5em)
    )
  ],
  [
    参考附录@sec:entity_data，命令为
    #codebox("summon mannequin ~ ~ ~ {profile:{name:\"Mu_xian\"},pose:\"crouching\"}")
  ]
)
#example(
  [
    生成一个物品展示框，使之朝向上方，里面存储了一个被旋转了7次的铁镐，且该物品展示框无法被冒险模式的玩家破坏。
  ],
  [
    查阅附录@sec:entity_data，除了实体共通标签外，物品展示框还拥有下列标签：
    #tree(
      (0, [#icon("nbt-compound") 根标签]),
      (1, [#icon("nbt-byte") *#underline[Facing]*: 物品展示框的朝向，用 `0b` 表示朝向下方，`1b` 表示上方，`2b` 表示北方，`3b` 表示南方，`4b` 表示西方，`5b` 表示东方。]),
      (1, [#icon("nbt-bool") *#underline[Fixed]*: 物品展示框是否为一个锁定的物品展示框。锁定的物品展示框意思为，该物品展示框无法被绝大部分伤害源所破坏（特例：处于创造模式的玩家），并且里面物品无法被旋转、放置或移除；此外该物品展示框无论是否有支撑方块，均不会被破坏。]),
      (1, [#icon("nbt-bool") *#underline[Invisible]*: 物品展示框是否隐形。]),
      (1, [#icon("nbt-compound") *Item*: 物品展示框中的物品。]),
      (2, [无槽位物品格式]),
      (1, [#icon("nbt-float") *ItemDropChance*: 物品展示框被破坏时内部物品掉落的概率。]),
      (1, [#icon("nbt-byte") *ItemRotation*: 物品被旋转的次数。])
    )
    详细的物品格式概念将在节@sec:item_stack 中讲解，这里先给出一个铁镐的物品格式：
    #codebox("{id:\"minecraft:iron_pickaxe\",count:1}")
    物品展示框的其他一些标签在此用不到，故不单独介绍它们。要想生成一个题设要求的物品展示框，可以不难写出如下的命令：
    #codebox("summon item_frame ~ ~ ~ {
  Facing:1b,
  Item:{
    id:\"minecraft:iron_pickaxe\",
    count:1
  },
  ItemRotation:7b,
  Invisible:1b,
  Fixed:1b
}")
  ]
) <exa:item_frame>
#example(
  [
    为标签 #icon("nbt-int") `DisabledSlots` 编写数据，使之禁用盔甲架如下部位的特定交互事件：
    + 添加和改变靴子栏的物品； <enu:armor_stand_boot>
    + 添加、移除和改变主手的手持物品。 <enu:armor_stand_mainhand>
  ],
  [
    标签 #icon("nbt-int") `DisabledSlots` 用于禁止玩家与盔甲架某些部位的交互。虽然它使用整型数据，但在内部其实是使用二进制存储盔甲架物品栏可交互信息的。该二进制数据一共有22位数字，每一位都用于存储禁用的部位与禁用的交互动作。对于每一位数字，使用 `1` 以表示禁用与特定部位物品的特定交互动作，使用 `0` 以解除禁用。每一位的禁用部位和禁用动作如下表所示：
    #split-table(
      caption: "盔甲架禁用部位与禁用动作",
      original-cols: (auto, auto),
      seperator: (2,),
      header: ([位数], [禁用部位与禁用动作]),
      data: (
        [0], [添加和改变主手的手持物品],
        [1], [添加和改变靴子栏的物品],
        [2], [添加和改变护腿栏的物品],
        [3], [添加和改变胸甲栏的物品],
        [4], [添加和改变头盔栏的物品],
        [5], [添加和改变副手的手持物品],
        [6], [空位],
        [7], [空位],
        [8], [移除和改变主手的手持物品],
        [9], [移除和改变靴子栏的物品],
        [10], [移除和改变护腿栏的物品],
        [11], [移除和改变胸甲栏的物品],
        [12], [移除和改变头盔栏的物品],
        [13], [移除和改变副手的手持物品],
        [14], [空位],
        [15], [空位],
        [16], [添加主手的手持物品],
        [17], [添加靴子栏的物品],
        [18], [添加护腿栏的物品],
        [19], [添加胸甲栏的物品],
        [20], [添加头盔栏的物品],
        [21], [添加副手的手持物品]
      )
    )
    禁用特定部位和特定交互动作时，需要先确定禁用的部位和动作分属哪些位数，再将这些位上的数据组合成二进制数据。第@enu:armor_stand_boot 小题禁用添加和改变靴子栏的物品，控制这项禁用为二进制数据的第1位（注意与第0位作区分），所以二进制数据为 `10`，即：
    #codebox("DisabledSlots:0b10")
    第@enu:armor_stand_mainhand 小题的禁用项使用了多个位数，分别为第0位禁用添加和改变主手的手持物品和第8位移除和改变主手的手持物品，得到二进制数据 `100000001`，即：
    #codebox("DisabledSlots:0b100000001")
  ]
)
#example(
  [有一个位于坐标$(0,70,0)$的朝向为南、左内角形状的橡木楼梯，将这个橡木楼梯变成受到重力影响的下落方块，要求石头每多下落一格，就对下方的实体多造成2点伤害。],
  [
    有一类实体被称作#proper-noun(display: "下落的方块（Falling block）", "xia4 luo4 de fang1 kuai4")，顾名思义，这类实体由方块转化而来，受到重力的影响。一般下落的方块可由游戏中原本受重力影响的方块，如沙子、沙砾、铁砧等转化，使用NBT可以让其他不受重力影响的方块也转化为下落的方块。

    在这个题设中，需要用到的下落的方块的标签如下：
    #tree(
      (0, [#icon("nbt-compound") 根标签]),
      (1, [#icon("nbt-compound") *#underline[BlockState]*: 该下落的方块代表的方块。]),
      (2, [#icon("nbt-string") *#underline[Name]*: 方块的命名空间ID。]),
      (2, [#icon("nbt-compound") *Properties*: 可选，由若干方块属性组成的方块状态。]),
      (3, [#icon("nbt-string") *\<方块属性>*: 标签名为方块状态的属性，值使用字符串表示。]),
      (1, [#icon("nbt-list") *FallHurtAmount*: 下落的方块每多下落一格对下方实体造成伤害的增量，仅当 #icon("nbt-bool") `HurtEntities` 存在时有效。]),
      (1, [#icon("nbt-bool") *#underline[HurtEntities]*: 是否对砸中的实体造成伤害。])
    )
    首先指定一个朝向为南、左内角形状的橡木楼梯，使这个橡木楼梯变成下落的方块，则标签 #icon("nbt-compound") `BlockState` 为
    #codebox("BlockState:{Name:\"minecraft:oak_stairs\",Properties:{facing:\"south\",shape:\"inner_left\"}}")
    将它变为下落的方块：
    #codebox("summon falling_block 0 70 0 {
  BlockState:{
    Name:\"minecraft:oak_stairs\",
    Properties:{
      facing:\"south\",
      shape:\"inner_left\"
    }
  },
  FallHurtAmount:2.0f,
  HurtEntities:true
}")
  ]
) <exa:falling_block>
#example(
  [生成一个掉落物钻石，使之永远不会自行消失。],
  [
    物品虽然在物品栏中严格使用物品格式，但是掉落物形式的物品却是一种实体，使用实体格式，物品本身的信息被打包在物品堆叠组件中成为实体格式的一部分。掉落物物品的实体格式中有一个标签名为 #icon("nbt-compound") `Item`，复合标签内即为该物品的物品堆叠组件。现在先提供一个钻石的物品格式：
    #codebox("{id:\"minecraft:diamond\"}")
    题设还有一个要求：物品永远不会自行消失。掉落物物品的实体格式有一个名为 #icon("nbt-short") `Age` 的标签，存储该掉落物物品已存在的游戏刻长度，即从生成至未被捡起的时长。该标签的值会随着游戏过程而增加，掉落物物品刚生成时值为 `0s`，一旦值达到 `6000s`，该物品就会消失，在游戏中表现为5分钟内掉落物未被捡起就自行消失。如果值被设为 `-32768s`，则该值不会随着游戏过程而增加，也就可以实现物品永远不会自行消失的目地。最终的命令为：
    #codebox("summon item ~ ~ ~ {Item:{id:\"minecraft:diamond\"},Age:-32768s}")
  ]
)
#index(index: "method", display: "通过Motion控制实体的运动", "tong1 guo4 Motion kong4 zhi4 shi2 ti3 de yun4 dong4")
#example(
  [生成一个雪球，使之在生成的那一刻拥有水平向正东南方的初速度。],
  [
    可以在生成实体的时候直接指定 #icon("nbt-list") `Motion`，水平向正东南方的$x$和$z$方向速度分量应为正且相同，$y$方向分量为0。命令为
    #codebox("summon snowball ~ ~ ~ {Motion:[1.0f,0.0f,1.0f]}")
    同时调整 `Motion[0]` 和 `Motion[2]` 可以控制雪球发射的初速度大小。
  ]
)
== 状态效果<sec:active_effects>
有时候需要对实体施加一定的增益或减益，这种给予增益或减益的手段便是#proper-noun(display: "状态效果（Status effect）", "zhuang4 tai4 xiao4 guo3")，这是一种从实体外部施加作用于实体的、在限定时间内给实体提供正面或负面效果的游戏机制。

一个状态效果包含有三个要素，即命名空间ID、作用时间和倍率。命名空间ID决定了施加于实体的是何种状态效果，对实体起正面作用还是负面作用；作用时间决定了该状态效果持续的时间；倍率决定了该状态效果的等级：*等级比倍率大1*，例如，若一个状态效果等级为I，则其倍率为0。

大多数的状态效果都随着其倍率（或等级）增大而效果增强，少数如夜视在任何倍率下效果都是一样的。一个状态效果的持续时间可以是有限的，也可以是无限的。*一个实体可以同时拥有多个不同种类的状态效果，但不能拥有相同的状态效果，即使其倍率不同。*当一个实体拥有某种状态效果，其持续时间和倍率都是确定的，则无法为这个实体施加倍率更低的同种状态效果，但可以施加倍率更高的同种状态效果，此时原先低倍率的状态效果会被隐藏，但持续时间会继续扣除，*若高倍率的状态效果终止，则低倍率的状态效果会重新出现。*

下表列举了所有可用状态效果的ID，其中命名空间前缀 `minecraft:` 已省略：
#triple-split-table(
  caption: "状态效果表",
  original-cols: (auto, auto),
  seperator: (2, 5),
  header: ([状态效果], [英文ID]),
  data: (
    [速度], [`speed`],
    [缓慢], [`slowness`],
    [急迫], [`haste`],
    [挖掘疲劳], [`mining_fatigue`],
    [力量], [`strength`],
    [瞬间治疗], [`instant_health`],
    [瞬间伤害], [`instant_damage`],
    [跳跃提升], [`jump_boost`],
    [反胃], [`nausea`],
    [生命恢复], [`regeneration`],
    [抗性提升], [`resistance`],
    [防火], [`fire_resistance`],
    [水下呼吸], [`water_breathing`],
    [隐身], [`invisibility`],
    [失明], [`blindness`],
    [夜视], [`night_vision`],
    [饥饿], [`hunger`],
    [虚弱], [`weakness`],
    [中毒], [`poison`],
    [凋零], [`wither`],
    [生命提升], [`health_boost`],
    [伤害吸收], [`absorption`],
    [饱和], [`saturation`],
    [发光], [`glowing`],
    [漂浮], [`levitation`],
    [幸运], [`luck`],
    [霉运], [`unluck`],
    [缓降], [`slow_falling`],
    [潮涌能量], [`conduit_power`],
    [海豚的恩惠], [`dolphins_grace`],
    [不祥之兆], [`bad_omen`],
    [村庄英雄], [`hero_of_the_village`],
    [黑暗], [`darkness`],
    [试炼之兆], [`trial_omen`],
    [袭击之兆], [`raid_omen`],
    [蓄风], [`wind_charged`],
    [盘丝], [`weaving`],
    [渗浆], [`oozing`],
    [寄生], [`infested`],
    [鹦鹉螺之息], [`breath_of_the_nautilus`]
  )
)
命令 `/effect` 用于移除或施加实体的状态效果，它需要的权限等级为2，以下是所有用法：#index(index: "command", "effect")
===== 移除状态效果，语法为
#codebox("effect clear [<targets>] [<effect>]")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [可选，指定的目标实体，必须为玩家名称、UUID或目标选择器，不填写则清除命令执行者自身的所有状态效果。],
  [`[<effect>]`（注册项 `minecraft:resource`）], [可选，指定要移除的状态效果的命名空间ID，不填写则清除指定实体的所有状态效果。]
)
===== 施加状态效果，语法为
#codebox("effect give <targets> <effect> [<seconds>] [<amplifier>] [<hideParticles>]")
#param-desc(
  [`[<seconds>]`（整型 `brigadier:integer`）], [状态效果持续时间，为不大于 `1000000` 的正整数。对于除瞬间伤害（`instant_damage`）、瞬间治疗（`instant_health`）和饱和（`saturation`）外的状态效果而言单位均为秒，而这三者的单位则为游戏刻。如果该参数不指定，则将除了除瞬间伤害、瞬间治疗和饱和外的状态效果默认设定为30秒，瞬间伤害、瞬间治疗和饱和则被设为1gt。],
  [`[<amplifier>]`（整型 `brigadier:integer`）], [可选，状态效果的倍率，必须为不大于 `255` 的非负整数。倍率是比等级小 `1` 的参数，倍率设为 `0` 时，等级为I；设为 `1` 时，等级为II。默认为 `0`。],
  [`[<hideParticles>]`（布尔值 `brigadier:bool`）], [是否显示粒子效果和HUD上显示的状态效果图标。该参数在冒险地图中较为常用。]
)
===== 施加无限时长的状态效果，语法为
#codebox("effect give <targets> <effect> infinite [<amplifier>] [<hideParticles>]")
#example(
  [给所有玩家施加2秒的速度提升II效果。],
  [
    命令如下所示，注意等级为II，则倍率为1：
    #codebox("effect give @a speed 2 1")
  ]
)
存储实体状态效果的NBT数据结构如下所示：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-list") *active_effects*: 该生物拥有的状态效果列表。]),
  (2, [#icon("nbt-compound") 一个状态效果。]),
  (3, [#icon("nbt-bool") *ambient*: 该状态效果是否由信标施加。]),
  (3, [#icon("nbt-byte") *amplifier*: 该状态效果的倍率。若实际倍率大于127，设实际倍率为$s$，此标签存储的值为$127-s$。]),
  (3, [#icon("nbt-int") *duration*: 状态效果的持续时间，单位为游戏刻。如果持续时间为无尽，则值为 `-1`。]),
  (3, [#icon("nbt-compound") *hidden_effect*: 存储类型、命名空间ID相同但倍率较低的状态效果，在高倍率状态效果结束后该状态效果会出现，是为低倍率状态效果提供隐藏功能的标签。]),
  (4, [不包含字段 #icon("nbt-string") `id` 的状态效果格式]),
  (3, [#icon("nbt-string") *id*: 该状态效果的ID。]),
  (3, [#icon("nbt-bool") *show_icon*: 是否显示图标。]),
  (3, [#icon("nbt-bool") *show_particles*: 是否显示粒子效果。])
)
#example(
  [直接生成一个村民，使之带有10秒的跳跃提升II和10秒的速度I效果。],
  [
    命令如下所示，注意标签 #icon("nbt-int") `duration` 数据的单位为游戏刻，因此要把10秒化为200gt：
    #codebox("summon villager ~ ~ ~ {active_effects:[{id:\"minecraft:jump_boost\",duration:200,amplifier:1b},{Id:\"minecraft:speed\",duration:200,amplifier:0b}]\}")
  ]
)
== 属性<sec:attribute>
相对于状态效果这样由外部施加给实体的机制，决定了诸如攻击伤害、移动速度这样的实体本身的“能力”，游戏有另一套机制来描述之，即属性。*#proper-noun(display: "属性（Attribute）", "shu3 xing4")是一套用于决定玩家和生物本身能力的机制。*

一个属性一定存在一个*属性名称*，这个名称需要是一个命名空间ID。属性名称决定了该属性控制玩家和生物哪方面的能力，如移动速度、生命值上限。在属性的机制中使用特定的值以表示一方面能力的大小，即*属性的值*，为了与属性的基值做区分，通常称之为属性的最终值。这个值可以为浮点数。属性的值由两部分决定，一个是#proper-noun(display: "属性基值（Attribute base）", "shu3 xing4 ji1 zhi2")，另一个是属#proper-noun(display: "属性修饰符（Attribute modifiers）", "shu3 xing4 xiu1 shi4 fu2")。*若存在属性修饰符，则属性的最终值等于在基值上进行修饰后的值；若不存在属性修饰符，则属性的最终值等于基值。*下面举一个例子以说明这个机制运作的原理。

属性的基值是一个属性在不加任何修饰符、处于原本状态下的值，例如决定玩家攻击力的属性基值为1，表示玩家的基础攻击力为1，即不带任何装备、武器的情况下造成的伤害为1点（$0.5 times$#icon("sprite-heart_full")）。而玩家一旦手持武器，则造成的攻击会发生变化，但这并不意味着是玩家本身的攻击力得到了提升，而是因为手持的武器提供了一个属性修饰符，该修饰符在攻击力基值的基础上增加了一定的数值。因此玩家一次攻击造成的伤害值实际上是由两部分组成的，一部分是玩家本身的攻击力，另一部分是武器提供的加成。若一个玩家手持钻石剑，其单次攻击的伤害值为玩家攻击力的1点基值加上钻石剑的修饰符提供的6点加成值，总和为7点。

虽然修饰符可以自由地对属性的值进行修改，而对于特定名称的属性，其值必须处于一个规定的*值域*内，每种属性的值域各不相同。在实际修改属性的值时，一定要注意修改后的值是否超限。此外，每种属性各有一个*默认值*，若属性未定义基值，则使用默认值作为基值计算。

不同属性适用生物也不同，各自使用的基值也不相同。下面列举了所有的属性，包括它们的名称、值域、默认值和基值，其中名称的命名空间前缀 `minecraft:` 已省略。
#general-table(
  caption: "可用属性表",
  colspan: 6,
  columns: (auto, 11em, auto, auto, auto, auto),
  header: ([属性名称], [ID], [值域], [默认值], [适用生物], [基值]),
  table.cell(rowspan: 5)[护甲值], table.cell(rowspan: 5)[`armor`], table.cell(rowspan: 5)[0 \~ 30], table.cell(rowspan: 5)[0], [杀手兔], [8],
  [凋零], [4],
  [岩浆怪], [$3 times "体型"+1$],
  [僵尸、尸壳、溺尸、僵尸村民、僵尸猪灵], [2],
  [其他所有生物], [0],
  [盔甲韧性], [`armor_toughness`], [0 \~ 20], [0], [所有生物], [0],
  table.cell(rowspan: 16)[攻击伤害], table.cell(rowspan: 16)[`attack_damage`], table.cell(rowspan: 16)[0 \~ 2048], table.cell(rowspan: 16)[2], [巨人], [50],
  [监守者], [30],
  [铁傀儡], [15],
  [劫掠兽], [12],
  [青蛙], [10],
  [远古守卫者], [8],
  [末影人、猪灵蛮兵], [7],
  [幻翼], [#box(height: 2em, $display(cases(2"," s=0, 6+s"," s>0))$)#footnote[$s$为幻翼的体型，由 #icon("nbt-int") `size` 字段存储。]],
  [烈焰人、守卫者、成年疣猪兽、熊猫、北极熊、成年僵尸疣猪兽], [6],
  [猪灵、掠夺者、卫道士、僵尸猪灵], [5],
  [恼鬼、狼], [4],
  [旋风人、猫、嘎吱、海豚、溺尸、尸壳、豹猫、兔子、僵尸、僵尸村民], [3],
  [悦灵、美西螈、蜜蜂、沼骸、洞穴蜘蛛、苦力怕、末影螨、唤魔者、狐狸、成年山羊、幻术师、骷髅、史莱姆、蜘蛛、流浪者、女巫、凋灵、凋灵骷髅], [2],
  [岩浆怪、史莱姆], [$1+"体型"$],
  [幼年山羊、玩家、蠹虫], [1],
  [幼年疣猪兽、幼年僵尸疣猪兽], [0.5],
  table.cell(rowspan: 3)[击退], table.cell(rowspan: 3)[`attack_knockback`], table.cell(rowspan: 3)[0 \~ 5], table.cell(rowspan: 3)[0], [劫掠兽、监守者], [1.5],
  [疣猪兽、僵尸疣猪兽], [1],
  [其他所有生物], [0],
  [攻击速度], [`attack_speed`], [0 \~ 1024], [4], [玩家], [4],
  [方块破坏速度], [`block_break_speed`], [0 \~ 1024], [1], [玩家], [1],
  [方块交互距离], [`block_interaction_range`], [0 \~ 64], [4.5], [玩家], [4.5],
  [着火时间], [`burning_time`], [0 \~ 1024], [1], [所有生物], [1],
  table.cell(rowspan: 3)[镜头距离], table.cell(rowspan: 3)[`camera_distance`], table.cell(rowspan: 3)[0 \~ 32], table.cell(rowspan: 3)[4], [末影龙、巨人], [16],
  [快乐恶魂、恶魂], [8],
  [其他所有生物], [4],
  [实体交互距离], [`entity_interaction_range`], [0 \~ 64], [3], [玩家], [3],
  [爆炸击退抗性], [`explosion_knockback_resistance`], [0 \~ 1], [0], [所有生物], [0],
  table.cell(rowspan: 2)[摔落伤害倍数], table.cell(rowspan: 2)[`fall_damage_multiplier`], table.cell(rowspan: 2)[0 \~ 100], table.cell(rowspan: 2)[1], [骆驼、驴、马、羊驼、骡、骷髅马、行商羊驼、僵尸马], [0.5],
  [其他所有生物], [0],
  table.cell(rowspan: 5)[飞行速度], table.cell(rowspan: 5)[`flying_speed`], table.cell(rowspan: 5)[0 \~ 1024], table.cell(rowspan: 5)[0.4], [蜜蜂、凋灵], [0.6],
  [鹦鹉], [0.4],
  [悦灵], [0.1],
  [恶魂], [0.06],
  [快乐恶魂], [0.05],
  table.cell(rowspan: 11)[生物跟随距离], table.cell(rowspan: 11)[`follow_range`], table.cell(rowspan: 11)[0 \~ 2048], table.cell(rowspan: 11)[32], [恶魂], [100],
  [末影人], [64],
  [烈焰人], [48],
  [凋灵], [40],
  [僵尸、尸壳、溺尸、僵尸村民、僵尸猪灵], [35],
  [嘎吱、狐狸、掠夺者、劫掠兽], [32],
  [旋风人、监守者], [24],
  [北极熊], [20],
  [幻术师], [18],
  [唤魔者、猪灵蛮兵、卫道士], [12],
  [其他所有AI生物], [16],
  [重力], [`gravity`], [$-1$ \~ 1], [0.08], [所有生物], [0.08],
  table.cell(rowspan: 3)[跳跃力度], table.cell(rowspan: 3)[`jump_strength`], table.cell(rowspan: 3)[0 \~ 32], table.cell(rowspan: 3)[0.42], [马、骷髅马、僵尸马], [$U[0.4,1]$#footnote[服从均匀分布。]],
  [驴、骡、羊驼、行商羊驼], [0.5],
  [其他所有生物], [0.42],
  table.cell(rowspan: 4)[击退抗性], table.cell(rowspan: 4)[`knockback_resistance`], table.cell(rowspan: 4)[0 \~ 1], table.cell(rowspan: 4)[0], [铁傀儡、监守者], [1],
  [劫掠兽], [0.75],
  [疣猪兽、僵尸疣猪兽], [0.6],
  [其他所有生物], [0],
  [幸运值], [`luck`], [$-1024$ \~ 1024], [0], [玩家], [0],
  [最大伤害吸收值], [`max_absorption`], [0 \~ 2048], [0], [所有生物], [0],
  table.cell(rowspan: 25)[最大生命值#footnote[大多数生物在生成时的生命值会自动设为最大生命值。]], table.cell(rowspan: 25)[`max_health`], table.cell(rowspan: 25)[0 \~ 1024], table.cell(rowspan: 25)[0], [监守者], [500],
  [凋灵], [300],
  [末影龙], [200],
  [铁傀儡、巨人、劫掠兽], [100],
  [远古守卫者], [80],
  [猪灵蛮兵], [50],
  [末影人、疣猪兽、驯服的狼、僵尸疣猪兽], [40],
  [骆驼、骆驼尸壳、幻术师], [32],
  [旋风人、守卫者、潜影贝、海龟、北极熊], [30],
  [女巫], [26],
  [僵尸马], [25],
  [唤魔者、掠夺者、卫道士], [24],
  [驴、马、羊驼、骡、行商羊驼], [$U[15,30]$],
  [岩浆怪、史莱姆], [$"尺寸"^2$],
  [悦灵、盔甲架、烈焰人、苦力怕、溺尸、快乐恶魂、尸壳、非体弱熊猫、幻翼、玩家、骷髅、流浪者、炽足兽、村民、流浪商人、凋灵骷髅、僵尸村民、僵尸、僵尸猪灵], [20],
  [沼骸、焦骸、猪灵、蜘蛛], [16],
  [鹦鹉螺、骷髅马、僵尸鹦鹉螺], [15],
  [美西螈、嗅探兽、恼鬼], [14],
  [犰狳、洞穴蜘蛛、铜傀儡], [142],
  [蜜蜂、猫、牛、海豚、狐狸、青蛙、恶魂、发光鱿鱼、山羊、哞菇、豹猫、体弱熊猫、猪、鱿鱼], [10],
  [杀手兔、末影螨、绵羊、蠹虫、野生狼], [8],
  [蝙蝠、鹦鹉、蝌蚪], [6],
  [鸡、雪傀儡], [4],
  [鳕鱼、河豚、兔子、鲑鱼、热带鱼], [3],
  [嘎吱], [1],
  [挖掘效率], [`mining_efficiency`], [0 \~ 1024], [0], [玩家], [0],
  [移动效率], [`movement_efficiency`], [0 \~ 1], [0], [所有生物], [0],
  table.cell(rowspan: 20)[速度#footnote[设该值为$a$，生物脚下的方块阻力为$f$，则最高移动速度为#box(baseline: 30%, inset: (y: 0.5em))[$display(v=0.21168a/(1-0.91f)f^3)$]。]], table.cell(rowspan: 20)[`movement_speed`], table.cell(rowspan: 20)[0 \~ 1024], table.cell(rowspan: 20)[0.7], [海豚], [1.2],
  [美西螈、青蛙、蝌蚪], [1],
  [蝙蝠、鳕鱼、末影龙、恶魂、发光鱿鱼、幻翼、河豚、鲑鱼、潜影贝、鱿鱼、热带鱼、恼鬼、流浪商人], [0.7],
  [旋风人、凋灵], [0.6],
  [唤魔者、巨人、守卫者、幻术师], [0.5],
  [嘎吱], [0.4],
  [猪灵、猪灵蛮兵、掠夺者、卫道士], [0.35],
  [蜜蜂、猫、洞穴蜘蛛、远古守卫者、末影人、狐狸、疣猪兽、豹猫、兔子、蜘蛛、监守者、狼、僵尸疣猪兽、劫掠兽], [0.3],
  [鸡、苦力怕、末影螨、铁傀儡、猪、北极熊、蠹虫、骷髅、流浪者、沼骸、海龟、女巫、凋灵骷髅], [0.25],
  [烈焰人、溺尸、尸壳、绵羊、僵尸、僵尸村民、僵尸猪灵], [0.23],
  [马], text(size:0.9em)[$U[0.1125,0.3375]$],
  [史莱姆], [$0.2+0.1 times "尺寸"$],
  [铜傀儡、牛、山羊、岩浆怪、哞菇、鹦鹉、骷髅马、僵尸马], [0.2],
  [驴、羊驼、骡、炽足兽、行商羊驼], [0.175],
  [非懒惰的熊猫], [0.15],
  [犰狳], [0.14],
  [悦灵、嗅探兽、玩家], [0.1],
  [骆驼], [0.09],
  [懒惰的熊猫], [0.07],
  [快乐恶魂], [0.05],
  [额外氧气#footnote[设该属性值为$o$，若$o=0$，则生物在水中每游戏刻氧气值减1；若$o>0$，则生物每游戏刻有#box(baseline: 30%, inset: (y: 0.5em))[$display(o/(o+1))$]的概率不消耗氧气值。]], [`oxygen_bonus`], [0 \~ 1024], [0], [所有生物], [0],
  table.cell(rowspan: 3)[安全摔落高度], table.cell(rowspan: 3)[`safe_fall_distance`], table.cell(rowspan: 3)[$-1024$ \~ 1024], table.cell(rowspan: 3)[3], [骆驼、驴、马、羊驼、骡、骷髅马、行商羊驼、僵尸马], [6],
  [狐狸], [5],
  [其他所有生物], [3],
  [尺寸], [`scale`], [0.0625 \~ 16], [1], [所有生物], [1],
  [潜行速度], [`sneaking_speed`], [0 \~ 1], [0.3], [玩家], [0.3],
  table.cell(rowspan: 2)[僵尸增援], table.cell(rowspan: 2)[`spawn_reinforcements`], table.cell(rowspan: 2)[0 \~ 1], table.cell(rowspan: 2)[0], [僵尸、尸壳、溺尸、僵尸村民], [$U[0,0.1]$],
  [僵尸猪灵], [0],
  table.cell(rowspan: 5)[最大行走高度], table.cell(rowspan: 5)[`step_height`], table.cell(rowspan: 5)[0 \~ 10], table.cell(rowspan: 5)[0.6], [骆驼], [1.5],
  [嘎吱], [1.0625],
  [美西螈、铜傀儡、驴、溺尸、末影人、青蛙、马、铁傀儡、羊驼、骡、劫掠兽、骷髅马、行商羊驼、海龟、僵尸马], [1],
  [盔甲架], [0],
  [其他所有生物], [0.6],
  [水下挖掘速度], [`submerged_mining_speed`], [0 \~ 20], [0.2], [玩家], [0.2],
  [横扫伤害比率#footnote[设该值为$r$，当$r=0$时，横扫攻击伤害为1；当$r>0$时，横扫攻击伤害为$1+r d$，其中$d$为近战攻击伤害。]], [`sweeping_damage_ratio`], [0 \~ 1], [0], [玩家], [0],
  [生物引诱范围], [`tempt_range`], [0 \~ 2048], [10], [犰狳、美西螈、蜜蜂、鸡、狐狸、青蛙、山羊、疣猪兽、豹猫、熊猫、猪、北极熊、兔子、绵羊、嗅探兽、炽足兽、海龟、骆驼、马、骷髅马、僵尸马、驴、骡、羊驼、行商羊驼、牛、哞菇、猫、狼、鹦鹉], [10],
  [水中移动效率], [`water_movement_efficiency`], [0 \~ 1], [0], [所有生物], [0],
  table.cell(rowspan: 2)[路径点传输距离], table.cell(rowspan: 2)[`waypoint_transmit_range`], table.cell(rowspan: 2)[0 \~ 60000000], table.cell(rowspan: 2)[0], [玩家], [60000000],
  [其他生物], [0],
  [路径点接收距离], [`waypoint_receive_range`], [0 \~ 60000000], [0], [玩家], [60000000]
) <tab:attributes>
=== 属性修饰符
在一个属性上可以使用多个属性修饰符，则属性的最终值为基值和这些属性修饰符共同修饰后的结果。在数据的存储上，每一个修饰符都需要作区分，用命名空间ID唯一地标识每个属性修饰符，充当修饰符“身份证”的作用。不同修饰符中的不同属性允许使用相同的ID。

一个属性修饰符在对基值进行修饰时，会采用一定的#proper-noun(display: "运算模式（Operation）", "yun4 suan4 mo2 shi4")。修饰符一共有三种运算模式：#proper-noun(display: "属性增量（Add value）", "shu3 xing4 zeng1 liang4")、#proper-noun(display: "倍率增量（Add multiplied base）", "bei4 lv4 zeng1 liang4")和#proper-noun(display: "最终倍乘（Add multiplied total）", "zui4 zhong1 bei4 cheng2")，每一个修饰符只会采用其中一种运算方式。
==== 属性增量
属性增量即在基值的基础上进行加减运算。若一个属性同时存在多个运算模式为属性增量的修饰符，则属性的最终值为基值与这些修饰符值得代数和。设$x_1$、$x_2$、……$x_n$是运算模式为属性增量的属性修饰符$M_1$、$M_2$、……$M_n$的修饰量，而被修饰的属性基值为常数$B$，则该属性的最终值$f(x_1,x_2,dots.h.c,x_n)$可以表示为
$ f(x_1,x_2,dots.h.c,x_n) = B + sum_(i=1)^(n) x_i $ <equ:modifier_add>
#example(
  [用两个属性增量的修饰符修饰同一属性，已知属性基值为1，修饰量分别为2、3，求属性的最终值。],
  [
    属性的最终值为$f=1+(2+3)=6$。

  ]
) <exa:modifier_add>
==== 倍率增量
倍率增量在属性增量修饰完成后进行，用于将属性增量修饰完成后的属性值乘以一定倍率。对于同一个属性中多个倍率增量的修饰符，修饰后的值为倍率增量的修饰量代数和与1的和与属性增量修饰完成后属性值的乘积，设$y_1$、$y_2$、……$y_m$是倍率增量的修饰符$M_1$、$M_2$、……$M_m$的修饰量，而$f(x_1,x_2,dots.h.c,x_n)$为属性增量的修饰符修饰完成后的属性值，则该属性的最终值$g(y_1,y_2,dots.h.c,y_m)$可以表示为
$ g(y_1,y_2,dots.h.c,y_m) = f(x_1,x_2,dots.h.c,x_n)(1 + sum_(i=1)^(m) y_i) $
将@equ:modifier_add 代入，得
$ g(y_1,y_2,dots.h.c,y_m) = (B + sum_(i=1)^(n) x_i)(1 + sum_(i=1)^(m) y_i) $ <equ:modifier_multiply_base>
#example(
  [在@exa:modifier_add 的基础上，追加两个修饰量分别为2、4的倍率增量修饰符，求属性的最终值。],
  [
    属性的最终值为$g=6 times (1+2+4)=42$。

  ]
) <exa:modifier_multiply_base>
==== 最终倍乘
最终倍乘在所有的属性增量和倍率增量修饰符修饰完成后进行。最终倍乘的意义为：将属性增量和倍率增量修饰符修饰完成后的属性值增加一定的倍数。若一个属性存在一个最终倍乘的修饰符，记属性增量和倍率增量修饰完成后的属性值为$g$，而该最终倍乘的修饰量为$z$，则属性的最终值$h(z)$可以表示为
$ h(z)=g dot.c (z+1) $
可以看到，对原值$g$倍乘的倍率实际上为修饰量加1后的值。若存在多个最终倍乘的修饰符，则在上一个最终倍乘修饰完毕后，在当前属性值的基础上再进行倍乘。设$z_1$、$z_2$、……$z_p$是倍率增量的修饰符$M_1$、$M_2$、……$M_p$的修饰量，则属性的最终值$h(z_1,z_2,dots.h.c,z_p)$可以表示为
$ h(z_1,z_2,dots.h.c,z_p)=g dot.c product_(i=1)^(p) (z_i+1) $ <equ:modifier_multiply>
#example(
  [在@exa:modifier_multiply_base 的基础上，追加两个修饰量分别为2、3的最终倍乘修饰符，求属性的最终值。],
  [
    属性的最终值为$h=42 times (2+1) times (3+1)=504$。

  ]
)
==== 修饰符公式
修饰符进行修饰运算时，遵循“先属性增量，再倍率增量，后最终倍乘”的运算顺序。设$x_1$、$x_2$、……$x_n$是属性增量的修饰量，$y_1$、$y_2$、……$y_m$是倍率增量的修饰量，$z_1$、$z_2$、……$z_p$是最终倍乘的修饰量，将@equ:modifier_multiply_base 和@equ:modifier_multiply 结合，可得属性最终值的多元函数：
$ phi = phi(x_1,x_2,dots.h.c,x_n,y_1,y_2,dots.h.c,y_m,z_1,z_2,dots.h.c,z_p) $ <equ:modifier>
通常记Op0为所有属性增量修饰值的代数和，Op1为所有倍率增量修饰值的代数和，Op2为所有最终倍率修饰值加1后的乘积，即：
$ "Op0" = sum_(i=1)^(n) x_i $
$ "Op1" = sum_(i=1)^(m) y_i $
$ "Op2" = product_(i=1)^(p) (z_i+1) $
于是@equ:modifier 又可以写成如下的形式，即*修饰符一般公式*：
$ phi = (B + "Op0")("Op1" + 1)"Op2" $ <equ:modifier_caculation>
#param-desc(
  prefix: "式中：",
  [$phi$], [属性经过修饰后的最终值。],
  [$B$], [属性的基值。]
)
#example(
  [一个属性的基值为0.3，已知该属性拥有修饰量为0.2的一个属性增量修饰符，修饰量为5的一个倍率增量修饰符和两个修饰量分别为1和4的最终倍乘修饰符，求该属性的最终值。],
  [
    根据题意，不难得出$"Op0"=0.2$，$"Op1"=5$，$"Op2"=(1+1) times(4+1)=10$，属性基值$B=0.3$，则根据@equ:modifier_caculation，计算得到属性的最终值为$phi=(0.3+0.2) times(5+1) times 10=30$。

  ]
)
=== 命令/attribute的语法
命令 `/attribute` 是用于查询、修改属性的命令，玩家的属性也是可以被修改的。它需要的权限等级为2，以下是所有用法：#index(index: "command", "attribute")
===== 返回目标实体指定属性的基值或最终值，语法为
#codebox("attribute <target> <attribute> [base] get [<scale>]")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [指定的目标实体，必须为玩家名称、UUID或目标选择器。必须指定一个实体。],
  [`<attribute>`（命名空间ID `minecraft:resource_location`）], [指定属性的命名空间ID。],
  [`[base]` ], [字面量，可选，若填写该参数，则返回属性的基值，不填写则返回最终值。],
  [`[<scale>]`（双精度浮点数 `brigadier:double`）], [可选，定义返回的属性基值或最终值的缩放倍率。]
)
===== 修改目标实体属性的基值，语法为
#codebox("attribute <target> <attribute> base set <value>")
#param-desc(
  [`<value>`（双精度浮点数 `brigadier:double`）], [指定的基值。]
)
===== 重置目标实体属性的默认值，语法为
#codebox("attribute <target> <attribute> base reset")
===== 为目标实体的指定属性添加一个属性修饰符，语法为
#codebox("attribute <target> <attribute> modifier add <id> <value> (add_value|add_multiplied_total|add_multiplied_base)")
#param-desc(
  [`<value>`（双精度浮点数 `brigadier:double`）], [修饰符的修饰量。],
  [`(add_value|add_multiplied_total|add_multiplied_base)` ], [运算模式，分别为：\ `add_value` 属性增量\ `add_multiplied_total` 倍率增量\ `add_multiplied_base` 最终倍乘]
)
===== 删除特定UUID的属性修饰符，语法为
#codebox("attribute <target> <attribute> modifier remove <id>")
===== 返回指定UUID修饰符的修饰量，语法为
#codebox("attribute <target> <attribute> modifier value get <id> [<scale>]")
#example(
  [将当前玩家的最大生命值设置为40。],
  [
    如果直接修改最大生命值属性的基值，则命令可以为
    #codebox("attribute @s max_health base set 40")
    如果使用修饰符，则可以用修饰量为20的属性增量修饰基值，命令为
    #codebox("attribute @s max_health modifier add minecraft:health_boost 20 add")
    其中命名空间ID可以自由指定。
  ]
)
=== 属性NBT格式
属性是实体数据的一部分，属性NBT隶属于实体格式。属性修饰符也可以存在于物品堆叠组件中，当实体持有这些有修饰符的物品时，即对实体的属性值进行修饰。当属性存在于实体数据时，使用标签 #icon("nbt-list") `attributes`，其数据结构为
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-list") *attributes*: 该实体的属性列表。]),
  (2, [#icon("nbt-compound") 一个属性。]),
  (3, [#icon("nbt-double") *#underline[base]*: 该属性的基值。]),
  (3, [#icon("nbt-string") *#underline[id]*: 该属性的名称，使用命名空间ID。]),
  (3, [#icon("nbt-list") *modifiers*: 该实体的属性列表。]),
  (4, [#icon("nbt-compound") 一个属性修饰符。]),
  (5, [#icon("nbt-double") *#underline[amount]*: 该修饰符的修饰量。]),
  (5, [#icon("nbt-string") *#underline[id]*: 该修饰符的命名空间ID。]),
  (5, [#icon("nbt-string") *#underline[operation]*: 运算模式，可用值为 `add_value`（属性增量）、`add_multiplied_total`（倍率增量）和 `add_multiplied_base`（最终倍乘）。])
)
#example(
  [生成一个一次普通攻击会造成10点伤害、最大生命值为100的僵尸。],
  [
    下面的命令直接修改了基值：
    #codebox("summon ~ ~ ~ zombie {attributes:[{base:10.0d,id:\"minecraft:attack_damage\"},{base:100.0d,id:\"minecraft:max_health\"}]}")
  ]
)
== 技术性实体<sec:technical_entity>
命令系统处理的实体一般可分为三类：一是*标记实体*、二是*展示用实体*、三是*可交互实体*。

相对于直接作用对象实体而言，搭建系统时通常需要处理另外一些实体，这些实体不直接参与游戏进程，主要充当游戏后台的角色，作为命令运行的辅助工具，对游戏过程产生间接的影响。例如，当一个玩家经过某一特定位置，现在需要对这个位置做一个标记以方便该玩家此后某一时间通过命令回到该位置，这时可以使用到标记实体，当玩家第一次经过该点时在该位置放置一个标记实体，当玩家需要回到该位置时，就可以使用命令 `/tp` 将玩家传送至该标记实体。这些标记实体的其主要作用是辅助命令的执行。由于无法直接通过标记静态的方块来实现这一功能，因此标记实体的存在极为必要。*为了尽量规避这些实体做出多余的行为以干扰到游戏的正常运行，一般选择行动较少的、对游戏本身的影响较少的实体。*

展示用实体，顾名思义，就是用于展示图像、文字之类的实体。由于它们的作用主要体现在视觉方面，因此也需要有尽量少的干扰行为。

可以直接与之发生交互的、对游戏进程有着直接影响的实体，比如玩家、与玩家发生互动的生物等，可称之为“可交互实体”，这类实体一般拥有特定的实体边界框。

对于这三类实体，Minecraft各有一种专门适用于命令系统的实体，即标记、展示实体和交互实体。#proper-noun(display: "盔甲架（Armor stand）", "kui1 jia3 jia4")作为一种传统的兼具标记、展示和交互功能的实体，在这些技术性实体未加入之前被广泛使用，其主要特点是显形，可以直观地显示标记实体的状态。但是随着标记、展示实体和交互实体的加入，盔甲架基本上不再参与到这几项任务中，本教程不再讲述盔甲架的使用。
=== 标记
于21w15a加入的#proper-noun(display: "标记（Marker）", "biao1 ji4")是完全无行为、不会产生更新、没有碰撞箱、不会干扰玩家的一种隐形实体，相对于盔甲架而言对游戏的多余影响更小。标记*只存在于服务端，不在客户端中渲染*，只能使用命令检查标记的存在。

标记只能通过命令 `/summon` 生成：
#codebox("summon minecraft:marker")
#example(
  [生成一个标记，使其 #icon("nbt-compound") `data` 标签拥有一个子标签 #icon("nbt-bool") `marker:true`。],
  [
    自定义标签是 #icon("nbt-compound") `data` 的子标签，注意标签 #icon("nbt-compound") `data` 不能遗漏。
    #codebox("summon minecraft:marker ~ ~ ~ {data:{marker:true}}")
    如此标记的数据树为：
    #tree(
      (0, [#icon("nbt-compound") 根标签]),
      (1, [#icon("nbt-compound") *data*]),
      (2, [#icon("nbt-bool") *marker*: `true`])
    )
  ]
)
=== 展示实体
#proper-noun(display: "展示实体（Display）", "zhan3 shi4 shi2 ti3")是一类用于展示内容的实体，包括#proper-noun(display: "物品展示实体（Item display）", "wu4 pin3 zhan3 shi4 shi2 ti3")、#proper-noun(display: "方块展示实体（Block display）", "fang1 kuai4 zhan3 shi4 shi2 ti3")和#proper-noun(display: "文本展示实体（Text display）", "wen2 ben3 zhan3 shi4 shi2 ti3")三种。这些展示实体没有碰撞箱，没有任何自主行为，只能通过命令 `/summon` 生成。在生成时如果不指定NBT，则不会显示任何内容。
==== 展示实体共通标签
下面这些字段是三种展示实体共同拥有的，即#proper-noun(display: "展示实体共通标签（Tags common to all display entities）", "zhan3 shi4 shi2 ti3 gong4 tong1 biao1 qian1")。它们指定了展示内容的形式、渐变动画和插值。
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-string") *billboard*: 展示内容跟随玩家视角的变换形式。有效值 `fixed`（固定不发生旋转）、`vertical`（跟随玩家视角在水平方向上转动）、`horizontal`（跟随玩家视角在竖直方向上转动）和 `center`（跟随玩家视角绕中心自由转动）。]),
  (1, [#icon("nbt-compound") *brightness*: 该实体渲染使用的亮度值，若不存在则使用当前位置使用的亮度值。一个位置的亮度值由#proper-noun(display: "天空光照（Sky light）", "tian1 kong1 guang1 zhao4")和#proper-noun(display: "方块光照（Block light）", "fang1 kuai4 guang1 zhao4")决定。]),
  (2, [#icon("nbt-int") *block*: 方块光照等级，有效值 `0` \~ `15`。]),
  (2, [#icon("nbt-int") *sky*: 天空光照等级，有效值 `0` \~ `15`。]),
  (1, [#icon("nbt-int") *glow_color_override*: 覆盖发光边框的颜色，使用RGB格式，对二进制来说从高到底依次是：R通道8位、G通道8位、B通道8位。若设为 `-1`，则使用该实体所在队伍的颜色。默认为 `-1`。只有当 #icon("nbt-bool") `Glowing` 的值为 `true` 时才会显示发光边框。]),
  (1, [#h(-2em)#icon("nbt-float") *height*: 定义#proper-noun(display: "剔除边界框（Rendering culling bounding box）", "ti4 chu2 bian1 jie4 kuang1")的高度，剔除边界框的作用是，当剔除边界框不在玩家的视角范围内，则该实体不在该玩家的客户端渲染。若 #icon("nbt-float") `height` 值定义为$h$，则剔除边界框自实体位置（使用实际坐标）向上延伸$h$，如@fig:rendering_culling_bounding_box 所示。
  #figure(caption: "剔除边界框的范围", image("图片/剔除边界框的范围.png", width: 10em)) <fig:rendering_culling_bounding_box>
  ]),
  (1, [#icon("nbt-float") *width*: 定义剔除边界框的宽度。若 #icon("nbt-float") `width` 值定义为$w$，则剔除边界框自实体位置（使用实际坐标）横向扩展#box(baseline: 30%, inset: (y: 0.5em))[$display(w/2)$]，如@fig:rendering_culling_bounding_box 所示。#icon("nbt-float") `height` 和 #icon("nbt-float") `width` 默认值均为 `0.0f`，即不使用剔除边界框，只要实体位于玩家视角范围内即渲染。]),
  (1, [#icon("nbt-int") *start_interpolation*: 此#proper-noun(display: "插值（Interpolation）", "cha1 zhi2")方式用于制造渲染上的渐变动画而非跳跃式的突变，由该字段定义插值开始的时间，插值会在定义后第 `start_interpolation` 刻开始。单位为游戏刻，使用游戏内时间。若设为 `-1`，则使用当前游戏时间。*制作插值动画时此标签是必须的。*]),
  (1, [#icon("nbt-int") *interpolation_duration*: 实体动画渲染意义上的插值持续的时长，单位为游戏刻。插值会在第 #icon("nbt-int") `start_interpolation`$+$#icon("nbt-int") `interpolation_duration` 游戏刻终止。在插值过程中，所有标记为可插值的字段都作为单个#proper-noun(display: "插值集（Interpolation set）", "cha1 zhi2 ji2")的一部分。当插值集内的任意值被修改时，修改后可插值字段的*所有*值都会被视作*当前值*，修改前的值被视作*先前值*。在插值的持续时间内，*实体会由先前值定义的外观过渡至当前值定义的外观*。若同一游戏刻内出现值的多次变更，则只会计算一次变更。下面标注了所有的可插值字段。]),
  (1, [#icon("nbt-float") *shadow_strength*: 可插值，控制实体阴影的透明度，默认值为 `1.0f`。]),
  (1, [#icon("nbt-int") *teleport_duration*: 应用于实体本身位置和朝向的插值。例如，若更改了某展示实体的位置（如使用 `/tp` 命令），定义 #icon("nbt-int") `teleport_duration` 插值可制造展示实体从原本位置移动到新位置的动画而非突然的传送。若该标签的值设为 `0`，则为突然移动。大于 `0` 的值可制造移动动画。此值必须介于 `0` 和 `59` 之间（含）。]),
  (1, [#icon("nbt-list")#icon("nbt-compound") *transformation*: 可插值。此字段数据结构较为复杂，用于表示模型的渲染变换。变换仅在渲染上有意义，实体本身的位置和朝向不作变换，因此只受 #icon("nbt-int") `interpolation_duration` 插值作用，不受 #icon("nbt-int") `teleport_duration` 插值的影响。所有渲染变换一律以展示实体的*实际位置*为变换的原点。]),
  (2, [渲染变换的数据]),
  (1, [#icon("nbt-float") *view_range*: 展示实体的最大可视范围。记该值为$v$，在选项中设置的实体渲染距离的最大值为$e$，若玩家与该实体的距离超过$64v e$，则该实体不会被渲染。默认值为 `1.0f`。])
)
#index(index: "method", display: "用展示实体实现运镜", "yong4 zhan3 shi4 shi2 ti3 shi2 xian4 yun4 jing4")
#example(
  [一张冒险地图需要制作运镜，要求镜头从$(0,70,0)$移动至$(5,72,0)$，同时视角从面向$(5,70,0)$变换至面向$(5,70,5)$，整个运镜在2秒内完成。],
  [
    运镜可以通过展示实体完成，当玩家旁观展示实体时，其视角会随着展示实体的视角移动。因此可以生成一个物品展示实体，初始状态：位于$(0,70,0)$、朝向$(5,70,0)$；最终状态：位于$(5,72,0)$、朝向$(5,70,5)$。这中间的运镜可以通过长达两秒（40游戏刻）的 #icon("nbt-int") `teleport_duration` 以实现。

    首先生成这个展示实体并设置初始化的状态，由$(0,70,0)$面向$(5,70,0)$实际上是水平朝向正东方，偏航角为 `-90`，俯仰角为 `0`：
    #codebox("summon item_display 0 70 0 {Rotation:[-90.0f,0.0f],teleport_duration:40}")
    其次必须保证玩家（这里用 `@s` 指代这个玩家）处于旁观模式且旁观这个展示实体，依次执行：
    #codebox("gamemode spectator @s")
    #codebox("spectate @n[type=item_display,x=0.5,y=70,z=0.5] @s")
    最后设置终止状态、并立即开始插值，以下两条命令应在同一游戏刻内依次执行：
    #codebox("tp @n[type=item_display,x=0.5,y=70,z=0.5] 5 72 0 facing 5 70 5")
    #codebox("data modify entity @n[type=item_display,x=0.5,y=70,z=0.5] start_interpolation set value 0")
    将以上命令按顺序整合进函数内：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > display_camera.mcfunction",
      "summon item_display 0 70 0 {Rotation:[-90.0f,0.0f],teleport_duration:40}
gamemode spectator @s
spectate @n[type=item_display,x=0.5,y=70,z=0.5] @s
tp @n[type=item_display,x=0.5,y=70,z=0.5] 5 72 0 facing 5 70 5
data modify entity @n[type=item_display,x=0.5,y=70,z=0.5] start_interpolation set value 0"
    )
    玩家在聊天栏中运行此函数，运镜即可生效。
  ]
)
#cite(<display_camera>, form: none)
==== 各类展示实体特有标签
===== 方块展示实体
方块展示实体用于展示一个方块，被展示的方块仅有渲染意义，不具备具体使用价值。默认的实体锚点位于被展示方块的西北下角，若在 `/summon` 中使用整数形式的坐标，因为命令中坐标参数使用中心点校准，因此生成的方块展示实体不会贴合方格；贴合方格应使用小数坐标。

对方块展示实体进行插值时，若当前插值未完成，则上次设置的值为先前值，本次设置的值为当前值，在此基础上重新开始插值。#cite(<display_tips>, form: none)

下面是方块展示实体的特有字段：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *#underline[block_state]*]),
  (2, [#icon("nbt-string") *#underline[Name]*: 方块的命名空间ID。]),
  (2, [#icon("nbt-compound") *Properties*: 可选，由若干方块属性组成的方块状态。]),
  (3, [#icon("nbt-string") *\<方块属性>*: 标签名为方块状态的属性，值使用字符串表示。]),
)
#example(
  [在$(0,70,0)$位置贴合方格展示一个开启的、朝向为东的铁门。],
  [
    命令为
    #codebox("summon block_display 0.0 70.0 0.0 block_state:{Name:\"minecraft:iron_door\",Properties:{open:\"true\",face:\"east\"}}")
  ]
)
===== 物品展示实体
物品展示用于展示一个物品，同样，被展示的物品仅有渲染意义。被展示的物品可以带有特定的堆叠组件，拥有自定义物品模型的物品也可以被渲染。允许使用 `/item` 或 `/loot` 变更和获取其中的物品数据。

对物品展示实体进行插值时，若当前插值未完成，则当前的状态为先前值，本次设置的值为当前值，在此基础上重新开始插值。

下面是物品展示特有的字段：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *item*: 一个要展示的物品，使用物品格式，见节@sec:item_stack。默认为空气。]),
  (2, [无槽位物品格式]),
  (1, [#icon("nbt-string") *item_display*: 描述展示物品的方式，有效值：`none`（无变换）、`thirdperson_lefthand`（第三人称视角左手）、`thirdperson_righthand`（第三人称视角右手）、`firstperson_lefthand`（第一人称视角左手）、`firstperson_righthand`（第一人称视角右手）、`head`（放置于头部）、`gui`（GUI视图）、`ground`（平铺于地面）、`fixed`（默认变换）和 `on_shelf`（在展示架中）。默认值为 `none`。])
)
===== 文本展示实体
顾名思义，文本展示实体用于展示一段文本。下面是文本展示的特有字段：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-string") *alignment*: 规定文本对齐方向，可用值有 `center`（居中对齐）、`left`（左对齐）和 `right`（右对齐）。]),
  (1, [#icon("nbt-int") *background*: 可插值。文本的背景颜色，使用ARGB颜色格式，默认值为 `0x40000000`。渲染时会丢弃Alpha（透明度）通道小于10%的片段，所以当A小于 `0x1A` 时背景会完全透明。]),
  (1, [#icon("nbt-bool") *default_background*: 是否使用默认的文本背景，此项设置会覆盖字段 #icon("nbt-int") `background` 的值，默认为 `false`。]),
  (1, [#icon("nbt-int") *line_width*: 一行文本的最大宽度，超过此数值即换行，默认值为 `200`。]),
  (1, [#icon("nbt-bool") *see_through*: 是否能透过方块渲染，默认为 `false`。]),
  (1, [#icon("nbt-bool") *shadow*: 文本是否渲染阴影，默认为 `false`。]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *#underline[text]*: 显示的文本内容，使用文本组件。]),
  (1, [#icon("nbt-byte") *text_opacity*: 可插值，用$-128$与127之间的值表示透明度。透明度需要是0 \~ 255之间的数，故大于127的值一律使用负数替代，换算公式为$"真正透明度"="<text\_opacity>"+256$。例如，完全不透明（255）使用$-1$这个值来表示（$"<text\_opacity>"=255-256=-1$）。类似于字段 #icon("nbt-int") `background`，透明度小于26（即通道小于10%）时会丢弃片段，故文本将不可见。默认值为 `-1b`（完全不透明）。])
)
#index(index: "method", display: "获取玩家的名字", "huo4 qu3 wan2 jia1 de ming2 zi4")
#example(
  [将最近的玩家的名字存入存储 `toturial:test` 的字段 #icon("nbt-string") `player_name`。],
  [
    玩家的名字可以由实体名称组件得到，经过动态解析之后，文本内容会变成不需要解析的静态类组件。虽然在聊天栏、标题中只能看到解析的结果，但文本展示实体可以存储SNBT格式的解析结果。
    以上结果是由实体名称组件解析而来。因此可以生成一个解析最近玩家名字的文本展示实体：
    #codebox("summon minecraft:text_display ~ ~ ~ {text:{selector:\"@p\"}}")
    文本展示实体生成完毕后，用
    #codebox("data get entity @n[type=minecraft:text_display] text")
    #h(-2em)获取 #icon("nbt-compound") `text` 的值，其中的内容大致如下所示：
    #codebox("{click_event: {action: \"suggest_command\", command: \"/tell Mu_xian \"}, insertion: \"Mu_xian\", text: \"Mu_xian\", hover_event: {name: \"Mu_xian\", action: \"show_entity\", id: \"minecraft:player\", uuid: [I; 1699506248, -677556729, -1141634424, -430286865]}}")
    可见玩家名字存储于 #icon("nbt-string") `text` 中，按以下命令即可获取玩家名字并存入存储：
    #codebox("data modify storage tutorial:test player_name set from entity @n[type=minecraft:text_display] text.text")
  ]
)
==== 渲染变换
对于展示实体的渲染变换，字段 #icon("nbt-list")#icon("nbt-compound") `transformation` 拥有两种数据形式：*矩阵形式*和*分解形式*。编写NBT时可用矩阵形式，但实体被保存时一律使用分解形式。
===== 矩阵形式
使用矩阵形式时，字段 #icon("nbt-list") `transformation` 的数据类型为列表：
#tree(
  (0, [#icon("nbt-list") *transformation*: 含有十六个元素的仿射变换矩阵。]),
  (1, [#icon("nbt-float") 矩阵中的一个元素。])
)
使用一个$4 times 4$的矩阵以表示变换方式$bold(A)$：
$ bold(A) = mat(
  a_(11), a_(12), a_(13), a_(14);
  a_(21), a_(22), a_(23), a_(24);
  a_(31), a_(32), a_(33), a_(34);
  a_(41), a_(42), a_(43), a_(44)
) $ <equ:affine_matrix>
#wrap-content(
  tips(
    [列表中每一个元素后面不要忘记附加 `f` 以表明单精度浮点数的数据类型。],
    width: 20em
  ),
  [

    这是一个#proper-noun(display: "行主序矩阵（Row-major matrix）", "hang2 zhu3 xu4 ju3 zhen4")，每一个元素都是浮点数，在NBT中写成列表的形式即
  ],
  align: right
)
#codebox("[<a11>, <a12>, <a13>, <a14>, <a21>, <a22>, <a23>, <a24>, <a31>, <a32>, <a33>, <a34>, <a41>, <a42>, <a43>, <a44>]")
这个矩阵用于描述一个#proper-noun(display: "仿射变换（Affine transform）", "fang3 she4 bian4 huan4")。为了以矩阵形式表示三维空间中点的变换，将原空间映射至仿射空间。对于三维空间内每一个点$(x_0,y_0,z_0)$，在其尾部添加一个1以在仿射空间内表示一个点，即$(x_0,y_0,z_0,1)$。令该点经过一定仿射变换$bold(A)$后位于$(x',y',z',1)$，则写成矩阵乘法的形式：
$ mat(x'; y'; z'; 1) = mat(
  a_(11), a_(12), a_(13), a_(14);
  a_(21), a_(22), a_(23), a_(24);
  a_(31), a_(32), a_(33), a_(34);
  a_(41), a_(42), a_(43), a_(44);
) mat(x; y; z; 1) $
基础变换形式有平移、旋转、缩放（镜像）、剪切，*所有的变换均基于实体的实际坐标进行*，下面依次讲解之。
====== 平移
设展示实体上任意一点$(x_0,y_0,z_0,1)$在$x$、$y$、$z$轴分别平移$a$、$b$、$c$后得到点$(x',y',z',1)$，则
$ cases(
  x' &= &x_0 & & &+&a,
  y' &= & &y_0 & &+&b,
  z' &= & & &z_0 &+&c,
  1 &= & & & &&1
) $
则平移矩阵$bold(T)$为
$ bold(T)(a,b,c) = mat(
  1, 0, 0, a;
  0, 1, 0, b;
  0, 0, 1, c;
  0, 0, 0, 1
) $
====== 旋转
一共有三种旋转方式，即绕$x$轴、绕$y$轴和绕$z$轴旋转。旋转矩阵的推导过程在@chap:coordinates\对朝向和局部坐标的推导中已给出，同理可得绕$x$轴旋转$alpha$的矩阵形式
$ bold(R)_x (alpha) = mat(
  1, 0, 0, 0;
  0, cos alpha , -sin alpha, 0;
  0, sin alpha, cos alpha, 0;
  0, 0, 0, 1
) $
绕$y$轴旋转$beta$的矩阵形式为
$ bold(R)_y (beta) = mat(
  cos beta, 0, sin beta, 0;
  0, 1 , 0, 0;
  -sin beta, 0, cos beta, 0;
  0, 0, 0, 1
) $
绕$z$轴旋转$gamma$的矩阵形式为
$ bold(R)_z (gamma) = mat(
  cos gamma, sin gamma, 0, 0;
  -sin gamma, cos gamma , 0, 0;
  0, 0, 1, 0;
  0, 0, 0, 1
) $
====== 缩放
设展示实体上任意一点$(x_0,y_0,z_0,1)$沿$x$、$y$、$z$轴分别缩放$m$、$n$、$p$倍后得到点$(x',y',z',1)$，则
$ cases(
  x' &= &m x_0,
  y' &= &&n y_0,
  z' &= &&&p z_0,
  1 &= &&&&1,
) $
则缩放矩阵$bold(S)$为
$ bold(S)(m,n,p) = mat(
  m, 0, 0, 0;
  0, n, 0, 0;
  0, 0, p, 0;
  0, 0, 0, 1
) $ <equ:scale_matrix>
若$m=n=p$，则是均匀缩放；不然则是非均匀缩放。
#example(
  [尝试生成一个方块展示实体，使之展示一个$2 times 2 times 2$大小的海晶灯，使用等级为15的方块光照。],
  [
    由于仅应用缩放变换，因此仿射变换矩阵中主对角线上除右下角的元素外，其余元素均为2，所需命令为
    #codebox("summon block_entity ~ ~ ~ {brightness:{block:15},transformation:[2f,0f,0f,0f,0f,2f,0f,0f,0f,0f,2f,0f,0f,0f,0f,1f]}")
  ]
)
====== 镜像
对于@equ:scale_matrix 而言，特别地、若$m$、$n$、$p$三者中至少有一个为负数，都会进行镜像变换。负缩放因子使坐标系在对应轴上反转，表面法线方向改变，从而造成内凹渲染。
#figure(
  caption: "镜像变换造成的内凹渲染",
  image("图片/镜像变换造成的内凹渲染.png", width: 18em)
)
若展示实体上任意一点$(x_0,y_0,z_0,1)$沿$x$轴镜像，其他方向上不作变化，易得镜像矩阵
$ bold(M)_x (m) = mat(
  m, 0, 0, 0;
  0, 1, 0, 0;
  0, 0, 1, 0;
  0, 0, 0, 1
) $
其中$m<0$。同理可得沿$y$轴镜像、沿$z$轴镜像的矩阵$bold(M)_y (n)$、$bold(M)_z (p)$。在多个方向进行的镜像变换也很容易得出，例如在$x$轴、$y$轴和$z$轴方向上同时应用镜像变换所需的矩阵（$m<0$，$n<0$，$p<0$）为
$ bold(M)_(x,y,z) (m,n,p) = mat(
  m, 0, 0, 0;
  0, n, 0, 0;
  0, 0, p, 0;
  0, 0, 0, 1
) $
====== 剪切
剪切变换将实体上所有点沿某一方向做一定移动，通过原点的直线上任意一点沿该方向移动的距离随直线与原点的距离线性变化，这使得图像变得倾斜。一种剪切变换发生在两个正交坐标轴组成的平面内，在其中一个方向上做剪切，在另一个方向上不做变换。三维坐标系中坐标轴两两正交一共有六对正交关系，因此初等剪切变换一共有六种。
#figure(
  caption: "剪切变换",
  image("图片/剪切变换.png", width: 18em)
) <fig:shear_transformation>
如@fig:shear_transformation，图像在一个方向发生剪切的过程中，实际上与另一个方向拥有一个剪切角度$theta_(i,j)$，下标（$i,j$）代表在$i$方向内做剪切，并与$j$方向呈一定剪切角度。若图中横向为$x$轴，纵向为$y$轴，剪切角度记为$theta_(x,y)$，显然有
$ cases(
  x' &= &x_0 + &y_0 tan theta_(x,y),
  y' &= &&y_0,
  z' &= &&&z_0,
  1 &= &&&&1
) $
则$x$轴方向上做剪切、并与$y$轴方向呈一定剪切角度所需矩阵$bold(H)$为
$ bold(H)(theta_(i,j)) = mat(
  1, tan theta_(x,y), 0, 0;
  0, 1, 0, 0;
  0, 0, 1, 0;
  0, 0, 0, 1
) $
同理可推导得到其他六种剪切变换所需的矩阵。当剪切变换的方向为$x$轴时，元素$tan theta_(i,j)$一定位于矩阵的第一行，$y$轴则为第二行，$z$轴则为第三行；与变换方向呈剪切角度的方向为$x$轴时，元素$tan theta_(i,j)$一定位于第一列，$y$轴则为第二列，$z$轴则为第三列。例如，某个剪切变换在$z$轴方向进行，与$x$轴方向呈剪切角度，则$tan theta_(z,x)$位于第三行第一列。

以上描述的剪切矩阵均为仅在一个方向上做变换、并与另一个方向呈一定剪切角度的情况。若同时应用多个不同的剪切变换，使用上面的规律填入元素，则剪切矩阵可记为
$ bold(H)(theta_(i,j)) = mat(
  1, tan theta_(x,y), tan theta_(x,z), 0;
  tan theta_(y,x), 1, tan theta_(y,z), 0;
  tan theta_(z,x), tan theta_(z,y), 1, 0;
  0, 0, 0, 1
) $ <equ:shear_matric>
若某个方向的剪切变换不使用，将@equ:shear_matric 中对应位置的$tan theta_(i,j)$写为0即可。
====== 组合变换
一种变换可能无法满足要求，有时需要同时应用多种以表示复杂的变换。对于有限个仿射变换$bold(A)_1$、$bold(A)_2$、……$bold(A)_n$，*依次*将它们作用于一点$bold(x)$，则变换后得到的点$bold(x')$为
$ bold(x')=bold(A)_n bold(A)_(n-1) dots.h.c bold(A)_2 bold(A)_1 bold(x) $
注意矩阵的乘法遵循*从右向左*的运算规则，且不支持交换律，但是支持结合律，因此有
$ bold(x')=(bold(A)_n bold(A)_(n-1) dots.h.c bold(A)_2 bold(A)_1)bold(x) $
令$bold(A)=bold(A)_n bold(A)_(n-1) dots.h.c bold(A)_2 bold(A)_1$，则$bold(x)=bold(A) bold(x')$，其中$bold(A)$为组合变换矩阵。组合变换中各种变换的次序非常重要，上一个变换可能会影响下一个变换的结果。

在标签 #icon("nbt-list") `transformation` 中使用的矩阵均为组合变换矩阵。
#example(
  [修改一个方块展示实体的NBT数据，使之依次绕$y$轴旋转$30 degree$、绕$x$轴旋转$45 degree$、绕$z$轴旋转$90 degree$。],
  [
    求出组合变换矩阵，注意按从右向左的顺序计算：
    #math.equation(numbering: none, block: true)[$ bold(A) &= bold(R)_z (90 degree) bold(R)_x (45 degree) bold(R)_y (30 degree)\ &= mat(
      cos 90 degree, sin 90 degree, 0, 0;
      -sin 90 degree, cos 90 degree , 0, 0;
      0, 0, 1, 0;
      0, 0, 0, 1
    ) mat(
      1, 0, 0, 0;
      0, cos 45 degree , -sin 45 degree, 0;
      0, sin 45 degree, cos 45 degree, 0;
      0, 0, 0, 1
    ) mat(
      cos 30 degree, 0, sin 30 degree, 0;
      0, 1 , 0, 0;
      -sin 30 degree, 0, cos 30 degree, 0;
      0, 0, 0, 1
    )\ &= mat(
      display(-sqrt(2)/4), display(-sqrt(2)/2), display(sqrt(6)/4), 0;
      display(sqrt(3)/2), 0, display(1/2), 0;
      display(-sqrt(2)/4), display(sqrt(2)/2), display(sqrt(6)/4), 0;
      0, 0, 0, 1
    ) approx mat(
      -0.35, -0.71, 0.61, 0;
      0.87, 0, 0.5, 0;
      -0.35, 0.71, 0.61, 0;
      0, 0, 0, 1
    )$]
    故命令应为
    #codebox("data merge entity @e[type=block_display,limit=1] {transformation:[-0.35f, -0.71f, 0.61f, 0.0f, 0.87f, 0.0f, 0.5f, 0.0f, -0.35f, 0.71f, 0.61f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f]}")
  ]
)
===== 分解形式 \*
对于@equ:affine_matrix 所述$4 times 4$大小的仿射变换矩阵$bold(A)$，其元素$a_(41)$、$a_(42)$、$a_(43)$总是为0，$a_(44)$总是为1，若不为1，则将整个矩阵按#box(baseline: 30%, inset: (y: 0.5em))[$display(1/a_(44))$]的比例缩放，从而使$a_(44)$为1。可以将其分块写成如下的形式：
$ bold(A) = mat(
  augment: #(hline: 3, vline: 3),
  a_(11), a_(12), a_(13), a_(14);
  a_(21), a_(22), a_(23), a_(24);
  a_(31), a_(32), a_(33), a_(34);
  a_(41), a_(42), a_(43), a_(44)
) = mat(
  bold(B)_(3 times 3), bold(T)_(3 times 1);
  bold(O)_(1 times 3), bold(E)_(1 times 1)
) $ <equ:affine_matrix_block>
式中分块阵$bold(B)$是左上角$3 times 3$区域，这个区域代表模型的线性变换，存储了包括旋转、缩放、镜像和剪切在内的所有线性变换数据，注意，这个分块阵不适用于平移变换，因为平移变换不是线性变换。而分块阵$bold(T)$的三个元素仅被平移变换所使用。

分解形式的 #icon("nbt-compound") `transformation` 字段是分块阵$bold(B)$经#proper-noun(display: "奇异值分解（Singular value decomposition，SVD）", "qi2 yi4 zhi2 fen1 jie3")后使用的数据。对于任意的3阶方阵$bold(B)$，总存在3阶正交方阵$bold(U)$和$bold(V)$、3阶对角阵$bold(Sigma)$，有
$ bold(B)=bold(U)bold(Sigma)bold(V)^"T" $ <equ:svd>
#param-desc(
  prefix: "式中：",
  [$bold(V)^"T"$], [矩阵$bold(V)$的转置矩阵。]
)
称$bold(U)$为#proper-noun(display: "左奇异向量矩阵（left-singular vector matrix）", "zuo3 qi2 yi4 xiang4 liang4 ju3 zhen4")，$bold(V)$为#proper-noun(display: "右奇异向量矩阵（Right-singular vector matrix）", "you4 qi2 yi4 xiang4 liang4 ju3 zhen4")，对角阵$bold(Sigma)$中对角线上的三个元素被称为#proper-noun(display: "奇异值（Singular values）", "qi2 yi4 zhi2")。下面介绍奇异值分解的计算方法。

对@equ:svd，等号左右两边取转置矩阵，得
$ bold(B)^"T"=bold(V)bold(Sigma)bold(U)^"T" $
#h(-2em)由于方阵$bold(U)$和$bold(V)$是正交的，因此$bold(V)^"T"bold(V)=bold(E)$、$bold(U)^"T"bold(U)=bold(E)$。则有
$ bold(B)bold(B)^"T"=bold(U)bold(Sigma)bold(V)^"T"bold(V)bold(Sigma)bold(U)^"T"=bold(U)bold(Sigma)^2 bold(U)^"T" $
#h(-2em)对上式进行变形：
$ bold(U)(bold(B)bold(B)^"T")bold(U)^"T"=bold(Sigma)^2 $
方阵$bold(B)bold(B)^"T"$是一个实对称阵，显然上式描述的是将$bold(B)bold(B)^"T"$相似对角化的过程，其中#box(baseline: 43%, inset: (y: 0.5em))[$display(bold(Sigma)=mat(sigma_1, , ; , sigma_2, ; , , sigma_3))$]，使用的正交阵便为左奇异向量矩阵$bold(U)$。如果记$lambda_1$、$lambda_2$、$lambda_3$是$bold(B)bold(B)^"T"$的三个特征值，这些特征值是非负的，读者可自行证明，于是有
$ bold(Sigma)^2=mat(lambda_1, , ; , lambda_2, ; , , lambda_3)=mat(sigma^2_1, , ; , sigma^2_2, ; , , sigma^2_3) $
于是求出$bold(B)bold(B)^"T"$的三个特征值即可求出对角阵$bold(Sigma)$。因此，$bold(Sigma)$和$bold(U)$的求解步骤如下：
======= 由特征方程$abs(lambda bold(E) - bold(B)bold(B)^"T") = 0$求$bold(B)bold(B)^"T"$的全部特征值$lambda_i$，然后求出对角阵
$ bold(Sigma)="diag"(sigma_1,sigma_2,sigma_3)="diag"(sqrt(lambda_1),sqrt(lambda_2),sqrt(lambda_3)) $
======= 对于每个特征值$lambda_i$，由方程组$(lambda_i bold(E)-bold(B)bold(B)^"T")bold(x)=bold(0)$求对应的特征向量$bold(alpha)_i$。
======= 如果求得的特征向量相互不正交，则对特征向量$bold(alpha)_i$进行正交化，记正交化后的向量为$bold(beta)_i$。
======= 如果求得的向量$bold(beta)_i$没有单位化，则将其单位化为$bold(gamma)_i$，令$bold(U)=[gamma_1,gamma_2,gamma_3]$。计算完毕。
\ 

对于右奇异向量矩阵$bold(V)$，有
$ bold(B)^"T"bold(B)=bold(V)bold(Sigma)bold(U)^"T"bold(U)bold(Sigma)bold(V)^"T"=bold(V)bold(Sigma)^2 bold(V)^"T" $
#h(-2em)同理可求得右奇异向量矩阵，计算步骤与上述计算左奇异向量矩阵的步骤相同，其中$bold(Sigma)$和上文是同一个矩阵，可不必重复计算。若$bold(B)$可逆，对@equ:svd 变形：
$ bold(V)=bold(B)^(-1)bold(U)bold(Sigma) $ <equ:svd_v_calculate_directly>
#h(-2em)则可以不进行对角化计算而直接求出右奇异向量矩阵$bold(V)$。下面举一个奇异值分解的计算实例：
#example(
  [对#box(baseline: 43%, inset: (y: 0.5em))[$display(bold(B) = mat(1, 0, 0; 0, 0, 3; 0, 0, -1))$]进行奇异值分解。],
  [
    首先求左奇异向量矩阵，#box(baseline: 43%, inset: (y: 0.5em))[$display(bold(B)bold(B)^"T" = mat(1, 0, 0; 0, 0, 3; 0, 0, -1) mat(1, 0, 0; 0, 0, 0; 0, 3, -1) = mat(1, 0, 0; 0, 9, -3; 0, -3, 1))$]。由特征多项式#box(baseline: 43%, inset: (y: 0.5em))[$display(abs(lambda bold(E) - bold(B)bold(B)^"T") = mat(delim: "|", lambda-1, 0, 0; 0, lambda-9, 3; 0, 3, lambda-1) = (lambda -10)(lambda -1)lambda = 0)$]，解得$lambda_1=10$，$lambda_2=1$，$lambda_3=0$。因此有$sigma_1=sqrt(10)$，$sigma_2=1$，$sigma_3=0$，所以#box(baseline: 30%, inset: (y: 0.5em))[$bold(Sigma) = "diag"(sqrt(10),1,0)$]。

    当$lambda_1=10$时，解方程#box(baseline: 30%, inset: (y: 0.5em))[$display((10 bold(E) - bold(B)bold(B)^"T")bold(x) = bold(0))$]，#box(baseline: 43%, inset: (y: 0.5em))[$display(mat(9, 0, 0; 0, 1, 3; 0, 3, 9) ~ mat(1, 0, 0; 0, 1, 3; 0, 0, 0))$]，得基础解系$bold(alpha_1)=(0,-3,1)^"T"$，此即为$lambda_1=10$对应的特征向量。

    当$lambda_2=1$时，解方程$(bold(E)-bold(B)bold(B)^"T")bold(x)=bold(0)$，得基础解系$bold(alpha_2)=(1,0,0)^"T"$。
    
    当$lambda_3=0$时，解方程$(0bold(E)-bold(B)bold(B)^"T")bold(x)=bold(0)$，得基础解系$bold(alpha_3)=(0,1,3)^"T"$。

    $bold(alpha_1)$、$bold(alpha_2)$、$bold(alpha_3)$已正交，现对其进行单位化，得#box(baseline: 43%, inset: (y: 0.5em))[$display(bold(gamma_1)=1/sqrt(10)(0,-3,1)^"T")$]，$bold(gamma_2)=(1,0,0)^"T"$，#box(baseline: 43%, inset: (y: 0.5em))[$display(bold(gamma_3)=1/sqrt(10)(0,1,3)^"T")$]。令#box(baseline: 46%, inset: (y: 0.5em))[$display(bold(U)=[bold(gamma_1),bold(gamma_2),bold(gamma_3)]=mat(0,1,0;display(-3/sqrt(10)),0,display(1/sqrt(10));display(1/sqrt(10)),0,display(3/sqrt(10))))$]，此即为左奇异向量矩阵。

    接下来求右奇异向量矩阵，因为$"r"(bold(B))<3$，$bold(B)$不可逆，故不能使用@equ:svd_v_calculate_directly 计算$bold(V)$。

    #box(baseline: 43%, inset: (y: 0.5em))[$display(bold(B)^"T"bold(B)=mat(1, 0, 0; 0, 0, 0; 0, 3, -1)mat(1, 0, 0; 0, 0, 3; 0, 0, -1)=mat(1,0,0;0,0,0;0,0,10))$]已为对角阵，将对角线元素顺序改为$bold(Sigma)^2$的顺序，取$bold(gamma_1)=(0,0,-1)^"T"$，$bold(gamma_2)=(1,0,0)^"T"$，$bold(gamma_3)=(0,1,0)^"T"$，令#box(baseline: 43%, inset: (y: 0.5em))[$display(bold(V)=mat(0,1,0;0,0,1;-1,0,0))$]，此即为右奇异向量矩阵。则有$bold(U)bold(Sigma)bold(V)^"T"=bold(B)$。分解完毕。
  ]
)
矩阵奇异值分解的结果具有几何意义。因为$bold(U)$、$bold(V)$都是正交矩阵，所以它们能用于表示旋转，$bold(Sigma)$是缩放变换矩阵。任何变换都可以被分解成四个过程：初次旋转变换、缩放变换、再次旋转变换和平移变换。因此，用$bold(V)$表示初次旋转变换，用$bold(Sigma)$表示缩放变换，用$bold(U)$表示再次旋转变换，在此基础上再引入平移向量$bold(T)$，则可以得到变换矩阵$bold(A)$的分解形式，此时字段 #icon("nbt-compound") `transformation` 是复合标签：
#tree(
  (0, [#icon("nbt-compound") *transformation*: 分解形式。]),
  (1, [#icon("nbt-list")#icon("nbt-compound") *right_rotation*: 模型进行缩放变换前的旋转变换，即初次旋转变换，与奇异值分解中的$bold(V)$相关。拥有两种可用数据形式：轴角式和四元数形式。编写时可以使用轴角式，但是在存储数据时一律转换成四元数形式。]),
  (2, [初次旋转数据]),
  (1, [#icon("nbt-list") *scale*: 模型的缩放变换，与奇异值分解中的$bold(Sigma)$相关。使用三维向量。]),
  (2, [#icon("nbt-float") 向量的一个分量。]),
  (1, [#icon("nbt-list")#icon("nbt-compound") *left_rotation*: 模型进行缩放变换后的旋转变换，即再次旋转变换，与奇异值分解中的$bold(U)$相关。同样有轴角式和用四元数形式两种表示方式。编写时可以使用轴角式，但是在存储数据时一律转换成四元数形式。]),
  (2, [再次旋转数据]),
  (1, [#icon("nbt-list") *translation*: 模型的平移变换$bold(T)$。对应矩阵形式最后一列前三行元素，见@equ:affine_matrix_block。使用三维向量。]),
  (2, [#icon("nbt-float") 向量的一个分量。])
)
对于 #icon("nbt-list")#icon("nbt-compound") `right_rotation` 和 #icon("nbt-list")#icon("nbt-compound") `left_rotation` 这两个字段，有轴角式和四元数形式两种数据形式表示旋转。下面分别介绍这两种数据形式：
====== 轴角式
#proper-noun(display: "轴角式（Angle-axis form）", "zhou2 jiao3 shi4")旋转可以理解为：一个向量$bold(v)$绕一个通过原点（即实体实际位置）的长度为1的轴$bold(u)$旋转角度$theta$得到向量$bold(v)'$。此时有$norm(bold(u))=1$。
#align(center)[
  #grid(
    align: center,
    column-gutter: 10em,
    columns: 2,
    [
      #figure(
        caption: "轴角式旋转示意图",
        image("图片/轴角式旋转示意图.png", height: 10em)
      )
    ],
    [
      #figure(
        caption: [向量$bold(v)$的分解],
        image("图片/向量v的分解.png", height: 10em)
      )
    ]
  )
]
为了便于分析，将向量$bold(v)$分解成平行于轴$bold(u)$的向量$bold(v)_parallel$和正交于轴$bold(u)$的向量$bold(v)_parallel$，于是有
$ bold(v)=bold(v)_parallel+bold(v)_perp $ <equ:decomposition_of_vector_v>
#h(-2em)将$bold(v)_parallel$用含有$bold(v)$和$bold(u)$的式子表达，即计算$bold(v)$在$bold(u)$上的投影：
$ bold(v)_parallel = norm(bold(v)_parallel) bold(u)/norm(bold(u)) = ((bold(u) dot.c bold(v))bold(u))/(norm(bold(u))norm(bold(u))) = (bold(u) dot.c bold(v))bold(u) $
#h(-2em)于是可得到$bold(v)_perp$的表达式
$ bold(v)_perp = bold(v) - bold(v)_parallel = bold(v) - (bold(u) dot.c bold(v))bold(u) $
对于向量$bold(v)'$，同样可以将其分解得到
$ bold(v)'=bold(v)'_parallel + bold(v)'_perp $ <equ:decomposition_of_vector_v_>
#h(-2em)实际上，在向量$bold(v)$的旋转过程中，向量$bold(v)_parallel$没有发生变化，即
$ bold(v)'_parallel = bold(v)_parallel $
#figure(
  caption: [向量$bold(v)_perp$的旋转],
  image("图片/向量v⊥的旋转.png", width: 10em)
) <fig:rotation_of_the_vector_perpendicular_to_v>
现在考察向量$bold(v)_perp$的旋转。不难发现，向量的旋转实际上是发生在圆周上的，如@fig:rotation_of_the_vector_perpendicular_to_v 所示。此时正交于$bold(u)$轴的平面内没有其他可用轴，为此构建同时正交于$bold(u)$和$bold(v)_perp$的轴$bold(w)$，有
$ bold(w) = bold(u) times bold(v)_perp $
#h(-2em)由
$ norm(bold(w)) = norm(bold(u) times bold(v)_perp) = norm(bold(u)) dot.c norm(bold(v)_perp) dot.c sin 90 degree = norm(bold(v)_perp) $
#h(-2em)知$bold(w)$和$bold(v)_perp$的模是相等的，故将向量$bold(v)'_perp$可被分解为平行于$bold(w)$的$bold(v)'_bold(w)$和平行于$bold(v)_perp$的$bold(v)'_bold(v)$，有
$ bold(v)'_perp = bold(v)'_bold(w) + bold(v)'_bold(v) = bold(w) sin theta + bold(v)_perp cos theta = (bold(u) times bold(v)_perp)sin theta + bold(v)_perp cos theta $ <equ:decomposition_of_the_vector_perpendicular_to_v_>
#h(-2em)所以得到
$ bold(v)' &= bold(v)'_parallel + bold(v)'_perp\ &= bold(v)_perp + (bold(u) times bold(v)_perp)sin theta + bold(v)_perp cos theta\ &= bold(v)_perp + [bold(u) times (bold(v) - bold(v)_parallel)]sin theta + bold(v)_perp cos theta\ &= bold(v)_perp + (bold(u) times bold(v))sin theta + bold(v)_perp cos theta\ &= (bold(u) dot.c bold(v))bold(u) + (bold(u) times bold(v))sin theta + [bold(v) - (bold(u) dot.c bold(v))bold(u)] cos theta\ &= (bold(u) dot.c bold(v))bold(u)(1 - cos theta) + (bold(u) times bold(v))sin theta + bold(v) cos theta $
使用轴角式表示旋转时字段 #icon("nbt-compound") `right_rotation` 和 #icon("nbt-compound") `left_rotation` 为复合标签：
#tree(
  (0, [#icon("nbt-compound") *right_rotation*或*left_rotation*]),
  (1, [#icon("nbt-float") *angle*: 绕轴旋转的角度，即$theta$角，采用*角度制*。]),
  (1, [#icon("nbt-list") *axis*: 含三个元素的有序数组，用于定义旋转轴向量$bold(u)$。一般可以写成单位向量。]),
  (2, [#icon("nbt-float") 向量的一个分量。])
)
====== 四元数形式
使用四元数形式表示旋转时，字段 #icon("nbt-list") `right_rotation` 和 #icon("nbt-list") `left_rotation` 类型是列表，数据格式为：
#tree(
  (0, [#icon("nbt-list") *right_rotation*或*left_rotation*: 表示四元数的四个元素，顺序依次为$x$、$y$、$z$、$w$。]),
  (1, [#icon("nbt-float") 四元数中的一个元素。])
)
一切#proper-noun(display: "四元数（Quaternion）", "si4 yuan2 shu4")都可以写成如下的形式：
$ q = w + x bold(i) + y bold(j) + z bold(k) $
其中$x$、$y$、$z$、$w in RR$，称$x bold(i) + y bold(j) + z bold(k)$为四元数$q$的虚部，$w$为实部。一般可以使用向量$q=(w,x,y,z)$来表示四元数，或者将$(x,y,z)$视作一个向量$bold(v)$，用标量和向量的形式表示四元数$q=(w,bold(v))$。四元数的模为#box(baseline: 30%, inset: (y: 0.5em))[$norm(q) = sqrt(w^2 + x^2 + y^2 + z^2)$]，规定：当$norm(q) = 1$时，该四元数为#proper-noun(display: "单位四元数（Unit quaternion）", "dan1 wei4 si4 yuan2 shu4")。同时又有规定：当$w=0$时，可以称该四元数为*纯四元数*。

对于轴角式中的旋转轴和向量，可以将其写成纯四元数的形式，如$u=(0,bold(u))$、$v=(0,bold(v))$。因此@equ:decomposition_of_vector_v、@equ:decomposition_of_vector_v_ 可写成如下的形式：
$ v = v_parallel + v_perp $
$ v' = v'_parallel + v'_perp $
#h(-2em)$v_parallel$的旋转可表示为
$ v'_parallel = v_parallel $
#h(-2em)对@equ:decomposition_of_the_vector_perpendicular_to_v_ 作变形，如果将$(u sin theta + cos theta)$视作一个四元数$q$，即$q=(cos theta, bold(u) sin theta)$，则可得
$ v'_perp = q v_perp $
注意到，上面的这个四元数q有如下性质：
$ norm(q) = sqrt(cos^2 theta + bold(u) sin theta dot.c bold(u) sin theta) = sqrt(cos^2 theta + norm(bold(u))^2 sin^2 theta) = 1 $
#h(-2em)这是一个单位四元数。*一般应用于旋转变换的四元数都是单位四元数，非单位四元数会使得模型在旋转的同时进行缩放*。于是使用四元数形式表示的向量旋转为
$ v' = v'_parallel + v'_perp = v_parallel + q v_perp $ <equ:quaternion_form_of_v_>
令$q=p^2$，其中#box(baseline: 30%, inset: (y: 0.5em))[$display(p = (cos theta/2, bold(u) sin theta/2))$]，则@equ:quaternion_form_of_v_ 可化简为
$ v' &= v_parallel + q v_perp\ &= p p^* v_parallel + p^2 v_perp\ &= p v_parallel p^* + p v_perp p^*\ &= p(v_parallel + v_perp)p^*\ &= p v p^* $
#param-desc(
  prefix: "式中：",
  [$p^*$], [四元数$p$的共轭，若$p=(w,bold(v))$，则$p^*=(w,-bold(v))$。]
)
于是得到了四元数形式表示的旋转公式：
$ v' = q v q^* $ <equ:quaternion_rotation>
#h(-2em)*其中#box(baseline: 30%, inset: (y: 0.5em))[$display(q = (cos theta/2, bold(u) sin theta/2))$]。这个四元数中各元素分别为#box(baseline: 30%, inset: (y: 0.5em))[$display(w = cos theta/2)$]、#box(baseline: 30%, inset: (y: 0.5em))[$display(x = u_x sin theta/2)$]、#box(baseline: 30%, inset: (y: 0.5em))[$display(y = u_y sin theta/2)$]、#box(baseline: 30%, inset: (y: 0.5em))[$display(z = u_z sin theta/2)$]。$theta$是绕轴$bold(u)$旋转的角度，方向为逆时针。$u_i$是旋转轴$bold(u)$在该坐标轴$i$上的分量。*

\

对于一个渲染变换，设其初次旋转所用四元数为$q_r$，再次旋转所用四元数为$q_l$，令缩放数据$s=(s_x,s_y,s_z)$，平移数据$t=(t_x,t_y,t_z)$。对展示实体上任意一点$A(x_0,y_0,z_0)$构造四元数
$ q_0 = x_0 bold(i) + y_0 bold(j) + z_0 bold(k) = (0, arrow(O A)) $
#h(-2em)进行初次旋转，得到
$ q_1 = q_r q_0 q^*_r $
#h(-2em)随后应用缩放变换，得到
$ q_2 = s_x q_(1x) bold(i) + s_y q_(1y) bold(j) + s_z q_(1z) bold(k) $
#h(-2em)*在初次旋转和放缩变换共同作用下，模型中各点的相对位置会发生改变。*只有当初次旋转四元数$q_r=(1,bold(0))$（不发生旋转）或缩放数据$s=(1,1,1)$（不进行缩放）时，模型才不会发生变形。模型在这之后会*根据再次旋转变换确定最终的旋转角度*，得到
$ q_3 = q_l q_2 q^*_l $
#h(-2em)最后应用平移变换，确定模型最终的位置，从而得到点$A$最终的位置：
$ q = q_3 + t $
#example(
  [
    现用方块展示实体展示一个玻璃。
    + 生成这个展示实体，使玻璃的体对角线与$y$轴平行。
    + 使这个展示实体绕体对角线旋转，旋转一周用时4秒。
    #figure(
      caption: "",
      image("图片/展示实体例题.png", width: 5em)
    )
  ],
  [
    + 模型中体对角线从$O(0,0,0)$到$A(1,1,1)$，现在需要使模型在不发生形变的前提下将$arrow(O A)$变换为与$(0,1,0)$（$y$轴方向向量）平行。现在可以直接确定再次旋转所用的四元数$q_l$，根据@equ:quaternion_rotation，待确定的量有旋转角度$theta$和旋转轴$bold(u)$。

      计算旋转角度：将$arrow(O A)$单位化，得到#box(baseline: 30%, inset: (y: 0.5em))[$display((1/sqrt(3),1/sqrt(3),1/sqrt(3)))$]，因此
      #math.equation(numbering: none, block: true)[$ theta = arccos [(1/sqrt(3),1/sqrt(3),1/sqrt(3)) dot.c (0,1,0)] = arccos 1/sqrt(3) approx 54.74 degree $]
      旋转轴垂直于旋转前后的向量，有
      #math.equation(numbering: none, block: true)[$ bold(u) = (1/sqrt(3),1/sqrt(3),1/sqrt(3)) times (0,1,0) = (-1/sqrt(3),0,1/sqrt(3)) $]
      将其单位化得#box(baseline: 30%, inset: (y: 0.5em))[$display((-1/sqrt(2),0,1/sqrt(2)))$]，如果使用轴角式，#icon("nbt-compound") `left_rotation` 的数据为：
      #tree(
        (0, [#icon("nbt-compound") *left_rotation*]),
        (1, [#icon("nbt-float") *angle*: `54.74`]),
        (1, [#icon("nbt-list") *axis*: `[-0.71f, 0.0f, 0.71f]`])
      )
      于是由@equ:quaternion_rotation 计算再次旋转四元数
      #math.equation(numbering: none, block: true)[$ q = (cos theta/2, u_x sin theta/2, u_y sin theta/2, u_z sin theta/2) approx (0.89, -0.33, 0, 0.33) $]
      模型不需要进行初次旋转、缩放和平移，故$q_r=(1,0,0,0)$，$s=(1,1,1)$，$t=(0,0,0)$。分解形式的 #icon("nbt-compound") `transformation` 字段为：
      #tree(
        (0, [#icon("nbt-compound") *transformation*]),
        (1, [#icon("nbt-list") *left_rotation*: `[-0.33f, 0.0f, 0.33f, 0.89f]`]),
        (1, [#icon("nbt-list") *right_rotation*: `[0.0f, 0.0f, 0.0f, 1.0f]`]),
        (1, [#icon("nbt-list") *scale*: `[1.0f, 1.0f, 1.0f]`]),
        (1, [#icon("nbt-list") *translation*: `[0.0f, 0.0f, 0.0f]`])
      )
      生成这个展示实体所需的命令为：
      #codebox("summon block_display ~ ~ ~ {block_state:{Name:\"minecraft:glass\"},transformation:{left_rotation:[-0.33f,0.0f,0.33f,0.89f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],translation:[0.0f,0.0f,0.0f]}}")
    + 字段 #icon("nbt-compound") `left_rotation` 的值已定义，旋转动画由插值完成，可由 #icon("nbt-compound") `right_rotation` 定义，待确定的量依然是旋转角度$theta$和旋转轴$bold(u)$。显然旋转轴为方块模型的体对角线，这时体对角线与$y$轴平行，但变换依旧基于模型的局部坐标，因此轴向量为$(1,1,1)$，单位化为#box(baseline: 30%, inset: (y: 0.5em))[$display((1/sqrt(3),1/sqrt(3),1/sqrt(3)))$]。制作插值动画时，可以设定四个固定的旋转角度：$0 degree$、$90 degree$、$180 degree$、$270 degree$，使得模型依此顺序循环变换，每次插值的时长为$4 div 4=1$秒$=20$gt。

      以$theta=90 degree$为例，若使用轴角式，则 #icon("nbt-compound") `right_rotation` 的数据为
      #tree(
        (0, [#icon("nbt-compound") *right_rotation*]),
        (1, [#icon("nbt-float") *angle*: `90`]),
        (1, [#icon("nbt-list") *axis*: `[0.58f, 0.58f, 0.58f]`])
      )
      由@equ:quaternion_rotation 转换为四元数形式$q approx (0.71,0.41,0.41,0.41)$，即
      #codebox("right_rotation:[0.41f,0.41f,0.41f,0.71f]")
      同理$theta=180 degree$、$theta=270 degree$、$theta=0 degree$的数据分别为
      #codebox("right_rotation:[0.58f,0.58f,0.58f,0.0f]")
      #codebox("right_rotation:[0.41f,0.41f,0.41f,-0.71f]")
      #codebox("right_rotation:[0.0f,0.0f,0.0f,1.0f]")
      为将模型的旋转角度平滑过渡至$theta=90 degree$，插值动画的命令为
      #codebox("data merge entity @n[type=block_display] {transformation:{right_rotation:[0.41f,0.41f,0.41f,0.71f]},interpolation_duration:20}") <code:transformation_decomposed_form_loop>
      该命令执行后，可以用 `/schedule` 使20 gt后、由命令@code:transformation_decomposed_form_loop 定义的插值动画结束时模型的旋转角度开始平滑过渡至$theta=180 degree$：
      #codebox("data merge entity @n[type=block_display] {transformation:{right_rotation:[0.58f,0.58f,0.58f,0.0f]},interpolation_duration:20}")
      20gt后开始平滑过渡至$theta=270 degree$：
      #codebox("data merge entity @n[type=block_display] {transformation:{right_rotation:[0.41f,0.41f,0.41f,-0.71f]},interpolation_duration:20}")
      20gt后开始平滑过渡至$theta=0 degree$：
      #codebox("data merge entity @n[type=block_display] {transformation:{right_rotation:[0.0f,0.0f,0.0f,1.0f]},interpolation_duration:20}")
      20gt后开始平滑过渡至$theta=90 degree$，此时循环至命令@code:transformation_decomposed_form_loop。在函数中执行命令时，则可以在目录 #icon("folder") `data > minecraft > function > animation` 下创建 #icon("mcfunction") `90.mcfunction`、#icon("mcfunction") `180.mcfunction`、#icon("mcfunction") `270.mcfunction`、#icon("mcfunction") `0.mcfunction` 四个函数。例如，函数 `minecraft:animation/90` 的内容可以如下所示：
      #codefile(
        lang: "mcfunction",
        title: "data > minecraft > function > animation > 90.mcfunction",
        "data merge entity @n[type=block_display] {transformation:{right_rotation:[0.41f,0.41f,0.41f,0.71f]},interpolation_duration:20}
schedule function minecraft:animation/180 20t"
      )
  ]
)
=== 交互实体
上述的两种技术型实体：标记和展示实体，都没有判定箱，都不具备直接与之交互的能力。为此游戏又提供了一种技术型的可交互实体，即#proper-noun(display: "交互实体（Interaction）", "jiao1 hu4 shi2 ti3")。这是一种拥有判定箱的、可与玩家发生交互行为的实体，若将其与标记或展示实体联合使用，甚至可以在原版制作出自定义生物。

同标记和展示实体一样，交互实体没有自主行为，不会阻碍方块放置、不会推开其他实体，且只能通过命令 `/summon` 生成。交互实体不可见，但可以通过 `F3` + `B` 观察其实体边界框。玩家攻击和使用交互实体的行为均被视为交互行为，交互实体会自主记录这些行为并存储到其实体数据中。

除了实体共通标签外，交互实体拥有以下特有字段：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *attack*: 最后一个攻击此交互实体（`鼠标左键`）的玩家。]),
  (2, [#icon("nbt-int_array") *#underline[player]*: 该玩家的UUID。]),
  (2, [#icon("nbt-long") *#underline[timestamp]*: 该玩家做出攻击行为的时间点。]),
  (1, [#icon("nbt-float") *height*: 实体边界框的高度，默认为 `1.0f`，单位为方格。]),
  (1, [#icon("nbt-compound") *interaction*: 最后一个使用此交互实体（`鼠标右键`）的玩家。]),
  (2, [#icon("nbt-int_array") *#underline[player]*: 该玩家的UUID。]),
  (2, [#icon("nbt-long") *#underline[timestamp]*: 该玩家做出使用行为的时间点。]),
  (1, [#icon("nbt-bool") *response*: 玩家与该展示实体交互时是否触发响应（玩家手臂的挥动），默认为 `false`。]),
  (1, [#icon("nbt-float") *width*: 实体边界框的宽度，默认为 `1.0f`，单位为方格。])
)
#example(
  [尝试实现打碎石砖的效果：对位于$(0,70,0)$的石砖左键会将其转换为裂纹石砖。],
  [
    石砖没有方块实体，本身也并不会与玩家产生交互，因此必须使用交互实体。首先为保证石砖六个面都有交互效果，可以使用一个长宽均为1.1格的交互实体，这样实体比方块略大，将交互实体的位置放在$(0.5,69.9,0.5)$可使其中心与方块中心重合（交互实体的锚点位于其底部中心），于是有
    #codebox("summon interaction 0 69.9 0 {height:1.1f,width:1.1f,Tags:[\"stone_bricks\"]}")
    $x$和$z$坐标采用了中心校准，这样就生成了一个带有记分板标签 `stone_bricks` 的交互实体。下面在循环型命令方块中键入下面的命令：
    #codebox("execute as @e[type=interaction,tag=stone_bricks] positioned as @s if data entity @s attack run setblock ~ ~1 ~ minecraft:cracked_stone_bricks")
    该命令的意义为：判断此拥有记分板标签 `stone_bricks` 的交互实体是否含有 #icon("nbt-compound") `attack` 这个字段，因为只要玩家对其左键（视为攻击），#icon("nbt-compound") `attack` 字段会立即记录下攻击此实体的玩家，在此之前交互实体没有 #icon("nbt-compound") `attack` 字段。

    只要测试通过，即在交互实体的位置上方一格方块（石砖的位置）放置裂纹石砖。因为这时候交互实体的锚点实际上位于方块坐标为$(0,69,0)$的方块内，因此$y$坐标必须拔高一格。
    
    记分板标签和命令 `/execute` 的使用可参考后面的章节。
  ]
)
== 玩家
#proper-noun(display: "玩家（Player）", "wan2 jia1")是进行游戏的主体。它也是一种实体，属于生物一类。*玩家的数据无法直接由命令 `/data`、`/execute` 等修改*，而是由 `/attribute`、`/item` 等命令间接、部分地修改。
=== 游戏档案
#proper-noun(display: "游戏档案（Game Profile）", "you2 xi4 dang4 an4")，又称#proper-noun(display: "玩家档案（Player Profile）", "wan2 jia1 dang4 an4")，是每一个游戏帐户的凭证，游戏通过这些游戏档案唯一地确定用户，从而分发玩家实体。每一个游戏档案都有以下的信息：
+ #proper-noun(display: "用户名（Username）", "yong4 hu4 ming2")：即玩家名称，长3 \~ 16字符（含）#footnote[部分早期注册的游戏档案会有1 \~ 2个字符。]，每一个用户名都必须不同。
+ 外观：即玩家的皮肤，有宽型和纤细型两种，其手臂宽度分别为4、3个像素。
+ UUID：*游戏档案使用UUID作为标识符。*离线游戏和正版游戏的UUID不同。
#figure(
  caption: [玩家用户名：`Mu_xian`，使用的皮肤为纤细型，UUID `654c6848-d79d-4e07-bbf4-0a88e65a57ef`],
  image("图片/Mu_xian.png", width: 8em)
)
命令 `/fetchprofile` 可用于获取玩家档案，结果只会在聊天栏中显示，因此该命令虽然在命令方块和函数中均可用，但只在聊天栏中执行是有效的。它并不是一个自动化的命令。获取得到的文本为：\ #text_component([已解析名称为Mu_xian的玩家档案：[#text(green)[复制组件]] [#text(green)[给予物品]] [#text(green)[召唤玩家模型]] [#text(green)[复制 #icon("sprite-Mu_xian") ]]])\ 其中的四个带方括号的文本均有点击事件，作用依次为复制 `profile` 组件的内容、给予对应玩家的头、生成玩家模型和复制对应文本组件。

命令所需权限等级为2，以下是所有用法：#index(index: "command", "fetchprofile")
===== 根据UUID获取玩家档案
#codebox("fetchprofile id <id>")
#param-desc(
  [`<id>`（UUID `minecraft:uuid`）], [玩家的UUID，必须为带连字符的十六进制。]
)
===== 根据玩家名称获取玩家档案
#codebox("fetchprofile name <name>")
#param-desc(
  [`<name>`（字符串 `brigadier:string`）], [玩家名称。]
)
===== 从指定实体获取玩家档案
#codebox("fetchprofile entity <entity>")
#param-desc(
  [`<entity>`（实体 `minecraft:entity`）], [获取玩家档案的实体，由于只有玩家和玩家档案这两种实体有档案数据，因此该命令只对这两种实体有作用。必须为玩家名称、UUID或目标选择器，且不必须只选择一个实体。]
)
=== 和玩家有关的命令
本节讲述一些只对玩家有效的命令。
==== 命令 `/experience` 和 `/xp`
该命令用于设置玩家的经验值，所需权限等级为2，两者均可用，且语法完全一致，编写命令时允许将 `/xp` 作为 `/experience` 的简写替代命令。以下是所有用法：#index(index: "command", "experience")#index(index: "command", "xp")
===== 在原先的经验值上修改经验，语法为
#codebox("experience add <targets> <amount> [levels|points]")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [指定命令作用的目标实体，必须为玩家名称、UUID或目标选择器，且目标选择器必须指定玩家。可以使用目标选择器指定多个玩家。],
  [`<amount>`（整型 `brigadier:integer`）], [需要是介于 `-2147483648` 和 `2147483647` 之间（含）的整数值，用于指定给予玩家的经验值数量。这个参数可以是负数，以表示在原先经验的基础上减去一定经验值。],
  [`[levels|points]` ], [用于指定设置的是经验等级 `levels` 还是具体的经验值 `points`。不指定则默认对经验值 `points` 进行操作。]
)
===== 设置经验值，语法为
#codebox("experience set <targets> <amount> [levels|points]")
#param-desc(
  [`<amount>`（整型 `brigadier:integer`）], [必须为大于等于0的数。]
)
===== 查询目标玩家的经验，语法为
#codebox("experience query <targets> (levels|points)")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [只能指定单个玩家。],
  [`[levels|points]` ], [必须选择一个填入。]
)
注意该命令中使用的经验值 `points` 是*对于当前经验等级的经验值*而不是经验值总量，且设置经验值 `points` 时不能超过当前等级可用的最大经验值。各等级的最大可用经验值按下式计算：
$ X_"MAX" = cases(
  2L+6 &"," &0 lt.eq.slant L lt.eq.slant 15,
  5L-39 &"," &16 lt.eq.slant L lt.eq.slant 30,
  9L-159 &"," &L gt.eq.slant 31
) $ <equ:xp_by_level>
#param-desc(
  prefix: "式中：",
  [$X_"MAX"$], [当前等级的最大经验值。],
  [$L$], [经验等级。]
)
当玩家的经验处于某一等级$L$的0经验值时，升到下一等级所需的经验值在@equ:xp_by_level 的基础上加1，即
$ X(L)=X_"MAX"+1 $
#param-desc(
  prefix: "式中：",
  [$X(L)$], [从等级$L$升到等级$L+1$所需的经验值。]
)
则升到等级$L$所需经验值总量可推导得到：
$ f(L) = sum_(i=1)^(L-1) X(i) = cases(
  L^2 + 6L &"," &0 lt.eq.slant L lt.eq.slant 16,
  display(5/2) L^2 - display(81/2) L + 360 &"," &17 lt.eq.slant L lt.eq.slant 31,
  display(9/2) L^2 - display(325/2) L + 2220 &"," &L gt.eq.slant 32
) $ <equ:xp_total>
#param-desc(
  prefix: "式中：",
  [$L$], [升到等级$L$所需经验值总量。]
)
#example(
  [为玩家 `Mu_xian` 设置总量为1246的经验值。],
  [
    这里需要使用@equ:xp_total，先计算第一个分段点$L=16$处的经验值总量，$f(16)=352$，则1246的经验值总量不处于区间$0 lt.eq.slant L lt.eq.slant 16$内。再计算第二个分段点$L = 31$处的经验值总量，$f(31)=1507$，则1246的经验值总量处于区间$17 lt.eq.slant L lt.eq.slant 31$内。此时令#box(baseline: 30%, inset: (y: 0.5em))[$f(L) = display(5/2) L^2 - display(81/2) L + 360 = 1246$]，解得$L approx 28.59$或$-12.39$（舍），知1246的经验值总量所属的等级为28。升到28级所需的经验值总量为$f(28)=1106$，因此需要在28级内的经验值设为$1246-1186=60$。综上所述，此时玩家的经验等级为28，经验值为60。可以依次执行下面的命令：
    #codebox("xp set Mu_xian 28 levels")
    #codebox("xp set Mu_xian 60 points")
  ]
)
==== 命令 `/waypoint`
#wrap-content(
  tips(
    [
      不仅玩家可以被定位，任何的生物都可以被定位。
    ],
    width: 8em
  ),
  [

    这条命令用于处理路径点。#proper-noun(display: "路径点（Waypoint）", "lu4 jing4 dian3")是会将其他生物的位置投射到玩家定位栏中的一项功能。@tab:attributes 中有两项属性与之有关：路径点传输距离 `minecraft:waypoint_transmit_range` 和路径点接收距离 `waypoint_receive_range`。顾名思义，路径点传输距离是向接收者发送路径点信息的属性，因此它可以用于所有生物；而路径点接收距离只能用于玩家，因为只有玩家能接收路径点信息。
  ],
  align: right
)
*记传输路径点的生物为A，接收路径点的玩家为B。只有当B位于A的路径点传输距离以内且A位于B的路径点接收距离以内时，路径点才会被接收并显示在定位栏中。*例如，一个玩家模型的路径点传输距离为10，玩家 `Mu_xian` 的路径点接收距离为5，则它们之间的距离为8时，由于此距离大于 `Mu_xian` 的路径点接收距离，因此该路径点不会被 `Mu_xian` 接收。

当一个生物的路径点传输距离不为0时，即创建了一个路径点；再次重置为0时此路径点被去除。因而*路径点的创建与去除与属性有关，需要使用 `/attribute` 或修改NBT，`/waypoint` 不能创建路径点，只能修改其样式。*
#example(
  [为最近的玩家模型创建一个路径点。],
  [
    命令为
    #codebox("attribute @n[type=mannequin] minecraft:waypoint_transmit_range base set 60000000")
  ]
)
`/waypoint` 需要的权限等级为2，以下是所有用法：#index(index: "command", "waypoint")
===== 列出路径点，即列出所有路径点传输距离不为0的生物
#codebox("waypoint list")
===== 修改路径点的颜色
#codebox("waypoint modify <waypoint> color <color>")
#param-desc(
  [`<waypoint>`（实体 `minecraft:entity`）], [需要修改的路径点，必须为玩家名称、UUID或目标选择器，且必须指定一个实体。],
  [`<color>`（颜色 `minecraft:color`）], [必须为 `reset` 或十六种基本颜色值之一，可用值见@tab:color。]
)
#codebox("waypoint modify <waypoint> color hex <color>")
#param-desc(
  [`<color>`（十六进制颜色 `minecraft:hex_color`）], [用十六进制指定颜色，如 `FF0000`，此参数不需要使用引号括起。]
)
===== 修改路径点的样式
#codebox("waypoint modify <waypoint> style set <style>")
#param-desc(
  [`<style>`（命名空间ID `minecraft:resource_location`）], [路径点样式的命名空间ID，要求是在资源包 #icon("folder") `assets > <命名空间> > waypoint_style` 内定义的路径点样式，否则显示为丢失的纹理。]
)
===== 将路径点样式重置为默认样式
#codebox("waypoint modify <waypoint> style reset")
#example(
  [将最近玩家模型的路径点颜色修改为黄色 #color_block(yellow)，并使用路径点样式 `tutorial:mannequin`。],
  [
    命令为
    #codebox("waypoint modify @n[type=mannequin] color yellow")
    #codebox("waypoint modify @n[type=mannequin] style set tutorial:mannequin")
  ]
)
=== 玩家数据格式 \*<subsec:player_data>
玩家虽然属于实体一类，但是其数据并不存储在 #icon("folder") `entities` 文件夹的Anvil文件中。而是在 #icon("nbt") `players` 中，这个文件夹存储了玩家达成进度、基本数据和统计信息的内容。
==== 进度
#icon("folder") `players > advancements` 文件夹内以玩家UUID的名义存放了各玩家进度的完成情况，包括了玩家完成该进度所触发的准则以及触发这些准则的时间。#icon("json") `<玩家UUID>.json` 文件的数据格式为：
#tree(
  (0, [#icon("json-object") 文件封装]),
  (1, [#icon("json-object") *\<进度命名空间ID>*: 一项已达成的进度。]),
  (2, [#icon("json-object") *criteria*: 达成此进度所触发的准则及达成的时间。]),
  (3, [#icon("json-string") *\<准则名称>*: 触发该准则的时间，格式为 `yyyy-MM-dd HH:mm:ss Z`。]),
  (2, [#icon("json-bool") *done*: 此进度是否已经完成。不存在则默认进度已完成。]),
  (1, [#icon("json-number") *DataVersion*: 游戏数据版本。])
)
例如：
#codefile(
  lang: "json",
  title: "<存档名称> > players > advancement > 654c6848-d79d-4e07-bbf4-0a88e65a57ef.json",
  "{
  \"minecraft:story/smelt_iron\": {
    \"criteria\": {
      \"iron\": \"2026-03-01 14:36:42 +0800\"
    },
    \"done\": true
  },
  \"DataVersion\": 4777
}"
)
该文件指明了拥有此UUID `654c6848-d79d-4e07-bbf4-0a88e65a57ef` 的玩家完成了进度 #icon("smelt_iron") 来硬的（`minecraft:story/smelt_iron`），并且完成该进度所触发的条件为获得铁锭（即键名 `iron`），触发时间为东八区时间2026年3月1日14时36分42秒。
==== 基础数据
在单人游戏存档中，玩家的数据被存储在 #icon("nbt") `saves > <存档名称> > level.dat` 中。此时玩家数据存储于标签 #icon("nbt-compound") `Player`。服务端的玩家数据被存储在 #icon("nbt") `players > data > <玩家UUID>.dat` 文件中，其中 `<玩家UUID>` 是该玩家的UUID。#icon("nbt") `level.dat` 中按照存档信息为准存储的玩家信息比 #icon("nbt") `<玩家UUID>.dat` 存储的玩家信息优先级高，若 #icon("nbt") `level.dat` 和 #icon("nbt") `<玩家UUID>.dat` 中的玩家信息不匹配，则以 #icon("nbt") `level.dat` 中的玩家信息为主，#icon("nbt") `<玩家UUID>.dat` 中的玩家信息会被 #icon("nbt") `level.dat` 中的玩家信息所覆盖。
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [实体共通标签]),
  (1, [生物共通标签]),
  (1, [#icon("nbt-compound") *abilities*: 玩家拥有的能力。]),
  (2, [#icon("nbt-bool") *#underline[flying]*: 玩家是否正在飞行。]),
  (2, [#icon("nbt-float") *flySpeed*: 玩家的飞行速度。]),
  (2, [#icon("nbt-bool") *#underline[instabuild]*: 玩家是否可以立即摧毁方块、选取方块时是否允许保存方块实体数据、使用铁砧时是否不消耗经验且不会显示过于昂贵、是否可以立即破坏载具等。]),
  (2, [#icon("nbt-bool") *#underline[invulnerable]*: 玩家是否免疫除带有 `#bypasses_invulnerability` 标签的所有伤害。]),
  (2, [#icon("nbt-bool") *#underline[mayBuild]*: 玩家是否可以摧毁、放置和调整方块和盔甲架。]),
  (2, [#icon("nbt-bool") *#underline[mayfly]*: 玩家是否能飞行。]),
  (2, [#icon("nbt-float") *walkSpeed*: 玩家的步行速度。]),
  (1, [#icon("nbt-int") *DataVersion*: 游戏数据版本。]),
  (1, [#icon("nbt-string") *Dimension*: 玩家所处的维度，使用维度的命名空间ID。]),
  (1, [#icon("nbt-list") *ender_pearls*: 与该玩家绑定的末影珍珠数据。]),
  (2, [#icon("nbt-compound") 一个末影珍珠。]),
  (3, [#icon("nbt-string") *ender_pearl_dimension*: 末影珍珠所在的维度，使用维度的命名空间ID。]),
  (3, [末影珍珠实体格式]),
  (1, [#icon("nbt-list") *EnderItems*: 该玩家末影箱中的物品。]),
  (2, [#icon("nbt-compound") 一个物品。]),
  (3, [物品格式]),
  (1, [#icon("nbt-list") *entered_nether_pos*: 玩家进入下界前在主世界的位置。]),
  (2, [#icon("nbt-double") 一个物品。]),
  (1, [#icon("nbt-float") *foodExhaustionLevel*: 该玩家的消耗度。]),
  (1, [#icon("nbt-int") *foodLevel*: 该玩家的饥饿值。]),
  (1, [#icon("nbt-float") *foodSaturationLevel*: 该玩家的饱和度。]),
  (1, [#icon("nbt-int") *foodTickTimer*: 该玩家的食物计刻器。]),
  (1, [#icon("nbt-list") *#underline[Inventory]*: 该玩家的物品栏。一共有27个物品存储槽和9个快捷槽。盔甲槽、主副手槽及其他装备槽位的物品不在此处存储。对于27个物品存储槽，用 `9b` \~ `35b` 的数字分别给他们定位，顺序是从左到右、从上到下，左上角的物品槽编号为 `9b`。对于9个快捷槽，从左至右分别用 `0b` \~ `8b` 作为其编号。总体的编号如@fig:player_inventory_slot 所示。]),
  (2, [#icon("nbt-compound") 一个物品。]),
  (3, [#h(-2em)物品格式
  #figure(
    caption: "玩家物品栏的编号",
    image("图片/玩家物品栏的编号.png", width: 12em)
  ) <fig:player_inventory_slot>
  ]),
  (1, [#icon("nbt-compound") *LastDeathLocation*: 该玩家上次死亡的地点。]),
  (2, [#icon("nbt-string") *#underline[dimension]*: 此死亡地点所在的维度，使用维度的命名空间ID。]),
  (2, [#icon("nbt-int_array") *#underline[pos]*: 死亡地点的坐标，三个元素依次为$x$坐标、$y$坐标、$z$坐标。]),
  (1, [#icon("nbt-int") *playerGameType*: 该玩家的游戏模式，可用值有 `0`（生存模式）、`1`（创造模式）、`2`（冒险模式）和 `3`（旁观模式）。]),
  (1, [#icon("nbt-int") *previousPlayerGameType*: 该玩家上次使用的游戏模式。]),
  (1, [#icon("nbt-int_array") *raid_omen_position*: 玩家触发袭击之兆的位置，三个元素依次为$x$坐标、$y$坐标、$z$坐标。]),
  (1, [#icon("nbt-compound") *recipeBook*: 该玩家已解锁的配方。]),
  (2, [#icon("nbt-bool") *isBlastingFurnaceFilteringCraftable*: 玩家是否在高炉烧炼配方书中启用“仅显示可烧炼”功能。]),
  (2, [#icon("nbt-bool") *isBlastingFurnaceGuiOpen*: 玩家是否打开高炉烧炼配方书GUI。]),
  (2, [#icon("nbt-bool") *isFilteringCraftable*: 玩家是否在合成配方书中启用“仅显示可合成”功能。]),
  (2, [#icon("nbt-bool") *isFurnaceFilteringCraftable*: 玩家是否在熔炉烧炼配方书中启用“仅显示可烧炼”功能。]),
  (2, [#icon("nbt-bool") *isFurnaceGuiOpen*: 玩家是否打开熔炉烧炼配方书GUI。]),
  (2, [#icon("nbt-bool") *isGuiOpen*: 玩家是否打开合成配方书GUI。]),
  (2, [#icon("nbt-bool") *isSmokerFilteringCraftable*: 玩家是否在烟熏炉烧炼配方书中启用“仅显示可烧炼”功能。]),
  (2, [#icon("nbt-bool") *isSmokerGuiOpen*: 玩家是否打开烟熏炉烧炼配方书GUI。]),
  (2, [#icon("nbt-list") *recipes*: 玩家解锁的所有配方。]),
  (3, [#icon("nbt-string") 一个配方的命名空间ID。]),
  (2, [#icon("nbt-list") *toBeDisplayed*: 玩家能看到的所有配方。]),
  (3, [#icon("nbt-string") 一个配方的命名空间ID。]),
  (1, [#icon("nbt-compound") *respawn*: 玩家的重生数据。]),
  (2, [#icon("nbt-string") *#underline[dimension]*: 玩家重生所在的维度，使用维度的命名空间ID。]),
  (2, [#icon("nbt-bool") *forced*: 玩家是否被强制重生在出生点上，默认为 `false`。]),
  (2, [#icon("nbt-float") *pitch*: 玩家重生时的俯仰角，默认为 `0.0f`。]),
  (2, [#icon("nbt-int_array") *pos*: 玩家重生点所处的方块位置。]),
  (2, [#icon("nbt-float") *yaw*: 玩家重生时的偏航角，默认为 `0.0f`。]),
  (1, [#icon("nbt-compound") *RootVehicle*: 玩家骑乘实体的数据。]),
  (2, [#icon("nbt-int_array") *#underline[Attach]*: 玩家直接骑乘的实体的UUID。]),
  (2, [#icon("nbt-compound") *#underline[Entity]*: 玩家所骑乘实体的数据，骑乘该实体的实体也可以被其他实体所骑乘，可嵌套实体格式。]),
  (3, [#icon("nbt-compound") 实体格式]),
  (1, [#icon("nbt-int") *#underline[Score]*: 玩家在死亡画面中显示的分数。]),
  (1, [#icon("nbt-bool") *#underline[seenCredits]*: 玩家是否看过终末之诗。]),
  (1, [#icon("nbt-compound") *SelectedItem*: 玩家手持的物品。]),
  (2, [物品格式]),
  (1, [#icon("nbt-int") *#underline[SelectedItemSlot]*: 玩家正在选择的快捷栏编号。]),
  (1, [#icon("nbt-compound") *ShoulderEntityLeft*: 该玩家左肩上的实体。]),
  (2, [实体格式]),
  (1, [#icon("nbt-compound") *ShoulderEntityRight*: 该玩家右肩上的实体。]),
  (2, [实体格式]),
  (1, [#icon("nbt-short") *#underline[SleepTimer]*: 自玩家开始睡觉之后经过的时间。]),
  (1, [#icon("nbt-bool") *spawn_extra_particles_on_fall*: 玩家落地时是否产生大范围的额外粒子。]),
  (1, [#icon("nbt-compound") *warden_spawn_tracker*: 追踪该玩家在监守者生成机制中的进程。]),
  (2, [#icon("nbt-int") *cooldown_ticks*: 警告等级能够再次增加前的冷却时间。每游戏刻减少1。警告等级增加后会被重置为200 gt。]),
  (2, [#icon("nbt-int") *ticks_since_last_warning*: 距玩家上次被监守者生成机制警告后的时间。每游戏刻增加1。12000 gt后会被重置为 `0`，并将警告等级减少1。]),
  (2, [#icon("nbt-int") *warning_level*: 警告等级。值为 `4` 时生成监守者。]),
  (1, [#icon("nbt-int") *#underline[XpLevel]*: 该玩家的经验等级。]),
  (1, [#icon("nbt-float") *#underline[XpP]*: 提升到下一经验等级的进度。]),
  (1, [#icon("nbt-int") *XpSeed*: 附魔台选取附魔使用的随机数种子。]),
  (1, [#icon("nbt-int") *#underline[XpTotal]*: 玩家的经验值总数。])
)
==== 统计信息
原版的统计信息被分成若干种类，它们以命名空间ID的格式被命制成诸如 `minecraft:custom`、`minecraft:mined` 这样的名称。在种类之下又有不同的统计细则，这些单独的统计又有其各自的命名空间ID。一条统计的命名空间ID采用如下的写法：
#codebox("<统计类别命名空间>.<统计类别ID>:<统计细则命名空间>.<统计细则ID>")
例如，玩家捡起铁胸甲的统计细则的命名空间ID为 `minecraft:iron_chestplate`，其所属的统计大类为 `minecraft:picked_up`，因此完整的统计信息为
#codebox("minecraft.picked_up:minecraft.iron_chestplate")
下表列举了所有的统计类别及其可用的统计细则：
#general-table(
  caption: "统计类别及其可用统计细则",
  colspan: 4,
  columns: (auto, auto, auto, 15em),
  header: ([统计类别], [简介], [可用统计细则], [用例]),
  [`minecraft:custom`], [通用统计信息], [见@tab:custom_stat], [`minecraft.custom:minecraft.animals_bred`],
  [`minecraft.broken`], [使用指定物品并耗尽其耐久度的次数], [物品], [`minecraft.broken:minecraft:iron_axe`],
  [`minecraft.crafted`], [合成指定物品的次数], [物品], [`minecraft.crafted:minecraft.acacia_boat`],
  [`minecraft.dropped`], [丢出指定物品的次数], [物品], [`minecraft.dropped:minecraft:acacia_boat`],
  [`minecraft.killed`], [杀死指定实体的次数], [实体], [`minecraft.killed:minecraft.zombie`],
  [`minecraft.killed_by`], [被指定实体杀死的次数], [实体], [`minecraft.killed_by:minecraft.zombie`],
  [`minecraft.mined`], [挖掘指定方块的次数], [方块], [`minecraft.mined:minecraft.stone`],
  [`minecraft.picked_up`], [捡起指定物品的次数], [物品], [`minecraft.picked_up:minecraft.apple`],
  [`minecraft.used`], [使用指定物品的次数], [物品], [`minecraft.used:minecraft.bread`],
) <tab:stat>
通用统计信息 `minecraft:custom` 一类所有的细则如下表所示：
#general-table(
  caption: "通用统计信息细则",
  colspan: 2,
  columns: (auto, auto),
  header: ([统计细则], [简介]),
  [`minecraft:animals_bred`], [繁殖动物的次数],
  [`minecraft:aviate_one_cm`], [用鞘翅滑翔的总路程],
  [`minecraft:bell_ring`], [敲钟的次数],
  [`minecraft:boat_one_cm`], [乘船移动的总路程],
  [`minecraft:clean_armor`], [对炼药锅清洗染色皮革装备的次数],
  [`minecraft:clean_armor`], [对炼药锅清洗旗帜图案的次数],
  [`minecraft:clean_shulker_box`], [对炼药锅清洗染色潜影盒的次数],
  [`minecraft:climb_one_cm`], [向上攀爬的总路程],
  [`minecraft:crouch_one_cm`], [潜行移动的总路程],
  [`minecraft:damage_absorbed`], [伤害吸收的总量，单位为#box(baseline: 30%, inset: (y: 0.5em))[$display(1/10)times$]#icon("sprite-heart_half")],
  [`minecraft:damage_blocked_by_shield`], [用盾牌抵挡的伤害总量，单位为#box(baseline: 30%, inset: (y: 0.5em))[$display(1/10)times$]#icon("sprite-heart_half")],
  [`minecraft:damage_dealt`], [造成的伤害总量，单位为#box(baseline: 30%, inset: (y: 0.5em))[$display(1/10)times$]#icon("sprite-heart_half")],
  [`minecraft:damage_dealt_absorbed`], [造成但被吸收的伤害总量，单位为#box(baseline: 30%, inset: (y: 0.5em))[$display(1/10)times$]#icon("sprite-heart_half")],
  [`minecraft:damage_dealt_resisted`], [造成但被抵挡的伤害总量，单位为#box(baseline: 30%, inset: (y: 0.5em))[$display(1/10)times$]#icon("sprite-heart_half")],
  [`minecraft:damage_resisted`], [抵挡的伤害总量，单位为#box(baseline: 30%, inset: (y: 0.5em))[$display(1/10)times$]#icon("sprite-heart_half")],
  [`minecraft:damage_taken`], [承受的伤害总量，单位为#box(baseline: 30%, inset: (y: 0.5em))[$display(1/10)times$]#icon("sprite-heart_half")],
  [`minecraft:deaths`], [死亡次数],
  [`minecraft:drop`], [丢弃物品的次数],
  [`minecraft:eat_cake_slice`], [食用蛋糕片的次数],
  [`minecraft:enchant_item`], [使用附魔台附魔物品的次数],
  [`minecraft:fall_one_cm`], [坠落的总路程，不含1格高的跳跃],
  [`minecraft:fill_cauldron`], [装满炼药锅的次数],
  [`minecraft:fish_caught`], [捕鱼的总数],
  [`minecraft:fly_one_cm`], [飞行的总路程],
  [`minecraft:happy_ghast_one_cm`], [骑乘快乐恶魂移动的总路程],
  [`minecraft:horse_one_cm`], [骑马移动的总路程],
  [`minecraft:inspect_dispenser`], [和发射器交互的次数],
  [`minecraft:inspect_dropper`], [和投掷器交互的次数],
  [`minecraft:inspect_hopper`], [和漏斗交互的次数],
  [`minecraft:interact_with_anvil`], [和铁砧交互的次数],
  [`minecraft:interact_with_beacon`], [和信标交互的次数],
  [`minecraft:interact_with_blast_furnace`], [和高炉交互的次数],
  [`minecraft:interact_with_brewingstand`], [和酿造台交互的次数],
  [`minecraft:interact_with_campfire`], [和营火交互的次数],
  [`minecraft:interact_with_cartography_table`], [和制图台交互的次数],
  [`minecraft:interact_with_crafting_table`], [和工作台交互的次数],
  [`minecraft:interact_with_furnace`], [和熔炉交互的次数],
  [`minecraft:interact_with_grindstone`], [和砂轮交互的次数],
  [`minecraft:interact_with_lectern`], [和讲台交互的次数],
  [`minecraft:interact_with_loom`], [和织布机交互的次数],
  [`minecraft:interact_with_smithing_table`], [和锻造台交互的次数],
  [`minecraft:interact_with_smoker`], [和烟熏炉交互的次数],
  [`minecraft:interact_with_stonecutter`], [和切石机交互的次数],
  [`minecraft:jump`], [跳跃次数],
  [`minecraft:leave_game`], [玩家离开服务器的次数],
  [`minecraft:minecart_one_cm`], [乘矿车移动的总路程],
  [`minecraft:mob_kills`], [击杀生物的总数],
  [`minecraft:nautilus_one_cm`], [骑鹦鹉螺移动的总路程],
  [`minecraft:open_barrel`], [打开木桶的次数],
  [`minecraft:open_chest`], [打开箱子的次数],
  [`minecraft:open_enderchest`], [打开末影箱的次数],
  [`minecraft:open_shulker_box`], [打开潜影盒的次数],
  [`minecraft:pig_one_cm`], [骑猪移动的总路程],
  [`minecraft:play_record`], [播放唱片的次数],
  [`minecraft:play_noteblock`], [击打音符盒的次数],
  [`minecraft:play_time`], [存档游玩的总时长，不计入游戏暂停的时间],
  [`minecraft:player_kills`], [击杀玩家的总数],
  [`minecraft:pot_flower`], [在花盆里种花的次数],
  [`minecraft:raid_trigger`], [触发袭击的次数],
  [`minecraft:raid_win`], [赢得袭击的次数],
  [`minecraft:sleep_in_bed`], [睡觉的次数],
  [`minecraft:sneak_time`], [潜行的总时长],
  [`minecraft:strider_one_cm`], [骑炽足兽移动的总路程],
  [`minecraft:sprint_one_cm`], [疾跑的总路程],
  [`minecraft:swim_one_cm`], [游泳的总路程],
  [`minecraft:talked_to_villager`], [和村民交互的次数],
  [`minecraft:target_hit`], [射中标靶的次数],
  [`minecraft:time_since_death`], [自上次死亡经历的游戏刻数],
  [`minecraft:time_since_rest`], [自上次入眠经历的游戏刻数],
  [`minecraft:total_world_time`], [存档打开的总时长，不计入游戏暂停的时间],
  [`minecraft:traded_with_villager`], [和村民交易的次数],
  [`minecraft:trigger_trapped_chest`], [打开陷阱箱的次数],
  [`minecraft:tune_noteblock`], [为音符盒调音的次数],
  [`minecraft:use_cauldron`], [从炼药锅装水、熔岩、细雪的次数],
  [`minecraft:walk_one_cm`], [行走的总路程],
  [`minecraft:walk_on_water_one_cm`], [在水面行走的总路程],
  [`minecraft:walk_under_water_one_cm`], [在水下行走的总路程]
) <tab:custom_stat>
统计信息文件位于 `<存档名称> > players > stats > <玩家UUID>.json`，数据格式为
#tree(
  (0, [#icon("json-object") 文件封装]),
  (1, [#icon("json-number") *DataVersion*: 游戏数据版本。]),
  (1, [#icon("json-object") *#underline[stats]*: 统计信息。]),
  (2, [#icon("json-object") *\<统计类别命名空间ID>*: 统计类别的信息。]),
  (3, [#icon("json-number") *\<统计细则命名空间ID>*: 统计细则的信息，一般是统计次数。])
)
下面是一个典型的 `<玩家UUID>.json` 文件示例：
#codefile(
  lang: "json",
  title: "<存档名称> > players > stats > 654c6848-d79d-4e07-bbf4-0a88e65a57ef",
  "{
  \"stats\":{
    \"minecraft:picked_up\":{
      \"minecraft:shulker_shell\":21,
      \"minecraft:iron_chestplate\":1
    },
    \"minecraft:broken\":{
      \"minecraft:golden_sword\":1
    }
  },
  \"DataVersion\":4777
}"
)
== 物品堆叠<sec:item_stack>
Minecraft中的“物品”是一个多义词，它可以指掉落物形式的物品，由于掉落物形式的物品本质上是实体，所以主要使用实体格式。同时，“物品”一词也可以指在物品栏中的物品。无论对于上述哪种物品而言，物品的数据均无法单独存在，它们要么作为实体格式的一部分，要么作为方块实体格式的一部分。而不管它们作为哪种数据的一部分，这些物品使用统一的数据格式，即#proper-noun(display: "物品堆叠（Item stack）", "wu4 pin3 dui1 die2")。

结构化的物品堆叠于24w09a加入，替换了原先的非结构化物品格式，旧的物品格式如下：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-string") *id*: 物品的命名空间ID。]),
  (1, [#icon("nbt-byte") *Count*: 该物品堆叠的数量。]),
  (1, [#icon("nbt-byte") *Slot*: 物品所在的槽位。若此物品为某个属性类的数据或配置项，则不存在该标签。]),
  (1, [#icon("nbt-compound") *tag*: 该物品的额外信息，此标签不一定存在。])
)
上述物品格式已于24w09a弃用，在当前版本编写物品数据时，不要再使用这种格式。新的物品格式依然以NBT的形式存储，因此直接使用命令 `/data` 等对物品数据进行编辑是可行的，但相比旧格式而言更结构化，这使得自定义物品更方便灵活。

通常而言，物品拥有堆叠数量、命名空间ID和附加信息这些属性。特别地，一些物品被存储在实体或方块实体的特定槽位中，则它们使用带槽位的物品格式。如果一个物品为某个属性类的数据或配置项，如实体物品中的物品，则使用不带槽位的物品格式。
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-string") *#underline[id]*: 物品的命名空间ID。]),
  (1, [#icon("nbt-int") *count*: 该物品堆叠的数量，是介于1到该物品最大堆叠数（含）的值，不会大于99。]),
  (1, [#icon("nbt-byte") *Slot*: 物品所在的槽位。若此物品为某个属性类的数据或配置项，则不存在该标签。]),
  (1, [#icon("nbt-compound") *components*: 可选，存储该物品的额外信息，使用#proper-noun(display: "数据组件（Data Component）", "shu4 ju4 zu3 jian4")。]),
  (2, [一个特定的数据组件，使用与之匹配的数据类型])
)
=== 适用于物品的命令
下面介绍一些适用于物品格式的命令，这些命令所需的权限等级均为2。
==== 命令 `/clear`
命令 `/clear` 用于清除且只能用于清除*玩家物品栏*中的物品，无法清除其他实体或容器物品栏中的物品。语法为：#index(index: "command", "clear")
#codebox("clear [<targets>] [<item>] [<maxCount>]")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [可选，用于选择被清除物品的目标实体，可以为玩家名、UUID或目标选择器，但必须选择玩家。如果这个参数不指定，则默认清除命令执行者自身的物品，且由于后面的参数均不能指定，所以不指定 `[<targets>]` 的命令写法只有一种：即 `clear`，这条命令等效于 `clear @s`。],
  [`[<item>]`（物品谓词 `minecraft:item_predicate`）], [可选，用于指定需要被清除的物品，无论该物品所在的槽位。若不指定这个参数，则会清除目标玩家物品栏中的所有物品。因此 `clear`、`clear @s` 均用于清除命令执行者自身的所有物品。个参数所使用的类型 `minecraft:item_predicate` 的语法较为复杂，其格式将在小节@subsec:item_predicate 中详细说明。],
  [`[<maxCount>]`（整型 `brigadier:integer`）], [可选，用于指定被清除物品可被清除的最大数量，必须为整数。若该参数小于被清除物品的数量，则被清除物品被清除的数量就为该参数指定的数量；若该参数大于或等于被清除物品的数量，则被清除物品会被全部清除；若该参数为0，则没有任何物品会被清除，且返回被清除物品的数量。例如，有命令 `clear @s stone 10`，这时如果命令执行者自身有20个石头，则该命令会清除10个石头；如果命令执行者自身有5个石头，则该命令会清除5个石头。]
)
==== 命令 `/give`
命令 `/give` 的作用是：给予且只能用于给予玩家物品，无法给予其他实体或容器物品。语法为：#index(index: "command", "give")
#codebox("give <target> <item> [<count>]")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [被给予物品的玩家，可以为玩家名、UUID或目标选择器，但必须选择玩家。],
  [`<item>`（物品堆叠 `minecraft:item_stack`）], [给予的物品及其使用的组件。],
  [`[<count>]`（整型 `brigadier:integer`）], [可选，给予物品的数量，若不指定则默认给予该物品1个。该参数必须小于此物品的最大堆叠数量$ times 100$。]
)
使用命令 `/give` 给予玩家物品时，若物品栏内存在同种可堆叠且未达到堆叠上限的物品，则给予的物品会在同类物品上进行堆叠；若同类可堆叠物品已达到堆叠上限，则会使物品被放置到空白的物品栏。空白物品栏的放置顺序为：先是快捷栏 `0` \~ `8`，其次为物品存储栏 `9` \~ `35`。
#example(
  [给予命令执行者命令方块。],
  [
    命令为
    #codebox("give @s command_block")
  ]
)
==== 命令 `/item`
命令 `/item` 的前身是于20w46a移除的命令 `/replaceitem`，现在使用的 `/item` 语法是于24w09a更改后的语法。与命令 `/give` 的不同之处在于，命令 `/item` 需要指定物品放入的槽位，且会对该槽位上原本的物品进行覆盖。此外，命令 `/item` 不仅可以修改玩家的物品栏，还可以修改其他方块实体和实体的物品栏。

类似于命令 `/data`，命令 `/item` 也有子命令。相较 `/data` 而言，其语法树比较简单。子命令一共有两条：`modify` 和 `replace`。#index(index: "command", "item")
===== 子命令 `modify`
该子命令用于修改物品栏中物品的信息，其语法如下：
#codebox("item modify (block <pos>|entity <targets>) <slot> <modifier>")
#param-desc(
  [`<pos>`（方块坐标 `minecraft:block_pos`）], [进行操作的方块的方块坐标。],
  [`<targets>`（实体 `minecraft:entity`）], [被给予物品的玩家，可以为玩家名、UUID或目标选择器。],
  [`<slot>`（物品栏槽位 `minecraft:item_slot`）], [需要修改的物品栏槽位，格式见小节@subsec:slot 的说明。],
  [`<modifier>`（物品修饰器 `minecraft:loot_modifier`）], [修改物品所使用的物品修饰器，具体的物品修饰器在数据包中使用，故详见《数据包》教程。可以直接指定一个修饰器的命名空间ID，也可以使用SNBT形式的内联物品修饰器。]
)
===== 子命令 `replace`
该子命令语法较复杂，它用于将物品直接覆盖指定槽位并替换原先的物品。其中物品的来源可以有两种声明方式：`with` 和 `from`。声明方式 `with` 用于直接将自定义的物品覆盖指定槽位，语法为
#codebox("item replace (block <pos>|entity <targets>) <slot> with <item> [<count>]")
声明方式 `from` 可用于指定物品的来源，并可以指定物品修饰器以对来源物品进行修饰，语法为
#codebox("item replace (block <pos>|entity <targets>) <slot> from (block <pos>|entity <targets>) <slot> [<modifier>]")
#param-desc(
  [`<item>`（物品堆叠 `minecraft:item_stack`）], [指定要在指定槽位中放置的物品及其使用的组件。特别地，*从指定槽位移除物品时，一般使用空气 `minecraft:air`*。],
  [`[<count>]`（整型 `brigadier:integer`）], [可选，放置物品的堆叠数量。]
)
#example(
  [
    尝试执行下列命令：
    + 将一把钻石剑替换当前玩家主手上的物品；
    + 将这把钻石剑从该玩家主手上移除。
  ],
  [
    主手的槽位为 `weapon.mainhand`，因此命令分别为
    #codebox("item replace entity @s weapon.mainhand with diamond_sword")
    #codebox("item replace entity @s weapon.mainhand with air")
  ]
)
=== 槽位<subsec:slot>
#wrap-content(
  tips(
    [
      雪球实体没有槽位。
    ],
    width: 8em
  ),
  [

    大多数能存储物品的方块实体或实体都会按#proper-noun(display: "槽位（Slot）", "cao2 wei4")存放单个物品堆叠。游戏内部会使用一个索引值映射到一个特定的槽位，在命令中则以槽位类型和槽位编号映射到槽位索引，即参数类型 `minecraft:item_slot`，格式为 `<slot_type>.<slot_number>` 或 `<slot_type>`。
  ],
  align: right
)
其中的 `<slot_type>` 是槽位类别，能够容纳物品的各种器件使用相应的槽位类别，`<slot_number>` 是该槽位类别下的槽位编号。各种槽位类别、适用的对象及其可用的槽位编号列于下表：
#general-table(
  caption: "槽位信息",
  colspan: 4,
  columns: (auto, 12em, auto, auto),
  header: ([槽位类别], [适用对象], [可用槽位编号], [适用范围]),
  table.cell(rowspan: 8)[`container`], [（大）箱子、（大）陷阱箱、所有种类潜影盒、木桶、运输矿车、所有种类运输船], [`0` \~ `26`], [左上角槽位编号为 `0`，且槽位编号增大的顺序为从左到右、从上到下。大箱子和大陷阱箱的情况比较特殊，虽然它们的GUI显示了一共54个槽位，但由于它们分属两个方块，因此两个方块的槽位是分开计算的。即上面三行为 `container.0` \~ `container.26`，下面三行是属于另一个方块的 `container.0` \~ `container.26`],
	table.cell(rowspan: 2)[玩家], [`0` \~ `8`],
  [快捷栏],
  [`9` \~ `35`], [物品栏],
  [发射器、投掷器], [`0` \~ `8`], [左上角槽位编号为 `0`，编号增大顺序与上述一致],
  [漏斗、漏斗矿车], [`0` \~ `4`], [最左边槽位编号为 `0`，编号沿右方向增大],
  [熔炉、烟熏炉、高炉], [`0` \~ `2`], [#box(image("图片/熔炉槽位.png", width: 12em))],
  [酿造台], [`0` \~ `4`], [#box(image("图片/酿造台槽位.png", width: 12em))],
  [物品实体、物品展示框、物品展示实体、唱片机、箭、光灵箭、火球、小火球], [`0`], [],
  table.cell(rowspan: 3)[`weapon`], table.cell(rowspan: 8)[所有生物（并非所有生物都实际使用这些槽位）], [-], [主手槽],
  [`mainhand`], [主手槽], 
  [`offhand`], [副手槽],
  table.cell(rowspan: 5)[`armor`], [`head`], [头盔槽],
  [`chest`], [胸甲槽],
  [`legs`], [护腿槽],
  [`feet`], [靴子槽],
  [`body`], [马铠、地毯、狼铠、挽具或鹦鹉螺铠],
  table.cell(rowspan: 2)[`horse`], table.cell(rowspan: 2)[带箱子的驴、骡、羊驼], [`chest`], [箱子],
  [`0` \~ `14`], [箱子内的存储槽],
  [`saddle`], [所有生物（并非所有生物都实际使用这些槽位）], [-], [马、驴、骡、羊驼、猪、鹦鹉螺的鞍槽位，铜傀儡的虞美人槽位],
  [`hotbar`], table.cell(rowspan: 5)[玩家], [`0` \~ `8`], [快捷栏，对应 `container.0` \~ `container.8`],
  [`inventory`], [`0` \~ `26`], [物品栏，对应 `container.9` \~ `container.35`],
  [`enderchest`], [`0` \~ `26`], [末影箱左上角槽位编号为 `0`，编号增大的顺序同箱子一致],
  table.cell(rowspan: 2)[`player`], [`cursor`], [创造模式物品栏外玩家的鼠标所持的物品槽位],
  [`crafting.<槽位编号>`], [`<槽位编号>` 可用范围为 `0` \~ `3`，表示玩家物品栏中的四个合成槽位],
  [`villager`], [村民、流浪商人、掠夺者], [`0` \~ `7`], [村民、流浪商人、掠夺者的物品栏],
  [`piglin`], [猪灵], [`0` \~ `7`], [猪灵的物品栏]
) <tab:slots>
#example(
  [
    写出以下槽位在命令中的映射方式。
    #figure(
      caption: "",
      [
        #box(image("图片/槽位例题1.png", height: 12em))
        #box(image("图片/槽位例题2.png", height: 12em))
        #box(image("图片/槽位例题3.png", height: 12em))
      ]
    )
  ],
  [
    + 这是玩家的头盔槽，槽位 `armor.head`。
    + 这是玩家的副手槽，槽位 `weapon.offhand`。
    + 这是玩家的物品栏，槽位可以为 `container.21` 或 `inventory.12`。
    + 这是箱子的物品栏，槽位为 `container.11`。
    + 虽然这是一个大箱子，但下半部分的槽位算在第二个方块实体中，因此槽位为 `container.16`。
    + 这是羊驼的地毯槽位，即 `armor.body`。
    + 这是羊驼箱子的存储槽，即 `horse.2`。
  ]
)
#tips(
  [
    有一些槽位在正常手段下仅被部分生物使用，但实际上所有生物都拥有这个槽位，如 `armor_body` 和 `saddle`。玩家也拥有这些槽位，也能在这些槽位中放入物品，如果物品具有一定效果，在此槽位上也能生效。但由于常规方法无法在玩家或其他不使用鞍生物的鞍槽位放入物品，因此需要使用 `/item` 并在物品中搭配 `equippable` 组件。这个技巧可以结合自定义魔咒使用以实现特定的事件监听。#cite(<custom_enchantment_application>, form: none)
  ]
)
物品NBT格式中的 #icon("nbt-byte") `Slot` 字段存储的是槽位，但它是字节型数据，它实际上是该槽位所属槽位类别下的槽位编号，这些数字编号在@tab:slots 中已全部列出。对玩家而言，其槽位使用的是 `container` 类的 `0` \~ `35` 编号，如@fig:player_inventory_slot 所示。数字编号的槽位物品数据均存储于各自方块实体或实体的专门字段中，如箱子的 #icon("nbt-list") `Items`，玩家的 #icon("nbt-list") `Inventory` 等。

对于非数字编号的槽位，如 `weapon`、`armor` 和 `saddle` 类的槽位，使用*装备槽位*，装备槽位字符串对槽位的索引如下表所示：
#general-table(
  caption: "装备槽位的索引",
  colspan: 2,
  columns: (auto, auto),
  header: ([装备槽位字符串], [映射到的槽位]),
  [`mainhand`], [`weapon` 和 `weapon.mainhand`],
  [`offhand`], [`weapon.offhand`],
  [`head`], [`armor.head`],
  [`chest`], [`armor.chest`],
  [`legs`], [`armor.legs`],
  [`feet`], [`armor.feet`],
  [`body`], [`armor.body`],
  [`saddle`], [`saddle`],
) <tab:equipment_slot>
这些装备槽位的数据均存储在生物共同标签 #icon("nbt-compound") `equipment` 中：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *equipment*: 生物的装备。]),
  (2, [#icon("nbt-compound") *\<槽位>*: 在此槽位上装备的物品。有效的槽位有 `mainhand`、`offhand`、`feet`、`legs`、`chest`、​`head`、`body` 和 `saddle`。]),
  (3, [#icon("nbt-string") *id*: 物品的命名空间ID。]),
  (3, [#icon("nbt-int") *count*: 该物品堆叠的数量。]),
  (3, [#icon("nbt-compound") *components*: 可选，存储该物品的额外信息，使用数据组件。]),
  (4, [一个特定的数据组件，使用与之匹配的数据类型])
)
#h(-2em)@tab:equipment_slot 的字符串即作为 #icon("nbt-compound") `<槽位>` 的标签名。但也有例外，比如玩家主手的物品实际上存储于 #icon("nbt-compound") `SelectedItem` 而非 `equipment.mainhand`。
#example(
  [
    获取命令执行者（玩家）以下槽位内物品的命名空间ID：
    + `container.2`；
    + 头盔槽；
    + 主手。
  ],
  [
    首先可以确认的是，命名空间ID位于每一个物品堆叠的 #icon("nbt-string") `id` 字段中。
    + `container.2` 是有数字编号槽位，存储于 #icon("nbt-list") `Inventory`，槽内物品的 #icon("nbt-byte") `Slot` 值为 `2b`。命令为
      #codebox("data get entity @s Inventory[{Slot:2b}].id")
    + 头盔槽是装备槽位，因此存储于 #icon("nbt-compound") `equipment`。命令为
      #codebox("data get entity @s equipment.head.id")
    + 主手的物品存储于 #icon("nbt-compound") `SelectedItem`。命令为
      #codebox("data get entity @s SelectedItem.id")
  ]
)
#example(
  [生成一个小僵尸，使之装备全套的钻石盔甲，主手持有钻石矛。],
  [
    小僵尸并不是一种独立的实体类型，而是僵尸的一个种类，使用标签 #icon("nbt-bool") `IsBaby` 定义该僵尸为小僵尸。此外这些装备物品全部位于装备槽位，故应写在 #icon("nbt-compound") `equipment` 中。命令为
    #codebox("summon zombie ~ ~ ~ {
  IsBaby:true,
  equipment:{
    head:{id:\"minecraft:diamond_helmet\"},
    chest:{id:\"minecraft:diamond_chestplate\"},
    legs:{id:\"minecraft:diamond_leggings\"},
    feet:{id:\"minecraft:diamond_boots\"},
    mainhand:{id:\"minecraft:diamond_spear\"}
  }
}")
    或者可以先生成这个僵尸，再用 `/item` 修改其特定槽位上的物品：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > summon.mcfunction",
      "execute summon zombie run function tutorial:item"
    )
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > item.mcfunction",
      "data modify entity @s IsBaby set value true
item replace entity @s armor.head with diamond_helmet
item replace entity @s armor.chest with diamond_chestplate
item replace entity @s armor.legs with diamond_leggings
item replace entity @s armor.feet with diamond_boots
item replace entity @s weapon.mainhand with diamond_spear"
    )
  ]
)
判断物品可放置于什么槽位时，有时需要允许物品能够放置于多个槽位内，因此需要使用*装备槽位组*，这是一个或多个装备槽位的集合。游戏中可用的装备槽位组如下表所示：
#general-table(
  caption: "装备槽位组",
  colspan: 2,
  columns: (auto, auto),
  header: ([装备槽位组], [包含的装备槽位]),
  [`any`], [所有装备槽位],
  [`hand`], [`mainhand`、`offhand`],
  [`armor`], [`body`、`chest`、`feet`、`head`、`legs`],
  [`mainhand`], [`mainhand`],
  [`offhand`], [`offhand`],
  [`head`], [`head`],
  [`chest`], [`chest`],
  [`legs`], [`legs`],
  [`feet`], [`feet`],
  [`body`], [`body`],
  [`saddle`], [`saddle`],
) <tab:equipment_slot_group>
=== 物品谓词<subsec:item_predicate>
物品谓词是一种用于匹配物品的命令参数，其类型为 `minecraft:item_predicate`，它在 `/clear`、`/execute if items` 中都有使用。其格式为
#codebox("<type>[<test>,<test>,…]") <code:item_predicate_and>
#h(-2em)或
#codebox("<type>[<test>|<test>|…]") <code:item_predicate_or>
#h(-2em)其中 `[<test>,<test>,…]` 和 `[<test>|<test>|…]` 在不需要时可以省略。例如，匹配任意的苹果时，此参数应写为 `minecraft:apple`。在语法@code:item_predicate_and、@code:item_predicate_or 中，物品满足方括号内的条件时才会被选中，每一个 `<test>`（测试项）均为一个条件，需要所有测试项均满足，即取“与”时，使用语法@code:item_predicate_and；只需任一测试项满足，即取“或”时，使用语法@code:item_predicate_or。*每一个 `<test>` 项都可以在其前面添加 `!` 以表示对此项取反。*

例如，一个 `minecraft:item_predicate` 参数的内容为：
#codebox("<type>[<test1>|!<test2>]") <code:item_predicate_example_1>
#h(-2em)由方括号中的内容知此参数对两项条件取或，两个条件分别为满足 `<test1>` 、不满足 `<test2>`，列表可得：
#general-table(
  caption: [参数@code:item_predicate_example_1 所述物品能否被选中的情况],
  colspan: 3,
  columns: (auto, auto, auto),
  header: (table.cell(fill: none)[], table.cell(fill: dark_green)[满足 #text(black)[`<test1>`]], table.cell(fill: dark_red)[不满足 #text(black)[`<test1>`]]),
  table.cell(fill: dark_red)[#text(fill: white, font: "Source Han Sans SC", weight: "bold")[满足] `<test2>`], table.cell(fill: green)[是], table.cell(fill: red)[否],
  table.cell(fill: dark_green)[#text(fill: white, font: "Source Han Sans SC", weight: "bold")[不满足] `<test2>`], table.cell(fill: green)[是], table.cell(fill: green)[是]
)
如果这个参数的形式改为
#codebox("<type>[<test1>,!<test2>]") <code:item_predicate_example_2>
#h(-2em)则是对两项条件与，此时物品必须同时满足 `<test1>`、不满足 `<test2>` 才能被选中，列表如下：
#general-table(
  caption: [参数@code:item_predicate_example_2 所述物品能否被选中的情况],
  colspan: 3,
  columns: (auto, auto, auto),
  header_color: black,
  even_color: black,
  header: (table.cell(fill: none)[], table.cell(fill: dark_green)[满足 #text(black)[`<test1>`]], table.cell(fill: dark_red)[不满足 #text(black)[`<test1>`]]),
  table.cell(fill: dark_red)[#text(fill: white, font: "Source Han Sans SC", weight: "bold")[满足] `<test2>`], table.cell(fill: red)[否], table.cell(fill: red)[否],
  table.cell(fill: dark_green)[#text(fill: white, font: "Source Han Sans SC", weight: "bold")[不满足] `<test2>`], table.cell(fill: green)[是], table.cell(fill: red)[否]
)
对于语法@code:item_predicate_and、@code:item_predicate_or 中的 `<type>`，它可以是物品的命名空间ID，如 `minecraft:apple`；也可以是物品数据包标签，如 `#minecraft:planks`；也可以是 `*`，用于指定任意物品。

对于语法@code:item_predicate_and、@code:item_predicate_or 中的 `<test>`，它可以使用以下几种语法：
+ `<component_id>=<value>`：*精确匹配*物品拥有的组件及组件的值，其中 `<component_id>` 为组件名，`<value>` 是SNBT形式的值。例如，一个物品 `custom_data` 组件的内容为
  #codebox("\"minecraft:custom_data\": {field_1: true, field_2: true}") <code:item_predicate_custom_data_example>
  那么这种测试项能匹配它的必须是：`custom_data={field_1:true,field_2:true}` #text(green)[☑]\ 以下测试项均因缺失部分子标签而无法匹配：\ `custom_data={field_1:true}` #text(red)[☒]\ `custom_data={field_2:true}` #text(red)[☒]\ \
+ `<component_id>`：匹配存在该组件的物品，无论组件的值为何。\ \
+ `<predicate_id>~<value>`：匹配数据组件谓词，其中 `<predicate_id>` 是数据组件谓词的命名空间ID，`<value>` 是SNBT形式的数据组件谓词。具体写法见节@sec:data_component_prodicate 的例题。\ \
+ `minecraft:count=<positive_int>`：精确匹配物品的堆叠数量，其中 `count` 的命名空间前缀可省略，`<positive_int>` 必须为正整数。\ \
+ `minecraft:count`：匹配存在堆叠属性的物品，总是匹配成功。\ \
+ `minecraft:count~{min:<value>,max:<value>}`：匹配指定范围堆叠数量的物品，其中 `min` 和 `max` 均可不指定。
#example(
  [
    分别指出下列物品谓词参数匹配的物品：
    #codebox("minecraft:carrot_on_a_stick[custom_data={gun:true}]") <code:item_predicate_example_3>
    #codebox("#minecraft:axes[!damage|damage=0]") <code:item_predicate_example_4>
    #codebox("*[!count=3,count~{min:2}]") <code:item_predicate_example_5>
    #codebox("*[enchantments~[{levels:{min:4}}]]") <code:item_predicate_example_6>
  ],
  [
    参数@code:item_predicate_example_3：显然匹配拥有组件 `"minecraft:custom_data":{gun:true}` 的胡萝卜钓竿。
    
    参数@code:item_predicate_example_4：匹配没有组件 `damage` 或组件 `damage` 的值为 `0` 的拥有数据包标签 `#minecraft:axes` 的物品，即未损坏的所有种类的斧。
    
    参数@code:item_predicate_example_5：`*` 匹配所有物品，条件 `!count=3` 匹配堆叠数量不为3的物品，条件 `count~{min:2}` 匹最小配堆叠数量为2的物品，对此两个条件取“与”，即匹配所有堆叠数量大于等于2而不等于3的物品。
    
    参数@code:item_predicate_example_6：`enchantments` 是一个数据组件谓词，用于检查物品的魔咒，`[{levels:{min:4}}]` 匹配等级至少为IV的魔咒，因此该参数匹配拥有等级大于等于IV魔咒的物品，无论该物品的魔咒为何，且无论该物品的其他魔咒是否大于等于IV。
  ]
)
#example(
  [清除执行者自身所有堆叠数量为16的倍数的物品。],
  [
    原版可用的堆叠数量是不大于99的值，不妨遍历所有符合要求的堆叠数，对这些测试项取“或”。命令为
    #codebox("clear @s *[count=16|count=32|count=48|count=64|count=80|count=96]")
  ]
)
== 数据组件<sec:data_components>
#proper-noun(display: "数据组件（Data Component）", "shu4 ju4 zu3 jian4")是游戏中用于定义各项属性的结构化数据，由于它主要被用于物品，因此也被称为#proper-noun(display: "物品堆叠组件（Item stack component）", "wu4 pin3 dui1 die2 zu3 jian4")，或#proper-noun(display: "物品组件（Item component）", "wu4 pin3 zu3 jian4")。数据组件在物品格式、方块实体和实体格式中均有使用。

所有种类的数据组件于附录@sec:data_components_type 中列出，可供查阅。
=== 物品组件
物品格式全部使用数据组件。
==== 命令参数格式
类似于方块状态，*数据组件也分为不同的种类，它们用于确定物品某一方面的附加信息，每种组件使用各自可用的值*。同样，数据组件是硬编码的，不可随意使用未注册的组件。数据组件是一种硬编码的注册表对象，具有命名空间ID。注意，省略命名空间前缀的写法仅在原版注册的数据组件中有效，一些模组注册的数据组件仍需要其使用的命名空间前缀。

在 `/give`、`/item` 和 `/clear` 等命令的格式中为了确认一个物品及其使用的组件，使用参数类型 `minecraft:item_stack`，其语法为
#codebox("<命名空间>:<ID>[<组件名称>=<值>,<组件名称>=<值>,…]") <code:item_components_command_format>
#h(-2em)这样就可以不直接通过修改SNBT来确定一个物品的附加信息。例如，当指定一个损坏值为10的钻石镐时，查阅附录@sec:data_components_type，知物品此项性质由组件 `minecraft:damage` 控制，该组件使用 #icon("nbt-int") 整型，则相应的命令参数应写为
#codebox("minecraft:diamond_pickaxe[damage=10]")
对于方括号中组件的值，应参照附录@sec:data_components_type 中各组件的数据树，写为对应类型的SNBT格式。若值类型为字符串，则需要单引号 `'` 或双引号 `"` 定义。若值类型为复合标签，则花括号必不可少，且标签之间需有严格的层级关系。如
#codebox("minecraft:golden_apple[
  max_stack_size=99,
  rarity=\"epic\",
  food={can_always_eat:false}
]") <code:item_components_command_format_example>
#h(-2em)其中组件 `max_stack_size` 使用整型数据，`rarity` 使用字符串，`food` 使用复合标签。
#example(
  [
    在冒险模式的情况下，将下列物品给予附近的玩家：
    + 一把不会损坏耐久值的铁镐，使之可以用于破坏铁矿石和钻石矿石； <enu:unbreakable_iron_pickaxe>
    + 一个可以放置在金块上的拉杆。 <enu:level_place_on_gold_block>
  ],
  [
    冒险模式的玩家无法破坏任何方块，即使他们持有普通的工具。在物品组件中可以为工具添加允许破坏的方块种类，具体由组件 #icon("nbt-list")#icon("nbt-compound") `minecraft:can_break` 定义，查阅附录@sec:data_components_type 知需要在 #icon("nbt-string")#icon("nbt-list") `blocks` 中填写允许破坏的方块命名空间ID。于是可以得到如下的命令：
    #codebox("give @p iron_pickaxe[can_break={blocks:[\"minecraft:iron_ore\",\"minecraft:diamond_ore\"]}]")
    #h(-2em)这条命令在冒险地图的制作过程中几乎是必要的。
    
    不会损坏这个特征由组件 #icon("nbt-compound") `unbreakable` 定义，只要存在这个组件，无论使用多少次工具均不会减少耐久值。第@enu:unbreakable_iron_pickaxe 小题完整的命令为：
    #codebox("give @p iron_pickaxe[unbreakable={},can_break={blocks:[\"minecraft:iron_ore\",\"minecraft:diamond_ore\"]}]")
    如果给物品添加了 #icon("nbt-list")#icon("nbt-compound") `can_place_on` 组件，则该组件会允许冒险模式的玩家将该物品（一般是方块）放置在指定的方块上。组件 #icon("nbt-list")#icon("nbt-compound") `can_place_on` 的语法与 #icon("nbt-list")#icon("nbt-compound") `minecraft:can_break` 类似，只是 #icon("nbt-string")#icon("nbt-list") `blocks` 中填写的可放置于其上的方块的命名空间ID。于是可以得到第@enu:level_place_on_gold_block 小题的命令，该命令在冒险地图的制作中也几乎是必须的。\
    #codebox("give @p level[can_place_on={blocks:[\"minecraft:gold_block\"]}]")
  ]
) <exa:can_break_and_can_place_on>
原版中每一个物品都具有其默认的组件，默认组件的定义是：*使用 `/give` 命令且不指定数据组件时所获物品的组件。*例如，原版所有的食物类物品都默认具有 `minecraft:food` 这个组件。这些默认组件不会被序列化成物品数据，因此也无法用 `/data` 等命令获取它们的数据，存档也不会存储它们的数据。
#example(
  [清除所有玩家物品栏中所有能被食用的物品。],
  [
    能被食用的物品拥有组件 `food`，因此在物品谓词中只需要匹配存在组件 `food` 的物品即可，命令为
    #codebox("clear @a *[food]")
  ]
) <exa:clear_food>
参数类型 `minecraft:item_stack` 另有一种写法，即
#codebox("<命名空间>:<ID>[!<组件名称>,…]")
#h(-2em)这样可以用于指定不含有某个组件的物品，因此可用于移除的物品默认组件。例如，参数
#codebox("minecraft:apple[!minecraft:food]")
#h(-2em)指定了一个不具有组件 `minecraft:food` 的苹果，这个苹果无法被食用。
==== SNBT格式
语法@code:item_components_command_format 中方括号内的信息被专门存储在标签 #icon("nbt-compound") `components` 中，形成如下所示的数据结构：
#tree(
  (0, [#icon("nbt-compound") *components*]),
  (1, [*\<组件名称>*: `<值>`]),
  (1, [*\<组件名称>*: `<值>`])
)
组件名称被存储在NBT中时带有命名空间前缀。例如，@code:item_components_command_format_example 所示的参数写成树状图的格式为：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-string") *id*: `minecraft:golden_apple`]),
  (1, [#icon("nbt-compound") *components*]),
  (2, [#icon("nbt-int") *minecraft:max_stack_size*: `99`]),
  (2, [#icon("nbt-string") *minecraft:rarity*: `epic`]),
  (2, [#icon("nbt-compound") *minecraft:food*]),
  (3, [#icon("nbt-bool") *can_always_eat*: `false`])
)
由于命名空间ID中带有冒号 `:`，使用SNBT格式时难免与标签中的冒号 `:` 冲突。因此在使用SNBT指定原版的数据组件时，允许不书写命名空间前缀，游戏在存入数据时会自动补上命名空间前缀，如：
#codebox("{id:\"minecraft:golden_apple\",components:{max_stack_size=99,rarity:\"epic\",food:{can_always_eat:false}}}")
在不省略命名空间前缀的写法中，为了解决命名空间ID和NBT的冒号冲突，一般给作为标签名的组件命名空间ID套上引号 `"`，如：
#codebox("{id:\"minecraft:golden_apple\",components:{\"minecraft:max_stack_size\"=99,\"minecraft:rarity\":\"epic\",\"minecraft:food\":{can_always_eat:false}}}")
#example(
  [现有一个命令存储 `tutorial:player`，其有两个标签 #icon("nbt-int") `mining_times` 和 #icon("nbt-int") `minerals`。随机选取一个物品栏中同时拥有铁镐和钻石的玩家，将其铁镐挖掘的次数存入存储的 #icon("nbt-int") `mining_times` 标签，并将其钻石的数量存入 #icon("nbt-int") `minerals` 标签。],
  [
    将数据存入标记这个动作由命令 `/data` 完成，可以注意到玩家作为数据的来源，被修改数据的对象是命令存储。在选择玩家时，随机玩家的目标选择器变量 `@r` 只选择唯一的玩家，因此不需要 `limit=1` 这个参数。这个例子中对玩家还有进一步的限定：要求目标玩家在物品栏中同时拥有铁镐和钻石。于是玩家的 #icon("nbt-list") `Inventory` 标签值需要为
    #codebox("[{id:\"minecraft:iron_pickaxe\"},{id:\"minecraft:diamond\"}]")
    由于只需选择在物品栏中拥有铁镐和钻石的玩家，忽视这些物品的堆叠数量、所在槽位或附加的标签，所以在目标选择器中不需要使用 #icon("nbt-int") `count`、#icon("nbt-byte") `Slot` 和 #icon("nbt-compound") `components` 这些标签。然后就可以选择这个玩家：
    #codebox("@r[nbt={Inventory:[{id:\"minecraft:iron_pickaxe\"},{id:\"minecraft:diamond\"}]}]")
    在确定目标选择器后，下一步需要确定的是NBT的来源。对于第一个节点，在确定了来源是玩家的物品栏后，其次需要确定的是铁镐和钻石所在的物品栏，由于列表中的元素在确定物品所在槽位的时候使用 #icon("nbt-byte") `Slot` 标签而不是通过元素在列表中的位置，所以列表 #icon("nbt-list") `Inventory` 中元素的位置显得不那么重要，命名列表标签的复合元素这种节点类型不使用索引值，用元素中包含的标签来确定元素。明显铁镐所处的元素可以由节点表示为
    #codebox("Inventory[{id:\"minecraft:iron_pickaxe\"}]")
    #h(-2em)钻石为
    #codebox("Inventory[{id:\"minecraft:diamond\"}]")
    #h(-2em)上面这些节点只是第一个节点，因为它们只指向了拥有这些子标签的复合标签，因此还需要进一步指向复合标签中的子标签。铁镐这类武器或工具的挖掘次数即物品的损坏值，由组件 `minecraft:damage` 存储，这个组件使用整型数据，是 #icon("nbt-compound") `components` 的子标签，所以指向铁镐挖掘次数的完整路径为
    #codebox("Inventory[{id:\"minecraft:iron_pickaxe\"}].components.minecraft:damage")
    #h(-2em)钻石的数量由 #icon("nbt-int") `count` 存储，完整路径为
    #codebox("Inventory[{id:\"minecraft:diamond\"}].count")
    最终可以得到将铁镐挖掘次数存入存储 #icon("nbt-int") `mining_times` 标签的命令为
    #codebox("data modify entity @e[type=marker,name=Marker,limit=1] data.mining_times set from entity @r[nbt={Inventory:[{id:\"minecraft:iron_pickaxe\"},{id:\"minecraft:diamond\"}]}] Inventory[{id:\"minecraft:iron_pickaxe\"}].components.minecraft:damage")
    #h(-2em)将钻石数量存入 #icon("nbt-int") `mining_times` 标签的命令为
    #codebox("data modify entity @e[type=marker,name=Marker,limit=1] data.minerals set from entity @r[nbt={Inventory:[{id:\"minecraft:iron_pickaxe\"},{id:\"minecraft:diamond\"}]}] Inventory[{id:\"minecraft:diamond\"}].count")
  ]
)
=== 方块实体组件
方块实体部分采用数据组件：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *components*: 使用此方块实体对应的物品放置此方块实体时，如果物品带有非默认的且不会被继承处理的数据组件，则数据会被复制存储入此标签内。]),
  (2, [一个特定的物品堆叠组件，使用与之匹配的数据类型。]),
)
当方块被放置时，不会被继承处理的数据组件会按原样存入 #icon("nbt-compound") `components`，并在方块被破坏时完整地将数据返还给掉落的物品。而对于那些会被继承处理的组件，则会将它们转换为方块实体特有的数据，是为#proper-noun(display: "隐式组件（Implicit component）", "yin3 shi4 zu3 jian4")。当方块被破坏时，方块实体内的隐式组件会被获取存入掉落物品的数据组件中。

例如，当旗帜物品被放置为旗帜方块时，物品的 `banner_patterns` 组件会被继承为方块实体的 #icon("nbt-list") `patterns` 字段，`banner_patterns` 组件就不再存储于方块实体的 #icon("nbt-compound") `components` 字段内。而当旗帜方块被破坏后，方块实体的 #icon("nbt-list") `patterns` 数据会转换为掉落物品的 `banner_patterns` 组件。参考以下的物品格式：
#codebox("{
  id:\"minecraft:white_banner\",
  components:{
    \"minecraft:banner_patterns\":[
      {color:\"cyan\",pattern:\"minecraft:rhombus\"}
    ],
    \"minecraft:custom_data\":{tutorial:true}
  }
}")
#h(-2em)放置为方块后的方块实体数据：
#codebox("{
  components:{
    \"minecraft:custom_data\":{tutorial:true}
  },
  patterns:[
    {color:\"cyan\",pattern:\"minecraft:rhombus\"}
  ],
  id:\"minecraft:banner\"
}")
下表列出了所有能在方块实体中被继承为隐式组件的数据组件及其对应的方块实体字段。
#general-table(
  caption: "方块实体隐式组件",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([数据组件], [适用方块], [对应方块实体的字段]),
  [`banner_patterns`], [所有种类旗帜], [#icon("nbt-list") `patterns`],
  [`bee`], [蜂巢、蜂箱], [#icon("nbt-list") `bees`],
  table.cell(rowspan: 2)[`container`], [箱子、陷阱箱、铜箱子、木桶、所有种类潜影盒、熔炉、烟熏炉、高炉、发射器、投掷器、合成器、酿造台、漏斗、营火、灵魂营火、雕纹书架、所有种类展示架], [#icon("nbt-list") `Items`],
  [饰纹陶罐], [#icon("nbt-compound") `Item`],
  [`container_loot`], [箱子、陷阱箱、铜箱子、木桶、所有种类潜影盒、发射器、投掷器、合成器], [#icon("nbt-string") `LootTable`\ #icon("nbt-long") `LootTableSeed`],
  table.cell(rowspan: 2)[`custom_name`], [箱子、陷阱箱、铜箱子、木桶、所有种类潜影盒、熔炉、烟熏炉、高炉、发射器、投掷器、合成器、酿造台、漏斗、所有种类旗帜、附魔台、信标、所有种类命令方块], [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") `CustomName`],
  [生物头颅], [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") `custom_name`],
  [`lock`], [箱子、陷阱箱、铜箱子、木桶、所有种类潜影盒、熔炉、烟熏炉、高炉、发射器、投掷器、合成器、酿造台、漏斗、信标], [#icon("nbt-compound") `lock`],
  [`note_block_sound`], [生物头颅], [#icon("nbt-string") `note_block_sound`],
  [`pot_decorations`], [饰纹陶罐], [#icon("nbt-list") `sherds`],
  [`profile`], [生物头颅], [#icon("nbt-string")#icon("nbt-compound") `profile`]
) <tab:block_entity_component>
下文补充一些特殊的方块组件：
===== 组件 `block_entity_data` 的行为
#tree(
  (0, [#icon("nbt-string")#icon("nbt-compound") *minecraft:block_entity_data*: 方块被放置时的方块实体数据，可以使用 #icon("nbt-string") 字符串和 #icon("nbt-compound") 复合标签两种形式。当使用 #icon("nbt-string") 字符串形式时，字符串被视为SNBT。游戏在存储时一律使用 #icon("nbt-compound") 复合标签形式。]),
  (1, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (1, [#icon("nbt-string") *#underline[id]*: 方块实体的命名空间ID。]),
  (1, [该方块实体的其他数据])
)
组件 `block_entity_data` 可用于直接设置被放置的方块实体数据，*但是@tab:block_entity_component 中除了 `container_loot` 以外的所有数据都不能通过 `block_entity_data` 设置，只能通过表中特定的组件转换。#icon("nbt-compound") `components` 也无法通过 `block_entity_data` 设置，其中的数据应直接写在对应的组件中而不是在 `block_entity_data` 组件内定义。*参考以下的物品格式：
#codebox("{
  id:\"minecraft:white_banner\",
  components:{
    \"minecraft:block_entity_data\":{
      id:\"minecraft:banner\",
      components:{
        \"minecraft:custom_data\":{type:\"block_entity_data组件内的components\"}
      },
      patterns:[
        {color:\"cyan\",pattern:\"minecraft:rhombus\"}
      ]
    },
    \"minecraft:custom_data\":{type:\"custom_data组件\"}
  }
}")
#h(-2em)放置为方块后的方块实体数据：
#codebox("{
  components:{
    \"minecraft:custom_data\":{type:\"custom_data组件\"}
  },
  id:\"minecraft:banner\"
}")
#h(-2em)此处 `block_entity_data` 组件中的 #icon("nbt-compound") `components` 和 #icon("nbt-list") `patterns` 被直接忽略。

如果放置的方块是有额外数据的任意种类的命令方块、讲台、任意种类的告示牌、任意种类的悬挂式告示牌、刷怪笼或试炼刷怪笼，只有当玩家拥有不小于2的权限等级时，放置方块时才会将组件数据转换为方块实体数据。

此外，物品被放置为方块时，`block_entity_data` 组件会被尽量转换为方块实体数据，不能转换的数据会被丢弃，方块实体的 #icon("nbt-compound") `components` 不会包含 `block_entity_data` 组件。
===== 组件 `block_state` 的行为
#tree(
  (0, [#icon("nbt-compound") *minecraft:block_state*: 方块被放置时的方块状态。]),
  (1, [#icon("nbt-string") *\<方块属性>*: 一项方块属性的值，数值也使用字符串形式。])
)
组件 `block_state` 用于定义方块状态，放置拥有此组件的方块能够保持固定的方块状态。与 `block_entity_data` 组件类似，物品被放置为方块时，`block_state` 组件会被尽量转换为方块状态数据，方块实体的 #icon("nbt-compound") `components` 不会包含 `block_state` 组件。
#example(
  [给予执行者一个橡木楼梯，使之放置为方块后总是朝向为南、形状为左内角。],
  [
    命令为
    #codebox("give @s oak_stairs[block_state={facing:\"south\",shape:\"inner_left\"}]")
  ]
)
=== 实体组件
当物品放置为实体时，物品内的组件也会转换为实体可用的数据，实体组件均为隐式组件，实体数据中也没有相应的 #icon("nbt-compound") `components` 来存放组件数据。
#general-table(
  caption: "实体隐式组件",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([数据组件], [适用实体], [对应实体的字段]),
  [`axolotl/variant`], [美西螈], [#icon("nbt-int") `Variant`],
  [`cat/collar`], table.cell(rowspan: 3)[猫], [#icon("nbt-byte") `CollarColor`],
  [`cat/sound_variant`], [#icon("nbt-string") `sound_variant`],
  [`cat/variant`], [#icon("nbt-string") `variant`],
  [`chicken/variant`],  table.cell(rowspan: 2)[鸡], [#icon("nbt-string") `variant`],
  [`chicken/sound_variant`], [#icon("nbt-string") `sound_variant`],
  [`cow/variant`],  table.cell(rowspan: 2)[牛], [#icon("nbt-string") `variant`],
  [`cow/sound_variant`], [#icon("nbt-string") `sound_variant`],
  [`custom_data`], table.cell(rowspan: 2)[所有实体], [#icon("nbt-string")#icon("nbt-compound") `data`],
  [`custom_name`], [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") `custom_name`],
  [`fox/variant`], [狐狸], [#icon("nbt-string") `Type`],
  [`frog/variant`], [青蛙], [#icon("nbt-string") `variant`],
  [`horse/variant`], [马], [#icon("nbt-int") `Variant` 后8位],
  [`llama/variant`], [羊驼、行商羊驼], [#icon("nbt-int") `Variant`],
  [`mooshroom/variant`], [哞菇], [#icon("nbt-string") `Type`],
  [`painting/variant`], [画], [#icon("nbt-string") `variant`],
  [`parrot/variant`], [鹦鹉], [#icon("nbt-int") `Variant`],
  [`pig/variant`],  table.cell(rowspan: 2)[猪], [#icon("nbt-string") `variant`],
  [`pig/sound_variant`], [#icon("nbt-string") `sound_variant`],
  [`potion_contents`],  table.cell(rowspan: 2)[区域效果云], [#icon("nbt-string")#icon("nbt-compound") `potion_contents`],
  [`potion_duration_scale`], [#icon("nbt-float") `potion_duration_scale`],
  [`profile`], [玩家模型], [#icon("nbt-string")#icon("nbt-compound") `profile`],
  [`rabbit/variant`], [兔子], [#icon("nbt-int") `RabbitType`],
  [`salmon/size`], [鲑鱼], [#icon("nbt-string") `type`],
  [`sheep/color`], [绵羊], [#icon("nbt-byte") `Color`],
  [`shulker/color`], [潜影贝], [#icon("nbt-byte") `Color`],
  [`tropical_fish/base_color`], table.cell(rowspan: 3)[热带鱼], table.cell(rowspan: 3)[#icon("nbt-int") `Variant`],
  [`tropical_fish/pattern`],
  [`tropical_fish/pattern_color`],
  [`villager/variant`], [村民、僵尸村民], [#icon("nbt-string") `VillagerData.type`],
  [`wolf/collar`], table.cell(rowspan: 3)[狼], [#icon("nbt-byte") `CollarColor`],
  [`wolf/sound_variant`], [#icon("nbt-string") `sound_variant`],
  [`wolf/variant`], [#icon("nbt-string") `variant`]
) <tab:entity_component>
如果物品同时拥有 `bucket_entity_data`、`entity_data` 和@tab:entity_component 列出的组件，则放出实体时优先转换 `bucket_entity_data` 组件，再应用 `entity_data` 组件，最后应用@tab:entity_component 列出的组件。
#tree(
  (0, [#icon("nbt-string")#icon("nbt-compound") *minecraft:entity_data*: 实体被生成时的实体数据，可以使用 #icon("nbt-string") 字符串和 #icon("nbt-compound") 复合标签两种形式。当使用 #icon("nbt-string") 字符串形式时，字符串被视为SNBT。游戏在存储时一律使用 #icon("nbt-compound") 复合标签形式。]),
  (1, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (1, [#icon("nbt-string") *#underline[id]*: 实体的命名空间ID。]),
  (1, [该实体的其他数据])
)
#example(
  [给与执行者一个牛刷怪蛋，使之生成马。],
  [
    命令为
    #codebox("give @s cow_spawn_egg[entity_data={id:\"minecraft:horse\"}]")
  ]
)
#example(
  [制作一个刷怪蛋，使之生成@exa:amr_bot 所制作的组合实体。],
  [
    这个组合实体的全部数据已经在命令@code:summon_amr_bot 中写出来了，现在可以将其整合至刷怪蛋中：
    #codebox("give @s wolf_spawn_egg[entity_data={
  id:\"minecraft:wolf\",
  active_effects:[
    {
      id:\"minecraft:invisibility\",
      duration:-1,
      show_particles:false
    }
  ],
  Silent:true,
  Invulnerable:true,
  Passengers:[
    {
      id:\"minecraft:item_display\",
      Passengers:[
        {
          id:\"minecraft:interaction\"
        }
      ]
    }
  ]
}]")
  ]
)
=== 数据组件的应用实例
冒险地图、原版模组的制作需要使用大量的自定义物品。由于物品注册表不是可写注册表，因此自定义物品是通过数据组件实现的，同时也需要确定“原型物品”。“原型物品”的要求是：尽量对自定义的物品有较少的非功能性作用。追溯指针非常适合用作原型物品，因为它没有任何的交互事件, 也不能参与到任何物品的合成中去, 而且也完全没有任何的附加数据。#cite(<custom_item>, form: none)原型物品不一定必须是追溯指针，也可以巧用原型物品的默认组件。例如，想要自定义食物，可以使用原版的食物作为原型物品。
#example(
  [
    在地图中制作麦当劳薯条，使之：
    + 拥有翻译名称；
    + 使用以下的纹理
      #figure(
        caption: "",
        image("图片/fries.png", width: 5em)
      ) <fig:fries>
    + 能够被食用，无论玩家的饥饿值是否已满，食用后最多可恢复8点饥饿值、6点饱和度。
  ],
  [
    此处使用烤马铃薯作为原型物品。
    + 首先确定物品的翻译名称，美式英文的名称为“Fries”，简体中文的名称为“薯条”。在资源包内创建以下语言文件：
      #codefile(
        lang: "json",
        title: "assets > mcdonalds > lang > en_us.json",
        "{
    \"item.mcdonalds.fries\": \"Fries\"
  }"
      )
      #codefile(
        lang: "json",
        title: "assets > mcdonalds > lang > zh_cn.json",
        "{
    \"item.mcdonalds.fries\": \"薯条\"
  }"
      )
      翻译键名被定义为 `item.mcdonalds.fries`，这是因为原版的物品翻译键的格式都是 `item.<命名空间>.<ID>`，此处可标准化。相应地，物品名称使用 `item_name` 这个组件，将此翻译键写入本地化文本组件：
      #codebox("\"minecraft:item_name\":{translate:\"item.mcdonalds.fries\"}")
    + 接下来制作薯条的纹理，需要使用 `item_model` 这个组件，组件的值需要是物品模型映射，此知识点将在《资源包》教程的模型一章重点讲述，此处直接给出模型映射文件，这个文件需要被放置在命名空间下的 `items` 目录：
      #codefile(
        lang: "json",
        title: "assets > mcdonalds > items > fries.json",
        "{
  \"model\": {
    \"type\": \"model\",
    \"model\": \"mcdonalds:fries\"
  }
}"
      )
      需要映射到 `mcdonalds:fries` 这个物品模型，因此在资源包 `models` 目录下创建模型文件。薯条使用的是一个平面纹理，因此可以直接应用父模型 `minecraft:item/generated`：
      #codefile(
        lang: "json",
        title: "assets > mcdonalds > models > fries.json",
        "{
  \"parent\": \"minecraft:item/generated\",
  \"textures\": {
    \"layer0\": \"mcdonalds:item/fries\"
  }
}"
      )
      然后将@fig:fries 放置在路径 `assets > mcdonalds > textures > item > fries.png`。最后在物品的组件中确定使用 `mcdonalds:fries` 这个物品模型映射：
      #codebox("\"minecraft:item_model\":\"mcdonalds:fries\"")
    + 要求物品能够被食用，无论玩家的饥饿值是否已满，食用后最多可恢复8点饥饿值、6点饱和度。此需求应使用 `food` 组件来实现：
      #codebox("\"minecraft:food\":{can_always_eat:true,nutrition:8,saturation:6.0f}")
    将以上组件组合起来，用 `/give` 给予玩家这个自定义物品：
    #codebox("give @s baked_potato[
  minecraft:item_name={translate:\"item.mcdonalds.fries\"},
  minecraft:item_model=\"mcdonalds:fries\",
  minecraft:food={can_always_eat:true,nutrition:8,saturation:6.0f}
]")
    也可以使用战利品表统一存储自定义物品。将这个麦当劳薯条写在战利品表中：
    #codefile(
      lang: "json",
      title: "data > mcdonalds > loot_table > fries.json",
      "{
  \"pools\": [
    {
      \"entries\": [
        {
          \"name\": \"minecraft:baked_potato\",
          \"type\": \"minecraft:item\"
        }
      ],
      \"functions\": [
        {
          \"function\": \"minecraft:set_name\",
          \"name\": {
            \"translate\": \"item.mcdonalds.fries\"
          }
        },
        {
          \"function\": \"minecraft:set_components\",
          \"components\": {
            \"minecraft:food\": {
              \"can_always_eat\": true,
              \"nutrition\": 8,
              \"saturation\": 6
            },
            \"minecraft:item_model\": \"mcdonalds:fries\"
          }
        }
      ],
      \"rolls\": 1.0
    }
  ]
}"
    )
  ]
)
战利品表可用于统一存储和管理自定义的物品，如此就能通过 `/loot` 或其他战利品表很方便地引用这个自定义物品。
#example(
  [给予玩家一把钻石剑，手持能够提升20点的攻击伤害。],
  [
    显然需要使用 `attribute_modifiers` 这个组件，查阅附录@sec:data_components_type 及节@sec:attribute，攻击伤害的属性ID为 `attack_damage`，属性修饰符生效的装备槽位组应为主手 `mainhand`，运算模式为属性增量。完整的命令为
    #codebox("give @s diamond_sword[
  attribute_modifiers=[
    {
      amount:20.0d,
      id:\"add_attack_damage\",
      operation:\"add_value\",
      slot:\"mainhand\",
      type:\"minecraft:attack_damage\"
    }
  ]
]")
  ]
)
#example(
  [
    将附近玩家的胸甲栏中放入一个附魔的青色皮革外套，将光标移至这个皮革外套上时呈现如下所示的文本。\ 
    #text_component(text(gray)[#text(aqua)[超级保护]\ 保护 IV\ 爆炸保护 IV\ 火焰保护 IV\ 弹射物保护 IV\ 颜色：\#409DA0\ #text(gold)[这个外套将互斥的保护魔咒组合到了一起]], background: black, shadow-color: black.transparentize(100%))
  ],
  [
    这段文本主要显示了以下几种信息：第一行为物品的名称#text_component(text(aqua)[超级保护], background: black, shadow-color: black.transparentize(100%))，第二至第五行是这件皮革外套的魔咒信息，第六行是这件皮革外套的颜色，第七行是物品的描述信息。由于四种保护类魔咒是互斥的，因此只能用命令将这四种魔咒叠加到一起。

    查阅附录@sec:data_components_type，物品的名称由组件 #icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") `minecraft:item_name` 定义，值需要为一个文本组件。如果物品被附魔，则名称会显示为青色。因此直接写字符串即可：
    #codebox("custom_name=\"超级保护\"")
    物品的魔咒由组件 #icon("nbt-compound") `minecraft:enchantments` 定义，根据附录@sec:data_components_type 的说明，此处标签名为各魔咒的命名空间ID，值为该魔咒的等级。保护、爆炸保护、火焰保护和弹射物保护的命名空间ID分别为 `minecraft:protection`、`minecraft:blast_protection`、`minecraft:fire_protection` 和 `minecraft:projectile_protection`，故组件为
    #codebox("enchantments={
  \"minecraft:protection\":4,
  \"minecraft:blast_protection\":4,
  \"minecraft:fire_protection\":4,
  \"minecraft:projectile_protection\":4
}")
    对于皮革外套的颜色，由于皮革外套是可染色物品，故适用组件 #icon("nbt-int")#icon("nbt-list") `minecraft:dyed_color`，根据附录@sec:data_components_type 的说明，此处可直接采用十六进制的 #icon("nbt-int") 整型表示颜色值。该组件为
    #codebox("dyed_color=0x409da0")
    物品的描述信息则由组件 #icon("nbt-list") `minecraft:lore` 定义，列表中每一个元素的值类型都是字符串，且每个值都需要为一个文本组件。描述信息默认为紫色斜体，列表中一个元素的文本占据一行。所以这个组件应写为
    #codebox("lore=[{text:\"这个外套将互斥的保护魔咒组合到了一起\",italic:false}]")
    将上面的所有标签整合起来，可得到命令
    #codebox("item replace entity @p armor.chest with leather_chestplate[
  custom_name=\"超级保护\",
  enchantments={
    \"minecraft:protection\":4,
    \"minecraft:blast_protection\":4,
    \"minecraft:fire_protection\":4,
    \"minecraft:projectile_protection\":4
  },
  dyed_color=0x409da0,
  lore=[{text:\"这个外套将互斥的保护魔咒组合到了一起\",color:\"gold\",italic:false}]
]")
  ]
) <exa:custom_leather_chestplate>
#example(
  [给予附近的玩家一本由 `unknown` 写的名为 `Hello` 的成书，这本书第1页的内容为：#text_component(text(black)[跳转至第2页], shadow-color: black.transparentize(100%))，点击第1页的文本会跳转至第2页，第2页的内容为：#text_component(text(black)[Hello\ World], shadow-color: black.transparentize(100%))。],
  [
    成书的内容由组件 #icon("nbt-compound") `minecraft:written_book_content` 定义，由附录@sec:data_components_type，在不使用内容过滤的情况下，这个组件的格式如下：
    #tree(
      (0, [#icon("nbt-compound") *minecraft:written_book_content*]),
      (1, [#icon("nbt-string") *#underline[title]*: 成书的标题，必须指定该标签的值，否则无论成书的内容，打开成书后一律显示“无效的书本标签”。]),
      (1, [#icon("nbt-string") *#underline[author]*: 成书的作者，必须指定该标签的值，否则判定书本标签无效。]),
      (1, [#icon("nbt-byte") *resolved*: 该成书内的文本是否已被解析。]),
      (1, [#icon("nbt-int") *generation*: 该成书的性质，用 `0` 表示“原作”，用 `1` 表示“原作的副本”，用 `2` 表示“副本的副本”，用 `3` 表示“破烂不堪”。]),
      (1, [#icon("nbt-list") *pages*: 该成书每一页的内容，列表中所有元素都是字符串，字符串中使用文本组件。列表第一个元素存储成书第1页的内容，第二个元素存储成书第2页的内容，以此类推。]),
      (2, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") 一页的内容，使用文本组件。])
    )
    首先指定成书的作者和标题：
    #codebox("{title:\"Hello\",author:\"unknown\"}")
    接下来为列表 #icon("nbt-list") `pages` 中的元素添加内容。由于第1页有跳转页数这个动作，因此不得不在第一个元素中使用 #icon("nbt-compound") 复合标签，字段 #icon("nbt-compound") `click_event` 中 #icon("nbt-string") `action` 的值设置为 `change_page`，#icon("nbt-int") `page` 设为 `2` 以表示页数：
    #codebox("{text:\"跳转至第2页\",click_event:{action:\"change_page\",page:2}}")
    第2页中没有特殊的文本类型与动作事件，可以考虑直接使用纯文本：
    #codebox("\"Hello\\nWorld\"")
    综上所述，可得命令
    #codebox("give @p written_book[written_book_content={title:\"Hello\",author:\"unknown\",pages:[{text:\"跳转至第2页\",click_event:{action:\"change_page\",page:2}},\"Hello\\nWorld\"]}]")
  ]
)
#example(
  [
    有一个箱子存放有@exa:can_break_and_can_place_on 第@enu:unbreakable_iron_pickaxe 小题所述的铁镐和@exa:custom_leather_chestplate 所述的皮革外套，但它通常是上锁的，只能被手持名为 `Key` 的物品打开。箱子的GUI如@fig:item_component_and_chest 所示，则：
    #figure(
      caption: "",
      image("图片/箱子与物品堆叠组件例题.png", width: 15em)
    ) <fig:item_component_and_chest>
    + 用命令 `/setblock` 在$(0,56,0)$放置这个箱子； <enu:setblock_chest>
    + 用命令 `/give` 将这个箱子给予附近的玩家；
    + 用命令 `/summon` 使这个箱子变成下落的方块，生成位置为$(0,70,0)$。 <enu:summon_chest>
  ],
  [
    本例题总结了物品格式和组件在三大格式中的应用：第@enu:setblock_chest 小题至第@enu:summon_chest 小题分别对应了其在方块实体格式、物品格式和实体格式中的应用。
    + 在方块实体格式中的应用

      箱子是为数不多的拥有方块实体的方块，查阅附录@sec:block_entity_data，在本题中需要用到的方块实体标签有：
      #tree(
        (0, [#icon("nbt-compound") 根标签]),
        (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 该方块实体的名称，即该容器在GUI上显示的名称。使用文本组件。]),
        (1, [#icon("nbt-compound") *Lock*: 玩家可以用于打开该容器的物品，使用*物品堆叠谓词*来判断。]),
        (2, [#icon("nbt-compound") *components*: 检查物品的堆叠组件，只有当物品堆叠组件完全相同时才匹配成功。]),
        (3, [*\<组件名称>*: 一项组件及匹配的内容。]),
        (2, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品的堆叠数量，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个数量区间。]),
        (3, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
        (3, [#icon("nbt-int") *max*: 最大值。]),
        (3, [#icon("nbt-int") *min*: 最小值。]),
        (2, [#icon("nbt-string")#icon("nbt-compound") *items*: 匹配的物品，可以是 #icon("nbt-string") 命名空间ID或物品数据包标签。也可以使用 #icon("nbt-list") 列表形式以尝试匹配列表中任意物品。]),
        (3, [*若使用 #icon("nbt-list") 列表形式，则有以下字段：*], false),
        (3, [#icon("nbt-string") 一项物品，可以是命名空间ID或物品数据包标签。]),
        (2, [#icon("nbt-compound") *predicates*: 检查该物品是否匹配指定的数据组件谓词。]),
        (3, [*\<数据组件谓词ID>*: 一项数据组件谓词及匹配的内容。]),
        (1, [#icon("nbt-list") *Items*: 箱子内的物品。列表中每个元素都是一个物品堆叠。]),
        (2, [带槽位物品格式])
      )
      注意到@fig:item_component_and_chest 的箱子GUI有“补给”这个自定义名称，故标签 #icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") `CustomName` 为
      #codebox("CustomName:\"补给\"")
      标签 #icon("nbt-compound") `Lock` 不仅存在于箱子的方块实体，还存在于其他所有的容器，故熔炉、酿造台都是可以被上锁的。这里需要匹配物品的名称 `Key`，而题目并没有要求匹配物品的命名空间ID，因此只需要匹配组件 `minecraft:item_name`。在本题中该标签应写为
      #codebox("Lock:{components:{\"minecraft:item_name\":\"Key\"}}")
      本题中皮革外套位于槽位 `container.2`，铁镐位于 `container.14`，取 `2b`、`14b` 作为物品格式中标签 #icon("nbt-byte") `Slot` 的值。将@exa:can_break_and_can_place_on 和@exa:custom_leather_chestplate 中的组件转换为SNBT后再写入标签 #icon("nbt-compound") `components`。由此可以得到标签 #icon("nbt-list") `Items` 的全部内容：
      #tree(
        (0, [#icon("nbt-list") *Items*]),
        (1, [#icon("nbt-compound")]),
        (2, [#icon("nbt-compound") *components*]),
        (3, [#icon("nbt-compound") *minecraft:can_break*]),
        (4, [#icon("nbt-list") *blocks*]),
        (5, [#icon("nbt-string") `minecraft:diamond_ore`]),
        (5, [#icon("nbt-string") `minecraft:iron_ore`]),
        (3, [#icon("nbt-compound") *minecraft:unbreakable*]),
        (2, [#icon("nbt-int") *count*: `1`]),
        (2, [#icon("nbt-string") *id*: `minecraft:iron_pickaxe`]),
        (2, [#icon("nbt-byte") *Slot*: `14b`]),
        (1, [#icon("nbt-compound")]),
        (2, [#icon("nbt-compound") *components*]),
        (3, [#icon("nbt-compound") *minecraft:enchantments*]),
        (4, [#icon("nbt-int") *minecraft:blast_protection*: `4`]),
        (4, [#icon("nbt-int") *minecraft:fire_protection*: `4`]),
        (4, [#icon("nbt-int") *minecraft:projectile_protection*: `4`]),
        (4, [#icon("nbt-int") *minecraft:protection*: `4`]),
        (3, [#icon("nbt-int") *minecraft:dyed_color*: `0x409da0`]),
        (3, [#icon("nbt-string") *minecraft:item_name*: `超级保护`]),
        (3, [#icon("nbt-list") *minecraft:lore*]),
        (4, [#icon("nbt-compound")]),
        (5, [#icon("nbt-string") *color*: `gold`]),
        (5, [#icon("nbt-bool") *italic*: `false`]),
        (5, [#icon("nbt-string") *text*: `这个外套将互斥的保护魔咒组合到了一起`]),
        (2, [#icon("nbt-int") *count*: `1`]),
        (2, [#icon("nbt-string") *id*: `minecraft:leather_chestplate`]),
        (2, [#icon("nbt-byte") *Slot*: `2b`])
      )
      综上所述，命令 `/setblock` 的完整写法为
      #codebox("setblock 0 56 0 chest{
  CustomName:\"补给\",
  Item:[
    {
      components:{
        \"minecraft:can_break\":{
          blocks:[
            \"minecraft:diamond_ore\",
            \"minecraft:iron_ore\"
          ]
        },
        \"minecraft:unbreakable\":{}
      },
      count:1,
      id:\"minecraft:iron_pickaxe\",
      Slot:14b,
    },
    {
      components:{
        \"minecraft:enchantments\":{
          \"minecraft:blast_protection\":4,
          \"minecraft:fire_protection\":4,
          \"minecraft:projectile_protection\":4,
          \"minecraft:protection\":4,
        },
        \"minecraft:dyed_color\":0x409da0,
        \"minecraft:item_name\":\"超级保护\",
        \"minecraft:lore\":[
          {
            color:\"gold\",
            italic:false,
            text:\"这个外套将互斥的保护魔咒组合到了一起\"
          }
        ]
      },
      count:1,
      id:\"minecraft:leather_chestplate\",
      Slot:2b,
    }
  ],
  Lock:{
    components:{
      \"minecraft:item_name\":\"Key\"
    }
  }
}")
    + 在物品格式中的应用

      命令 `/give` 使用的参数可直接指定组件。物品形式的箱子本质上是一个物品，但是它放置以后会成为一个箱子，且拥有方块实体。根据@tab:block_entity_component，可以使用方块实体组件 `minecraft:container`、`minecraft:custon_name` 和 `minecraft:lock`，得到命令 `/give`：
      #codebox("give @p chest[
  minecraft:container=[
    {
      components:{
        \"minecraft:can_break\":{
          blocks:[
            \"minecraft:diamond_ore\",
            \"minecraft:iron_ore\"
          ]
        },
        \"minecraft:unbreakable\":{}
      },
      count:1,
      id:\"minecraft:iron_pickaxe\",
      Slot:14b,
    },
    {
      components:{
        \"minecraft:enchantments\":{
          \"minecraft:blast_protection\":4,
          \"minecraft:fire_protection\":4,
          \"minecraft:projectile_protection\":4,
          \"minecraft:protection\":4,
        },
        \"minecraft:dyed_color\":0x409da0,
        \"minecraft:item_name\":\"超级保护\",
        \"minecraft:lore\":[
          {
            color:\"gold\",
            italic:false,
            text:\"这个外套将互斥的保护魔咒组合到了一起\"
          }
        ]
      },
      count:1,
      id:\"minecraft:leather_chestplate\",
      Slot:2b,
    }
  ],
  minecraft:custom_name=\"补给\",
  minecraft:lock={
    components:{
      \"minecraft:item_name\":\"Key\"
    }
  }
]")
    + 在实体格式中的应用

      本题所需的下落的方块的标签，除了节@sec:entity @exa:falling_block 的 #icon("nbt-compound") `BlockState` 外，还有 #icon("nbt-compound") `TileEntityData`，该标签用于存储下落的方块所代表方块的方块实体数据。直接使用第@enu:setblock_chest 小题的方块实体格式，不包含 #icon("nbt-string") `id` 字段，得到
      #codebox("summon falling_block 0 70 0 {
  BlockState:{
    Name:\"minecraft:chest\"
  },
  TileEntityData:{
    CustomName:\"补给\",
    Item:[
      {
        components:{
          \"minecraft:can_break\":{
            blocks:[
              \"minecraft:diamond_ore\",
              \"minecraft:iron_ore\"
            ]
          },
          \"minecraft:unbreakable\":{}
        },
        count:1,
        id:\"minecraft:iron_pickaxe\",
        Slot:14b,
      },
      {
        components:{
          \"minecraft:enchantments\":{
            \"minecraft:blast_protection\":4,
            \"minecraft:fire_protection\":4,
            \"minecraft:projectile_protection\":4,
            \"minecraft:protection\":4,
          },
          \"minecraft:dyed_color\":0x409da0,
          \"minecraft:item_name\":\"超级保护\",
          \"minecraft:lore\":[
            {
              color:\"gold\",
              italic:false,
              text:\"这个外套将互斥的保护魔咒组合到了一起\"
            }
          ]
        },
        count:1,
        id:\"minecraft:leather_chestplate\",
        Slot:2b,
      }
    ],
    Lock:{
      components:{
        \"minecraft:item_name\":\"Key\"
      }
    }
  }
}")
  ]
)
== 数据组件谓词<sec:data_component_prodicate>
在部分情况下需要判断数据组件是否满足某种条件，这时就需要使用#proper-noun(display: "数据组件谓词（Data Component Predicate）", "shu4 ju4 zu3 jian4 wei4 ci2")。所谓谓词，就是检查目标是否符合其所描述特征的过程，若否则检查不通过，如此可以筛选掉一批不符合要求的目标。数据组件谓词可在命令参数 `item_predicate`、实体谓词和物品堆叠谓词中使用，进而在 `/clear`、`/execute if items`、进度、战利品表谓词和物品模型映射等地方发挥作用。

数据组件谓词分为存在性谓词和条件判断型谓词两类。
=== 存在性谓词
存在性谓词可用于判断目标是否存在相应的数据组件，格式为
#tree(
  (0, [#icon("nbt-compound") *\<数据组件名称>*: 空标签，用于检测该数据组件是否存在。])
)
例如，要检测一个物品是否有 `food` 组件，谓词可以写为 `{"minecraft:food":{}}`，将它用在物品堆叠谓词中：`{predicates:{"minecraft:food":{}}}`；或者将它写在命令参数 `item_predicate` 中，理论上应写为 `*[food~{}]`，但是 `item_predicate` 参数本身就有直接匹配组件是否存在的测试项类型，所以只需写成 `*[food]`，见@exa:clear_food。

所有数据组件谓词的键名都和对应数据组件的ID一致，游戏在判定时会遵循以下逻辑：
+ 如果ID对应一个已注册的条件判断型谓词，游戏会尝试解析其内部条件，且这个谓词必须使用该条件判断型谓词接受的数据类型。这个规则造成了部分数据组件谓词不能用于检测存在性。例如，`potion_contents` 是一个已注册的条件判断型谓词，使用的数据类型为 #icon("nbt-string") 字符串或 #icon("nbt-list") 列表，因此不接受空复合标签，从而不能用 `{potion_contents:{}}` 判断其存在性。
+ 只有当ID不属于已注册的谓词时，才会将其视为存在性谓词。
=== 条件判断型谓词
条件判断型谓词用于检查相应数据组件是否符合特定的要求。游戏中存在以下已注册的条件判断型谓词：
==== #icon("nbt-compound") `attribute_modifiers`
此谓词用于检查数据组件 `attribute_modifiers` 所定义的属性修饰符。
#tree(
  (0, [#icon("nbt-compound") *minecraft:attribute_modifiers*]),
  (1, [#icon("nbt-compound") *modifiers*: 检查属性修饰符。]),
  (2, [#icon("nbt-list") *contains*: 要求列表内所有的项每个都必须至少有一个符合的属性修饰符，若否则谓词检查不通过。实际的属性修饰符不必匹配列表内所有的项。]),
  (3, [#icon("nbt-compound") 一个属性修饰符集合内容谓词。]),
  (4, [#icon("nbt-double")#icon("nbt-compound") *amount*: 若使用 #icon("nbt-double") 双精度浮点数形式，则匹配一个精确的修饰值。若使用 #icon("nbt-compound") 复合标签形式，则修饰值位于此区间内就能匹配。]),
  (5, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (5, [#icon("nbt-double") *max*: 允许匹配的最大值。]),
  (5, [#icon("nbt-double") *mix*: 允许匹配的最小值。]),
  (4, [#icon("nbt-string")#icon("nbt-list") *attribute*: 匹配的属性，可以是一个属性ID、在数据包内定义的属性标签，也可以是多个属性ID组成的列表。]),
  (4, [#icon("nbt-string") *id*: 匹配的属性修饰符，需要是属性修饰符的命名空间ID。]),
  (4, [#icon("nbt-string") *operation*: 匹配的属性修饰符运算模式，有效值 `add_value`（属性增量）、`add_multiplied_base`（倍率增量）和 `add_multiplied_total`（最终倍乘）。]),
  (4, [#icon("nbt-string") *slot*: 匹配属性修饰符生效的装备槽位组，有效值见@tab:equipment_slot_group。]),
  (1, [#icon("nbt-int")#icon("nbt-compound") *size*: 检查属性修饰符的数量。若使用 #icon("nbt-int") 整型，则匹配一个精确的数量。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (2, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (1, [#icon("nbt-list") *count*: 统计符合要求的属性修饰符并检查其数量。]),
  (2, [#icon("nbt-compound") 一个统计项。]),
  (3, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查属性修饰符的数量。若使用 #icon("nbt-int") 整型，则匹配一个精确的数量。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (4, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (3, [#icon("nbt-compound") *test*: 属性修饰符集合内容谓词，即需要检查数量的属性修饰符。]),
  (4, [#icon("nbt-double")#icon("nbt-compound") *amount*: 若使用 #icon("nbt-double") 双精度浮点数形式，则匹配一个精确的修饰值。若使用 #icon("nbt-compound") 复合标签形式，则修饰值位于此区间内就能匹配。]),
  (5, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (5, [#icon("nbt-double") *max*: 允许匹配的最大值。]),
  (5, [#icon("nbt-double") *mix*: 允许匹配的最小值。]),
  (4, [#icon("nbt-string")#icon("nbt-list") *attribute*: 匹配的属性，可以是一个属性ID、在数据包内定义的属性标签，也可以是多个属性ID组成的列表。]),
  (4, [#icon("nbt-string") *id*: 匹配的属性修饰符，需要是属性修饰符的命名空间ID。]),
  (4, [#icon("nbt-string") *operation*: 匹配的属性修饰符运算模式，有效值 `add_value`（属性增量）、`add_multiplied_base`（倍率增量）和 `add_multiplied_total`（最终倍乘）。]),
  (4, [#icon("nbt-string") *slot*: 匹配属性修饰符生效的装备槽位组，有效值见@tab:equipment_slot_group。])
)
#example(
  [清除执行者（玩家）身上所有修饰攻击伤害的物品。],
  [
    `clear` 命令使用 `item_predicate` 参数，其中物品组件谓词应写为
    #codebox("{modifiers:{contains:[{id:\"minecraft:attack_damage\"}]}}")
    将它写入完整的命令：
    #codebox("clear @s *[attribute_modifiers~{modifiers:{contains:[{id:\"minecraft:attack_damage\"}]}}]")
  ]
)
==== #icon("nbt-compound") `bundle_contents`
此谓词用于检查数据组件 `bundle_contents` 中的物品堆叠。
#tree(
  (0, [#icon("nbt-compound") *minecraft:bundle_contents*]),
  (1, [#icon("nbt-compound") *items*: 检查物品堆叠。]),
  (2, [#icon("nbt-list") *contains*: 要求列表内所有的项每个都必须至少有一个符合的物品堆叠，若否则谓词检查不通过。实际的物品堆叠不必匹配列表内所有的项。]),
  (3, [#icon("nbt-compound") 一个物品堆叠谓词。]),
  (4, [#icon("nbt-compound") *components*: 检查物品的堆叠组件，只有当物品堆叠组件完全相同时才匹配成功。]),
  (5, [*\<组件名称>*: 一项组件及匹配的内容。]),
  (4, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品的堆叠数量，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个数量区间。]),
  (5, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
  (5, [#icon("nbt-int") *max*: 最大值。]),
  (5, [#icon("nbt-int") *min*: 最小值。]),
  (4, [#icon("nbt-string")#icon("nbt-compound") *items*: 匹配的物品，可以是 #icon("nbt-string") 命名空间ID或物品数据包标签。也可以使用 #icon("nbt-list") 列表形式以尝试匹配列表中任意物品。]),
  (5, [*若使用 #icon("nbt-list") 列表形式，则有以下字段：*], false),
  (5, [#icon("nbt-string") 一项物品，可以是命名空间ID或物品数据包标签。]),
  (4, [#icon("nbt-compound") *predicates*: 检查该物品是否匹配指定的数据组件谓词。]),
  (5, [*\<数据组件谓词ID>*: 一项数据组件谓词及匹配的内容。]),
  (1, [#icon("nbt-int")#icon("nbt-compound") *size*: 检查物品堆叠的数量。若使用 #icon("nbt-int") 整型，则匹配一个精确的数量。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (2, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (1, [#icon("nbt-list") *count*: 统计符合要求的物品堆叠并检查其数量。]),
  (2, [#icon("nbt-compound") 一个统计项。]),
  (3, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品堆叠的数量。若使用 #icon("nbt-int") 整型，则匹配一个精确的数量。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (4, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (3, [#icon("nbt-compound") *test*: 物品堆叠谓词，即需要检查数量的物品堆叠。]),
  (4, [#icon("nbt-compound") *components*: 检查物品的堆叠组件，只有当物品堆叠组件完全相同时才匹配成功。]),
  (5, [*\<组件名称>*: 一项组件及匹配的内容。]),
  (4, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品的堆叠数量，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个数量区间。]),
  (5, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
  (5, [#icon("nbt-int") *max*: 最大值。]),
  (5, [#icon("nbt-int") *min*: 最小值。]),
  (4, [#icon("nbt-string")#icon("nbt-compound") *items*: 匹配的物品，可以是 #icon("nbt-string") 命名空间ID或物品数据包标签。也可以使用 #icon("nbt-list") 列表形式以尝试匹配列表中任意物品。]),
  (5, [*若使用 #icon("nbt-list") 列表形式，则有以下字段：*], false),
  (5, [#icon("nbt-string") 一项物品，可以是命名空间ID或物品数据包标签。]),
  (4, [#icon("nbt-compound") *predicates*: 检查该物品是否匹配指定的数据组件谓词。]),
  (5, [*\<数据组件谓词ID>*: 一项数据组件谓词及匹配的内容。])
)
==== #icon("nbt-compound") `container`
此谓词用于检查数据组件 `container` 中的物品堆叠。
#tree(
  (0, [#icon("nbt-compound") *minecraft:container*]),
  (1, [#icon("nbt-compound") *items*: 检查物品堆叠。]),
  (2, [#icon("nbt-list") *contains*: 要求列表内所有的项每个都必须至少有一个符合的物品堆叠，若否则谓词检查不通过。实际的物品堆叠不必匹配列表内所有的项。]),
  (3, [#icon("nbt-compound") 一个物品堆叠谓词。]),
  (4, [#icon("nbt-compound") *components*: 检查物品的堆叠组件，只有当物品堆叠组件完全相同时才匹配成功。]),
  (5, [*\<组件名称>*: 一项组件及匹配的内容。]),
  (4, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品的堆叠数量，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个数量区间。]),
  (5, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
  (5, [#icon("nbt-int") *max*: 最大值。]),
  (5, [#icon("nbt-int") *min*: 最小值。]),
  (4, [#icon("nbt-string")#icon("nbt-compound") *items*: 匹配的物品，可以是 #icon("nbt-string") 命名空间ID或物品数据包标签。也可以使用 #icon("nbt-list") 列表形式以尝试匹配列表中任意物品。]),
  (5, [*若使用 #icon("nbt-list") 列表形式，则有以下字段：*], false),
  (5, [#icon("nbt-string") 一项物品，可以是命名空间ID或物品数据包标签。]),
  (4, [#icon("nbt-compound") *predicates*: 检查该物品是否匹配指定的数据组件谓词。]),
  (5, [*\<数据组件谓词ID>*: 一项数据组件谓词及匹配的内容。]),
  (1, [#icon("nbt-int")#icon("nbt-compound") *size*: 检查物品堆叠的数量。若使用 #icon("nbt-int") 整型，则匹配一个精确的数量。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (2, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (1, [#icon("nbt-list") *count*: 统计符合要求的物品堆叠并检查其数量。]),
  (2, [#icon("nbt-compound") 一个统计项。]),
  (3, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品堆叠的数量。若使用 #icon("nbt-int") 整型，则匹配一个精确的数量。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (4, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (3, [#icon("nbt-compound") *test*: 物品堆叠谓词，即需要检查数量的物品堆叠。]),
  (4, [#icon("nbt-compound") *components*: 检查物品的堆叠组件，只有当物品堆叠组件完全相同时才匹配成功。]),
  (5, [*\<组件名称>*: 一项组件及匹配的内容。]),
  (4, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查物品的堆叠数量，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个数量区间。]),
  (5, [*若使用 #icon("nbt-compound") 复合标签形式，则包含以下字段：*], false),
  (5, [#icon("nbt-int") *max*: 最大值。]),
  (5, [#icon("nbt-int") *min*: 最小值。]),
  (4, [#icon("nbt-string")#icon("nbt-compound") *items*: 匹配的物品，可以是 #icon("nbt-string") 命名空间ID或物品数据包标签。也可以使用 #icon("nbt-list") 列表形式以尝试匹配列表中任意物品。]),
  (5, [*若使用 #icon("nbt-list") 列表形式，则有以下字段：*], false),
  (5, [#icon("nbt-string") 一项物品，可以是命名空间ID或物品数据包标签。]),
  (4, [#icon("nbt-compound") *predicates*: 检查该物品是否匹配指定的数据组件谓词。]),
  (5, [*\<数据组件谓词ID>*: 一项数据组件谓词及匹配的内容。])
)
==== #icon("nbt-string")#icon("nbt-compound") `custom_data`
此谓词用于检查数据组件 `custom_data` 中的自定义数据。
#tree(
  (0, [#icon("nbt-string")#icon("nbt-compound") `minecraft:custom_data`: 需要是一个测试NBT标签，写法见节@sec:testing_nbt。可以是 #icon("nbt-string") 字符串形式，此时整个值被视为一个SNBT，也可以是 #icon("nbt-compound") 复合标签。])
)
在命令参数 `item_predicate` 中，`custom_data=` 和 `custom_data~` 这两种测试项有本质区别，前者用于精确匹配谓词，这意味着测试的内容和实际的内容必须完全一致才能匹配；后者是数据组件谓词，由于测试内容需要是测试NBT标签，根据节@sec:testing_nbt 所述测试NBT标签的匹配方式，可以做到部分匹配。

例如，一个物品拥有如下的自定义数据组件：
#codebox("\"custom_data\":{test:1,test1:2}")
#h(-2em)则 `*[custom_data={test:1}]` 这个物品谓词无法匹配，组件 `custom_data` 的值是 `{test:1,test1:2}` 而不是谓词中所述的 `{test:1}`。因此能匹配的物品谓词是 `*[custom_data={test:1,test1:2}]`。但是如果写成数据组件谓词，那么 `*[custom_data~{test:1}]` 是可以匹配的。
#example(
  [
    一个作者在他的冒险地图中设计了一个行李箱，并为他地图中的所有物品都设置了如下的自定义数据：
    #tree(
      (0, [#icon("nbt-compound") *minecraft:custom_data*]),
      (1, [#icon("nbt-bool") *can_be_luggaged*: 该物品是否可放入行李箱。]),
      (1, [#icon("nbt-int") *volume*: 该物品在行李箱中占用的体积，若 #icon("nbt-bool") `can_be_luggaged` 为 `false`，则此项不存在。])
    )
    部分物品的设计如下表所示：
    #general-table(
      caption: "",
      colspan: 4,
      columns: (auto, auto, auto, auto),
      header: ([物品], [502胶水], [电池], [垃圾桶]),
      [`can_be_luggaged`], [`true`], [`true`], [`false`],
      [`volume`], [`2`], [`1`], [-]
    )
    + 尝试分别为表中的3样自定义物品编写 `custom_data` 组件。
    + 在玩家手持物品将其放入行李箱时，使用的命令为：
      #codebox("execute if items entity @s mainhand <item_predicate>")
      现需要判断以下情况，分别根据这些情况补全命令中的 `<item_predicate>`：
      + 判断物品占用的体积是否为1；
      + 判断物品是否不能放入行李箱。
  ],
  [
    + 以下使用SNBT格式的组件。

      502胶水：`"minecraft:custom_data":{can_be_luggaged:true,volume:2}`

      电池：`"minecraft:custom_data":{can_be_luggaged:true,volume:1}`
      
      垃圾桶：`"minecraft:custom_data":{can_be_luggaged:false}`
    + `<item_predicate>` 即物品谓词参数，此处只需要部分匹配，因此在物品谓词中使用 `custom_data` 这个数据组件谓词。
      + `*[custom_data~{volume:1}]`
      + `*[custom_data~{can_be_luggaged:false}]`
  ]
)
==== #icon("nbt-compound") `damage`
此谓词用于检查 `damage` 和 `max_damage` 这两个组件。
#tree(
  (0, [#icon("nbt-compound") *minecraft:damage*]),
  (1, [#icon("nbt-int")#icon("nbt-compound") *damage*: 检查物品的损坏值，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个区间。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (2, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (1, [#icon("nbt-int")#icon("nbt-compound") *durability*: 检查物品的剩余耐久度，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个区间。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (2, [#icon("nbt-int") *mix*: 允许匹配的最小值。])
)
==== #icon("nbt-list") `enchantments`
此谓词用于检查数据组件 `enchantments` 中的魔咒。
#tree(
  (0, [#icon("nbt-list") *minecraft:enchantments*: 此列表中的每一项都必须满足才能匹配。]),
  (1, [#icon("nbt-compound") 一项魔咒。]),
  (2, [#icon("nbt-string")#icon("nbt-list") *enchantments*: 匹配的魔咒，可以是一个魔咒ID、在数据包内定义的魔咒标签，也可以是多个魔咒ID组成的列表。]),
  (2, [#icon("nbt-int")#icon("nbt-compound") *levels*: 检查此魔咒的等级，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个等级区间。若 #icon("nbt-string")#icon("nbt-list") `enchantments` 不存在，则只要有任意魔咒的等级在此字段指定范围内，就匹配成功。]),
  (3, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (3, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (3, [#icon("nbt-int") *mix*: 允许匹配的最小值。])
)
==== #icon("nbt-compound") `firework_explosion`
此谓词用于检查数据组件 `firework_explosion` 的烟火数据。
#tree(
  (0, [#icon("nbt-compound") *minecraft:firework_explosion*]),
  (1, [#icon("nbt-compound") *modifiers*: 检查烟火数据。]),
  (2, [#icon("nbt-list") *contains*: 要求列表内所有的项每个都必须至少有一个符合的烟火爆裂效果，若否则谓词检查不通过。实际的烟火爆裂效果不必匹配列表内所有的项。]),
  (3, [#icon("nbt-compound") 一个烟火谓词。]),
  (4, [#icon("nbt-bool") *has_trail*: 此烟火是否有尾曳。]),
  (4, [#icon("nbt-bool") *has_twinkle*: 此烟火是否有闪烁效果。]),
  (4, [#icon("nbt-string") *shape*: 匹配烟火的形状，有效值 `small_ball`、`large_ball`、`star`、`creeper` 和 `burst`。]),
  (1, [#icon("nbt-int")#icon("nbt-compound") *size*: 检查烟火爆裂效果的数量。若使用 #icon("nbt-int") 整型，则匹配一个精确的数量。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (2, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (1, [#icon("nbt-list") *count*: 统计符合要求的烟火爆裂效果并检查其数量。]),
  (2, [#icon("nbt-compound") 一个统计项。]),
  (3, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查烟火爆裂效果的数量。若使用 #icon("nbt-int") 整型，则匹配一个精确的数量。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (4, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (3, [#icon("nbt-compound") *test*: 烟火谓词，即需要检查数量的烟火爆裂效果。]),
  (4, [#icon("nbt-bool") *has_trail*: 此烟火是否有尾曳。]),
  (4, [#icon("nbt-bool") *has_twinkle*: 此烟火是否有闪烁效果。]),
  (4, [#icon("nbt-string") *shape*: 匹配烟火的形状，有效值 `small_ball`、`large_ball`、`star`、`creeper` 和 `burst`。])
)
==== #icon("nbt-compound") `firework`
此谓词用于检查数据组件 `firework` 的烟花火箭数据。
#tree(
  (0, [#icon("nbt-compound") *minecraft:firework*]),
  (1, [#icon("nbt-compound") *explosions*: 检查烟火爆裂效果]),
  (2, [#icon("nbt-compound") *modifiers*: 检查烟火数据。]),
  (3, [#icon("nbt-list") *contains*: 要求列表内所有的项每个都必须至少有一个符合的烟火爆裂效果，若否则谓词检查不通过。实际的烟火爆裂效果不必匹配列表内所有的项。]),
  (4, [#icon("nbt-compound") 一个烟火谓词。]),
  (5, [#icon("nbt-bool") *has_trail*: 此烟火是否有尾曳。]),
  (5, [#icon("nbt-bool") *has_twinkle*: 此烟火是否有闪烁效果。]),
  (5, [#icon("nbt-string") *shape*: 匹配烟火的形状，有效值 `small_ball`、`large_ball`、`star`、`creeper` 和 `burst`。]),
  (2, [#icon("nbt-int")#icon("nbt-compound") *size*: 检查烟火爆裂效果的数量。若使用 #icon("nbt-int") 整型，则匹配一个精确的数量。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (3, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (3, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (3, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (2, [#icon("nbt-list") *count*: 统计符合要求的烟火爆裂效果并检查其数量。]),
  (3, [#icon("nbt-compound") 一个统计项。]),
  (4, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查烟火爆裂效果的数量。若使用 #icon("nbt-int") 整型，则匹配一个精确的数量。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (5, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (5, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (5, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (4, [#icon("nbt-compound") *test*: 烟火谓词，即需要检查数量的烟火爆裂效果。]),
  (5, [#icon("nbt-bool") *has_trail*: 此烟火是否有尾曳。]),
  (5, [#icon("nbt-bool") *has_twinkle*: 此烟火是否有闪烁效果。]),
  (5, [#icon("nbt-string") *shape*: 匹配烟火的形状，有效值 `small_ball`、`large_ball`、`star`、`creeper` 和 `burst`。]),
  (1, [#icon("nbt-int")#icon("nbt-compound") *flight_duration*: 检查烟花火箭的飞行时间。若使用 #icon("nbt-int") 整型，则匹配一个精确的时间。若使用 #icon("nbt-compound") 复合标签形式，则飞行时间位于此区间内就能匹配。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (2, [#icon("nbt-int") *mix*: 允许匹配的最小值。])
)
==== #icon("nbt-compound") `jukebox_playable`
此谓词用于检查数据组件 `jukebox_playable` 的音乐唱片信息。
#tree(
  (0, [#icon("nbt-compound") *minecraft:jukebox_playable*]),
  (1, [#icon("nbt-string")#icon("nbt-list") *song*: 匹配的唱片机曲目，可以是一个唱片机曲目ID、在数据包内定义的唱片机曲目标签，也可以是多个唱片机曲目ID组成的列表。])
)
==== #icon("nbt-string")#icon("nbt-list") `potion_contents`
此谓词用于检查数据组件 `potion_contents` 的药水效果。
#tree(
  (0, [#icon("nbt-string")#icon("nbt-list") *potion_contents*: 匹配的药水效果，可以是一个药水效果ID、在数据包内定义的药水效果标签，也可以是多个药水效果ID组成的列表。])
)
==== #icon("nbt-list") `stored_enchantments`
此谓词用于检查数据组件 `stored_enchantments` 中存储的魔咒。
#tree(
  (0, [#icon("nbt-list") *minecraft:stored_enchantments*: 此列表中的每一项都必须满足才能匹配。]),
  (1, [#icon("nbt-compound") 一项魔咒。]),
  (2, [#icon("nbt-string")#icon("nbt-list") *enchantments*: 匹配的魔咒，可以是一个魔咒ID、在数据包内定义的魔咒标签，也可以是多个魔咒ID组成的列表。]),
  (2, [#icon("nbt-int")#icon("nbt-compound") *levels*: 检查此魔咒的等级，可以使用 #icon("nbt-int") 整数匹配一个精确值，也可以使用 #icon("nbt-compound") 复合标签匹配一个等级区间。若 #icon("nbt-string")#icon("nbt-list") `enchantments` 不存在，则只要有任意魔咒的等级在此字段指定范围内，就匹配成功。]),
  (3, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (3, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (3, [#icon("nbt-int") *mix*: 允许匹配的最小值。])
)
==== #icon("nbt-compound") `trim`
此谓词用于检查数据组件 `trim` 的盔甲纹饰数据。
#tree(
  (0, [#icon("nbt-compound") *minecraft:trim*]),
  (1, [#icon("nbt-string")#icon("nbt-list") *material*: 匹配的盔甲纹饰材料，可以是一个盔甲纹饰材料ID、在数据包内定义的盔甲纹饰材料标签，也可以是多个盔甲纹饰材料ID组成的列表。]),
  (1, [#icon("nbt-string")#icon("nbt-list") *pattern*: 匹配的盔甲纹饰图案，可以是一个盔甲纹饰图案ID、在数据包内定义的盔甲纹饰图案标签，也可以是多个盔甲纹饰图案ID组成的列表。])
)
==== #icon("nbt-string")#icon("nbt-list") `villager/variant`
此谓词用于检查数据组件 `villager/variant` 使用的村民类型。
#tree(
  (0, [#icon("nbt-string")#icon("nbt-list") *villager/variant*: 匹配的村民类型，可以是一个村民类型ID、在数据包内定义的村民类型标签，也可以是多个村民类型ID组成的列表。])
)
==== #icon("nbt-compound") `writable_book_content`
此谓词用于检查数据组件 `writable_book_content` 的书与笔内容。
#tree(
  (0, [#icon("nbt-compound") *minecraft:writable_book_content*]),
  (1, [#icon("nbt-compound") *pages*: 检查书页内容。]),
  (2, [#icon("nbt-list") *contains*: 要求列表内所有的项每个都必须至少有一个符合的书页，若否则谓词检查不通过。实际的书页不必匹配列表内所有的项。]),
  (3, [#icon("nbt-string") 一个书页谓词。要求完全匹配一页未过滤的原始文本内容。]),
  (1, [#icon("nbt-int")#icon("nbt-compound") *size*: 检查页数。若使用 #icon("nbt-int") 整型，则匹配一个精确的页数。若使用 #icon("nbt-compound") 复合标签形式，则页数位于此区间内就能匹配。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (2, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (1, [#icon("nbt-list") *count*: 统计符合要求的书页并检查其数量。]),
  (2, [#icon("nbt-compound") 一个统计项。]),
  (3, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查页数。若使用 #icon("nbt-int") 整型，则匹配一个精确的页数。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (4, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (3, [#icon("nbt-string") *test*: 一个书页谓词。要求完全匹配一页未过滤的原始文本内容。])
)
==== #icon("nbt-compound") `written_book_content`
此谓词用于检查数据组件 `written_book_content` 的成书内容。
#tree(
  (0, [#icon("nbt-compound") *minecraft:written_book_content*]),
  (1, [#icon("nbt-compound") *pages*: 检查书页内容。]),
  (2, [#icon("nbt-list") *contains*: 要求列表内所有的项每个都必须至少有一个符合的书页，若否则谓词检查不通过。实际的书页不必匹配列表内所有的项。]),
  (3, [#icon("nbt-string") 一个书页谓词。要求完全匹配一页未过滤的原始文本内容。]),
  (1, [#icon("nbt-int")#icon("nbt-compound") *size*: 检查页数。若使用 #icon("nbt-int") 整型，则匹配一个精确的页数。若使用 #icon("nbt-compound") 复合标签形式，则页数位于此区间内就能匹配。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (2, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (1, [#icon("nbt-list") *count*: 统计符合要求的书页并检查其数量。]),
  (2, [#icon("nbt-compound") 一个统计项。]),
  (3, [#icon("nbt-int")#icon("nbt-compound") *count*: 检查页数。若使用 #icon("nbt-int") 整型，则匹配一个精确的页数。若使用 #icon("nbt-compound") 复合标签形式，则数量位于此区间内就能匹配。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (4, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (4, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (3, [#icon("nbt-string") *test*: 一个书页谓词。要求完全匹配一页未过滤的原始文本内容。]),
  (1, [#icon("nbt-string") *author*: 检查成书的作者。]),
  (1, [#icon("nbt-int")#icon("nbt-compound") *generation*: 检查成书的性质，用 `0` 表示“原作”，用 `1` 表示“原作的副本”，用 `2` 表示“副本的副本”，用 `3` 表示“破烂不堪”。若使用 #icon("nbt-int") 整型，则匹配特定的性质。若使用 #icon("nbt-compound") 复合标签形式，则值位于此区间内就能匹配。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-int") *max*: 允许匹配的最大值。]),
  (2, [#icon("nbt-int") *mix*: 允许匹配的最小值。]),
  (1, [#icon("nbt-byte") *resolved*: 检查成书内的文本是否已被解析。]),
  (1, [#icon("nbt-string") *title*: 检查成书的标题。]),
)
== 粒子
#proper-noun(display: "粒子（Particles）", "li4 zi3")是一种纯美学的、不会造成任何实质性影响的图形效果。如果设计得当，粒子效果将会为作品增色不少。
#figure(
  caption: "使用命令生成的水粒子效果",
  image("图片/使用命令生成的水粒子效果.png", width: 20em)
) <fig:particle_example>
命令 `/particle` 用于在指定位置显示指定粒子效果，它需要的权限等级为2，语法为：#index(index: "command", "particle")
#codebox("particle <name> [<pos>]") <code:particle_name_pos>
#h(-2em)或
#codebox("particle <name> <pos> <delta> <speed> <count> [force|normal] [<viewers>]")
#param-desc(
  [`<name>`（粒子 `minecraft:particle`）], [需要生成的粒子，必须为粒子的命名空间ID，必要时需要带有粒子参数。],
  [`<pos>`（三维坐标 `minecraft:vec3`）], [粒子显示的位置，在语法@code:particle_name_pos 中可选，若不定义参数，则使用命令执行位置。],
  [`<delta>`（三维坐标 `minecraft:vec3`）], [#h(-2em)指定粒子显示的范围。粒子以显示位置为中心，按照各坐标增量参数的2至4倍向外扩展相应的格数，最终大致呈现一个较粒子原始尺寸4至8倍的长方体。#figure(caption: [粒子的显示范围，其中$"d"x'$约等于2至4倍的 `<dx>` 参数], image("图片/粒子的显示范围，其中dx'约等于2至4倍的dx参数.png", width: 10em))],
  [`<speed>`（浮点数 `brigadier:float`）], [粒子的速度，必须大于或等于 `0`。],
  [`<count>`（整型 `brigadier:integer`）], [粒子的数量，必须大于或等于 `0`。*若为 `0`，则颗粒会从 `<pos>` 往 `<delta>` 规定的坐标移动。*],
  [`[force|normal]` ], [可选，粒子显示的模式，其中 `force` 使粒子可以被512格以内的玩家看到，`normal` 使粒子仅能被32格以内的玩家看到，默认为 `normal`。],
  [`[<viewers>]`（实体 `minecraft:entity`）], [可选，指定粒子可以被哪些玩家看到，需要 玩家名、UUID或目标选择器，必须指定玩家。]
)
粒子分为简单粒子和带选项粒子两种，前者只需指定粒子的命名空间ID即可使用，后者需要附带一些参数以进行自定义。例如，
#codebox("particle ash")
#h(-2em)显示的是一个简单粒子，而
#codebox("particle item{item:\"minecraft:apple\"}")
#h(-2em)显示的就是一个带选项粒子，`{item:"minecraft:apple"}` 即是附带数据。

原版所有可用的简单粒子如下表所示，各粒子的命名空间前缀 `minecraft` 已省略：
#general-table(
  caption: "简单粒子效果表",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([ID], [外观], [描述]),
  [`angry_villager`], [#image("图标/particle/angry_villager.png", width: 3em)], [村民的愤怒粒子。],
  [`ash`], [#image("图标/particle/ash.png", width: 1em)], [灵魂沙峡谷的环境颗粒。],
  [`bubble`], table.cell(rowspan: 2)[#image("图标/particle/bubble.png", width: 3em)], [灵魂沙产生的气泡柱，若粒子所在位置不是水，此粒子会立即消失。],
  [`bubble_column_up`], [气泡，若粒子所在位置不是水，此粒子会立即消失。],
  [`bubble_pop`], [#image("图标/particle/bubble_pop.png", width: 3em)], [气泡柱顶部。],
  [`campfire_cosy_smoke`], table.cell(rowspan: 2)[#image("图标/particle/campfire_cosy_smoke.png", width: 3em)], [营火产生的烟雾，寿命为80到129 gt。],
  [`campfire_signal_smoke`], [放置在干草捆上的营火产生的烟雾，寿命为280到329 gt。],
  [`cherry_leaves`], [#image("图标/particle/cherry_leaves.png", width: 2em)], [落樱花瓣粒子。],
  [`cloud`], table.cell(fill: black)[#image("图标/particle/generic_7.png", width: 3em)], [湿海绵在下界干燥的粒子、幻术师隐身粒子。],
  [`composter`], [#image("图标/particle/glint.png", width: 3em)], [堆肥桶堆肥时产生的粒子。],
  [`copper_fire_flame`], [#image("图标/particle/copper_fire_flame.png", width: 3em)], [铜火把粒子。],
  [`crimson_spore`], [#image("图标/particle/crimson_spore.png", width: 1em)], [绯红森林的环境颗粒。],
  [`crit`], [#image("图标/particle/critical_hit.png", width: 3em)], [暴击、尖牙、蓄满的弓和填装完的弩发射的箭造成伤害时产生的粒子。],
  [`current_down`], [#image("图标/particle/bubble.png", width: 3em)], [岩浆块产生的气泡柱。],
  [`damage_indicator`], [#image("图标/particle/damage_indicator.png", width: 3em)], [近战攻击产生的粒子。],
  [`dolphin`], [#image("图标/particle/dolphin.png", width: 1em)], [海豚游泳产生的轨迹。],
  [`dripping_dripstone_lava`], [#image("图标/particle/dripping_lava.png", width: 1em)], [滴水石锥渗出未滴落的熔岩粒子。],
  [`dripping_dripstone_water`], [#image("图标/particle/dripping_water.png", width: 1em)], [滴水石锥渗出未滴落的水粒子。],
  [`dripping_honey`], [#image("图标/particle/dripping_honey.png", width: 1em)], [蜂巢或蜂箱渗出未滴落的蜂蜜粒子。],
  [`dripping_lava`], [#image("图标/particle/dripping_lava.png", width: 1em)], [方块渗出的熔岩粒子。],
  [`dripping_obsidian_tear`], [#image("图标/particle/dripping_obsidian_tear.png", width: 1em)], [哭泣的黑曜石产生的粒子。],
  [`dripping_water`], [#image("图标/particle/dripping_water.png", width: 1em)], [方块渗出的水粒子。],
  [`dust_plume`], [#image("图标/particle/dust_plume.png", width: 3em)], [向饰纹陶罐放入物品产生的粒子。],
  [`egg_crack`], [#image("图标/particle/glint.png", width: 3em)], [嗅探兽蛋放置在苔藓快或孵化时产生的粒子。],
  [`elder_guardian`], [], [远古守卫者施加挖掘疲劳效果时产生的鬼影，直接使用远古守卫者的模型，无对应粒子纹理。],
  [`electric_spark`], [#image("图标/particle/electric_spark.png", width: 3em)], [闪电击中氧化变种的未涂蜡铜块时产生的粒子。],
  [`enchant`], table.cell(fill: black)[#image("图标/particle/sga_a.png", width: 2em)], [附魔台周围的漂浮字符。],
  [`enchanted_hit`], [#image("图标/particle/enchanted_hit.png", width: 3em)], [附有锋利、亡灵杀手和节肢杀手的武器攻击实体时产生的粒子。],
  [`end_rod`], table.cell(fill: black)[#image("图标/particle/end_rod.png", width: 2em)], [末地烛的粒子、潜影贝导弹的轨迹。],
  [`explosion`], table.cell(fill: black, rowspan: 2)[#image("图标/particle/explosion.png", width: 3em)], [爆炸产生的粒子。],
  [`explosion_emitter`], [本身不渲染，但每游戏刻会在其周围生成6个 `explosion` 粒子。],
  [`falling_dripstone_lava`], [#image("图标/particle/dripping_lava.png", width: 1em)], [滴水石锥滴落的熔岩。],
  [`falling_dripstone_water`], [#image("图标/particle/dripping_water.png", width: 1em)], [滴水石锥滴落的水。],
  [`falling_honey`], [#image("图标/particle/dripping_honey.png", width: 1em)], [滴落的蜂蜜。],
  [`falling_lava`], [#image("图标/particle/dripping_lava.png", width: 1em)], [滴落的熔岩。],
  [`falling_nectar`], [#image("图标/particle/falling_nectar.png", width: 1em)], [蜜蜂滴落的花粉。],
  [`falling_obsidian_tear`], [#image("图标/particle/dripping_obsidian_tear.png", width: 1em)], [滴落的哭泣的黑曜石的粒子。],
  [`falling_spore_blossom`], [#image("图标/particle/falling_spore_blossom.png", width: 1em)], [孢子花滴落的孢子粒子。],
  [`falling_water`], [#image("图标/particle/dripping_water.png", width: 1em)], [滴落的水。],
  [`firefly`], [#image("图标/particle/firefly.png", width: 1em)], [萤火虫粒子。],
  [`firework`], table.cell(fill: black)[#image("图标/particle/firework.png", width: 3em)], [烟花火箭的尾迹。],
  [`fishing`], [#image("图标/particle/fishing.png", width: 1em)], [钓鱼产生的水花。],
  [`flame`], [#image("图标/particle/flame.png", width: 3em)], [火焰粒子。],
  [`glow`], [#image("图标/particle/glow.png", width: 3em)], [发光鱿鱼产生的荧光粒子。],
  [`glow_squid_ink`], [#image("图标/particle/glow_squid_ink.png", width: 3em)], [发光鱿鱼被攻击时产生的墨汁。],
  [`gust`], table.cell(rowspan: 3)[#image("图标/particle/gust.png", width: 3em)], [狂风粒子。],
  [`gust_emitter_large`], [寿命为7 gt，本身不渲染，但每游戏刻会在其周围生成3个 `gust` 粒子。],
  [`gust_emitter_small`], [寿命为3 gt，本身不渲染，但每游戏刻会在其周围生成3个 `gust` 粒子。],
  [`happy_villager`], [#image("图标/particle/glint.png", width: 3em)], [村民产生的粒子。],
  [`heart`], [#image("图标/particle/heart.png", width: 3em)], [生物繁殖产生的爱心。],
  [`infested`], [#image("图标/particle/infested.png", width: 3em)], [寄生效果产生的粒子。],
  [`item_cobweb`], [#image("图标/particle/item_cobweb.png", width: 3em)], [盘丝效果产生的粒子。],
  [`item_slime`], [#image("图标/particle/item_slime.png", width: 3em)], [渗浆效果产生的粒子。],
  [`item_snowball`], [#image("图标/particle/item_snowball.png", width: 3em)], [雪球击中物体产生的粒子。],
  [`landing_honey`], [#image("图标/particle/landing_honey.png", width: 3em)], [渗出的蜂蜜着地的粒子。],
  [`landing_lava`], [#image("图标/particle/landing_lava.png", width: 3em)], [渗出的熔岩着地的粒子。],
  [`landing_obsidian_tear`], [#image("图标/particle/landing_obsidian_tear.png", width: 3em)], [哭泣的黑曜石渗出的着地的粒子。],
  [`large_smoke`], [#image("图标/particle/large_smoke.png", width: 3em)], [火焰燃烧产生的烟雾。],
  [`lava`], [#image("图标/particle/lava.png", width: 2em)], [熔岩粒子。],
  [`mycelium`], [#image("图标/particle/mycelium.png", width: 1em)], [菌丝产生的孢子粒子。],
  [`nautilus`], [#image("图标/particle/nautilus.png", width: 3em)], [激活的潮涌核心产生的粒子。],
  [`note`], [#image("图标/particle/note.png", width: 3em)], [音符。],
  [`ominous_spawning`], table.cell(fill: black)[#image("图标/particle/ominous_spawning.png", width: 1em)], [不祥之物生成器生成物品时释放的粒子。],
  [`pause_mob_growth`], [#image("图标/particle/glint.png", width: 3em)], [用金蒲公英锁定生物年龄产生的粒子],
  [`poof`], table.cell(fill: black)[#image("图标/particle/generic_7.png", width: 3em)], [爆炸、生物死亡时出现的烟雾。],
  [`portal`], [#image("图标/particle/portal.png", width: 3em)], [传送门、末地生物产生的粒子。],
  [`raid_omen`], [#image("图标/particle/raid_omen.png", width: 2em)], [袭击之兆产生的粒子。],
  [`rain`], [#image("图标/particle/fishing.png", width: 1em)], [雨。],
  [`reset_mob_growth`], [#image("图标/particle/glint.png", width: 3em)], [用金蒲公英解锁生物年龄产生的粒子],
  [`reverse_portal`], [#image("图标/particle/portal.png", width: 3em)], [重生锚上方漂浮的粒子。],
  [`scrape`], [#image("图标/particle/glow.png", width: 3em)], [未涂蜡氧化变种铜块除锈时产生的粒子。],
  [`sculk_charge_pop`], [#image("图标/particle/sculk_charge_pop.png", width: 2em)], [幽匿信号丢失时产生的气泡破裂粒子。],
  [`sculk_soul`], [#image("图标/particle/sculk_soul.png", width: 1em)], [幽匿催发体探测到生物死亡时顶部出现的灵魂粒子。],
  [`small_flame`], [#image("图标/particle/flame.png", width: 3em)], [蜡烛燃烧的火焰。],
  [`small_gust`], [#image("图标/particle/small_gust.png", width: 2em)], [蓄风效果产生的粒子。],
  [`smoke`], [#image("图标/particle/large_smoke.png", width: 3em)], [小型烟雾。],
  [`sneeze`], [#image("图标/particle/glow_squid_ink.png", width: 3em)], [幼年熊猫的喷嚏粒子。],
  [`snowflake`], table.cell(fill: black)[#image("图标/particle/snowflake.png", width: 3em)], [玩家在细雪中移动时产生的雪花粒子。],
  [`sonic_boom`], [#image("图标/particle/sonic_boom.png", width: 3em)], [监守者发射的音波。],
  [`soul`], [#image("图标/particle/sculk_soul.png", width: 1em)], [穿戴灵魂疾行靴子的生物在灵魂沙或灵魂土上行走时出现的灵魂粒子。],
  [`soul_fire_flame`], [#image("图标/particle/soul_fire_flame.png", width: 3em)], [灵魂火把的火苗。],
  [`spit`], table.cell(fill: black)[#image("图标/particle/generic_7.png", width: 3em)], [羊驼唾沫。],
  [`splash`], [#image("图标/particle/fishing.png", width: 1em)], [水中的实体、离开水后的狼、船产生的水花粒子。],
  [`spore_blossom_air`], [#image("图标/particle/spore_blossom_air.png", width: 1em)], [孢子花产生的孢子。],
  [`squid_ink`], [#image("图标/particle/squid_ink.png", width: 3em)], [鱿鱼被攻击时产生的墨汁。],
  [`sweep_attack`], [#image("图标/particle/sweep_attack.png", width: 3em)], [横扫攻击粒子。],
  [`totem_of_undying`], [#image("图标/particle/totem_of_undying.png", width: 2em)], [激活不死图腾时出现的粒子。],
  [`trial_omen`], [#image("图标/particle/trial_omen.png", width: 2em)], [试炼之兆效果产生的粒子。],
  [`trial_spawner_detection`], [#image("图标/particle/trial_spawner_detection.png", width: 0.5em)], [试炼刷怪笼激活产生的火花粒子。],
  [`trial_spawner_detection_ominous`], [#image("图标/particle/trial_spawner_detection_ominous.png", width: 0.5em)], [不详试炼刷怪笼激活产生的火花粒子。],
  [`underwater`], [#image("图标/particle/underwater.png", width: 1em)], [水下颗粒。],
  [`vault_connection`], [#image("图标/particle/vault_connection.png", width: 1em)], [玩家靠近宝库产生的粒子。],
  [`warped_spore`], [#image("图标/particle/warped_spore.png", width: 1em)], [诡异森林的环境颗粒。],
  [`wax_off`], [#image("图标/particle/wax_off.png", width: 3em)], [给涂蜡变种铜块除蜡时出现的粒子。],
  [`wax_on`], [#image("图标/particle/wax_on.png", width: 3em)], [给铜块、告示牌上蜡时出现的粒子。],
  [`white_ash`], [#image("图标/particle/white_ash.png", width: 1em)], [玄武岩三角洲的环境颗粒。],
  [`white_smoke`], [#image("图标/particle/white_smoke.png", width: 3em)], [合成器投掷出物品时出现的粒子。],
  [`witch`], [#image("图标/particle/witch.png", width: 3em)], [女巫产生的粒子。]
)
#example(
  [在命令执行位置产生一个速度为1、数量为10、呈现点状的熔岩粒子。],
  [
    命令如下所示：
    #codebox("particle lava ~ ~ ~ 0 0 0 1 10")
  ]
)
#example(
  [
    高频生成火焰粒子，使之同时从坐标$(0,70,0)$处朝如图所示的八个正方向运动。
    #figure(
      caption: "",
      image("图片/由命令生成的火焰粒子动态效果.png", width: 10em)
    )
  ],
  [
    当 `/particle` 的 `<count>` 为0时，粒子可以从 `<pos>` 移动至 `<delta>`。由此可以编写如下高频运行的函数：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > flame_particle.mcfunction",
      "particle flame 0 70 0 1 0 0 1 0
particle flame 0 70 0 1 0 1 1 0
particle flame 0 70 0 0 0 1 1 0
particle flame 0 70 0 -1 0 1 1 0
particle flame 0 70 0 -1 0 0 1 0
particle flame 0 70 0 -1 0 -1 1 0
particle flame 0 70 0 0 0 -1 1 0
particle flame 0 70 0 1 0 -1 1 0"
    )
  ]
)
除此之外的所有粒子均为带选项粒子。原版拥有多种粒子选项类型，可供不同的带选项粒子使用。下文列举了所有的粒子选项类型：
===== #proper-noun(display: "方块粒子选项（Block particle option）", "fang1 kuai4 li4 zi3 xuan3 xiang4")
以下粒子类型使用方块粒子选项：

`block`：生物与方块接触或交互产生的粒子。

`block_crumble`：嘎吱之心被破坏时相应的嘎吱消失产生的粒子。

`block_marker`：光源方块或屏障的贴图。

`dust_pillar`：重锤猛击产生的粒子。

`falling_dust`：浮空的受重力影响的方块下方产生的飘落粒子。

方块粒子选项使用以下的字段：
#tree(
  (0, [#icon("nbt-compound") 粒子选项]),
  (1, [#icon("nbt-string")#icon("nbt-compound") *#underline[block_state]*: 粒子使用的方块及其方块状态。如果使用 #icon("nbt-string") 字符串形式，则值是一个方块的命名空间ID，此时该方块使用其默认属性。如果使用 #icon("nbt-compound") 复合标签形式，可以指定方块的各项属性。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-string") *#underline[Name]*: 方块的命名空间ID。]),
  (2, [#icon("nbt-compound") *Properties*: 可选，由若干方块属性组成的方块状态。]),
  (3, [#icon("nbt-string") *\<方块属性>*: 标签名为方块状态的属性，值使用字符串表示。])
)
#example(
  [生成一个覆雪草方块的粒子。],
  [
    命令为
    #codebox("particle block{block_state:{Name:\"minecraft:grass_block\",Properties:{snowy:\"true\"}}")
  ]
)
===== #proper-noun(display: "颜色粒子选项（Color particle option）", "yan2 se4 li4 zi3 xuan3 xiang4")
以下粒子类型使用颜色粒子选项：

`entity_effect`：药水效果的粒子。

`flash`：烟花火箭爆炸的闪烁效果。

`tinted_leaves`：落叶粒子。

这些粒子除了RGB通道外，还可以指定一个透明通道A，字段如下：
#tree(
  (0, [#icon("nbt-compound") 粒子选项]),
  (1, [#icon("nbt-int")#icon("nbt-list") *#underline[color]*: 粒子颜色，可以用 #icon("nbt-int") 整型指定RGB颜色，对二进制而言，每八位表示一个通道，从高到低依次为A、R、G、B通道。也可以用 #icon("nbt-list") 列表分别指定每个通道。游戏在存储时一律存储为 #icon("nbt-int") 整型。]),
  (2, [*若使用 #icon("nbt-list") 列表形式，则包含以下字段：*], false),
  (2, [#icon("nbt-float") R通道分量，表示红色值。]),
  (2, [#icon("nbt-float") G通道分量，表示绿色值。]),
  (2, [#icon("nbt-float") B通道分量，表示蓝色值。]),
  (2, [#icon("nbt-float") A通道分量，表示透明度。])
)
#example(
  [生成一个黑色不透明（RGBA通道为：0、0、0、1）的 `entity_effect` 粒子。],
  [
    命令为
    #codebox("particle entity_effect{color:[0.0f,0.0f,0.0f,1.0f]}")
    #h(-2em)如果使用整数形式，将上述RGBA颜色转换为十进制的结果为0，则命令又可以是
    #codebox("particle entity_effect{color:0}")
  ]
)
===== #proper-noun(display: "粉末粒子选项（Dust particle options）", "fen3 mo4 li4 zi3 xuan3 xiang4")
`dust` 粒子使用这种选项类型，可以指定粒子颜色，还可以指定粒子大小，同时大小会影响粒子寿命。它使用以下字段：
#tree(
  (0, [#icon("nbt-compound") 粒子选项]),
  (1, [#icon("nbt-int")#icon("nbt-list") *#underline[color]*: 粒子颜色，可以用 #icon("nbt-int") 整型指定RGB颜色，对二进制而言，每八位表示一个通道，从高到低依次为R、G、B通道。也可以用 #icon("nbt-list") 列表分别指定每个通道。游戏在存储时一律存储为 #icon("nbt-int") 整型。]),
  (2, [*若使用 #icon("nbt-list") 列表形式，则包含以下字段：*], false),
  (2, [#icon("nbt-float") R通道分量，表示红色值。]),
  (2, [#icon("nbt-float") G通道分量，表示绿色值。]),
  (2, [#icon("nbt-float") B通道分量，表示蓝色值。]),
  (1, [#icon("nbt-float") *scale*: 该粒子的大小，有效值区间为$[0.01,4]$。粒子的寿命为8到40 gt的随机时长乘以此值。])
)
#example(
  [生成一个正红色（RGB值：255，0，0）、大小为1的粉末粒子。],
  [
    命令为
    #codebox("particle dust{color:[1.0f,0.0f,0.0f],scale:1.0f}")
  ]
)
===== #proper-noun(display: "粉末颜色过渡选项（Dust color transition options）", "fen3 mo4 yan2 se4 guo4 du4 xuan3 xiang4")
`dust_color_transition` 粒子使用这种选项类型，可以指定颜色的渐变。
#tree(
  (0, [#icon("nbt-compound") 粒子选项]),
  (1, [#icon("nbt-int")#icon("nbt-list") *#underline[from_color]*: 起始粒子颜色，可以用 #icon("nbt-int") 整型指定RGB颜色，对二进制而言，每八位表示一个通道，从高到低依次为R、G、B通道。也可以用 #icon("nbt-list") 列表分别指定每个通道。游戏在存储时一律存储为 #icon("nbt-int") 整型。]),
  (2, [*若使用 #icon("nbt-list") 列表形式，则包含以下字段：*], false),
  (2, [#icon("nbt-float") R通道分量，表示红色值。]),
  (2, [#icon("nbt-float") G通道分量，表示绿色值。]),
  (2, [#icon("nbt-float") B通道分量，表示蓝色值。]),
  (1, [#icon("nbt-int")#icon("nbt-list") *#underline[to_color]*: 目标粒子颜色，可以用 #icon("nbt-int") 整型指定RGB颜色，对二进制而言，每八位表示一个通道，从高到低依次为R、G、B通道。也可以用 #icon("nbt-list") 列表分别指定每个通道。游戏在存储时一律存储为 #icon("nbt-int") 整型。]),
  (2, [*若使用 #icon("nbt-list") 列表形式，则包含以下字段：*], false),
  (2, [#icon("nbt-float") R通道分量，表示红色值。]),
  (2, [#icon("nbt-float") G通道分量，表示绿色值。]),
  (2, [#icon("nbt-float") B通道分量，表示蓝色值。]),
  (1, [#icon("nbt-float") *scale*: 该粒子的大小，有效值区间为$[0.01,4]$。粒子的寿命为8到40 gt的随机时长乘以此值。])
)
#example(
  [生成一个由正红色（RGB值：255，0，0）变换至正蓝色（RGB值：0，0，255）、大小为1的粉末粒子。],
  [
    命令为
    #codebox("particle dust_color_transition{from_color:[1.0f,0.0f,0.0f],scale:1.0f,to_color:[0.0f,0.0f,1.0f]}")
  ]
)
===== #proper-noun(display: "物品粒子选项（Item particle option）", "wu4 pin3 li4 zi3 xuan3 xiang4")
`item` 粒子使用这种选项类型，是物品碎片，字段为：
#tree(
  (0, [#icon("nbt-compound") 粒子选项]),
  (1, [#icon("nbt-string")#icon("nbt-compound") *#underline[item]*: 一个物品堆叠。可以使用 #icon("nbt-string") 字符串形式指定物品的命名空间ID，此时默认物品的堆叠数为1，使用默认组件。也可以使用 #icon("nbt-compound") 复合标签形式以指定完整的堆叠数据。]),
  (2, [*若使用 #icon("nbt-compound") 复合标签形式，则有以下字段：*], false),
  (2, [#icon("nbt-string") *#underline[id]*: 物品的命名空间ID。]),
  (2, [#icon("nbt-compound") *components*: 物品的数据组件。]),
  (3, [*\<数据组件>*: 一项数据组件]),
  (3, [*!\<数据组件>*: 一项需要被移除的数据组件。]),
  (2, [#icon("nbt-int") *count*: 该物品堆叠的数量，是介于1到该物品最大堆叠数（含）的值，不会大于99。])
)
#example(
  [生成苹果的物品粒子。],
  [
    命令为
    #codebox("particle item{item:\"minecraft:apple\"}")
    #h(-2em)或
    #codebox("particle item{item:{id:\"minecraft:apple\"}}")
  ]
)
===== #proper-noun("Power particle option")
`dragon_breath` 粒子使用这种选项类型，可指定速度，字段为：
#tree(
  (0, [#icon("nbt-compound") 粒子选项]),
  (1, [#icon("nbt-float") *power*: 粒子的速度，默认为 `1.0f`。])
)
===== #proper-noun(display: "幽匿块充能粒子选项（Sculk charge particle options）", "you1 ni4 kuai4 chong1 neng2 li4 zi3 xuan3 xiang4")
`sculk_charge` 粒子使用这种选项类型，可指定粒子在摄像机尺度下的显示角度，字段为：
#tree(
  (0, [#icon("nbt-compound") 粒子选项]),
  (1, [#icon("nbt-float") *#underline[roll]*: 该粒子显示的角度，使用*弧度制*。])
)
===== #proper-noun(display: "尖啸粒子选项（Shriek particle option）", "jian1 xiao4 li4 zi3 xuan3 xiang4")
`shriek` 粒子使用这种选项类型，可指定粒子延迟出现的时间，字段为：
#tree(
  (0, [#icon("nbt-compound") 粒子选项]),
  (1, [#icon("nbt-float") *#underline[delay]*: 该粒子延迟的时长，单位为*秒*。])
)
===== #proper-noun(display: "药水粒子选项（Spell particle option）", "yao4 shui3 li4 zi3 xuan3 xiang4")
以下粒子类型使用药水粒子选项：

`effect`：喷溅药水、滞留药水、附魔之瓶破碎时产生的粒子。

`instant_effect`：喷溅型或滞留型的治疗药水或伤害药水破碎时产生的粒子。

药水粒子选项使用以下的字段：
#tree(
  (0, [#icon("nbt-compound") 粒子选项]),
  (1, [#icon("nbt-int")#icon("nbt-list") *color*: 粒子颜色，可以用 #icon("nbt-int") 整型指定RGB颜色，对二进制而言，每八位表示一个通道，从高到低依次为R、G、B通道。也可以用 #icon("nbt-list") 列表分别指定每个通道。游戏在存储时一律存储为 #icon("nbt-int") 整型。]),
  (2, [*若使用 #icon("nbt-list") 列表形式，则包含以下字段：*], false),
  (2, [#icon("nbt-float") R通道分量，表示红色值。]),
  (2, [#icon("nbt-float") G通道分量，表示绿色值。]),
  (2, [#icon("nbt-float") B通道分量，表示蓝色值。]),
  (1, [#icon("nbt-float") *power*: 粒子的速度，默认为 `1.0f`。])
)
===== #proper-noun(display: "目标颜色粒子选项（Target color particle option）", "mu4 biao1 yan2 se4 li4 zi3 xuan3 xiang4")
`trail` 粒子使用这种选项类型，可指定粒子移动的目标位置，在移动过程中还会出现尾迹，字段为：
#tree(
  (0, [#icon("nbt-compound") 粒子选项]),
  (1, [#icon("nbt-int")#icon("nbt-list") *#underline[color]*: 粒子颜色，可以用 #icon("nbt-int") 整型指定RGB颜色，对二进制而言，每八位表示一个通道，从高到低依次为A、R、G、B通道。也可以用 #icon("nbt-list") 列表分别指定每个通道。游戏在存储时一律存储为 #icon("nbt-int") 整型。]),
  (2, [*若使用 #icon("nbt-list") 列表形式，则包含以下字段：*], false),
  (2, [#icon("nbt-float") R通道分量，表示红色值。]),
  (2, [#icon("nbt-float") G通道分量，表示绿色值。]),
  (2, [#icon("nbt-float") B通道分量，表示蓝色值。]),
  (2, [#icon("nbt-float") A通道分量，表示透明度。]),
  (1, [#icon("nbt-int") *#underline[duration]*: 粒子移动到目标位置所需的时间，单位为*游戏刻*。]),
  (1, [#icon("nbt-list") *#underline[target]*: 粒子的目标位置，需要是一个坐标。列表内为三个双精度浮点数，依次为$x$、$y$、$z$坐标。])
)
===== #proper-noun(display: "振动粒子选项（Vibration particle option）", "zhen4 dong4 li4 zi3 xuan3 xiang4")
`vibration` 粒子使用这种选项类型，可指定粒子移动的目标位置，字段为：
#tree(
  (0, [#icon("nbt-compound") 粒子选项]),
  (1, [#icon("nbt-int") *#underline[arrival_in_ticks]*: 粒子移动的时间，单位为*游戏刻*。]),
  (1, [#icon("nbt-compound") *#underline[destination]*: 粒子移动的终点位置。]),
  (2, [#icon("nbt-string") *type*: 终点位置的类型，可用值 `block`（方块源）和 `entity`（实体源）。#footnote[当前 `entity` 实体源不可用。]]),
  (2, [*若 #icon("nbt-string") `type` 值为 `block`，则有以下字段：*], false),
  (2, [#icon("nbt-list") *#underline[pos]*: 包含3个整数的列表，依次为$x$、$y$、$z$坐标，用于表示粒子移动终点位置的方块坐标。]),
  (2, [*若 #icon("nbt-string") `type` 值为 `entity`，则有以下字段：*], false),
  (2, [#icon("nbt-list") *#underline[source_entity]*: 目标实体的UUID。]),
  (2, [#icon("nbt-float") *y_offset*: 相对于实体脚部的$y$方向的偏移，默认为 `0.0f`。])
)
#example(
  [显示一个从初始位置移动到(0,70,0)、耗时100gt的 `vibration` 粒子],
  [
    命令为
    #codebox("particle vibration{destination:{type:\"block\",pos:[0,70,0]},arrival_in_ticks:100}")
  ]
)
== 教程：NBT Studio的使用 \*
游戏中的命令只能访问方块实体、实体和命令存储的数据，对于其他的一些存档数据，就需要使用第三方辅助程序来修改。#icon("nbtstudio") NBT Studio是一款图形化的NBT编辑程序，能用于自由查询、编辑各NBT文件中的数据。从网址 https://github.com/tryashtar/nbt-studio 选择合适的版本下载后，按照指引选择合适的文件夹安装程序。#icon("nbtstudio") NBT Studio不必安装在游戏文件夹中，任意文件夹均是可接受的。

程序下载安装完毕后，找到 `NBTStudio.exe`，打开程序，选择File → Open File或Open Folder。或者对任意的 `.dat` 或 `.nbt` 文件选择打开方式，使用 #icon("nbtstudio") NBT Studio打开。从窗口可以完整地看到每一个文件夹的结构和NBT文件的结构，这些结构都是树形的。#icon("nbtstudio") NBT Studio显示了完整的数据树，读者可以从这些数据数上查询所有的标签。

@fig:nbtstudio_interface 为 #icon("nbtstudio") NBT Studio的界面，从上往下依次为四个选项卡（File、Edit、Search和Help）、工具栏和操作界面。
#figure(
  caption: "NBT Studio的界面",
  image("图片/NBT Studio的界面.png", width: 30em)
) <fig:nbtstudio_interface>
#icon("nbtstudio") NBT Studio提供的工具分布在四个选项卡和工具栏中，选项卡中的大部分功能都被移植到工具栏上了，因此可以直接在工具栏上选择我们需要的工具。在操作界面选中标签后，可以由这些工具进行编辑。下面对工具栏中各工具的用途作逐一介绍：
#param-desc(
  prefix: "",
  [#icon("nbtstudio-new_file")], [创建新文件。],
  [#icon("nbtstudio-open_file")], [打开已有文件。],
  [#icon("nbtstudio-open_folder")], [打开已有文件夹。],
  [#icon("nbtstudio-save")], [存储当前对数据做出的修改，数据修改完成后一定要记得保存。],
  [#icon("nbtstudio-refresh")], [刷新数据。若 #icon("nbtstudio") NBT Studio运行的过程中游戏对数据做出了修改，则可以使用这个工具刷新在 #icon("nbtstudio") NBT Studio显示的数据。],
  [#icon("nbtstudio-cut")], [剪切一个标签。],
  [#icon("nbtstudio-copy")], [复制一个标签。],
  [#icon("nbtstudio-paste")], [粘贴一个标签。],
  [#icon("nbtstudio-rename")], [对选定标签的标签名进行重命名。],
  [#icon("nbtstudio-edit")], [对选定标签的数据进行修改，双击一个标签也可以对其数据进行修改。],
  [#icon("nbtstudio-edit_snbt")], [以SNBT的形式编辑标签。],
  [#icon("nbtstudio-delete")], [删除选定的标签。],
  [#icon("nbtstudio-sort")], [在视图中对各标签做首字母排序，不会影响标签存储的数据。],
  [#icon("nbt-byte")#icon("nbt-short")#icon("nbt-int")#icon("nbt-long")#icon("nbt-float")#icon("nbt-double")#icon("nbt-string")#icon("nbt-byte_array")#icon("nbt-int_array")#icon("nbt-long_array")#icon("nbt-compound")#icon("nbt-list")], [添加一个特定数据类型的标签。],
  [#icon("nbtstudio-add_snbt")], [以SNBT的形式添加标签。],
  [#icon("nbtstudio-search")], [#h(-2em)搜索特定的标签，其对话框如下图所示：#figure(caption: "Find对话框",image("图片/Find对话框.png",width:80%))#h(-2em)在对话框中输入想要查询标签的标签名或数据，就会在页面中显示目标标签的位置。如果满足要求的标签不止一个，则可以再次点击Find Previous、Find Next或Find All以搜寻前一个、后一个或所有匹配的标签。勾选Regex为启用正则表达式的搜寻方法。]
)
以下是使用 #icon("nbtstudio") NBT Studio修改数据的一个例子：

制作冒险地图的时候，为了给地图添加点缀，一些作者会选择在地图的名称上做一些花样。点击进入单人游戏，可以看到一个存档是这样显示的：
#figure(
  caption: "",
  image("图片/NBT Studio例子.png", width: 25em)
)
最上方的白色文本是这个存档的存档名称，它存储在 #icon("nbt") `level.dat` 中的字段 #icon("nbt-string") `LevelName`。第二行的灰色文本是存档文件夹的名称和最后一次修改文件夹（即对游玩该存档）的时间。存档名称和存档文件夹名称都是可以修改、添加样式的。其中对文件夹名称的修改不需要使用第三方程序，只要在游戏文件中直接修改文件夹名称。存档名称、最后一次游戏进行的时间都可以借助 #icon("nbtstudio") NBT Studio修改。下面是实现步骤：

首先在 #icon("nbtstudio") NBT Studio中打开相应的存档，找到文件 #icon("nbt") `level.dat`，展开其数据树，找到 #icon("nbt-long") `LastPlayed` 和 #icon("nbt-string") `LevelName` 这两个标签，它们分别存储了最后一次游戏进行的Unix时间戳和存档名称。具体的数据格式已于节@sec:saves 中列出。
#figure(
  caption: "",
  image("图片/NBT Studio例子2.png", width: 30em)
)
接下来修改存档名称，使之模糊化，并将最后一次游戏进行的时间修改为1970年1月1日8:00（UTC+8），使之贴合该冒险地图的主题。直接在数据树中双击这两个标签或点击工具栏中的 #icon("nbtstudio-edit")，将 #icon("nbt-long") `LastPlayed` 的值修改为 `0l`，将 #icon("nbt-string") `LevelName` 的值修改为带格式化代码的文本，使用@tab:formatting_code 中的 `§k` 进行模糊化字体，值为 `§kBackrooms地图测试`。如此便操作完成了。下面进入游戏中查看，可以看到修改后的结果如@fig:nbtstudio_example_3 所示。
#figure(
  caption: "",
  image("图片/NBT Studio例子3.png", width: 25em)
) <fig:nbtstudio_example_3>
#heading(level: 2, numbering: none, [第六章思考题与习题])
+ 分别计算下列二维坐标所在的相对区块坐标、绝对区块坐标和区域坐标。
  + $(1375,-688)$
  + $(201,330)$
  + $(-13,832)$
  + $(-3250,-94)$
+ 尝试编写一个简短的教程帮助想要下载冒险地图的玩家将存档安装到他们的游戏上。
+ \*一个成就JSON文件内容如下所示，从中可以获取到什么信息？
  #codefile(
    lang: "json",
    title: "654c6848-d79d-4e07-bbf4-0a88e65a57ef.json",
    "{
  \"minecraft:recipes/decorations/crafting_table\": {
    \"criteria\": {
      \"unlock_right_away\": \"2025-01-02 19:19:39 +0800\"
    },
    \"done\": true
  },
  \"DataVersion\": 4189
}"
  )
+ 尝试赋予玩家 `Waterman12345` 总量为43267的经验值。
+ 编写命令以获取范围在0和99之间（含）的随机数。
+ 回答下列问题。
  + 创建一个ID为 `main:a` 的Boss栏，显示名称为粗体、黄色的#text_component(text(fill: yellow, weight: "bold")[A])；
  + 将 `main:a` 的最大值设为200、当前值设为180，写出需要的命令；
  + 先将 `main:a` 的最大值设为150，再输入下面的命令：
    #codebox("bossbar get main:a value")
    写出该命令返回的值。
+ 下界的区块数据存储于什么文件夹内？
+ 自定义维度 `the_backrooms:level_0` 的区块数据存储于什么文件夹内？
+ \*假设坐标$(3370,-662)$处生成了大量实体导致游戏崩溃，现需要使用 #icon("nbtstudio") NBT Studio删除这个区块内的所有实体，则需要找到哪个文件？
+ 给出下列方块坐标，分别求存储该方块的数据的Anvil文件名、方块所在的区块标签名和方块在区段内的局部坐标。
  + $(8327,23,2194)$
  + $(-1399,-23,214)$
  + $(3985,300,-18560)$
  + $(0,0,0)$
+ 使用命令放置一个4级信标，其主效果为速度，辅助效果为生命恢复。
+ 对于一个条件制约、保持开启的脉冲型命令方块（该方块位于$(0,56,0)$）：
  + 更改该位置的命令方块为不受制约、红石控制。
  + 为该命令方块添加控制台命令：
    #codebox([tellraw \@a {text:\"test\",click_event:{action:\"run_command\",command:'tellraw \@a {text:\"Hello World!\",color:\"#color_block(red)red\"}'}}])
+ 放置一个结构方块，使其GUI如@fig:chapter_6_exercise_structure_block 所示。
  #figure(
    caption: "",
    image("图片/第六章思考题与习题结构方块.png", width: 28em)
  ) <fig:chapter_6_exercise_structure_block>
+ 生成一个尺寸值为7的超大型史莱姆。
+ 生成一个“僵尸堆”，使得一个僵尸骑在下面的僵尸身上，下面的僵尸又骑在它下面的僵尸身上，要求“僵尸堆”一共有5只僵尸。
+ 生成一个闪电苦力怕，使它的爆炸半径变为40，并且爆炸计时缩短为1 gt，即“立即爆炸”。
+ 生成一个不会在主世界转化为僵尸猪灵的猪灵。
+ 生成一个幻术师，使之一次攻击可以造成20点伤害，且每5秒钟释放一次法术。
+ 使位于坐标$(0,70,0)$的石头方块变成下落的方块后对下方的实体造成的伤害与铁砧相同。
+ 生成一个盔甲架，使之呈现走路的姿势，并且右手持有一个红石火把，该部位不能与玩家产生任何互动。
+ 生成一个掉落物形式的钻石，使其拥有自定义名称只有合适的玩家才能捡起这个钻石，并设定UUID为 `[I;123456789,123456789,123456789,123456789]` 的玩家才能捡起该钻石，在钻石被捡起之前该钻石不会自行消失。
+ 生成一个名为 #text_component([奸商])的村民，要求其职业为农民，交易项中有一项为用64个绿宝石交换1个土块，土块名称为奸商的土块。
+ 对于手持钻石的所有玩家，删除其物品栏中的所有钻石。
+ 将一面灾厄旗帜戴到附近玩家的头上。
+ 给予当前玩家一个村民刷怪蛋，使用该刷怪蛋时生成一个苦力怕。
+ 生成@exa:item_frame 的物品展示框，其中的铁镐拥有@exa:can_break_and_can_place_on 第@enu:unbreakable_iron_pickaxe 小题的物品数据。
+ 设计一串命令，使得玩家物品存储槽位编号 `9` \~ `35` 的物品按顺序存储在位于$(0,56,0)$的箱子的 `0` \~ `26` 号槽位中。
+ 判断下列与属性有关的说法是否正确。
  + 在任何情况下，属性的值属性基值属性修饰符的值。
  + 属性的基值不能被修改，只能通过修饰符更改属性的值。
  + 使用修饰符对属性的值进行修改时，属性的基值也一定会被更改。
  + 如果属性的最终值和基值相同，则该属性一定没有添加修饰符。
+ 按要求写出下列命令：
  + 为所有的僵尸修改属性：将它们设置为完全抵抗击退。 <enu:zombie_attribute>
  + 直接生成具有第@enu:zombie_attribute 小题所指定属性的僵尸。
+ 一个属性的基值为2，已知该属性拥有修饰量分别为4和6的两个属性增量修饰符，修饰量为0.4的一个倍率增量修饰符和两个修饰量分别为7和0.2的最终倍乘修饰符，求该属性的最终值。
+ 设计一套锁链盔甲，使头盔提供3点护甲值、1点盔甲韧性；胸甲提供7点护甲值、2点盔甲韧性；护腿提供6点护甲值、2点盔甲韧性；靴子提供3点护甲值、1点盔甲韧性。
+ 制作一个如图所示的绕西北方向的轴旋转$180 degree$的方块展示实体，展示内容为海晶灯。要求2秒内完成旋转。
  #figure(
    caption: "",
    image("图片/展示实体习题1.png", width: 4em)
  )
  + 生成该实体，使其位置正好贴合方块坐标为$(0,70,0)$的方块。写出NBT中不含仿射变换和插值的命令。
  + 求需要的仿射矩阵和定义插值时长所需字段 #icon("nbt-int") `interpolation_duration` 的值。
+ 如图所示是一个方块展示实体在$x O z$平面上的投影，虚线表示该展示实体原先的投影，经仿射变换后的大小、形状、位置如实线所示。该方块实体在$y$轴方向不做任何变换。
  #figure(
    caption: "",
    image("图片/展示实体习题2.png", width: 20em)
  )
  + 求所需的仿射矩阵。
  + 以分解形式写出对应的 #icon("nbt-compound") `transformation` 字段。
+ 用命令 `/data` 修改一块告示牌上第一行的文本，使正面的文本为#text_component([\"\\Hello World\\\"])。 <enu:chapter_6_sign_text>
+ 用命令 `/give` 将第@enu:chapter_6_sign_text 题中修改文本后的告示牌放入附近玩家的物品栏。
+ 用命令 `/give` 给予附近的玩家一本由 `B` 写的名为 `A` 的成书，书中第一页内容与第@enu:chapter_6_sign_text 题修改后的告示牌第二行内容相同。
+ 给予所有玩家一个村民刷怪蛋，要求这个村民刷怪蛋：
  + 拥有自定义名称#text_component([MMD召唤物])；
  + 能够被放置在钻石块和下界合金块上；
  + 使用时召唤一只僵尸，使其拥有自定义名称#text_component([MMD召唤物])，该实体的主手持有一把石斧，石斧名称为#text_component([MMD的石斧])。
+ 已知位于$(0,56,0)$的箱子中有一颗被命名为#text_component([money])的金粒，金粒在箱子中的槽位未知，在不打开箱子的情况下，将金粒的自定义名称更改为#text_component([coin])。
+ \*已知玩家 `Mu_xian` 在存档新的世界中已观看过终末之诗一次，为了使 `Mu_xian` 能够在该存档内再次观看终末之诗，使用 #icon("nbtstudio") NBT Studio给出解决办法。
+ 参考@fig:particle_example，设计该粒子效果。
+ 当玩家与一些容器类方块进行交互、将物品放置在这些容器内时需要先打开它们的UI，可能比较繁琐。现在不妨考虑如何让玩家减少打开UI这一操作，使得玩家手持相应物品时可以将手中的物品直接存入容器。如图所示是熔炉去UI化的示意图，熔炉的正面有一个拥有记分板标签 `item` 的交互实体。玩家以 `@p` 指代，需要操作的熔炉位于$(-60,56,92)$，尝试以命令方块电路或数据包函数的方式编写以下所需的命令：
  #figure(
    caption: "",
    image("图片/熔炉去UI化.png", width: 8em)
  )
  + 当玩家手持物品与该交互实体产生交互时，会将玩家手持物品的所有数据存入熔炉的被烧炼物品栏位，并去除玩家原本手持的物品。
  + 当熔炉内原本有物品时，若此时玩家手持物品与该交互实体产生交互，则将熔炉内物品弹出为掉落物，将玩家的手持物品存入熔炉的被烧炼物品栏位。
= 记分板
你可能会在服务器的小游戏中看到这些内容，这样大家就可以在比赛中拿到他们的分数了。不可否认的是，记分板确实是命令系统的重要内容，数据的统计、处理完全依靠它。
#pagebreak()
== 队伍与标签<sec:team_and_tag>
在正式开始讲解本章重点内容之前，读者需要先了解两个概念——“队伍”和“记分板标签”。
=== 队伍<subsec:team>
对于空间内一定数量的实体，可以使用#proper-noun(display:"队伍（Team）", "dui4 wu3")将这些实体分组。把实体添加到不同的队伍后，就可以对这些实体进行分组管理，比如对同一个队伍的实体施加统一的效果或用记分板统计它们的分数。队伍对于服务器小游戏来说几乎是必要的，尤其在竞技类的游戏中发挥非常重要的作用。
==== 队伍的性质
一个队伍拥有以下基本属性：
+ 名称：队伍在游戏中的内部名称，相当于ID，用于区分队伍。队伍的名称*不可重复*，一个队伍名称只能用于指定特定的队伍。
+ 显示名称：队伍显示的名称，是一个文本组件，可以指定样式。队伍的显示名称是可选的，不同的队伍允许拥有相同的显示名称。如果一个队伍没有显示名称，则使用名称作为它的显示名称。本教程使用和游戏一致的方式标记一个队伍：若一个队伍名称为 `A`、显示名称为 `B`，则记这个队伍为队伍 `[B]`；若一个队伍名称为 `A` 而没有显示名称，则记这个队伍为队伍 `[A]`。
+ 成员：队伍中的实体。

\

队伍拥有以下性质：
+ 队伍的成员不是固定的，可以任意为队伍添加成员或从队伍中移除成员。
+ 一个实体只能存在于一个队伍中。
+ 处于同一个队伍中的成员与成员之间不会有仇恨，而会对其他队伍中有自然仇恨的成员发动攻击。
对于第3点，这里举一个例子作为对它的解释：假设队伍 `[A]` 中有一个卫道士和一个村民，队伍 `[B]` 中也有一个卫道士和村民。则队伍 `[A]` 中的卫道士会对队伍 `[B]` 中的村民发动攻击，而不会对同一队伍中的村民发动攻击；同时队伍 `[B]` 中的卫道士会对队伍 `[A]` 中的村民发动攻击，而不会对同一队伍中的村民发动攻击。但是卫道士和卫道士之间、村民和村民之间没有自然仇恨，故处于不同队伍的卫道士不会相互攻击，村民也是如此。
==== 管理队伍的命令
命令 `/team` 是用于管理队伍的命令，它包括了添加或删除队伍、为队伍添加或删除成员、编辑队伍等功能。它需要的权限等级为2，以下是所有用法。#index(index: "command", "team")
===== 添加新队伍，语法为
#codebox("team add <team> [<displayName>]")
#param-desc(
  [`<team>`（字符串 `brigadier:string`）], [参数指定队伍的名称，必须为单个词，允许使用的字符有：数字 `0123456789`、小写字母 `abcdefghijklmnopqrstuvwxyz`、大写字母`ABCDEFGHIJKLMNOPQRSTUVWXYZ`、下划线 `_`、连字符 `-`、加号 `+` 和点 `.`。],
  [`[<displayName>]`（文本组件 `minecraft:component`）], [可选，指定队伍的显示名称，必须为文本组件。]
)
===== 删除队伍，语法为
#codebox("team remove <team>")
删除队伍后，队伍中的所有成员都会被从这个队伍中踢出。
===== 使成员加入队伍，语法为
#codebox("team join <team> [<members>]")
#param-desc(
  [`[<members>]`（分数持有者 `minecraft:score_holder`）], [可以是玩家名、UUID或目标选择器，也可以是 `*` 以指定所有正在被追踪的实体。如果不指定，则使命令执行者本身加入指定队伍。]
)
===== 使成员离开其所在的队伍，语法为
#codebox("team leave <members>")
===== 列出所有的队伍或队伍中的成员，语法为
#codebox("team list [<team>]")
#param-desc(
  [`[<team>]`（字符串 `brigadier:string`）], [若指定了该参数，则返回该队伍中所有的成员；不指定则返回所有存在的队伍。]
)
===== 清空队伍，即使所有成员离开队伍，语法为
#codebox("team empty <team>")
===== 编辑队伍，语法为
#codebox("team modify <team> <option> <value>")
下表列出了所有可用的 `<option>` 和它对应的 `<value>`：
#general-table(
  caption: "队伍属性表",
  colspan: 4,
  columns: (auto, auto, 7em, auto),
  header: (text(black)[`<option>`], [说明], [该 #text(black)[`<option>`] 可用的 #text(black)[`<value>`]], [说明]),
  table.cell(rowspan: 4)[`collisionRule`#footnote[事实上，队伍间碰撞和队伍内碰撞的效果是完全相反的，也就是启用队伍间碰撞 `pushOtherTeams` 时允许推动同队的成员而无法推动其他队伍的成员；启用队伍内碰撞 `pushOwnTeam` 时允许推动其他队伍的成员而无法推动同队的成员。这个BUG至今未被修复，参见#link("https://bugs.mojang.com/browse/MC/issues/MC-87984")[MC-87984]。]], table.cell(rowspan: 4)[碰撞选项，决定队伍内的成员可以推动的实体。], [`always`], [队伍中的玩家可以推动任何实体。],
  [`never`], [队伍中的玩家不能推动任何的实体。],
  [`pushOtherTeams`], [理论上开启队伍间碰撞，即允许推动其他队伍的成员而无法推动同队的成员。根据#link("https://bugs.mojang.com/browse/MC/issues/MC-87984")[MC-87984]，它的效果实际上为队伍内碰撞。],
  [`pushOwnTeam`], [理论上开启队伍内碰撞，即允许推动同队的成员而无法推动其他队伍的成员。根据#link("https://bugs.mojang.com/browse/MC/issues/MC-87984")[MC-87984]，它的效果实际上为队伍间碰撞。],
  [`color`], [决定队伍名称（注意不是显示名称）和队伍内成员的名称在聊天栏等处显示的颜色和队伍内成员发光效果的轮廓颜色。该选项不会改变队伍显示名称的颜色。	], [`<value>`], [包含十七个值：`aqua`、`black`、`blue`、`dark_aqua`、`dark_blue`、`dark_gray`、`dark_green`、`dark_purple`、`dark_red`、`gold`、`gray`、`green`、`light_purple`、`red`、`reset`、`yellow` 和 `white`。],
  table.cell(rowspan: 4)[`deathMessageVisibility`], table.cell(rowspan: 4)[决定何者可以看到队伍中玩家的死亡信息。], [`always`], [所有玩家都可以看到。],
  [`never`], [没有玩家可以看到。],
  [`hideForOtherTeams`], [对其他队伍的玩家隐藏。],
  [`hideForOwnTeam`], [对同队玩家隐藏。],
  [`displayName`], [队伍的显示名称。], [`<displayName>`], [一段文本组件。],
  table.cell(rowspan: 2)[`friendlyFire`], table.cell(rowspan: 2)[决定队伍中的玩家是否能相互伤害。], [`true`], [即使为 `true`，具有自然仇恨的生物也不会对同队的其他生物发动攻击。],
  [`false`], [],
  table.cell(rowspan: 4)[`nametagVisibility`], table.cell(rowspan: 4)[决定何者可以看到队伍中玩家头上的名字和标签。], [`always`], [所有玩家都可以看到。],
  [`never`], [没有玩家可以看到。],
  [`hideForOtherTeams`], [对其他队伍的玩家隐藏。],
  [`hideForOwnTeam`], [对同队玩家隐藏。],
  [`prefix`], [在队伍中玩家名称的前面显示的前缀。], [`<perfix>`], [一段文本组件。],
  table.cell(rowspan: 2)[`seeFriendlyInvisibles`], table.cell(rowspan: 2)[决定玩家是否可以看到同个队伍中隐形的玩家。], [`true`], [],
  [`false`], [],
  [`suffix`], [在队伍中玩家名称的后面显示的后缀。], [`<suffix>`], [一段文本组件。]
)
例如，#text_component(text(green)[[B组] #text(blue)[Mu_xian]#text(yellow)[ -lvl:10]])是聊天栏中一个名为 `Mu_xian` 的玩家显示的名称，其中#text_component(text(green)[B组])（末尾有空格）是前缀，#text_component(text(yellow)[ -lvl:10])（前端有空格）是后缀。由这个玩家的名称颜色可知，该玩家所在队伍的队伍颜色为蓝色，前缀的文本组件为 `{text:"[B组] ",color:"green"}`，后缀的文本组件为 `{text:" -lvl:10",color:"yellow"}`。
#index(index: "method", display: "关闭玩家之间的实体碰撞", "guan1 bi4 wan2 jia1 zhi1 jian1 de shi2 ti3 peng4 zhuang4")
#example(
  [关闭所有玩家之间的实体碰撞。],
  [
    当前版本暂时没有直接关闭实体碰撞的游戏规则，因此需要使用队伍系统的功能。首先任意添加一个队伍：
    #codebox("team add turn_off_collision")
    让所有玩家加入这个队伍：
    #codebox("team join turn_off_collision @a")
    随后关闭这个队伍的碰撞：
    #codebox("team modify turn_off_collision collisionRule never")
  ]
)
==== 队伍NBT格式 \*
标签 #icon("nbt-list") `Teams` 用于存储队伍信息，它是一个复合标签的列表。这个标签位于文件 #icon("nbt") `saves > <存档名称> > data > minecraft > scoreboard.dat` 中，列表 #icon("nbt-list") `Teams` 中的每一个复合标签都存储了一个队伍的信息。以下是队伍数据的结构：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *data*]),
  (2, [#icon("nbt-list") *Teams*: 存储所有队伍的信息。]),
  (3, [#icon("nbt-compound") 一个队伍。]),
  (4, [#icon("nbt-bool") *AllowFriendlyFire*: 队伍中的玩家是否能相互伤害。]),
  (4, [#icon("nbt-string") *CollisionRule*: 碰撞规则，有效值 `always`、`never`、`pushOtherTeams`、`pushOwnTeam`。]),
  (4, [#icon("nbt-string") *DeathMessageVisibility*: 决定何者可以看到队伍中玩家的死亡信息，有效值 `always`、`never`、`hideForOtherTeams`、`hideForOwnTeam`。]),
  (4, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *DisplayName*: 队伍的显示名称，为一个文本组件。]),
  (4, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *MemberNamePrefix*: 显示名称前缀，为一个文本组件。]),
  (4, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *MemberNameSuffix*: 显示名称后缀，为一个文本组件。]),
  (4, [#icon("nbt-string") *Name*: 队伍名称。]),
  (4, [#icon("nbt-string") *NameTagVisibility*: 决定何者可以看到队伍中玩家头上的名字和标签。有效值 `always`、`never`、`hideForOtherTeams`、`hideForOwnTeam`。]),
  (4, [#icon("nbt-list") *Players*: 队伍成员。]),
  (5, [#icon("nbt-string") 一个队伍成员，若为带名称的实体则使用该实体的名称，若为不带名称的实体则使用UUID。]),
  (4, [#icon("nbt-bool") *SeeFriendlyInvisibles*: 玩家是否可以看到同个队伍中隐形的玩家。]),
  (4, [#icon("nbt-string") *TeamColor*: 队伍颜色。])
)
=== 记分板标签
为了与数据包标签和NBT中标签的概念作区分，在记分板体系中使用的标签被称为#proper-noun(display: "记分板标签（Scoreboard tags）", "ji4 fen1 ban3 biao1 qian1")。记分板标签是一个字符串，只有标签名称，与NBT中的标签不同，它不需要定义数据类型。标签名称可以由大小写英文字母、数字、下划线 `_`、点 `.`、加号 `+` 或减号 `-` 构成。

记分板标签的主要作用是标记实体，当一个实体拥有一个记分板标签时，可以说这个实体被这个记分板标签所标记了。通过指定记分板标签可以很方便地指定到特定的实体。记分板标签主要被应用于目标选择器参数，如 `[tag=A]` 或 `[tag=!A]`，一般的思路可以是选择被标记过的或没有被标记过的实体。

一个实体可以拥有多个记分板标签，在目标选择器中指定有多个记分板标签的实体可以让选择的范围更小、选择更精确。一个实体的记分板标签的数量有上限，最大为1024。
==== 记分板标签命令
命令 `/tag` 用于处理实体的记分板标签，它需要的权限等级为2，以下是所有用法。#index(index: "command", "tag")
===== 为目标添加一个标签，语法为
#codebox("tag <targets> add <name>")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [指定的目标实体，必须为玩家名称、UUID或目标选择器。],
  [`<name>`（字符串 `brigadier:string`）], [要添加的标签。]
)
===== 从目标上移除一个记分板标签
#codebox("tag <targets> remove <name>")
===== 列出目标身上的所有记分板标签
#codebox("tag <targets> list")
==== 记分板标签NBT格式
记分板标签的实质是存储在实体数据中的字符串列表。以玩家格式为例，玩家的记分板标签存储在标签 #icon("nbt-list") `Tags` 中，它是玩家根标签  #icon("nbt-compound") `Player` 的子标签。数据结构为：
#tree(
  (0, [#icon("nbt-list") *Tags*]),
  (1, [#icon("nbt-string") 一个记分板标签。])
)
假设有一个实体的记分板标签NBT数据如下所示：
#codebox("{Tags:[\"a\",\"b\"]}")
#h(-2em)于是可以用目标选择器 `@e[tag=a]`、`@e[tag=b]` 或 `@a[tag=a,tag=b]` 对这个玩家进行选择，`@a[tag=!c]` 这个选择器也是可行的，但是 `@a[tag=!a]` 就不能用于选择这个玩家了。

使用命令 `/summon` 也可以生成带有记分板标签的实体，例如命令
#codebox("summon minecraft:zombie ~ ~ ~ {Tags:[\"a\",\"b\"]}")
#h(-2em)可生成一个带有记分板标签 `a` 和 `b` 的僵尸。
== 记分板的基本概念
上一章的内容主要是数据存储的方式。而对于数据的处理，例如统计和计算数据，则需要用到命令系统中一个非常重要的体系——#proper-noun(display: "记分板（Scoreboard）", "ji4 fen1 ban3")。记分板处理数据的原理是：*将数据通过命令转换为分数持有者的分数，对分数进行一定的处理后返回相应的数据。*

记分板的基本单位是#proper-noun(display: "记分项（Objective）", "ji4 fen1 xiang4")，而记分项中又含有记分项名称、记分项显示名称、准则等基本组成元素。对这些基本概念的讲解是本节的主要内容。
=== 记分项的基本属性
“记分项”概念的英文原文为Objective。那什么是“记分项”？先来举一个例子，假设教务处安排某本科专业的一个学期有高等数学A、理论力学B和大学物理C三门学科，则可以说，在该专业本学期这个“系统”中，存在高等数学A、理论力学B和大学物理C三个“记分项”。

一个记分板系统可以存在多个不同的记分项，正如上面的例子：有三门不同的学科，高等数学A、理论力学B和大学物理C是三个不同的记分项。观察这些记分项，不难发现，这些记分项都有自己的名称，即#proper-noun(display: "记分项名称（Objective's name）", "ji4 fen1 xiang4 ming2 cheng1")。记分项名称通常在系统内部使用，相当于记分项的“身份证”，其主要作用是区分不同的记分项，因此不同记分项的名称不能相同。记分项名称中允许包含大小写英文字母、数字、下划线 `_`、点 `.`、加号 `+` 或减号 `-`。

和队伍一样，记分项也有#proper-noun(display: "显示名称（Display name）", "xian3 shi4 ming2 cheng1")，记分项的显示名称不必存在，若不存在，则会使记分项名称作为默认的显示名称；若存在，则必须使用文本组件指定显示名称。和记分项名称不一样，不同记分项的显示名称可以有重复。和队伍的表示方法一样，规定若一个记分项的名称为 `A`、显示名称为 `B`，记这个记分项为记分项 `[B]`；若一个记分项的名称为 `A` 而没有显示名称，则记这个记分项为记分项 `[A]`。
=== 分数持有者及其分数
引用上面的例子：该专业本学期有高等数学A、理论力学B和大学物理C三门学科。现在有三个同学的考试成绩记录在教务系统中：同学1的高等数学A考了76分，理论力学B考了82分，而对于大学物理C申请了缓考，故该科暂时没有成绩；同学2的高等数学A考了85分，理论力学B考了90分，大学物理C考了81分；同学3的高等数学A考了62分，理论力学B考了71分，大学物理C考了83分。可以看到，除缓考外，每个同学在相应的学科中都取得了一定的成绩。在记分板系统中，称每一个在各学科中获得分数的同学为#proper-noun(display: "分数持有者（Score holder）", "fen1 shu4 chi2 you3 zhe3")。分数持有者能够在任意记分板中获得自身在该记分项上的#proper-noun(display: "分数（Score）", "fen1 shu3")，即分数持有者被该记分项追踪，也可以说该记分项对分数持有者进行追踪并记录其分数。

熟悉了这些概念后，可以不难列出如下所示的表格：
#general-table(
  caption: "",
  colspan: 4,
  columns: (auto, auto, auto, auto),
  header: ([记分项], [高等数学A], [理论力学B], [大学物理C]),
  [同学1], [76], [82], [],
  [同学2], [85], [90], [81],
  [同学3], [62], [71], [83]
)
从这张表格可以很清晰地看到记分项与分数持有者之间的关系。其中 `[高等数学A]` 这个记分项追踪了 `同学1`、`同学2` 和 `同学3` 三个分数持有者；而 `同学1` 这个分数持有者只被 `[高等数学A]` 和 `[理论力学B]` 两个记分项追踪，没有被记分项 `[大学物理C]` 所追踪，具体表现在 `同学1` 在记分项 `[大学物理C]` 上没有分数（注意没有分数不能等同于0分）。*任意一个分数持有者不一定被所有的记分项追踪，任意一个记分项也不一定追踪所有的分数持有者。若一个分数持有者不被某记分项追踪，则该分数持有者在此记分项上没有分数，该结论的逆命题同样成立。*

分数持有者记录的是玩家的玩家名称或其他实体的UUID。*当一个非玩家实体被清除时，其UUID也不复存在，故一个非玩家实体被杀死后，先前追踪它的记分项将不再对其进行追踪。但是对于玩家而言，无论其是否存活、是否存在于游戏中，记分项始终会追踪其分数，直到使用命令 `/scoreboard players reset` 重制分数持有者的分数。*

根据这个原理，读者可以任意设置一些玩家名称作为分数持有者使用，这些玩家名称所属的玩家甚至不必存在。一般称这类分数持有者的名称为#proper-noun(display: "假名（Fake name）", "jia3 ming2")。假名的使用在记分板系统中很常见，比如在上面的例子中，计算 `[高等数学A]`、`[理论力学B]` 和 `[大学物理C]` 三个记分项在三个分数持有者上的平均分，并存入分数持有者 `Ave` 中：
#general-table(
  caption: "",
  colspan: 4,
  columns: (auto, auto, auto, auto),
  header: ([记分项], [高等数学A], [理论力学B], [大学物理C]),
  [Ave], [74], [81], [82]
)
这里的计算方法先不讲。很明显 `Ave` 不是一个实际存在的同学名称，用记分板体系的表述方式为，分数持有者 `Ave` 指代的玩家不一定必须存在，但它依旧记录了一些数据。不过由于假名的实质是玩家名称，一旦拥有和假名相同名称的玩家进入游戏后，他的分数则会不可避免地受到影响。因此可以在假名前加一个 `#` 以作为假名和真实存在的玩家名称的区分。例如 `Ave` 和 `#Ave` 是两个完全不同的分数持有者，使用 `#Ave` 可以有效防止名为 `Ave` 的玩家的分数与假名分数持有者的分数起冲突。不过在社区中也有部分开发者会使用 `$` 作为假名前缀，如 `$Ave`。

分数持有者分数是*介于$-2147483648$和$2147483647$之间（含）的整数*，因此上述分数持有者 `Ave` 在记分项 `[高等数学A]` 上的分数并不严格等于三位同学的 `[高等数学A]` 分数的平均分，此处去除了实际平均分的小数部分。读者在制作记分板系统时，务必要注意分数的溢出情况。

接下来再说明一个特殊的机制：假设学校在期末考试过程中通过学生的学号识别每一个学生，无论该学生在试卷上填写的姓名为何。因此 `同学2` 在考 `[高等数学A]` 时将自己的名字填写为#text_component([高数有手就行])，在考 `[理论力学B]` 时将自己的名字填写为#text_component([理力有手就行])，在考 `[大学物理C]` 时将自己的名字填写为#text_component([大物有手就行])。因此产生了如下所示的成绩单：
#general-table(
  caption: "",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([分数持有者], [学科], [分数]),
  [高数有手就行], [高等数学A], [85],
  [理力有手就行], [理论力学B], [90],
  [大物有手就行], [大学物理C], [81]
)
但由于该同学的学号是固定的，因此这三门课的分数在教务系统中都被记录在同学2的名字下，但成绩公示后却显示了该同学在试卷上填写的自定义名字。而在记分板系统中，*分数持有者的显示名称是可以以文本组件的形式修改的，修改过后的显示名称不会影响分数持有者原本的名称和其他属性，只会在记分项经由显示区公示时展示。*

同学3在高等数学A一科仅得了62分，他觉得这个分数很低，因此在成绩单打印下来后，手动涂抹了这个分数，将这个分数改为了82。但是同学3记录在教务系统的高等数学A成绩必定为62，无论同学3纂改的分数为何。在记分板系统中，分数的数字格式也可以自由指定，游戏提供了以下三种类型的数字格式：
#param-desc(
  prefix: "",
  [`blank` ], [无论分数为何，均不显示分数。],
  [`fixed` ], [无论分数为何，均显式指定的内容，这些内容可以不一定是数字，也可以是其他文字，并使用这些内容的样式。一般使用文本组件定义显示的内容。没有分数的分数持有者会被赋予0分后再显示固定的文本。],
  [`styled`（在NBT数据中名为 `result`）], [修饰分数显示的样式，一般使用文本组件样式，不修改分数本身。]
)
*这些数字格式不会影响分数持有者原本的分数。*

教务处为突出高等数学A这一门课的重要性，在公示分数时将所有学生的高等数学A成绩标红显示，然而同学2不喜欢自己的分数使用红色的样式，因此他将成绩单上的分数样式改为了蓝色。反映到记分板系统中，*每一个记分项都有其默认的分数数字格式，若一个分数持有者没有其特定的分数数字格式，则显示为记分项默认的数字格式，否则使用分数持有者已有的数字格式。*注意，上述内容仍仅在渲染层面有意义，不会对分数持有者原本的分数造成影响。
=== 显示位置
记分项除了在记分板系统内部作为数据处理的工具外，还可以将数据显示出来。记分项所显示的位置，被称为#proper-noun(display: "显示位置（Display slot）", "xian3 shi4 wei4 zhi4")。一个显示位置最多只能显示一个记分项，但是一个记分项可以显示在不同的显示位置中。一旦记分项规定了显示位置，除非该记分项不复存在或该显示位置被规定显示了其他的记分项，则该记分项会一直显示在该显示位置中。显示位置一共有以下几种：
#general-table(
  caption: "显示位置",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([显示位置], [简介], [图例]),
  [`sidebar`（侧边栏）], [在屏幕的右侧显示。显示名称会显示在最上方。只会显示有分数的分数持有者的分数，若为玩家则显示玩家名，若为其他实体则显示UUID，带 `#` 号假名的分数不会出现在侧边栏。如果玩家不在线，其分数依然会被显示。], [#image("图片/显示位置侧边栏.png", width: 10em)],
  [`list`（列表）], [按住 `Tag` 键呼出。显示名称不会显示，仅显示分数。只显示在线玩家的分数。], [#image("图片/显示位置列表.png", width: 12em)],
  [`below_name`（名称下方）], [只在多人游戏中显示在玩家名称牌的下方，显示该玩家的分数。显示格式为 `<显示名称>:<分数>`。], [],
  [`siderbar.team.<颜色>`], [显示方式和侧边栏基本相同，但只有位于指定颜色队伍的玩家才可以看见拥有此颜色队伍中成员的分数。颜色一共有十六种不同的值，详见节@subsec:team。]
) <tab:tab:display_slot>
=== 准则
在上面的例子中，高等数学A、理论力学B和大学物理C这三门学科的分数是怎么得出的？在实际情况中，一门学科总评分数可能依据学生的平时表现，或是该生在期末考试中的成绩，又或者是两者的综合，比如平时成绩占40%、期末考试成绩占60%，这些便是对于一门学科总评分数的“判分依据”。对于每一个记分项，当它们追踪分数持有者并记录其分数时，一定需要一个判分依据，即记分项的#proper-noun(display: "准则（Criteria）", "zhun3 ze2")。准则的主要作用是*决定跟踪的分数持有者行为，并为记分项中分数的改变提供依据*。同时，对于一门学科而言，其判分依据必须是确切的、统一的，不能存在多个不同的判分依据，否则在分数的评定上会有非公平的、有冲突的后果。因此，在记分板系统中，*一个记分项必须拥有且只能拥有一种准则。*

根据准则名称的长度，可以将准则分为两类：单一准则和复合准则；如果根据记分项的分数能否被修改，则准则又可以分为*只读型准则*和*可修改型准则*。只读型准则是指：*记分项中分数的改变由系统中数据的改变而发生改变，无法对其进行修改；*可修改型准则是指可由命令修改的准则，一些可修改型准则只能由命令修改，一些可能受到系统内部数据的影响。下面使用单一准则和复合准则的分类方式，同时会说明每种准则是只读型或者是可修改型。
==== 单一准则
#proper-noun(display: "单一准则（Single criteria）", "dan1 yi1 zhun3 ze2")是较为简单的、准则名称只由单一字符串组成的准则。
#general-table(
  caption: "单一准则表",
  colspan: 3,
  columns: (auto, auto, auto),
  header: ([准则名], [简介], [类型]),
  [`dummy`], [虚拟型准则，分数只能由命令修改。被广泛应用于各种自定义的记分板中。], [可修改型],
  [`trigger`], [触发器，分数只能由命令修改。可使用命令 `/trigger` 对分数进行修改，具体内容见下一节触发器相关内容。], [可修改型],
  [`deathCount`], [死亡计数：玩家每死亡一次，分数自动加一。], [可修改型],
  [`playerKillCount`], [杀死玩家计数：每杀死其他玩家一次，分数自动加一。], [可修改型],
  [`totalKillCount`], [杀死生物计数：每杀死其他生物（包括玩家）一次，分数自动加一。], [可修改型],
  [`health`], [显示玩家的生命值。], [只读型],
  [`xp`], [显示玩家的经验值。], [只读型],
  [`level`], [显示玩家的经验等级。], [只读型],
  [`food`], [显示玩家的饥饿值。], [只读型],
  [`air`], [显示玩家的氧气值。], [只读型],
  [`armor`], [显示玩家的盔甲值。], [只读型]
) <tab:single_criteria>
==== 复合准则
#proper-noun(display: "复合准则（Compound criteria）", "fu4 he2 zhun3 ze2")是较为精细的、准则名称分成多个部分的准则。一个复合准则由基础准则和次级准则组成。所有的统计信息都可作为复合准则使用，格式见节@subsec:player_data 的@tab:stat 和@tab:custom_stat，其中统计大类为基础准则，统计细则为次级准则。

除统计信息外，另有如下表所示的复合准则，这些复合准则的基础准则和次级准则使用 `.` 隔开：
#general-table(
  caption: "复合准则表",
  colspan: 4,
  columns: (auto, auto, auto, auto),
  header: ([基础准则], [次级准则], [简介], [用例]),
  [`teamkill`], table.cell(rowspan: 2)[从下列参数中选择：`aqua`、`black`、`blue`、`dark_aqua`、`dark_blue`、`dark_gray`、`dark_green`、`dark_purple`、`dark_red`、`gold`、`gray`、`green`、`light_purple`、`red`、`yellow` 和 `white`。], [杀死指定颜色队伍中的一个玩家时，分数自动加一。], [`teamkill.aqua`],
  [`killedByTeam`], [被指定颜色队伍中的玩家杀死一次时，分数自动加一。], [`killedByTeam.aqua`]
) <tab:compound_criteria>
所有的复合准则都是可修改型准则。
#example(
  [自定义冒险地图的运作经常需要检测玩家使用胡萝卜钓竿的次数，常试写出所需的准则。],
  [
    胡萝卜钓竿使用次数是一项统计信息，参考@tab:stat，基础准则（统计大类）为 `minecraft.used`，次级准则（统计细则）为 `minecraft.carrot_on_a_stick`，因此复合准则为 `minecraft.used:minecraft.carrot_on_a_stick`。
    
  ]
)
=== 记分板NBT格式<subsec:scoreboard_data>
记分板的信息以NBT的格式存储在 #icon("nbt") `saves > <存档名称> > data > minecraft > scoreboard.dat` 中。其数据结构如下所示：
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, [#icon("nbt-compound") *#underline[data]*]),
  (2, [#icon("nbt-compound") *DisplaySlots*: 每个显示位置显示的记分项。]),
  (3, [#icon("nbt-string") *\<显示位置>*: 该显示位置显示的记分项，需要是一个记分项名称。]),
  (2, [#icon("nbt-list") *#underline[Objectives]*: 存储所有的记分项。]),
  (3, [#icon("nbt-compound") 一个记分项。]),
  (4, [#icon("nbt-string") *#underline[CriteriaName]*: 该记分项的准则。]),
  (4, [#icon("nbt-bool") *#underline[display_auto_update]*: 分数更改时，侧边栏中的显示名称是否自动更新。]),
  (4, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *#underline[DisplayName]*: 记分项的显示名称，必须为文本组件，如果没有使用命令指定显示名，则以记分项名称作为显示名称。]),
  (4, [#icon("nbt-compound") *format*: 该记分项默认的分数数字格式。]),
  (5, [#icon("nbt-string") *#underline[type]*: 数字格式类型，有效值 `blank`、`fixed` 和 `styled`。]),
  (5, [*若 #icon("nbt-string") `type` 值为 `blank`，则不存在额外字段。*], false),
  (5, [*若 #icon("nbt-string") `type` 值为 `fixed`，则使用以下字段：*], false),
  (5, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *#underline[value]*: 一段固定的文本，需要是文本组件。]),
  (5, [*若 #icon("nbt-string") `type` 值为 `styled`，则使用以下字段：*], false),
  (5, [文本组件样式]),
  (4, [#icon("nbt-string") *#underline[Name]*: 记分项名称。]),
  (4, [#icon("nbt-string") *#underline[RenderType]*: 存储分数的显示方式，有 `integer`（默认值，数字）和 `hearts`（爱心）两种有效值。]),
  (2, [#icon("nbt-list") *#underline[PlayerScores]*: 存储分数持有者及其分数信息。]),
  (3, [#icon("nbt-compound") 一个分数持有者及其分数。]),
  (4, [#icon("nbt-compound") *format*: 该分数持有者在此记分项使用的分数数字格式。]),
  (5, [#icon("nbt-string") *#underline[type]*: 数字格式类型，有效值 `blank`、`fixed` 和 `styled`。]),
  (5, [*若 #icon("nbt-string") `type` 值为 `blank`，则不存在额外字段。*], false),
  (5, [*若 #icon("nbt-string") `type` 值为 `fixed`，则使用以下字段：*], false),
  (5, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *#underline[value]*: 一段固定的文本，需要是文本组件。]),
  (5, [*若 #icon("nbt-string") `type` 值为 `styled`，则使用以下字段：*], false),
  (5, [文本组件样式]),
  (4, [#icon("nbt-bool") *#underline[Locked]*: 触发器记分项是否对该分数持有者启用，当值为 `true` 时，代表这个记分项是被“锁住”的，即未被启用。该标签对准则为触发器以外的记分项无效。]),
  (4, [#icon("nbt-string") *#underline[Name]*: 分数持有者的名称。]),
  (4, [#icon("nbt-string") *#underline[Objective]*: 分数持有者的分数所在的记分项。]),
  (4, [#icon("nbt-int") *#underline[Score]*: 分数。]),
  (2, [#icon("nbt-list") *Teams*: 存储所有队伍的信息。数据结构见节@subsec:team。])
)
== 记分板命令#h(1em)触发器
上一节对记分板的概念做出了解释，本节就如何用命令管理记分板进行讲解。

记分板命令大致可以分为三大类：记分项命令、分数持有者命令和触发器。
=== 记分项命令
记分项命令，即以 `/scoreboard objectives` 开头的命令。其中 `/scoreboard` 所需的权限等级为2。 `objectives` 是 `/scoreboard` 专门用于处理记分项的子命令，其所有次级子命令如下所示：#index(index: "command", "scoreboard")
===== `add`
该子命令用于添加一个记分项，并指定其记分项名称和准则。语法为
#codebox("scoreboard objectives add <objective> <criteria> [<displayName>]")
#param-desc(
  [`<objective>`（记分项 `minecraft:objective`）], [被添加的记分项的记分项名称，只允许包含大小写英文字母、数字、下划线 `_`、点 `.`、加号 `+` 或连字符 `-`。],
  [`<criteria>`（准则 `minecraft:objective_criteria`）], [指定记分项的准则，按@tab:single_criteria、@tab:compound_criteria、@tab:stat 和@tab:custom_stat 使用。],
  [`[<displayName>]`（文本组件 `minecraft:component`）], [可选，指定记分项的*显示名称*。]
)
#example(
  [添加一个虚拟型记分项 `[a]`。],
  [
    命令为
    #codebox("scoreboard objectives add a dummy")
  ]
)
===== `list`
该子命令用于列出所有存在的记分项，返回其记分项名称、准则和显示名称。语法为
#codebox("scoreboard objectives list")
===== `modify`
该子命令用于修改记分项的一些属性，以下是所有用法：
====== 设置此记分项是否会在分数更新时自动更新用于分数的分数持有者的显示名称，语法为
#codebox("scoreboard objectives modify <objective> displayautoupdate (true|false)")
#param-desc(
  [`(true|false)` ], [默认为 `false`。]
)
====== 更改此记分项的显示名称，语法为
#codebox("scoreboard objectives modify <objective> displayname <displayName>")
====== 将此记分项的分数数字格式设置为显示位置的默认数字格式，语法为
#codebox("scoreboard objectives modify <objective> numberformat")
====== 不显示此记分项的分数，即 `blank` 模式，语法为
#codebox("scoreboard objectives modify <objective> numberformat blank")
====== 将此记分项的分数数字格式设置为固定的文本，即 `fixed` 模式，语法为
#codebox("scoreboard objectives modify <objective> numberformat fixed <component>}")
#param-desc(
  [`<component>`（文本组件 `minecraft:component`）], [指定的文本，需要是文本组件，但不必为数字内容。没有分数的分数持有者会被赋予0分后再显示固定的文本。]
)
====== 修饰此记分项的分数数字格式，即 `styled` 模式，语法为
#codebox("scoreboard objectives modify <objective> numberformat styled <style>")
#param-desc(
  [`<style>`（文本组件样式 `minecraft:style`）], [需要为文本组件中的样式字段，内容类型相关的字段无效。]
)
====== 修改此记分项在显示位置 `list` 的分数显示格式，语法为
#codebox("scoreboard objectives modify <objective> rendertype (hearts|integer)")
#param-desc(
  [`(hearts|integer)` ], [分数的显示方式，`hearts` 为心形血条，`integer` 为数字。]
)
===== `remove`
该子命令用于移除记分项，语法为
#codebox("scoreboard objectives remove <objective>")
===== `setdisplay`
该子命令用于设置显示位置显示的记分项，语法为
#codebox("scoreboard objectives setdisplay <slot> [<objective>]")
#param-desc(
  [`<slot>`（显示位置 `minecraft:scoreboard_slot`）], [合法的显示位置，参照@tab:tab:display_slot 使用。],
  [`[<objective>]`（记分项 `minecraft:objective`）], [*如不指定该参数，则清空该显示位置。*]
)
#example(
  [在侧边栏显示玩家死亡榜。],
  [
    首先创建一个准则为 `deathCount` 的记分项 `[death_count]`：
    #codebox("scoreboard objectives add death_count deathCount \"死亡次数\"")
    然后在侧边栏显示这个记分项：
    #codebox("scoreboard objectives setdisplay sidebar death_count")
  ]
)
=== 分数持有者命令
分数持有者命令，即以 `/scoreboard players` 开头的命令。`players` 是 `/scoreboard` 专门用于处理分数持有者的子命令，若分数持有者原本不被指定的记分项追踪，则这些命令会使分数持有者开始被指定记分项追踪，并在初始分数0的基础上进行修改。其所有次级子命令如下所示：
===== `add`
该子命令为分数持有者在指定记分项原本的分数上加上指定的分数，语法为
#codebox("scoreboard players add <targets> <objective> <score>")
#param-desc(
  [`<targets>`（分数持有者 `minecraft:score_holder`）], [需要修改分数的分数持有者，可以是玩家名、UUID或目标选择器，也可以是 `*` 以指定所有正在被追踪的实体。允许使用假名。],
  [`<score>`（整型 `brigadier:integer`）], [增加的分数，*必须为非负整数*。]
)
#example(
  [使玩家 `Mu_xian` 在记分项 `[score]` 上的分数增加5。],
  [
    命令为
    #codebox("scoreboard players add Mu_xian score 5")
    若 `Mu_xian` 在记分项 `[score]` 上原本的分数为5，则执行命令后，`Mu_xian` 在记分项 `[score]` 上的分数变为10。
  ]
)
===== `display`
该子命令用于设置分数持有者在指定记分项上的显示名称及数字样式。
====== 修改显示名称时，有如下子命令：
======= 重置分数持有者在指定记分项上的显示名称为默认名称
#codebox("scoreboard players display name <targets> <objective>")
======= 直接修改分数持有者在指定记分项上的显示名称
#codebox("scoreboard players display name <targets> <objective> <text>")
#param-desc(
  [`<text>`（文本组件 `minecraft:component`）], [分数持有者的显示名称。]
)
====== 修改数字样式时，有如下子命令：
======= 重置分数持有者在指定记分项上的数字格式为默认样式
#codebox("scoreboard players display numberformat <targets> <objective>")
======= 不显示分数持有者在指定记分项上的分数
#codebox("scoreboard players display numberformat <targets> <objective> blank")
======= 设置分数持有者在指定记分项上的数字格式为 `fixed` 类型
#codebox("scoreboard players display numberformat <targets> <objective> fixed <contents>")
#param-desc(
  [`<contents>`（文本组件 `minecraft:component`）], [固定显示的文本样式。]
)
======= 设置分数持有者在指定记分项上的数字格式为 `styled` 类型
#codebox("scoreboard players display numberformat <targets> <objective> styled <style>")
#param-desc(
  [`<style>`（文本组件样式 `minecraft:style`）], [需要为文本组件中的样式字段，内容类型相关的字段无效。]
)
===== `enable`
该子命令对指定分数持有者启用一个准则为触发器的记分项，语法为
#codebox("scoreboard players enable <targets> <objective>") <code:command_scoreboard_players_enable>
===== `get`
该子命令用于获取分数持有者在记分项上的分数，每次只能选择一个分数持有者，语法为#footnote[`*` 在该命令中失效，对于下文 `list` 子命令也相同，详见#link("https://bugs.mojang.com/browse/MC/issues/MC-136858")[MC-136858]。]
#codebox("scoreboard players get <target> <objective>")
#param-desc(
  [`<targets>`（分数持有者 `minecraft:score_holder`）], [需要获取分数的分数持有者，可以是玩家名、UUID或目标选择器，但必须指定一个实体。]
)
===== `list`
该子命令用于返回指定分数持有者在所有追踪该分数持有者的记分项上的分数，语法为
#codebox("scoreboard players list [<target>]")
#param-desc(
  [`[<targets>]`（分数持有者 `minecraft:score_holder`）], [可选，若不填写该参数，则返回所有正在追踪分数持有者的记分项。]
)
===== `operation`
该子命令提供了更复杂的分数运算处理机制，同时允许多个记分项的分数之间产生互动，是记分板体系的精华部分。*在整个命令系统中，对数值进行的数学运算基本上都要依靠命令 `/scoreboard players operation` 来完成。*语法为
#codebox("scoreboard players operation <targets> <targetObjective> <operation> <source> <sourceObjective>")
#param-desc(
  [`<targets>`（分数持有者 `minecraft:score_holder`）], [*目标分数持有者*，可以是玩家名、UUID或目标选择器，也可以是 `*` 以指定所有正在被追踪的实体。],
  [`<targetObjective>`（记分项 `minecraft:objective`）], [*目标记分项*。这里称由分数持有者 `<targets>` 在记分项 `<targetObjective>` 上的分数为*目标分数*。],
  [`<operation>`（操作符 `minecraft:operation`）], [对目标分数和源分数进行的操作。所有可用的操作符列于@tab:operation。],
  [`<source>`（分数持有者 `minecraft:score_holder`）], [*源分数持有者*，可以是玩家名、UUID或目标选择器，也可以是 `*` 以指定所有正在被追踪的实体。],
  [`<sourceObjective>`（记分项 `minecraft:objective`）], [*源记分项*。这里称由分数持有者 `<source>` 在记分项 `<sourceObjective>` 上的分数为*源分数*。]
)
#general-table(
  caption: "操作符",
  colspan: 7,
  columns: (auto, auto, auto, auto, auto, 5em, 5em),
  header: (table.cell(rowspan: 2)[操作], table.cell(rowspan: 2)[#text(black)[`<operation>`]], table.cell(rowspan: 2)[说明], table.cell(colspan: 4)[用例], table.cell(fill: theme_basic.lighten(20%))[#text(fill: white, font: "Source Han Sans SC", weight: "bold")[目标分数]], table.cell(fill: theme_basic.lighten(20%))[#text(fill: white, font: "Source Han Sans SC", weight: "bold")[源分数]], table.cell(fill: theme_basic.lighten(20%))[#text(fill: white, font: "Source Han Sans SC", weight: "bold")[操作后的目标分数]], table.cell(fill: theme_basic.lighten(20%))[#text(fill: white, font: "Source Han Sans SC", weight: "bold")[操作后的源分数]]),
  [求和赋值], [`+=`], [将源分数加到目标分数上，不改变源分数。], [1], [2], [3], [2],
  [求差赋值], [`-=`], [使目标分数减去源分数，不改变源分数。], [3], [2], [1], [2],
  [求积赋值], [`*=`], [使目标分数乘以源分数，并将结果存储为目标分数，不改变源分数。], [1], [2], [2], [2],
  table.cell(rowspan: 3)[求商赋值], table.cell(rowspan: 3)[`/=`], table.cell(rowspan: 3)[使目标分数除以源分数得到整数商，并将结果存储为目标分数，不改变源分数。在大多数情况下，目标分数不能被源分数整除，此时除运算结果会*向负无穷大方向取整*。如果源分数为0，由于任何数除以0无意义，则求商运算不会得到任何结果。], [3], [2], [1], [2],
  [$-3$], [2], [$-1$], [2],
  [1], [0], [*1*], [0],
  table.cell(rowspan: 3)[取模赋值], table.cell(rowspan: 3)[`%=`], table.cell(rowspan: 3)[计算目标分数除以源分数后得到的非负余数，并将结果存储为目标分数。具体的计算过程可以分为两步：已知分数$a$和$b$，计算 `a%=b` 时，先对分数进行求整数商运算，得到#box(baseline: 30%, inset: (y: 0.5em))[$display(c=a/b)$]，其中$c$会*向负无穷大方向取整*；其次计算余数$r=a-c dot.c b$。], [12], [5], [2], [5],
  [10], [5], [0], [5],
  [$-12$], [5], [3], [5],
  [赋值], [`=`], [将源分数赋值给目标分数，不改变源分数。], [2], [3], [3], [3],
  table.cell(rowspan: 2)[取较小值], table.cell(rowspan: 2)[`<`], table.cell(rowspan: 2)[先比较目标分数$a$和源分数$b$，若$a<b$，则两个分数均不发生变化；若$a>b$，则目标分数变为$b$，源分数不发生改变。], [1], [2], [1], [2],
  [2], [1], [1], [1],
  table.cell(rowspan: 2)[取较大值], table.cell(rowspan: 2)[`>`], table.cell(rowspan: 2)[先比较目标分数$a$和源分数$b$，若$a>b$，则两个分数均不发生变化；若$a<b$，则目标分数变为$b$，源分数不发生改变。], [1], [2], [2], [2],
  [2], [1], [2], [1],
  [交换], [`><`], [交换目标分数和源分数，这时两个分数都会发生变化，是唯一会改变源分数的操作符。], [3], [4], [*4*], [*3*]
) <tab:operation>
编程中的一些算法思路都需要依靠操作符来完成，具体可见以下的例子：
#example(
  [假设记分项 `[var]` 上 `#result` 的分数是不大于99999的非负整数，输出 `#result` 分数的个位、十位、百位、千位和万位，分别使这些数字存储在同一个记分项 `#ge`、`#shi`、`#bai`、`#qian` 和 `#wan` 的分数中。],
  [
    对于一个十进制非负五位整数$N = (b_4 b_3 b_2 b_1 b_0)_(10)$（$b_i in {x divides 0 lt.eq.slant x lt.eq.slant 9,x in ZZ}$），它可以表示为#box(baseline: 40%, inset: (y: 0.5em))[$display(N = sum_(i=0)^4 b_i dot.c 10^i)$]。将$N$除以10，得到#box(baseline: 40%, inset: (y: 0.5em))[$display(N / 10 = b_0 / 10 + sum_(i=0)^3 b_(i+1) dot.c 10^i)$]。其中$display(b_0 / 10)$是小数部分，#box(baseline: 40%, inset: (y: 0.5em))[$display(sum_(i=0)^3 b_(i+1) dot.c 10^i)$]是整数部分。因此，对$N$除以10并取模（`%=`），得到的结果是 $b_0$，这就是个位上的数字。#box(baseline: 40%, inset: (y: 0.5em))[$display(sum_(i=0)^3 b_(i+1) dot.c 10^i)$]则是对$N$除以10的整除（`/=`）结果，得到这个值后，再对其进行一次取模，可得到十位上的数字。如此循环步骤，可提取所有位上的数字。

    运算时需要10这个分数，于是这里有必要建立一个新的记分项 `[constant]` 以存储10这个分数，分数可以由假名 `#10` 所持有以提示其存储的分数：
    #codebox("scoreboard objectives add constant dummy")
    #codebox("scoreboard players set #10 constant 10")
    接下来按顺序执行以下命令，可全部写入函数。如果需要保留 `#result` 的原始分数，那么可以先将 `#result` 的分数赋值给临时的 `#temp`，对 `#temp` 的分数进行运算。
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > digit_number.mcfunction",
      "scoreboard players operation #temp var = #result var

# 提取个位
scoreboard players operation #ge var = #temp var
scoreboard players operation #ge var %= #10 constant

# 提取十位
scoreboard players operation #temp var /= #10 constant
scoreboard players operation #shi var = #temp var
scoreboard players operation #shi var %= #10 constant

# 提取百位
scoreboard players operation #temp var /= #10 constant
scoreboard players operation #bai var = #temp var
scoreboard players operation #bai var %= #10 constant

# 提取千位
scoreboard players operation #temp var /= #10 constant
scoreboard players operation #qian var = #temp var
scoreboard players operation #qian var %= #10 constant

# 提取万位
scoreboard players operation #temp var /= #10 constant
scoreboard players operation #wan var = #temp var"
    )
  ]
)
===== `remove`
该子命令为分数持有者在指定记分项原本的分数上减去指定的分数，语法为
#codebox("scoreboard players remove <targets> <objective> <score>")
#param-desc(
  [`<score>`（整型 `brigadier:integer`）], [减去的分数，*必须为非负整数。*]
)
===== `reset`
该子命令使指定分数持有者在指定记分项上的分数清零，*并对指定分数持有者禁用准则为触发器的记分项*，同时使记分项不再追踪该分数持有者，语法为
#codebox("scoreboard players reset <targets> [<objective>]")
#param-desc(
  [`[<objective>]`（记分项 `minecraft:objective`）], [可选。若指定该参数，则使指定分数持有者在指定记分项上的分数清零；若不指定该参数，则使指定分数持有者在所有记分项上的分数清零。]
)
===== `set`
该子命令用于设置分数持有者在指定记分项上的分数为指定分数，语法为
#codebox("scoreboard players set <targets> <objective> <score>")
=== 触发器<subsec:trigger>
准则为触发器的记分项上的分数可以通过命令 `/trigger` 修改，命令 `/trigger` 的语法为#index(index: "command", "trigger")
#codebox("trigger <objective> [(add|set) <value>]")
#param-desc(
  [`[(add|set) <value>]`], [可选，若省略这个部分，则会使当前分数持有者在记分项 `<objective>` 上的分数加1分。]
)
下面的用法会在记分项中当前分数持有者原本的分数上加上指定的分数：
#codebox("trigger <objective> add <value>")
下面的命令会设置记分项中当前实体的分数：
#codebox("trigger <objective> set <value>")
命令 `/trigger` 需要的权限等级为0，这意味着未启用命令的玩家也能够使用这个命令。但是命令 `/trigger` 只能作用于已启用的触发器记分项，所以需要使用命令@code:command_scoreboard_players_enable 以对指定分数持有者启用指定的触发器记分项。当一个触发器记分项被启用后，可以使用命令 `/trigger` 对当前分数持有者进行分数修改，修改一次后触发器记分项会重新关闭，若要继续修改分数则需重新启用触发器记分项。

由于命令 `/trigger` 只需0级权限等级，读者可以将它与文本组件结合起来使用。文本组件中点击事件执行命令时视点击者为命令执行者，因此点击事件极大地受到点击者的权限等级的限制。*在未启用命令的冒险地图、服务器、或者是扩展游戏玩法的数据包中，所需权限等级超过0级的命令不能在点击事件中使用，此时必须使用 `/trigger`，用法如下：*
#codebox("click_event:{action:\"...\",command:\"trigger ...\"}")
#h(-2em)*随后需要高频执行的命令以监听触发器记分项的分数变动。*
#example(
  [重写@exa:click_event，使之对0级权限等级的玩家有效。],
  [
    建立一个触发器记分项：
    #codebox("scoreboard objectives add tri trigger")
    在 `click_event` 里写 `/trigger`：
    #codebox("{text:\"Minecraft\",click_event:{action:\"run_command\",command:'trigger tri set 1\"'}}")
    `tri` 的分数为1时执行实际的 `/title` 命令，因此需要高频监听记分项：
    #codebox("execute as @a if score @s tri matches 1 run title @s title \"Hello Minecraft!\"")
  ]
)
== 记分板的应用实例<sec:scoreboard_example>
记分板作为命令系统中一个较重要的体系，在服务器、冒险地图或数据包（原版模组）中有着非常广泛的应用。本节将列举记分板的若干应用实例，下面的例子中有些可能会需要使用命令 `/execute` 和数据包函数，读者可阅读后面章节的有关内容。

在使用记分板系统的时候，由于分数是介于$-2147483648$和2147483647之间（含）的整数，因此首先需要注意分数的溢出问题。其次，记分板不接受小数，因此对小数的运算都是模拟运算，通常采取的是缩放倍数的方式，比如计算$1.1+1.2$时会把分数缩放成11、12再计算。
#example(
  [
    在侧边栏中显示如图所示的内容。
    #figure(
      caption: "",
      image("图片/记分板显示例题.png", width: 6em)
    )
  ],
  [
    在多人游戏中，记分板不仅可用于显示玩家的分数和排名，还可以作为信息展示板使用。其原理是：*在记分板上显示不同的分数持有者名称，为这些分数持有者赋予分数使它们在侧边栏中有特定的位置，分数持有者名称即为记分板展示的信息。被赋予分数越高的分数持有者，它在侧边栏上所显示的位置就越靠上。*

    对于如图所示的侧边栏，不难发现它所显示的记分项其显示名称为粗体的起床战争，记分项名称和准则未知，于是可以自由指定记分项名称 `bed_wars`、准则为虚拟型。在游戏中添加这个记分项的命令为
    #codebox("scoreboard objectives add bed_wars dummy {text:\"起床战争\",bold:true}")
    #h(-2em)将这个记分项显示到侧边栏：
    #codebox("scoreboard objectives setdisplay sidebar bed_wars")
    #h(-2em)然后依次为各分数持有者赋予分数。注意到分数持有者名称是有样式的，比如分数持有者 `Round.1` 的文本就是红色的。这里介绍两种方法以实现之。

    *方法一（直接指定分数持有者名称的样式）*#h(1em)不妨使用格式化代码为被赋予分数的分数持有者添加名称样式。这里有两点注意事项：一、原版客户端无法输入字符 `§` ；二、除文本组件外的其他命令参数都不支持Unicode，因此不能使用 `\u00a7` 以代替字符 `§`。读者只能在函数中输入格式化代码，客户端内聊天栏和命令方块不能输入字符 `§`。

    创建一个数据包，填写元数据、添加命名空间和函数文件夹后，创建 #icon("mcfunction") `.mcfunction` 文件。在文件 #icon("mcfunction") `data > minecraft > function > display.mcfunction` 中输入下列命令后，用命令 `/function` 执行这个函数：
    #codefile(
      lang: "mcfunction",
      title: "data > minecraft > function > display.mcfunction",
      "#侧边栏显示内容
scoreboard objectives modify bed_wars numberformat blank
scoreboard objectives modify bed_wars displayname {text:\"起床战争\",bold:true}
scoreboard players set §cRound.1 bed_wars 6
scoreboard players set ========== bed_wars 5
scoreboard players set §c红队§r-§2√ bed_wars 4
scoreboard players set §e黄队§r-§2√ bed_wars 3
scoreboard players set §a绿队§r-§c× bed_wars 2
scoreboard players set §9蓝队§r-§2√ bed_wars 1
scoreboard players set §r========== bed_wars 0"
    )
    其中各分数持有者的分数只需满足相对的大小关系即可。注意到侧边栏最后一行的分数持有者名称和从上往下第二个分数持有者的名称是完全一致的，如果最后一条分数持有者命令写成如下的形式：
    #codebox("scoreboard players set ========== bed_wars 0")
    则第二个分数持有者的分数被改为1，那么侧边栏#text_component(background: black, text(white)[#text(red)[红队]-#text(green)[√]])及以下的内容都会被往上移一行，设计的两行#text_component(background: black, "==========")内容就会变成一行。当存在两个名称一样的分数持有者时，可以为分数持有者名称添加不会影响其设计样式的格式化代码，游戏会将它们识别成不同的分数持有者，这样就可以显示两行完全一致的内容。这里的最后一个分数持有者名称被设计为 `§r==========`。

    *方法二（修改分数持有者的显示名称）*#h(1em)此方法无需使用分节符 `§`，只需在记分板系统内修改分数持有者显示名称即可。以函数为例：
    #codefile(
      lang: "mcfunction",
      title: "data > minecraft > function > display.mcfunction",
      "#数字格式
scoreboard objectives modify bed_wars numberformat blank

#记分项显示名称
scoreboard objectives modify bed_wars displayname {text:\"起床战争\",bold:true}

#显示内容的上下行关系
scoreboard players set 游戏轮数 bed_wars 6
scoreboard players set 分隔行1 bed_wars 5
scoreboard players set 红队 bed_wars 4
scoreboard players set 黄队 bed_wars 3"
    )
  ]
) <exa:scoreboard_display>
#example(
  [现有 `[red]`、`[blue]`、`[yellow]` 和 `[green]` 四个队伍，其队伍颜色分别为红、蓝、黄和绿，每个队伍各有4名成员（玩家），游戏结束后所有玩家均获得一定的分数。记队伍的总分是队伍内所有成员所得分数之和，在聊天栏中返回排名第一的队伍及其总分（假设不存在总分相同的情况）。],
  [
    为了便于统计这四个队伍的分数，这里添加一个记分项 `[score]`，准则视具体游戏内容而定，这里先使用虚拟型：
    #codebox("scoreboard objectives add score dummy")
    将同一个队伍中所有玩家的分数加起来，将总和存放到代表各自队伍的假名中：
    #codebox("scoreboard players operation #red score += @a[team=red] score")
    #codebox("scoreboard players operation #yellow score += @a[team=yellow] score")
    #codebox("scoreboard players operation #green score += @a[team=green] score")
    #codebox("scoreboard players operation #blue score += @a[team=blue] score")
    #h(-2em)至此，对队伍总分的处理已经完成。
    
    侧边栏会自动对分数进行从高到低的排序，但如果要对聊天栏输出分数持有者名称及其分数，则需要将四个队伍按照其分数进行手动排序，在这个例子中仅需要求出最大的分数，可以使用擂台排序法。

    擂台排序法的原理是：假定第一个数是最大的数，将第二个数与第一个数作比较，若第二个数比较大，则第二个数是最大的数；若第二个数比较小，则第一个数仍是最大的数。按照这个方法处理完所有的数，则可以得出最大的数。为此可以在记分项 `[score]` 下添加一个假名 `#top` 以存储最高的得分。根据擂台排序法的原理，先假定红队的分数是最高的，将红队的分数赋值给假名 `#top`：
    #codebox("scoreboard players operation #top score = #red score")
    然后将黄队的分数与 `#top` 的分数进行对比，若 `#top` 的分数比黄队的分数高，则红队存储在 `#top` 上的分数得到保留；若 `#top` 的分数没有黄队的分数高，则 `#top` 的分数替换成黄队的分数，这里用运算符 `>` 即可：
    #codebox("scoreboard players operation #top score > #yellow score")
    其他队伍的分数处理以此类推：
    #codebox("scoreboard players operation #top score > #green score")
    #codebox("scoreboard players operation #top score > #blue score")
    这样一来假名 `#top` 就存储了四个队伍中的最高分。在聊天栏中返回的内容不仅包括最高分，还包括获得最高分的队伍，因此使用命令 `/execute` 中的条件子命令对分数进行判断：
    #codebox([execute if score \#top score = \#red score run tellraw \@a {text:\"红队\",color:\"#color_block(red)red\"}])
    这条命令会对假名 `#top` 的分数进行判断，如果这个分数等于红队的分数，则说明获得最高分的是红队，在聊天栏中返回#text_component(text(red)[红队])；否则不执行 `run` 子命令。其他队伍也按照这个格式处理：
    #codebox([execute if score \#top score = \#yellow score run tellraw \@a {text:\"黄队\",color:\"#color_block(yellow)yellow\"}])
    #codebox([execute if score \#top score = \#green score run tellraw \@a {text:\"绿队\",color:\"#color_block(green)green\"}])
    #codebox([execute if score \#top score = \#blue score run tellraw \@a {text:\"蓝队\",color:\"#color_block(blue)blue\"}])
    返回最高分可以由文本组件类型中的 `score` 处理：
    #codebox("tellraw @a {score:{objective:\"score\",name:\"#top\"}}")
    综上所述，将以上命令整合进一个函数内：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > rank.mcfunction",
      "scoreboard players operation #red score += @a[team=red] score
scoreboard players operation #yellow score += @a[team=yellow] score
scoreboard players operation #green score += @a[team=green] score
scoreboard players operation #blue score += @a[team=blue] score
scoreboard players operation #top score = #red score
scoreboard players operation #top score > #yellow score
scoreboard players operation #top score > #green score
scoreboard players operation #top score > #blue score
execute if score #top score = #red score run tellraw @a [\"\",{text:\"红队\",color:\"red\"},{score:{objective:\"score\",name:\"#top\"}}]
execute if score #top score = #yellow score run tellraw @a [\"\",{text:\"黄队\",color:\"yellow\"},{score:{objective:\"score\",name:\"#top\"}}]
execute if score #top score = #green score run tellraw @a [\"\",{text:\"绿队\",color:\"green\"},{score:{objective:\"score\",name:\"#top\"}}]
execute if score #top score = #blue score run tellraw @a [\"\",{text:\"蓝队\",color:\"blue\"},{score:{objective:\"score\",name:\"#top\"}}]"
    )
  ]
)
#example(
  [用记分板建立一个记录游戏时长的秒表系统（从零开始计时），使得时间以#text_component("时 : 分 : 秒")的文本格式显示在动作栏中。],
  [
    添加一个记分项 `[time]`，使得假名 `#time` 在记分项 `[time]` 上的分数每秒增加1，于是就可以得到一个最基本的秒表系统。本题要求以#text_component("时 : 分 : 秒")的格式输出时间，因此只计秒数的时间系统是远远不够的，因此还要添加记分项 `[hour]`、`[minute]` 和 `[second]` 以分别存储小时数、分钟数和秒数。此外还需要建立记分项 `[constant]`，把一些需要用到的常数存入其中。
    #codebox("scoreboard objectives add constant dummy")
    #codebox("scoreboard players set #60 constant 60")
    #codebox("scoreboard players set #3600 constant 3600")
    记分项 `[time]` 存储的是总秒数，这个数字除以3600得到的整数商即为小时数。先将 `[time]` 存储的总秒数存入记分项 `[hour]` 中：
    #codebox("scoreboard players operation #time hour = #time time")
    然后求这个数字除以3600的整数商，3600需要作为常数存入记分项 `[constant]` 中：
    #codebox("scoreboard players operation #time hour /= #3600 constant")
    接下来计算分钟数和秒数。先计算总秒数除以3600得到的余数，将结果存放在记分项 `[minute]` 和 `[second]` 中：
    #codebox("scoreboard players operation #time second = #time time")
    #codebox("scoreboard players operation #time second %= #3600 constant")
    #codebox("scoreboard players operation #time minute = #time second")
    计算出来的这个结果即为总秒数去掉小时数后剩余的时间，可由此计算出分钟数和秒数：
    #codebox("scoreboard players operation #time minute /= #60 constant")
    #codebox("scoreboard players operation #time second %= #60 constant")
    整理以上思路。先编写一个初始化函数 #icon("mcfunction") `data > tutorial > function > load.mcfunction`，以建立需要的记分项、存储需要的常数：
    #codefile(
      lang: "mcfunction",
      title: "ata > tutorial > function > load.mcfunction",
      "#时间
scoreboard objectives add time dummy
scoreboard objectives add hour dummy
scoreboard objectives add minute dummy
scoreboard objectives add second dummy

#常数
scoreboard objectives add constant dummy
scoreboard players set #60 constant 60
scoreboard players set #3600 constant 3600"
    )
    #h(-2em)这个函数可以被 `#minecraft:load` 调用，在每次重新加载数据包时运行以确保记分项和相关数据的存在。
    然后编写能增加时间刻度并计算时间的函数，每过1秒调用函数自身：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > timing.mcfunction",
      "#增加时间刻度
scoreboard players add #time time 1

#计算一次时分秒
scoreboard players operation #time hour = #time time
scoreboard players operation #time hour /= #3600 constant
scoreboard players operation #time second = #time time
scoreboard players operation #time second %= #3600 constant
scoreboard players operation #time minute = #time second
scoreboard players operation #time minute /= #60 constant
scoreboard players operation #time second %= #60 constant

#输出计算的结果
tellraw @a \
[\
  {score:{objective:\"hour\",name:\"#time\"}},\
  \" : \",\
  {score:{objective:\"minute\",name:\"#time\"}},\
  \" : \",\
  {score:{objective:\"second\",name:\"#time\"}}\
]

#1秒后递归
schedule function tutorial:timing 1s replace"
    )
    #h(-2em)如此一套函数编写完毕。
  ]
)
#example(
  [设计一个可在快捷栏中右击使用的物品，使用后会杀死当前玩家。],
  [
    记分板准则中以 `minecraft.used` 开头的复合准则可用于检测玩家使用一个物品的次数，因此基本思路是，将右击使用物品的次数转化为记分板的分数，通过检测记分板的分数以实现设计的效果。而首选的物品是胡萝卜钓竿或诡异菌钓竿，因为这两种物品具有以下的优点：
    + 耐久度仅在对猪或炽足兽加速时才会发生下降。
    + 除对猪或炽足兽加速的情况外，使用后不会对游戏造成任何实质性的影响，仅会影响拥有对应准则的记分项分数。
    \

    这里选择胡萝卜钓竿，创建一个准则为检测胡萝卜钓竿使用次数的记分项：
    #codebox("scoreboard objectives add test minecraft.used:minecraft.carrot_on_a_stick")
    #h(-2em)此命令可放在 `#minecraft:load` 初始化调用的函数中。首先在 `#minecraft:tick` 中高频调用下面的函数：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > tick.mcfunction",
      "#检测胡萝卜钓竿是否被使用
execute as @a[scores={test=1..}] run function tutorial:kill_player"
    )
    然后编写调用的 `tutorial:kill_player` 函数，注意，在这个函数的上下文中，`@s` 指的是函数 `tutorial:tick` 第2行中 `@a[scores={test=1..}]`，即使用了胡萝卜钓竿的玩家：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > kill_player.mcfunction",
      "#重置分数以等候下一次使用胡萝卜钓竿
scoreboard players reset @s test

#清除该玩家
kill @s"
    )
  ]
)
#index(index: "method", display: "服务器玩家上线检测", "fu2 wu4 qi4 wan2 jia1 shang4 xian4 jian3 ce4")
#example(
  [制作一个玩家上线欢迎系统。具体效果是：只要玩家进入服务器或冒险地图，就给此玩家显示主标题#text_component("欢迎")。],
  [
    此处介绍一种常用方法：通过统计信息 `leave_game` 以实现玩家上线检测。`leave_game` 是通用统计信息中的一个细则，用于统计玩家离开服务器。当玩家再次加入服务器时，这个变动就可以由记分板检测到。

    首先添加一个统计 `leave_game` 的记分项：
    #codebox("scoreboard objectives add enter_game minecraft.custom:minecraft.leave_game")
    #h(-2em)其次高频检测分数，放入高频运行的函数中：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > tick.mcfunction",
      "execute as @a if score @s enter_game matches 1.. run function tutorial:welcome"
    )
    #h(-2em) `tutorial:welcome` 函数的内容如下：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > welcome.mcfunction",
      "scoreboard players reset @s enter_game
title @s title \"欢迎\""
    )
  ]
)
#heading(level: 2, numbering: none, [第七章思考题与习题])
+ 一个玩家能否存在多个不同的队伍中？一个队伍能否存在多个不同的玩家？
+ 添加一个队伍名为 `[Red]` 的队伍，并使该队伍中玩家的死亡信息对其他队伍的玩家隐藏。
+ 用命令 `/tag` 分别写出添加记分板标签 `gaming` 和移除这个记分板标签的命令。
+ 现有A、B、C、D、E、F、G七个实体，其中A、C、G位于队伍 `[a]`，B、F位于队伍 `[b]`，B、D拥有记分板标签 `1`，A、B、C、E、G拥有标签 `2`，C、D、F拥有标签 `3`。则写出
  + 目标选择器 `@e[tag=!2,tag=!3,team=!b]` 选择的实体；
  + 目标选择器 `@e[team=a,tag=1,tag=2]` 选择的实体。
+ 解释下列名词：记分项、记分项名称、分数持有者、分数、显示位置、单一准则、次级准则。
+ 判断下列说法是否正确。
  + 一个只读型准则一定是一个单一准则。
  + 如果一个玩家在记分项 `[A]` 上没有分数，则该玩家不被记分项 `[A]` 追踪。
  + 两个不同的记分项追踪的分数持有者数量一定相同。
  + 名为 `#FakeName` 分数持有者的分数不会显示在列表中。
+ 分数持有者A ~ D在记分项 `[a]` ~ `[e]` 上的分数如下表所示，写出各记分项追踪的分数持有者数量和各分数持有者被追踪的记分项数。
  #general-table(
    caption: "",
    colspan: 6,
    columns: (auto, auto, auto, auto, auto, auto),
    header: ([分数持有者], [a], [b], [c], [d], [e]),
    [A], [10], [], [$-7$], [0], [],
    [B], [], [6], [], [1], [5],
    [C], [0], [], [9], [], [],
    [D], [$-2$], [], [], [3], [0]
  ) <tab:exercise_chapter_7_1>
+ 在@tab:exercise_chapter_7_1 中，用 `@a` 代表4个分数持有者，则依次执行命令
  #codebox("scoreboard players add @a b 5")
  #codebox("scoreboard players remove C c 2")
  #codebox("scoreboard objectives remove e")
  #codebox("scoreboard players reset D")
  后，仿照上表制作各记分项和各分数持有者的分数关系表，无追踪关系的位置空缺不填。
+ 简述命令 `/trigger tri` 的作用。
+ 判断下列命令能否执行成功，并说明原因。
  #codebox("/scoreboard players add * score 1")
  #codebox("/scoreboard players list *")
  #codebox("/scoreboard objectives add dummy")
  #codebox("/trigger @s test add 2")
+ 按要求写出下列命令：
  + 添加一个准则为虚拟型的记分项 `[force]`；
  + 设置记分项 `[force]` 的显示区为侧边栏；
  + 将所有玩家在记分项 `[force]` 上的分数设为9；
  + 将任意玩家在记分项 `[force]` 上的分数减去3。
+ 在命令 `/scoreboard players operation` 中，已知下列目标分数、源分数和运算符，分别求出命令执行之后的目标分数。
  #split-table(
    original-cols: (auto, auto, auto, auto),
    header: ([序号], [目标分数], [操作], [源分数]),
    data: (
      [(1)], [25], [`+=`], [13],
      [(2)], [10], [`+=`], [$-3$],
      [(3)], [$-3$], [`-=`], [$-9$],
      [(4)], [$-16$], [`*=`], [3],
      [(5)], [$-1$], [`*=`}], [$-7$],
      [(6)], [0], [`/=`], [5],
      [(7)], [16], [`/=`], [7],
      [(8)], [$-28$], [`/=`], [5],
      [(9)], [33], [`%=`], [4],
      [(10)], [16], [`%=`], [$-7$],
      [(11)], [$-23$], [`%=`], [$-5$],
      [(12)], [7], [`=`], [8],
      [(13)], [$-6$], [`<`], [16],
      [(14)], [27], [`>`], [45]
    )
  )
+ 有记分项 `[a]` 和 `[b]`，依次执行下面的命令后，写出分数持有者A、B和C在各记分项上的分数。
  #codebox("scoreboard players add A a 10")
  #codebox("scoreboard players operation B b += A a")
  #codebox("scoreboard players operation C a -= B b")
  #codebox("scoreboard players operation A a /= B b")
  #codebox("scoreboard players operation C b += A a")
  #codebox("scoreboard players operation C a -= B b")
  #codebox("scoreboard players operation A b >< C b")
  #codebox("scoreboard players operation B b %= A a")
  #codebox("scoreboard players operation C b > B b")
+ 对于@exa:scoreboard_display 的侧边栏，在侧边栏原本内容的基础上，将#text_component(background: black, text(white)[#text(yellow)[黄队]-#text(green)[√]])一行的内容改成#text_component(background: black, text(white)[#text(yellow)[黄队]-#text(red)[×]])，格式参考上下行的内容，且要求所处的行不变。
+ 设计一个能够在除法运算中输出带小数结果的记分板系统，要求精度为小数点后6位。
= 命令/execute<chap:command_execute>
前文已有说明，命令系统有一个非常重要的概念是#proper-noun(display: "执行上下文（Execution context）", "zhi2 xing2 shang4 xia4 wen2")，包括了#proper-noun(display: "执行者（Executor）", "zhi2 xing2 zhe3")、#proper-noun(display: "执行位置（Execution position）", "zhi2 xing2 wei4 zhi4")、#proper-noun(display: "执行朝向（Execution rotation）", "zhi2 xing2 chao2 xiang4")、#proper-noun(display: "执行锚点（Execution anchor）", "zhi2 xing2 mao2 dian3")和#proper-noun(display: "执行维度（Execution dimension）", "zhi2 xing2 wei3 du4")等参数。如果命令是由玩家在聊天栏中或由命令方块执行的，则执行命令时，执行者只能是执行命令的玩家本身或命令方块，而执行位置则为玩家所在的位置或命令方块所在的位置。

现在假设一个场景——某玩家在聊天栏中输入如下的命令：
#codebox("setblock ~ ~-1 ~ minecraft:stone")
#h(-2em)这时执行者为该玩家，执行位置为该玩家腿部所在的方块，所以这条命令执行后的效果为：该玩家脚底的方块变成了石头，且随着玩家的移动，被替换的方块位置也在不断变动。如果这条命令需要以该玩家为执行者每游戏刻被执行一次，则依靠聊天栏的输入几乎是不可能的，这时必须借助数据包或命令方块以实现循环执行。以数据包为例，如果在数据包中输入上面的命令，虽然命令大概率可以成功执行，但由于执行者和执行位置发生了改变，而达不到想要的效果。这时就迫切需要解决办法以改变命令上下文，这就是本章所讲解的命令—— `/execute`。#index(index: "command", "execute")
#pagebreak()
== 概述
在英语中，execute的意思为“实行、执行”，它说明了命令系统中命令 `/execute` 的实际用处，即命令执行。命令 `/execute` 是命令系统中最强大、也是用途最广泛的命令，没有之一。它需要的权限等级为2。由于其语法、结构的特点，它可以将所有所需权限等级不大于2的命令都作为它的子命令。同时，它还具备以下功能：
+ 更改和修饰命令执行上下文，包括命令执行者、执行位置、执行朝向或执行维度。
+ 对执行的条件进行判断。
+ 存储命令执行结果以方便进一步处理数据。
这三个功能是作为命令执行命令所必需具备的功能，在之后的章节中，有关命令 `/execute` 的教程都会以这三个功能为基础具体展开。
=== 命令/execute的历史 \*
命令 `/execute` 最初于14w07a被加入，彼时它的功能还没有现在这样齐全，仅仅允许更改命令执行位置，同时还可以做一些较为简单的条件判断，比如判断指定实体脚底方块是否为指定方块。下面这个例子用于探测所有玩家脚底是否为红色染色粘土（今称为红色陶瓦），如果是则杀死附近的玩家：
#codebox("execute @a ~ ~ ~ detect ~ ~-1 ~ minecraft:stained_hardened_clay 14 kill @p")
这条命令的语法现在已经不适用了，不难注意到1.8往后若干个版本中陶瓦在ID上仍被称为“染色硬化粘土”，而方块的Damage值依然存在。此外，由于目标选择器变量 `@s` 于稍晚些的版本加入，因此只能使用 `@p` 以指代当前玩家。旧语法仅仅体现出更改命令执行者和执行位置、对执行的条件进行判断这两个功能，且这两个功能尚不全面。在上面的命令中，`@a ~ ~ ~` 用于更改命令执行者和命令执行位置，而目标选择器和三维坐标参数是必填的，且在更改命令执行者和命令执行位置时没有提供多种修饰参数以添加其他可能性，故命令的功能有所限制。`detect ~ ~-1 ~ ...` 是对脚底方块的判断，同时也是旧语法中唯一可指定条件的地方，并只能用于判断方块条件，有很大的局限性。

扁平化之前能用于条件判断的命令有：`/testfor`、`/testforblock` 和 `/testforblocks`，它们分别用于判断实体条件、方块条件和区域条件。但由于它们不包含子命令，条件测试通过时必须借助其他方式以输出信号，常用的方法是在命令方块的毗邻位置放置一个红石比较器，将测试通过的信号转化为红石信号以输出。存储命令执行结果的功能在扁平化之前不存在于 `/execute` 的语法中，而是存在于命令 `/stats` 中，命令 `/stats` 是一种记分板命令，主要用于将命令执行结果存储到记分项中。出于更改命令执行者和命令执行位置的需要，这些命令通常需要与旧版本的命令 `/execute` 进行联动。

由此可见，扁平化之前这些命令执行的功能被分散到多个不同的命令中。为了消除命令功能的分散造成的不便，于2017年年底至2018年上半年进行的扁平化不仅对ID做出了更改，还对整个命令系统进行了一次巨大的改动，几乎所有命令的语法都进行了调整，一些命令的功能被合并至其他命令中。其中命令 `/testfor`、`/testforblock`、`/testforblocks` 和 `/stats` 被移除，其功能被悉数合并至命令 `/execute` 中。为了更好地吸收这些命令执行的功能，命令 `/execute` 的语法被拆分，添加了子命令的概念，对不同的功能进行了区分，同时允许在部分子命令后接入其他子命令。自此命令 `/execute` 的语法基本定型，形成了如今的树状结构。
=== 命令/execute的结构和子命令
命令 `/execute` 的语法为树状结构，且由不同的子命令拼接组成。大部分情况下子命令可以多个堆叠，形成如下的基本结构：
#codebox("execute <子命令1> <子命令2> <子命令3> ...")
例如：
#codebox("execute as @a at @s if block ~ ~-1 ~ red_concrete run kill @s")
其中的 `as @a`、`at @s`、`if block ~ ~-1 ~ red_concrete`、`run kill @s` 就是这个 `/execute` 的子命令。

命令 `/execute` 一共有14种可用的子命令，按照功能分类，它们可以被分为四大类：

#proper-noun(display: "修饰子命令（Modify subcommands）", "xiu1 shi4 zi3 ming4 ling4")*是用于更改执行者或执行位置、朝向、维度的子命令*，一共有10种修饰子命令：`align`、`anchored`、`as`、`at`、`facing`、`in`、`on`、`positioned`、`rotated` 和 `summon`。

#proper-noun(display: "条件子命令（Condition subcommands）", "tiao2 jian4 zi3 ming4 ling4")*是用于判断命令执行的条件，限制命令在指定条件内执行的子命令*，一共有2种条件子命令：`if` 和 `unless`。

#proper-noun(display: "存储子命令（Store subcommand）", "cun2 chu3 zi3 ming4 ling4")*是用于存储命令执行的#proper-noun(display: "成功次数（Success）", "cheng2 gong1 ci4 shu4")或#proper-noun(display: "结果（Result）", "jie2 guo3")的子命令*，只有1种存储子命令：`store`。

#proper-noun(display: "Run子命令（Run subcommand）", "run zi3 ming4 ling4")被单独归为一类，用于指定要执行的命令。其他种类的子命令会在下面的小节中具体介绍，这里先熟悉 `run` 子命令的用法。其语法为
#codebox("run ...")
#param-desc(
  [`...` ], [一条完整的命令，可以为其他所有的命令，命令开头不要带斜杠，命令中参数与参数之间的空格不要缺省，语法必须正确。]
)
这意味着通过子命令 `run`，可以在命令 `/execute` 中执行其他所有的命令。例如，有命令将命令执行者向上方传送5格：
#codebox("tp ~ ~5 ~")
#h(-2em)将这条命令完整地写到 `/execute` 的 `run` 子命令下，效果与原命令完全相同：
#codebox("execute run tp ~ ~5 ~")
#h(-2em)但是在不使用修饰、条件或存储子命令的情况下，不必如此单独使用 `run` 子命令。
==== 执行准则
当命令 `/execute` 被执行时，其遵守以下的执行准则：

*准则1*#h(1em)子命令的按照从前到后的顺序依次执行。

因此，玩家可以在同一个 `/execute` 命令中使用多个子命令以限制命令的执行条件。形象地说，编写命令 `/execute` 的过程相当于拼图游戏：每一条子命令相当于一块拼图碎片，一条完整的命令 `/execute` 就相当于由若干拼图碎片组成的完整图案。下面举一个例子——如果需要转变命令执行者为所有的玩家，执行位置为这些玩家所在的位置。在这个情境中命令需要进行的工作有两个，因此需要安排两个子命令：
#codebox("execute <子命令1> <子命令2>")
#param-desc(
  [`<子命令1>` ], [转变命令执行者为所有的玩家。],
  [`<子命令2>` ], [执行位置为这些玩家所在的位置。]
)
注意这里存在一个逻辑先后的顺序：先将命令执行者转变为所有的玩家，再将执行位置设置为这些玩家所在的位置。而不能先设定执行位置为“这些玩家”所在的位置，因为此时“这些玩家”还未指定到特定的玩家。而准则2为这种逻辑顺序提供了可能。由于准则2的存在，在上述的情境中 `<子命令1>` 和 `<子命令2>` 的顺序不能相互调换，否则会造成执行顺序混乱。

依旧沿用上面的例子：在一些情况下“所有的玩家”指不止一个玩家，这样的子命令会使 `/execute` 在执行的过程中产生多个#proper-noun(display: "分支（Branch）", "fen1 zhi1")，`/execute` 会在每一个分支的基础上分别执行后续的子命令。在一些情况下，分支会因为各种各样的原因中断其执行，比如条件子命令不满足、修饰子命令修饰的执行者不存在等，这样该分支的后续子命令便不能继续执行下去。如果 `/execute` 的所有分支都中断，则称该命令执行中断，此时命令没有返回值。如果一条 `/execute` 命令只存在一条分支，则称唯一的这条分支为#proper-noun(display: "主分支（The main branch）", "zhu3 fen1 zhi1")。

*准则2*#h(1em)命令 `/execute` 处理分支时遵循广度优先搜索算法。

所谓#proper-noun(display: "广度优先（Breadth-first）", "guang3 du4 you1 xian1")，就是在树中沿宽度方向遍历节点的一种搜索算法，即先将上一级的所有节点全部遍历一遍，再将下一级的所有节点全部遍历一遍。
#figure(
  caption: "广度优先算法的遍历顺序",
  image("图片/广度优先算法的遍历顺序.png", width: 15em)
)
按照这种算法，`/execute` 在处理下一个子命令产生的分支之前，已经把之前的子命令分支全部处理完毕，因此：

*准则3*#h(1em)后续的子命令无法对先前的子命令造成影响。
==== 编写规则
命令 `/execute` 可以由多个子命令堆叠而成，且这些子命令各自有不同的功能，在串联各子命令时，根据上述执行准则，往往需要遵守一定的编写规则。

*规则1*#h(1em)一个标准的含有 `run` 子命令的 `/execute` 命令遵循以下固定流向：
#codebox("execute <非run子命令> run ...")
#h(-2em)`run` 子命令只能使用一次，且它必须为最后一个子命令。

*规则2*#h(1em)同一个 `/execute` 命令中，所有非 `run` 子命令可以按任意顺序排列，并允许重复使用多次。

由于子命令的执行按照从前到后的先后顺序，则按照不同的顺序排列可能会有不同的效果，这一点在上文已有说明。因此读者应根据逻辑需要自由排列这些子命令。因为允许重复使用子命令，所以可以在一条 `/execute` 命令中使用多个条件子命令以添加多个限定条件，如：
#codebox("execute if block 0 0 0 air if entity @e[type=sheep]")
#h(-2em)也允许使用多个存储子命令以将一个数据存到多个媒介中：
#codebox("execute store result score #test var store result storage tutorial:_ test int 1.0 run random value 1..10")
#h(-2em)修饰子命令也可以使用多次以实现特定的逻辑：
#codebox("execute as @n[type=minecraft:armor_stand] at @s at @n[type=minecraft:armor_stand,tag=Tarnished] if entity @s[distance=..2] rotated ~60 ~ positioned ^ ^ ^1024 unless entity @s[distance=..1024] positioned ^ ^ ^-1024 rotated ~-120 ~ positioned ^ ^ ^1024 unless entity @s[distance=..1024] at @s run return run effect give @s glowing 1 0 true")

*规则3*#h(1em)`/execute` 必须以条件子命令或 `run` 子命令作为结尾。如果以条件子命令为结尾，则命令执行成功后会返回*执行的成功次数*。

以上3条规则都是代码上的硬性规则，规则4是社区规范：

*规则4*#h(1em)避免使用 `/execute ... run execute ...`。所有的子命令都应串联到一个 `/execute` 命令中而不是在 `run` 子命令内另起一个 `/execute`，后者会增加不必要的命令解析开销。因此，这样的写法不符合规范：
#codebox("execute as @a run execute at @s run setblock ~ ~ ~ air")
#h(-2em)应该写成：
#codebox("execute as @a at @s run setblock ~ ~ ~ air")
== 修饰子命令
修饰子命令用于更改、修饰命令执行上下文。注意，`/execute` 的修饰子命令本身不具备“选择实体”的功能，不能把其理解为选择符合要求的实体，实体的选择都是由目标选择器完成的。默认的命令执行者、执行位置、朝向、维度和锚点由实体及其位置、朝向决定，*修饰子命令只用于修饰命令的执行者、执行位置、朝向、维度和锚点，而不是更改实体的位置、朝向角度等参数，更不是指定实体及其位置和朝向角度等参数。`/execute` 命令中的修饰子命令做出的执行上下文的更新只会影响同一个命令中的 `run` 子命令以及该子命令引用的函数。*

不同的修饰子命令功能不同，下面依次介绍它们。在语法上，所有的修饰子命令后面必须接入其他子命令，修饰子命令不得作为命令的结尾，因此本节的语法展示使用 `-> execute` 这样的写法。
=== align
子命令 `align` *将命令执行位置的实际坐标向下取整*，语法为：
#codebox("align <axes> -> execute")
#param-desc(
  [`<axes>`（坐标轴组合 `minecraft:swizzle`）], [
    #h(-2em)可以为 `x`、`y` 和 `z` 的任意*不重复*组合，因此像 `xx` 这样的组合是错误的。所有可用的组合有：`x`、`y`、`z`、`xy`、`xz`、`yx`、`yz`、`zx`、`zy`、`xyz`、`xzy`、`yxz`、`yzx`、`zxy` 和 `zyx`，一共有15种不同的组合。子命令 `align` 会将该组合中所有相应坐标轴上的坐标*向下取整（即向负无穷大取整）*。各坐标轴的顺序没有要求，于是像 `xy` 和 `yx` 这样的组合效果完全相同。对坐标取整一共有七种情况，下面将所有的情况与15种组合对应起来：\
    仅对$x$坐标取整：`x`；\
    仅对$y$坐标取整：`y`；\
    仅对$z$坐标取整：`z`；\
    对$x$坐标和$y$坐标取整：`xy` 和 `yx`；\
    对$x$坐标和$z$坐标取整：`xz` 和 `zx`；\
    对$y$坐标和$y$坐标取整：`yz` 和 `zy`；\
    对$x$坐标、$y$坐标和$z$坐标取整：`xyz`、`xzy`、`yxz`、`yzx`、`zxy` 和 `zyx`。
  ]
)
#example(
  [
    已知命令执行者位于$(12.5,76,-41.3)$，执行下面的命令后：
    #codebox("execute align xyz run tp ~ ~ ~")
    该命令执行者的实际坐标为何？
  ],
  [
    由题意可知，该命令的初始执行位置为$(12.5,76,-41.3)$，`xyz` 组合使 `align` 子命令将该执行位置的$x$坐标、$y$坐标和$z$坐标向下取整，得到修饰后的执行位置$(12.0,76.0,-42.0)$。可以看到，若坐标为正，则向下取整会去除小数点；若坐标为整数则不变；若坐标为负，则去除小数点后将整数位置上的数字减去1。最后处理 `run` 命令时，命令 `tp` 会将命令执行者传送至修饰后的坐标。

    同理，如果执行的命令为
    #codebox("execute align x run tp ~ ~ ~")
    #h(-2em)则修饰后的执行位置为$(12.0,76,-42.0)$，这里$y$坐标和$z$坐标没有向下取整。
  ]
)
有一点需要读者注意，`align` 子命令不等同于坐标的中心点校准，因为命令中的所有坐标均为实际坐标，所以整数坐标的表现形式为方块的边缘。在上面的例子中，$x$坐标和$z$坐标均进行了向下取整，所以命令执行者被传送到了四个方块的交点，如@fig:round_down 所示：
#figure(
  caption: "",
  image("图片/向下取整.png", width: 12em)
) <fig:round_down>
虽然 `align` 子命令不等同于坐标的中心点校准，但仍然可以利用 `align` 子命令对已有的实体进行手动中心点校准，下面再举一个例子：
#example(
  [将任意坐标的命令执行者位置校准至其所在方块的中心。],
  [
    可以先用 `align` 子命令对$x$坐标和$z$坐标向下取整：无论命令执行者位于其所在方块内的任一坐标，向下取整后的执行位置都是相同的，然后用 `tp` 命令进行手动中心点校准，即将命令执行者的$x$坐标和$z$坐标向正方向移动0.5格，此时命令执行者就被校准到了方块的中心点。可以的命令为：
    #codebox("execute align xz run tp ~0.5 ~ ~0.5")
  ]
)
=== anchored
当命令执行者为实体时，子命令 `anchored` 会*更改执行锚点*，一共有两种可用的锚点：脚部和眼部。语法为：
#codebox("anchored <anchor> -> execute")
#param-desc(
  [`<anchor>`（实体锚点 `minecraft:entity_anchor`）], [用 `feet` 代表脚部，用 `eyes` 代表眼部，默认为脚部。锚点的修饰会影响实体的朝向和局部坐标，但不会影响绝对坐标和相对坐标。]
)
下面举一个例子：
#example(
  [
    命令执行者（玩家）的脚部位于$(0,70,0)$，已知其偏航角为 `90`，俯仰角为 `0`，分别执行下面的命令后，该命令执行者的坐标为何？
    #codebox("execute anchored eyes run tp ^ ^ ^3") <code:subcommand_anchored_example_1>
    #codebox("execute anchored eyes run tp ~ ~ ~3") <code:subcommand_anchored_example_2>
  ],
  [
    脚部位于$(0,70,0)$时，眼睛所在的坐标即为$(0,71,0)$。对于命令@code:subcommand_anchored_example_1，`run` 子命令会将玩家传送至其朝向的3格远位置，而此时的锚点被更改为眼部。偏航角为 `90`，俯仰角为 `0` 说明该玩家朝向正西面，坐标$(0,71,0)$的正西面3格远的位置为$(-3,71,0)$，此即为玩家被传送后的坐标。

    但是对于命令@code:subcommand_anchored_example_2，情况又有所不同，锚点更改不会影响相对坐标的使用，因此命令@code:subcommand_anchored_example_2 会直接将玩家传送至$(0,70,3)$。
  ]
)
=== as
子命令 `as` 会*更改执行者，但不改变执行位置、执行朝向、执行维度和执行锚点*，语法为：
#codebox("as <targets> -> execute")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [用于指定实体，指定的实体即为修饰后的命令执行者，后续子命令使用的目标选择器变量 `@s` 均可以指定该命令执行者。若同时选择了多个实体，则每一个实体都作为单独的命令执行者分别执行后续的子命令，于是能够产生多个分支。若指定的实体不存在，则命令执行中断。]
)
#example(
  [命令 `/say` 通常是由命令执行者执行，在聊天框返回的内容中会有方框署名命令执行者。编写命令让名为 `steve` 的村民使用 `/say` 命令在聊天框返回 `Hello World!` 的文本，以实现如下所示的效果：#text_component(background: black, "[steve] Hello World!")],
  [
    用子命令 `as` 更改命令执行者即可，命令为
    #codebox("execute as @e[type=villager,name=steve] run say Hello World!")
  ]
)
#example(
  [编写命令以返回所有实体的根标签数据。],
  [
    在本教程节@sec:command_data 对命令 `/data` 的语法讲解中有这样的规定：一条 `/data` 命令只能操作一个实体。因此像这样的命令是无效的：
    #codebox("data get entity @e")
    #h(-2em)但是可以通过 `as` 子命令实现本题的要求。因为命令 `/execute` 会将 `as` 子命令中指定的所有实体都作为一个单独的命令执行者分别执行命令。将所有实体视作单独的命令执行者后，再用 `/data get` 命令，此时可以用目标选择器变量 `@s` 指代这些命令执行者。在每一个分支中又因为 `@s` 指定的总是单个实体，所以此时的 `/data` 命令不会有报错。正确的完整命令应该这样编写：
    #codebox("execute as @e run data get entity @s")
  ]
)
=== at
子命令 `at` 会*改变执行位置、执行朝向和执行维度，但不会更改命令执行者、执行锚点*，语法为：
#codebox("at <targets> -> execute")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [用于指定实体，此时命令会将命令执行位置、执行朝向和执行维度更改为指定实体的位置、朝向和维度。如果指定了多个实体，则会产生分支，以各自指定实体的位置、朝向和维度分别执行后续的子命令。]
)
#example(
  [在所有玩家的脚下放置红色混凝土。],
  [
    更改命令执行坐标即可，将命令执行坐标更改为所有玩家所在的坐标，再用相对坐标表示其脚下的方块。完整的命令为：
    #codebox("execute at @a run setblock ~ ~-1 ~ red_concrete")
  ]
) <exa:subcommand_at_setblock>
#example(
  [
    判断下面的命令能否清除进入中心为$(0,70,0)$、半径为5格的球体区域的所有玩家。
    #codebox("execute at @a[x=0,y=70,z=0,distance=..5] run kill @s")
  ],
  [
    注意 `as` 子命令不会更改命令执行者，故该命令会直接清除命令执行者，对进入中心为$(0,70,0)$、半径为5格的球体区域的所有玩家没有影响。此时需要对命令做出更改，用 `as` 子命令改变命令执行者为进入中心为$(0,70,0)$、半径为5格的球体区域的所有玩家：
    #codebox("execute as @a[x=0,y=70,z=0,distance=..5] run kill @s")
  ]
)
=== facing
子命令 `facing` 会*将命令执行朝向更改为面向某个坐标或某个实体，但不会改变命令执行者和执行位置，不会直接改变实体的朝向*。所有用法如下：
===== 将命令执行朝向修饰为由执行位置、执行锚点至指定坐标的射线方向，语法为
#codebox("facing <pos> -> execute")
#param-desc(
  [`<pos>`（三维坐标 `minecraft:vec3`）], [修饰面向的坐标，需要是使用双精度浮点数的精确实际坐标。]
)
===== 将命令执行朝向修饰为由执行位置、执行锚点至指定实体位置的射线方向，并指定面向实体的锚点，语法为
#codebox("facing entity <targets> <anchor> -> execute")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [指定实体。若存在多个实体，则以每个实体分别执行一次后续子命令，形成分支。],
  [`<anchor>`（实体锚点 `minecraft:entity_anchor`）], [*必填*，指定面向指定实体的锚点，有脚部 `feet` 和眼部 `eyes` 两种可用参数。]
)
#index(index: "method", display: "制作黑洞", "zhi4 zuo4 hei1 dong4")
#example(
  [有一个“黑洞”，它实际上是一个拥有记分板标签 `black_hole` 的标记，如果有玩家位于球状的100格范围内，则它会以每游戏刻0.1格的速度将玩家往其所在的方向吸。在高频函数中输入相关命令以实现该效果。],
  [
    本题所述的情境可以简单描述为：将处于中心点为标记坐标、半径为100格的球体区域内所有玩家以每游戏刻0.1格的速度往标记的方向传送。
    
    首先，将命令执行者更改为所有玩家：
    #codebox("execute as @a")
    #h(-2em)其次，将命令执行位置和执行维度更改为这些玩家的位置和维度：
    #codebox("execute as @a at @s")
    #h(-2em)然后，将命令执行朝向更改为面向100格以内的标记：
    #codebox("execute as @a at @s facing entity @n[type=marker,tag=black_hole,distance=..100]")
    #h(-2em)以此得到的命令执行者为这些玩家、执行位置为这些玩家所在的坐标、朝向为从这些坐标面向标记。最后就可以使用局部坐标 `^ ^ ^0.1` 将玩家往命令执行朝向的方向传送。完整的命令为
    #codebox("execute as @a at @s facing entity @n[type=marker,tag=black_hole,distance=..100] run tp @s ^ ^ ^0.1")
  ]
)
=== in
子命令 `in` 会更改命令执行所在的维度，不更改执行位置，语法为：
#codebox("in <dimension> -> execute")
#param-desc(
  [`<dimension>`（维度 `minecraft:dimension`）], [原版存在主世界 `minecraft:overworld`、下界 `minecraft:the_nether` 和末地 `minecraft:the_end` 三个可用的参数，可以使用数据包添加的自定义维度。]
)
#example(
  [不前往下界，直接在下界的$(0,70,0)$位置放置一个石头。],
  [
    命令编写的思路为，将执行维度更改为下界，然后再使用 `/setblock` 命令：
    #codebox("execute in the_nether run setblock 0 70 0 stone")
  ]
)
#example(
  [
    教程@chap:coordinates\在介绍 `/spawnpoint` 命令时有下面的原文：

    读者也可以使用这条命令设置在任意维度的出生点。但是在末地使用 `/spawnpoint` 需谨慎，因为末地传送门会将玩家传送回出生点，无论该出生点所在的维度，因此很有可能会将玩家困在末地，不过玩家依旧可以使用 `/tp` 传送至其他维度的玩家或使用 `/execute` 子命令 `in` 直接传送至指定维度。

    现设计 `/execute` 命令使被困在末地的玩家回到主世界。
  ],
  [
    可行的命令如下，其中三维坐标参数随意：
    #codebox("execute in overworld run tp ~ ~ ~")
  ]
)
在维度之间使用坐标时，会受到维度坐标尺度的影响：主世界的8格距离等于下界的1格距离。如果直接使用 `in` 子命令，在不同的维度中会进行$x$和$z$坐标换算，$y$坐标不换算。具体见下面的例子：
#example(
  [
    命令执行者位于主世界$(16,64,16)$的位置，分别在该位置使用下列命令，则命令执行者会被传送到下界的什么坐标？
    #codebox("execute in the_nether run tp ~ ~ ~") <code:subcommand_in_example_1>
    #codebox("execute in the_nether run tp ~3 ~ ~") <code:subcommand_in_example_2>
  ],
  [
    直接进行坐标换算：$16 div 8=2$。不难得到执行命令@code:subcommand_in_example_1 后被传送至的坐标$(2,64,2)$。同样地，如果命令执行者位于下界的$(2,64,2)$位置，执行命令
    #codebox("execute in overworld run tp ~ ~ ~")
    #h(-2em)会将命令执行者传送至主世界的(16,64,16)。

    在本例子中，下界的 `~ ~ ~` 坐标指$(2,64,2)$，因此在下界中的坐标 `~3 ~ ~` 为$(5,64,2)$，这是执行命令@code:subcommand_in_example_2 后被传送的位置。由此可见，`in` 子命令更改命令执行维度时会先转换坐标尺度，再使用相对坐标。

    数据包的自定义维度如果也定义了相关的坐标尺度，则 `in` 子命令也会按照数据包内文件的定义进行坐标坐标。
  ]
) <exa:subcommand_in_scale>
=== on
子命令 `on` 会*将命令执行者更改为与当前执行者有指定关系的实体*，此即为“实体指针”，语法为：
#codebox("on (attacker|controller|leasher|origin|owner|passengers|target|vehicle) -> execute")
#param-desc(
  [`attacker` ], [五秒内对当前命令执行者最后造成伤害的实体。],
  [`controller` ], [控制当前命令执行者的实体。],
  [`leasher` ], [用栓绳牵引当前命令执行者的实体。],
  [`origin` ], [#h(-2em)当前命令执行者的来源，按@tab:executor_origin 使用。#general-table(caption: "命令执行者的来源", colspan: 2, columns: (auto, auto), header: ([当前执行者], [来源实体]), [凋落物形式的物品], [掷出此物者], [弹射物], [发射者], [被激活的TNT], [点燃此TNT者], [恼鬼或尖牙], [召唤者，一般为唤魔师], [区域效果云], [来源者]) <tab:executor_origin>],
  [`owner` ], [当前命令执行者的主人（如驯服宠物的玩家）。],
  [`passengers` ], [直接骑乘当前命令执行者的实体。],
  [`target` ], [当前命令执行者攻击的实体，若当前执行者为交互实体，则指向最后与之交互的玩家。],
  [`vehicle` ], [被当前命令执行者骑乘的实体。]
)
#example(
  [对所有拥有狗的玩家输出聊天栏文本#text_component([#text(green)[[提示]] 你可以通过狗尾巴的角度判断它的生命值])。],
  [
    直接指定拥有狗的玩家似乎并不容易，因为相关的NBT不容易找到，且通过进度来指定玩家的过程很繁琐。不妨先将命令执行者更改为所有的狼，所有已驯服的狼（狗）必有其主人，而对于所有未被驯服的狼，其没有主人，因此不会有任何与之有关系的玩家被选择。这样就可以进一步选择到所有有狗的主人：
    #codebox("execute as @e[type=wolf] on owner run tellraw @s [\"\",{text:\"[提示]\",color:\"green\"},\" 你可以通过狗尾巴的角度判断它的生命值\"]")
  ]
)
实体指针对原版模组中的自定义组合实体很有用处，下面举一个实例：
#example(
  [
    对于@exa:amr_bot 所述的无人机，编写函数使玩家可以与之产生互动：
    + 与交互实体产生交互时，将物品展示实体中物品的模型更改为 `astrbot:bot_on`；
    + 攻击交互实体时，将其中狼的主人设为此玩家。
  ],
  [
    首先整理一下此无人机设计的骑乘关系：交互实体骑乘物品展示实体，物品展示实体骑乘狼。
    + 本题需要判断交互实体是否有交互数据，这个情境没有说明需要判断特定玩家的交互，故只需要判断交互实体是否存在 `interaction` 这个字段。如果测试成功，就利用实体指针 `vehicle` 将执行者设为交互实体骑乘的物品展示实体，从而修改物品展示实体的数据：
      #codefile(
        lang: "mcfunction",
        title: "data > astrbot > function > bot > interaction.mcfunction",
        "execute as @e[type=interaction,tag=astrbot.interaction] if data entity @s interaction on vehicle run data modify entity @s item.components.\"minecraft:item_model\" set value \"astrbot:bot_on\""
      )
      此函数需要高频运行。
    + 狼的数据中有一个字段 #icon("nbt-int") `Owner`，它需要的值是玩家的UUID。在判断交互实体是否有攻击数据时，还需要用 `attacker` 指针获取做出攻击行为的玩家的UUID，将其放入临时的存储空间，随后再对交互实体连续使用两次 `vehicle` 指针将执行者设为狼，最后将临时数据存入狼的数据。此处不直接使用玩家数据的原因是过程中玩家的上下文会丢失，因为一套上下文只能有一个执行者，而执行者已经被无人机内的实体占用。
      #codefile(
        lang: "mcfunction",
        title: "data > astrbot > function > bot > attack > .mcfunction",
        "execute as @e[type=interaction,tag=astrbot.interaction] if data entity @s interaction run function astrbot:bot/attack/_"
      )
      #codefile(
        lang: "mcfunction",
        title: "data > astrbot > function > bot > attack > _.mcfunction",
        "execute on attacker run data modify storage astrbot:_ temp.player_uuid set from entity @s UUID
execute on vehicle on vehicle run data modify entity @s Owner set from storage astrbot:_ temp.player_uuid"
      )
      其中 `astrbot:bot/attack/` 这个函数需要高频运行。
  ]
) <exa:modify_amr_bot>
=== positioned
子命令 `positioned` 会*更改命令执行的位置*，即在指定的坐标执行命令或在指定实体所在的位置执行命令。该子命令不会改变命令执行者和执行朝向，所有用法如下：
===== 将命令执行位置修饰为指定的坐标，语法为
#codebox("positioned <pos> -> execute")
#param-desc(
  [`<pos>`（三维坐标 `minecraft:vec3`）], [修饰的执行位置，为使用双精度浮点数的精确实际坐标。]
)
===== 将命令执行位置修饰为指定实体所在的位置，语法为
#codebox("positioned as <targets> -> execute")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [指定实体。如果同时指定了多个实体，则会以各实体所在位置为命令执行位置分别执行后续的子命令，可以产生分支。]
)
===== 将命令执行位置修饰为最高点方块的上表面，语法为
#codebox("positioned over <heightmap> -> execute")
#param-desc(
  [`<heightmap>`（高度图 `minecraft:heightmap`）], [指定的高度图。]
)
所谓#proper-noun(display: "高度图（Heightmap）", "gao1 du4 tu2")，就是在一纵列方块中（即由相同$x$、$z$方块坐标的方块构成的长条）按特定规则指定该纵列上的最高点方块。高度图通常使用在地图（物品）中，也用于避雷针的判定。调试屏幕中 `CH`、`SH` 行分别存储了客户端、服务端的高度图信息。其中 `CH` 行的 `S` 指该纵列方块中最高的非空气方块的$y$坐标，`M` 指最高的能阻挡移动的方块。`SH` 行中 `W`、`M`、`ML`、`O` 分别指最高的非空气方块、能阻挡移动的方块、能阻挡移动的非树叶方块和能阻挡移动的非流体方块的$y$坐标。此命令可用的高度图如下：
#param-desc(
  prefix: "",
  [`world_surface` ], [最高的非空气方块。假设一实体站在一个方块上，且位于空气方块中，而其上方若干距离处有其他非空气方块（典型的例子是位于洞穴中），则该实体脚底的方块不是 `world_surface` 的最高点方块。],
  [`motion_blocking` ], [最高的能阻挡移动的方块，包括流体方块。与 `world_surface` 的区别在于，`motion_blocking` 不包括花、草、树苗等不会阻挡移动的方块。],
  [`motion_blocking_no_leaves` ], [最高的能阻挡移动的方块，不包括树叶。],
  [`ocean_floor` ], [最高的能阻挡移动的非流体方块。]
)
#example(
  [给予离当前位置上方5格处最近的玩家一个苹果],
  [
    需要先将命令执行位置设为 `~ ~5 ~`，再给予附近的玩家相应物品：
    #codebox("execute positioned 0 70 0 run give @p apple")
  ]
)
#example(
  [使用 `positioned` 子命令按照@exa:subcommand_at_setblock 要求编写其他可行命令。],
  [
    将命令执行位置更改为所有玩家所在的位置，再放置方块：
    #codebox("execute positioned as @a run setblock ~ ~-1 ~ red_concrete")
  ]
)
#example(
  [
    命令执行者位于主世界$(16,64,16)$的位置，在该位置使用下面的命令，则命令执行者会被传送到下界的什么坐标？
    #codebox("execute in the_nether positioned as @s run tp ~ ~ ~")
  ],
  [
    与@exa:subcommand_in_scale 有所不同的是，该命令在 `in` 子命令后面增添了一个 `positioned` 子命令，使得命令执行位置在 `in` 子命令中经过坐标尺度换算后，又在 `positioned` 子命令中被强制更改为了$(16,64,16)$。所以在 `run` 子命令中体现为被传送的坐标是位于下界的$(16,64,16)$。
    
  ]
)
#example(
  [将所有玩家传送至地表，允许传送至花、草等方块内。],
  [
     显然需要使用 `over` 模式，指定高度图 `motion_blocking`，命令为：
     #codebox("execute as @a positioned over motion_blocking run tp @s ~ ~ ~")
  ]
)
=== rotated
子命令 `rotated` 会*按照偏转角参数更改命令执行朝向，不改变命令执行者和执行位置*，其概念和用法较子命令 `facing` 而言完全不同。所有用法如下：
===== 将命令执行朝向修饰为指定的朝向角度，语法为
#codebox("rotated <rot> -> execute")
#param-desc(
  [`<rot>`（朝向 `minecraft:rotation`）], [指定的朝向角度，包含两个参数，偏航角在前，俯仰角在后。允许使用相对朝向角度。]
)
===== 将命令执行朝向修饰为*和目标实体相同的朝向*，语法为
#codebox("rotated as <targets> -> execute")
#param-desc(
  [`<targets>`（实体 `minecraft:entity`）], [指定实体。如果同时指定了多个实体，则以各实体的朝向分别执行后续的子命令，可以产生分支。]
)
#example(
  [将所有村民的朝向调整为和当前实体一致。],
  [
    要调整朝向，需要使用命令 `/rotate`。现在回顾其语法：
    #codebox("rotate <target> <rotation>")
    #h(-2em)不妨分析各个参数：这里 `<targets>` 需要指定为村民，`<rotation>` 是当前实体 `@s` 的朝向。其中后两者均需要用到相对坐标的波浪号。除了修饰执行位置外，还需要更改命令执行者为所有的村民。于是 `run` 子命令中的 `/rotate` 命令可以写为
    #codebox("rotate @s ~ ~")
    #h(-2em)其中 `@s` 为所有单个村民，两个波浪号是命令执行朝向（“当前实体”的朝向，但此时命令执行者 `@s` 已被更改为所有村民）。对着这些参数可以依次写出子命令。

    首先修饰执行朝向，这一条子命令一定要放在 `as` 子命令前面，因为此时命令执行者还不是村民，目标选择器变量 `@s` 修饰的是当前实体：
    #codebox("execute rotated as @s")
    #h(-2em)其次更改命令执行者：
    #codebox("execute rotated as @s as @e[type=minecraft:villager]")
    #h(-2em)最后加上 `/rotate` 命令：
    #codebox("execute rotated as @s as @e[type=minecraft:villager] run rotate @s ~ ~")
  ]
) <exa:subcommand_rotate>
=== summon
子命令 `summon` *可直接生成一个实体，并将命令执行者设为该实体*。该子命令合并了先使用命令 `/summon` 后更改命令执行者的过程，在命令编写中可减少命令条数；此外，生成的执行者可被直接选中，无论生成位置是否已加载。语法为：
#codebox("summon <entity> -> execute")
#param-desc(
  [`<entity>`（注册项 `minecraft:resource`）], [需要生成实体的命名空间ID。*不能指定实体NBT。*]
)
#example(
  [生成一个标记，并为其添加记分板标签 `test`、设其在记分项 `[marker]` 上的分数为2。],
  [
    可以使用函数：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > summon > .mcfunction",
      "execute summon marker run function tutorial:summon/_"
    )
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > summon > _.mcfunction",
      "tag @s add test
scoreboard players set @s marker 2"
    )
  ]
)
在未加载的区块内用子命令 `summon` 生成实体不必再使用 `/forceload` 以加载该实体。例如，在 `100000 0 100000` 处生成一个标记，无论这个位置是否被加载：
#codebox("execute positioned 100000 0 100000 summon marker ...")
相比之下，使用 `summon marker 100000 0 100000` 再对生成的标记进行操作时，还需要考虑 `100000 0 100000` 这个位置是否已被加载：`forceload add 100000 100000`，这其中区块的加载是异步的，实际执行的时候所有操作不一定会在同一游戏刻内完成。故 `/execute` 的 `summon` 子命令是更优解。
=== 应用实例
@exa:subcommand_rotate 提供了编写 `/execute` 命令的一种思路，即先写出 `run` 子命令，分析 `run` 子命令中的各种参数得出需要修饰的命令执行上下文，然后按照逻辑顺序用修饰子命令将它们一一修饰。

对于所有的修饰子命令，先列一张表以总结它们各自可修饰的执行上下文：
#general-table(
  caption: "修饰子命令对上下文的可修饰性",
  colspan: 6,
  columns: (auto, auto, auto, auto, auto, auto),
  header: ([子命令], [执行者], [执行位置], [执行朝向], [执行维度], [执行锚点]),
  [align], [否], table.cell(fill: green)[是], [否], [否], [否],
  [anchored], [否], [否], [否], [否], table.cell(fill: green)[是],
  [as], table.cell(fill: green)[是], [否], [否], [否], [否],
  [at], [否], table.cell(fill: green)[是], table.cell(fill: green)[是], table.cell(fill: green)[是], [否],
  [facing], [否], [否], table.cell(fill: green)[是], [否], [否],
  [in], [否], [否], [否], table.cell(fill: green)[是], [否],
  [on], table.cell(fill: green)[是], [否], [否], [否], [否],
  [positioned], [否], table.cell(fill: green)[是], [否], [否], [否],
  [rotated], [否], [否], table.cell(fill: green)[是], [否], [否],
  [summon], table.cell(fill: green)[是], [否], [否], [否], [否]
) <fig:tab:modify_subcommands>
编写命令时可按照这张表对号入座。在命令编写完成后还可以进行执行上下文的检查。下面举几个例子：
#example(
  [将离随即玩家最近的一只绵羊移动到该玩家眼前三格远的距离。],
  [
    先写出 `run` 子命令：
    #codebox("run tp ^ ^ ^3")
    #h(-2em)从中可以得到命令执行者为绵羊，命令执行位置为该玩家所在的位置，朝向与该玩家的朝向一致。不妨先将命令执行者设为随即玩家，这时目标选择器变量 `@s` 就会被指定为该玩家，可用 `as` 子命令更改命令执行位置和朝向。然后再将命令执行者改为最近的一只绵羊。完整的命令如下所示：
    #codebox("execute as @r at @s as @e[type=sheep,sort=random,limit=1] run tp ^ ^ ^3")
  ]
)
#example(
  [
    如图，一串正红色的 `dust` 粒子效果表现得像是顺时针绕着点$(0.5,64,0.5)$旋转。尝试实现这个效果。
    #figure(
      caption: "",
      image("图片/execute粒子例题.png", width: 12em)
    ) <fig:execute_particle>
  ],
  [
    如果直接使用 `/particle` 命令，通过计算得到每一个粒子应处于的位置有些困难。不妨在$(0.5,64,0.5)$放置一个标记，并带有 `center` 的标签：
    #codebox("summon marker 0.5 64 0.5 {Tags:[\"center\"]}")
    #h(-2em)或者也可以使用 `summon` 子命令：
    #codebox("execute positioned 0.5 64 0.5 summon marker run tag @s add center")
    #h(-2em)接下来可以旋转这个标记。将命令执行者、执行位置和朝向分别改为标记、标记的位置和朝向，然后用 `/rotate` 命令水平旋转这个标记。注意需要改动的是标记的水平偏转角，@fig:execute_particle 的旋转方向为顺时针，因此相对偏转角参数波浪号后应为正：
    #codebox("rotate @s ~15 ~")
    #h(-2em)这样随着标记的旋转，每游戏刻都会在标记面前生成一个粒子效果，在视觉上的表现就是粒子绕着该点旋转。

    用函数实现的时候，首先写初始化函数：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > load.mcfunction",
      "summon marker 0.5 64 0.5 {Tags:[\"center\"]"
    )
    #h(-2em)需要被 `#minecraft:tick` 调用的函数为：
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > tick.mcfunction",
      "execute as @e[type=marker,tag=center] at @s run function tutorial:particle"
    )
    #h(-2em)其中 `tutorial:particle` 的内容为
    #codefile(
      lang: "mcfunction",
      title: "data > tutorial > function > particle.mcfunction",
      "rotate @s  ~15 ~
particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.0} ^ ^ ^1 0 0 0 1 1 force"
    )
  ]
)
== 条件子命令
条件子命令是一类用于条件判断的子命令，只有符合条件、或称为*测试通过*时，才会执行后续的子命令。条件子命令不会更改命令执行者和执行位置等上下文，也不会对其他因素造成影响，它的作用仅限于判断条件。

命令 `/execute` 一共存在两种条件判断的子命令：`if` ——*只有条件满足时测试通过*；`unless` ——*只有条件不满足时测试通过*。这两种子命令构成了基本的“是”和“否”的判断方式。在语法上，除了 `if` 和 `unless` 的命令名，这两种判断方式其余部分的参数结构均相同。条件子命令可以多个随意堆叠，一个 `/execute` 命令中一个条件符合（满足条件或不满足条件）时，测试才会通过，后续子命令才会被执行；若不符合则测试失败，命令执行中断，后续的子命令不再被执行。这意味着只要子命令中有一个条件不符合，命令就无法完整执行。在逻辑上，同一条 `/execute` 命令中的条件子命令进行的是“与”运算；如果要进行“或”运算，则必须在不同的 `/execute` 命令中使用条件子命令。*执行条件子命令后，总会返回“测试通过”或“测试失败”，若存在多个满足条件的分支，则还会返回一个测试计数值。*

大部分条件子命令后面不必接入其他子命令，因此本节的语法展示使用 `-> [execute]` 这样的写法。
=== 生物群系条件：biome
判断给定坐标的位置是否为指定的生物群系，语法为：
#codebox("(if|unless) biome <pos> <biome> -> [execute]")
#param-desc(
  [`<pos>`（方块坐标 `minecraft:block_pos`）], [需要检测的位置，使用方块坐标。],
  [`<biome>`（注册项命名空间ID或标签 `minecraft:resource_or_tag`）], [指定生物群系的命名空间ID或生物群系的数据包标签。]
)
#example(
  [判断$(0,70,0)$的位置是否为平原生物群系。如果是则测试通过。],
  [
    在这个情境中很明显需要用到 `if` 子命令：
    #codebox("execute if biome 0 70 0 minecraft:plains")
  ]
)
=== 方块条件：block
判断给定坐标上的方块是否为指定的方块，语法为：
#codebox("(if|unless) block <pos> <block> -> [execute]")
#param-desc(
  [`<pos>`（方块坐标 `minecraft:block_pos`）], [需要检测的位置，使用方块坐标。],
  [`<block>`（方块谓 `minecraft:block_predicate`）], [指定方块的命名空间ID或方块标签，允许指定方块状态或方块实体NBT，格式为\ `<命名空间ID>[<方块状态>=<值>,…]{<方块实体数据>}`\ 其中 `[<方块状态>=<值>,…]` 和 `{<方块实体数据>}` 在不需要时可以省略。检查方块时只会检查此参数指定的方块状态是否匹配。]
)
#example(
  [判断坐标$(0,70,0)$处的方块是否为朝向东面的铁活板门，如果是则测试通过。],
  [
    命令为
    #codebox("execute if block 0 70 0 iron_trapdoor[facing=east]")
  ]
)
通常将条件子命令与修饰子命令放在一起使用。下面再举一个例子：
#example(
  [在一张跑酷地图中，所有踩到红色混凝土的玩家都会被立即杀死，用命令实现这个效果。],
  [
    将命令执行者更改为所有玩家，命令执行位置更改为命令执行者所在的位置，这样每个玩家能作为一个单独的命令执行者以执行后面的子命令。然后判断每个玩家脚下的方块，即命令执行位置下方毗邻的方块是否为红色混凝土，如果是则清除命令执行者（该玩家），很明显需要使用 `if` 子命令。完整的命令为
    #codebox("execute as @a positioned as @s if block ~ ~-1 ~ red_concrete run kill @s")
    #h(-2em)将这个命令放在 `tick` 函数中高频执行。这类情境在冒险地图中极为常见，因此这种命令需要读者掌握。
  ]
)
=== 区域条件：blocks
判断给定区域的方块是否与相同形状、大小指定区域的方块完全相同，这里的完全相同不仅指方块的ID和数量一致，每个被探测方块在区域内的相对位置都需要一致。语法为：
#codebox("(if|unless) blocks <start> <end> <destination> (all|masked) -> [execute]")
#param-desc(
  [`<start>` 和 `<end>`（方块坐标 `minecraft:block_pos`）], [类似于命令 `/fill` 和 `/clone` 决定源区域的方式，由这两个方块坐标参数决定源区域所处的位置及其大小。],
  [`<destination>`（方块坐标 `minecraft:block_pos`）], [对照区域西北下角的方块坐标。对照区域的大小与源区域完全相同，由源区域的参数决定，因此无需其他的参数。],
  [`(all|masked)` ], [检测模式，有 `all` 和 `masked` 两种有效值，用于决定区域内哪些方块会被探测。`all` 指区域内所有的方块；`masked` 指区域内所有非空气方块，忽略所有空气方块。]
)
#example(
  [在小游戏“建筑超市”中，玩家需要搜集建筑材料将模板建筑复刻到指定区域内。已知模板建筑位于方块坐标$(360,175,243)$和$(370,185,233)$围成的区域内，玩家需要在$(340,175,243)$和$(350,185,233)$围成的区域内建造。当两个区域内的建筑完全相同时，对所有玩家显示粗体的黄色大标题#text_component(text(fill: yellow, weight: "bold")[Building Completed])。],
  [
    将由$(340,175,243)$和$(350,185,233)$围成的区域当作源区域，则由$(360,175,243)$和$(370,185,233)$围成的区域为对照区域，注意对照区域西北下角的方块坐标取区域内所有坐标轴上坐标的最小值，即$(360,175,233)$。命令为：
    #codebox("execute if blocks 340 175 243 350 185 233 360 175 233 all run title @a title {text:\"Building Completed\",color:\"yellow\",bold:true}")
    当然，也可以把由$(360,175,243)$和$(370,185,233)$围成的区域当作源区域，由$(340,175,243)$和$(350,185,233)$围成的区域为对照区域，则命令也可以写成：
    #codebox("execute if blocks 360 175 243 370 185 233 340 175 233 all run title @a title {text:\"Building Completed\",color:\"yellow\",bold:true}")
  ]
)
=== NBT条件：data
判断目标方块实体、实体或命令存储是否有指定的NBT，所有用法如下：
===== 判断方块实体数据，语法为
#codebox("(if|unless) data block <sourcePos> <path> -> [execute]")
#param-desc(
  [`<sourcePos>`（方块坐标 `minecraft:block_pos`）], [需要检测的方块坐标。],
  [`<path>`（NBT路径 `minecraft:nbt_path`）], [需要检测的NBT路径。]
)
===== 判断实体数据，语法为
#codebox("(if|unless) data entity <source> <path> -> [execute]")
#param-desc(
  [`<source>`（实体 `minecraft:entity`）], [需要检测的实体，可以为玩家名、UUID或目标选择器，但必须只能选定一个实体。]
)
===== 判断命令存储数据，语法为
#codebox("(if|unless) data storage <source> <path> -> [execute]")
#param-desc(
  [`<source>`（命名空间ID `minecraft:resource_location`）], [指定命令存储的命名空间ID。]
)
#example(
  [判断$(0,70,0)$的箱子是否有自定义名称#text_component(shadow-color: black.transparentize(100%), text(black)[奖励箱])，如果是则在该箱子最中间的槽位 `container.13` 放入一颗钻石。],
  [
    判断NBT时不免要使用NBT路径，于是可以先写出符合要求的箱子拥有的NBT。下面是箱子根标签拥有的值：
    #tree(
      (0, [#icon("nbt-compound") 根标签]),
      (1, [#icon("nbt-string") *CustomName*: `奖励箱`])
    )
    则符合要求的箱子必须拥有如下的NBT路径，这里使用带子标签的根复合标签节点以指向拥有特定值的标签：
    #codebox("{CustomName:\"奖励箱\"}")
    接下来使用 `if` 子命令进行判断，得到完整的命令：
    #codebox("execute if data block 0 70 0 {CustomName:\"奖励箱\"} run item replace block 0 70 0 container.13 with diamond")
  ]
)
=== 维度条件：dimension
判断命令执行位置是否在特定的维度，语法为
#codebox("(if|unless) dimension <dimension> -> [execute]")
#param-desc(
  [`<dimension>`（维度 `minecraft:dimension`）], [需要检测的维度命名空间ID。]
)
#example(
  [判断玩家 `Mu_xian` 是否位于主世界。],
  [
    进行判断前，先要把命令执行维度改为 `Mu_xian` 所在的维度。根据@fig:tab:modify_subcommands，这时就不能只用子命令 `as`，而应该用 `at`：
  ]
)
#codebox("execute at Mu_xian if dimension overworld")
=== 实体条件：entity
判断指定的一个或多个实体是否存在，语法为：
#codebox("(if|unless) entity <entities> -> [execute]")
#param-desc(
  [`<entities>`（实体 `minecraft:entity`）], [需要检测的实体，可以为玩家名、UUID或目标选择器。]
)
#example(
  [判断是否存在实体拥有记分板标签 `test`，如果是则测试通过。],
  [
    由于不存在直接判断记分板标签的方式，对于记分板标签的判断都可以转化为对实体的判断。因此命令为
    #codebox("execute if entity @e[tag=test]")
  ]
)
=== 函数条件：function
判断给定函数或函数标签是否匹配返回值，语法为：
#codebox("(if|unless) function <function> -> execute")
#param-desc(
  [`<function>`（函数 `minecraft:function`）], [可以是给定函数的命名空间ID，也可以是带 `#` 号的函数标签。用参数指定的函数均会运行，函数的运行结果不会对其他函数的运行产生影响。*当且仅当函数内命令 `/return` 的返回值不为 `0` 时，判定测试通过；若为返回值为 `0`，或此函数是Void类型的函数（没有返回值），则测试失败。*无论测试是否通过，指定的函数均会被执行一遍。若该参数使用函数标签指定了多个函数，则标签只要有任一函数中返回值非 `0`，则判定测试通过，标签中的后续函数将不再执行。]
)
*注意，该条件后续必须接入其他子命令，否则命令被视为不完整的命令而执行失败。*
#example(
  [判断函数 `minecraft:foo` 返回值是否非 `0`，是的话返回 `1`。],
  [
    命令为
    #codebox("execute if function minecraft:foo run return 1")
  ]
)
=== 物品条件：items
判断给定实体或容器内的指定槽位或槽位区间内是否有指定物品，所有用法如下：
===== 判断容器，语法为
#codebox("(if|unless) items block <pos> <slots> <item_predicate> -> [execute]")
#param-desc(
  [`<pos>`（方块坐标 `minecraft:block_pos`）], [需要检测的容器方块坐标。],
  [`<slots>`（物品栏槽位 `minecraft:item_slot`）], [指定的物品栏槽位，按@tab:slots 取用。也可以指定槽位区间，格式为 `<slot_type>.*`，此时所有拥有该槽位类别的槽位都会被检测，可用于检测一个特定容器或实体物品栏内的所有槽位。],
  [`<item_predicate>`（物品谓词 `minecraft:item_predicate`）], [匹配的物品，按 `<type>[<test>,<test>,…]` 或 `<type>[<test>|<test>|…]` 的格式填写，语法见节@subsec:item_predicate。]
)
#example(
  [判断位于$(0,70,0)$的箱子内是否有食物。],
  [
    不指定槽位的情况下，使用槽位区间，箱子使用的槽位类别为 `container`。食物即拥有组件 `minecraft:food` 的物品。所需命令为
    #codebox("execute if items block 0 70 0 container.* *[food]")
  ]
)
===== 判断实体物品栏，语法为
#codebox("(if|unless) items entity <entities> <slots> <item_predicate> -> [execute]")
#param-desc(
  [`<entities>`（实体 `minecraft:entity`）], [需要检测的实体，可以为玩家名、UUID或目标选择器。可以选择多个实体。]
)
#example(
  [判断当前玩家主手是否持有钻石剑。],
  [
    命令为
    #codebox("execute if items entity @s weapon.mainhand diamond_sword")
  ]
)
=== 加载条件：loaded
判断给定位置是否已被加载，语法为：
#codebox("(if|unless) loaded <pos> -> [execute]")
#param-desc(
  [`<pos>`（方块坐标 `minecraft:block_pos`）], [允许使用相对坐标或局部坐标。可用于检查区块加载情况，判断此处位置能否执行命令，并配合命令 `/forceload` 调整区块加载。]
)
#example(
  [判断$(1000000,70,1000000)$处是否已被加载。],
  [
    命令为
    #codebox("execute if loaded 1000000 70 1000000")
  ]
)
=== 谓词条件：predicate
判断指定谓词是否通过，语法为：
#codebox("(if|unless) predicate <predicate> -> [execute]")
#param-desc(
  [`<predicate>`（战利品表谓词 `minecraft:loot_predicate`）], [指定谓词的命名空间ID，或是直接在此处以SNBT形式内联一个谓词。]
)
#example(
  [编写命令使得当且仅当谓词 `tne:test1` 通过且谓词 `tne:test2` 不通过时测试成功。],
  [
    这里需要进行两次条件判断：
    #codebox("execute if predicate tne:test1 unless tne:test2")
  ]
)
=== 分数条件：score
在节@sec:scoreboard_example 的例子中使用了 `if score` 子命令，它是记分板系统一个非常重要的功能。该子命令用于判断指定分数持有者在记分项上的分数是否满足一定的条件，一共有两条可用的语法。
===== 判断指定分数持有者在指定记分项上的分数与源分数持有者在源记分项上的分数是否符合一定的运算关系，语法为
#codebox("(if|unless) score <target> <targetObjective> (=|<|<=|>|>=) <source> <sourceObjective> -> [execute]")
#param-desc(
  [`<targets>`（分数持有者 `minecraft:score_holder`）], [目标分数持有者，可以是玩家名、UUID或目标选择器，这里 `*` 会判定失败。],
  [`<targetObjective>`（记分项 `minecraft:objective`）], [目标记分项。],
  [`(=|<|<=|>|>=)` ], [操作符，检查目标分数和源分数的关系，其中：\ `=`：目标分数等于源分数\ `<`：目标分数小于源分数\ `<=`：目标分数小于等于源分数\ `>`：目标分数大于源分数\ `>=`：目标分数大于等于源分数],
  [`<source>`（分数持有者 `minecraft:score_holder`）], [源分数持有者，可以是玩家名、UUID或目标选择器，这里 `*` 会判定失败。],
  [`<sourceObjective>`（记分项 `minecraft:objective`）], [源记分项。]
)
#example(
  [比较 `Mu_xian` 和 `XVExodus` 两名玩家在记分项 `[score]` 上的分数，并在聊天栏返回高分玩家的胜利；如果分数一致，则在聊天栏返回平局。],
  [
    先检测高分玩家，假设 `Mu_xian` 是分数比较高的玩家：
    #codebox("execute if score Mu_xian score > XVExodus score run tellraw @a \"Mu_xian胜出\"")
    #h(-2em)再假设 `XVExodus` 是分数比较高的玩家：
    #codebox("execute if score XVExodus score > Mu_xian score run tellraw @a \"XVExodus胜出\"")
    #h(-2em)然后假设两者分数一致：
    #codebox("execute if score Mu_xian score = XVExodus score run tellraw @a \"平局\"")
    以上三条命令均需要高频执行。
  ]
)
===== 判断指定对象在指定变量上的分数是否在某一范围内，语法为
#codebox("(if|unless) score <target> <targetObjective> matches <range> -> [execute]")
#param-desc(
  [`<range>`（整数范围 `minecraft:int_range`）], [整型范围，有精确值（如 `1`）、单侧限制（如 `1..` 或 `..1`）和双侧限制（如 `0..1`）几种。表示范围时限制值也包含在内，即在数学上是闭区间。例如，`1..` 表示大于或等于1。]
)
#example(
  [检测所有玩家在 `[point]` 上的分数，如果小于0，则对其输出大标题#text_component("Game Over")。],
  [
    不妨先将命令执行者更改为所有玩家，然后再进行分数判断，此时 `@s` 已被指定为当前玩家：
    #codebox("execute as @a if score @s point matches ..-1 run title @s title \"Game Over\"")
    由于分数不能为浮点数，小于0的范围（0不包含在内）等同于小于等于$-1$。当然，也可以使用 `unless` 子命令，这时范围参数与使用 `if` 子命令时相反：
    #codebox("execute as @a if score @s point matches 0.. run title @s title \"Game Over\"")
  ]
)
#appendix
= 命令方块与红石电路
命令系统程序化运行的载体一般有两种：一是传统的命令方块电路；二是数据包。命令方块电路是具象化、实体化的命令系统构建模式，在命令系统未完善的早期版本，冒险地图作者就已经能够通过纯粹的红石电路搭建整个地图的机关。在命令方块随骇人更新加入游戏后，命令就能借助红石电路程序化执行了。在往后很长一段时间，命令通常被视为红石电路的一部分，社区中的命令玩家通常称呼自己为“CBer”，意味围绕命令方块玩游戏的玩家。而随着数据包的加入和完善，命令系统最终脱离了红石电路，拥有了更程序化的运行载体。

*当今主流的原版技术性开发应使用数据包作为开发工具。命令方块因其性能不佳、不便于数据备份和维护基本被淘汰。*不过，由于命令方块仍然在某些地方有独特用处，于是本教程依旧保留了命令方块电路的内容。#cite(<command_block_not_recommended>, form: none)

广义的命令方块电路除了包含核心的几种命令方块元件，还包括结构方块这种较为实用的管理员用品，因此本章还囊括了结构方块的教程。
#pagebreak()
== 红石电路基础
命令方块是一种红石机械元件，放在红石电路中对红石信号做出一定的响应，因此在介绍命令方块电路前，有必要先了解一些红石电路的基础知识。*#proper-noun(display: "红石电路（Redstone circuits）", "hong2 shi2 dian4 lu4")是为玩家建造的，可以用于控制或激活其他机械的结构。*
=== 红石信号
#proper-noun(display: "红石信号（Redstone signal）", "hong2 shi2 xin4 hao4")是红石电路中由电源元件产生的，能够由传输元件进行传输并使机械元件作出一定响应的信号。红石信号有两种状态：*有信号*和*无信号*，或简单地表示为*1*和*0*。信号从无到有的瞬间被称为#proper-noun(display: "上升沿（Rising edge）", "shang4 sheng1 yan2")，从有到无的瞬间被称为#proper-noun(display: "下降沿（Falling edge）", "xia4 jiang4 yan2")。

当一个红石信号经过暂时性的改变而最终回到了起始状态，这种暂时性的改变被称为#proper-noun(display: "脉冲（Pulse）", "mai4 chong1")。若红石信号从无到有，再从有到无，即形成了“0-1-0”过程，则称这个脉冲为*正脉冲（On-pulse，或简称为脉冲）*#index(display: "正脉冲（On-pulse）", "zheng4 mai4 chong1")；若红石信号从有到无，再从无到有，即形成了“1-0-1”过程，则称这个脉冲为#proper-noun(display: "负脉冲（Off-pulse）", "fu4 mai4 chong1")。脉冲的长度一般由红石刻度量，且无论持续时间的长短，满足上述定义的过程均可以被称为脉冲。不同红石元件对脉冲长度的响应要求不同，例如，红石灯无法因短于2 rt的负脉冲而熄灭，红石比较器无法传导所有短于1 rt和大部分等于1 rt的脉冲。

红石信号具有#proper-noun(display: "信号强度（Signal strength）", "xin4 hao4 qiang2 du4")，通常是介于0和15之间（含）的整数。当处于无信号状态时，强度一般为0；处于有信号状态时，强度一般为1  \~ 15。0到15是大部分红石元件可接受的强度范围，但红石比较器却能够处理大于15或小于0的信号强度。

事实上，任何大于0的信号强度不会引起脉冲长度的变化，也不会对机械元件的运作造成影响，更不会影响充能和激活。
=== 充能与激活理论
为了进一步研究红石信号对电路中各方块的作用机制，社区玩家提出了*充能与激活理论*。此理论作出如下定义：
+ 方块在接收到红石信号后，若方块本身作出一定响应，如门打开、红石灯亮、命令方块执行命令等，则称这个方块被*激活*了。
+ 方块在接收到红石信号后，若方块能向所有毗邻方块输出红石信号，则称这个方块被*充能*了，这个方块也被称为#proper-noun(display: "红石导体（Redstone conductor）", "hong2 shi2 dao3 ti3")，或*充能方块*。并非所有方块都能作为红石导体，仅有部分固体方块能作为红石导体使用，如泥土、石头。#footnote[注意方块没有透明度的属性，不能以方块的透明度去判断一个方块是否能作为红石导体。]一个红石导体被多少强度的信号充能，就称该方块有多少*充能等级*。充能又分为强充能和弱充能：
  + 若该红石导体能够激活毗邻的红石粉和其他红石元件，则称这种充能行为为#proper-noun(display: "强充能（Strongly powered）", "qiang2 chong1 neng2")。
  + 若该红石导体只能够激活毗邻其他红石元件，而不能激活红石粉，则称这种充能行为为#proper-noun(display: "弱充能（Weekly powered）", "ruo4 chong1 neng2")。
*一次充能行为是否为强弱充能与充能等级无关。*

注意，上述说法仅作为理论存在，游戏中并不直接存在这种机制，能作为红石导体的方块均没有相关的方块状态。充能行为实际上是游戏中的NC更新，与之相关的理论贴合游戏机制，便于理解和分析，至今仍被社区接纳。
=== 红石元件
#proper-noun(display: "红石元件（Redstone components）", "hong2 shi2 yuan2 jian4")，即用于构成红石电路的方块。通常分为以下几类：
==== 电源元件
电源元件是一类可以产生红石信号的元件。
===== 红石块
#figure(
  caption: [红石块的信号输出#footnote[本教程使用的红石图例：#box(image("图标/红石图例/强充能.png"),baseline:30%,width:3em) 表示能够被强充能的位置，#box(image("图标/红石图例/弱充能.png"),baseline:30%,width:3em) 表示能够被弱充能的位置，#box(image("图标/红石图例/激活.png"),baseline:30%,width:3em) 表示只能被激活的位置，#box(image("图标/红石图例/无响应.png"),baseline:30%,width:3em) 表示不会做出任何响应的位置。]],
  image("图片/红石块的信号输出.png", width: 9em)
)
作为永久性电源使用，持续输出强度为15的信号。红石块共有六个毗邻位置可用于输出信号，*可以激活所有毗邻元件，但无法充能毗邻的红石导体。*
===== 按钮
#figure(
  caption: "按钮：木质按钮（左）与石质按钮（右）",
  [#box(image("图片/木质按钮.png"))#h(4em)#box(image("图片/石质按钮.png"))]
)
可附着于其他方块表面碰撞箱的完整面，用于手动输出脉冲信号。当按钮被打开时，其会向六个毗邻位置输出强度为15的信号。不同种类的按钮开启并输出信号的持续时间不同，其中石质按钮的信号持续时间为10 rt；木质则为15 rt。*按钮可以激活所有毗邻的元件，同时强充能其依附的方块。*
#figure(
  caption: "按钮的信号输出",
  image("图片/按钮的信号输出.png", width: 9em)
)
===== 压力板
#figure(
  caption: "压力板：从左到右依次为：木质压力板、石质压力板、轻质测重压力板和重质测重压力板",
  [#box(image("图片/木质压力板.png"),width:5em)#h(4em)#box(image("图片/石质压力板.png"),width:5em)#h(4em)#box(image("图片/轻质测重压力板.png"),width:5em)#h(4em)#box(image("图片/重质测重压力板.png"),width:5em)]
)
压力板能够用于探测位于其上的实体。当压力板上有实体时，压力板被激活，并向其毗邻的位置输出信号，并将它下方的方块强充能。

不同类型的压力板需要不同条件才能开启——木质压力板可以被除了掉落中的方块和投掷物外的所有实体开启，石质压力板只能由玩家和生物开启，测重压力板可用于探测所有实体。同时，不同的压力板输出的信号强度有所不同：木质和石质压力板输出的信号强度总是为15。测重压力板会探测位于其上的实体数量，然后决定输出的信号强度，具体情况列于下表：
#split-table(
  caption: "测重压力板信号强度表",
  original-cols: (auto, auto, auto),
  header: ([信号强度], [轻质所需实体数量], [重质所需实体数量]),
  data: (
    [0], [0], [0],
    [1], [1], [1 \~ 10],
    [2], [2], [11 \~ 20],
    [3], [3], [21 \~ 30],
    [4], [4], [31 \~ 40],
    [5], [5], [41 \~ 50],
    [6], [6], [51 \~ 60],
    [7], [7], [61 \~ 70],
    [8], [8], [71 \~ 80],
    [9], [9], [81 \~ 90],
    [10], [10], [91 \~ 100],
    [11], [11], [101 \~ 110],
    [12], [12], [111 \~ 120],
    [13], [13], [121 \~ 130],
    [14], [14], [131 \~ 140],
    [15], [$gt.eq.slant 15$], [$gt.eq.slant 141$]
  )
)
*压力板可以激活所有的毗邻元件，同时强充能其下方的毗邻方块。*
#figure(
  caption: "压力板的信号输出",
  image("图片/压力板的信号输出.png", width: 9em)
)
== 结构方块<sec:structure_block>
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
    [26.1 Snapshot 5], [98.0], [79.0],
    [26.1 Snapshot 6], [99.0], [80.0],
    [26.1 Snapshot 7], [99.1], [81.0],
    [26.1 Snapshot 8], [99.2], [81.1],
    [26.1 Snapshot 9], [99.2], [81.1],
    [26.1 Snapshot 10], [99.3], [82.0],
    [26.1 Snapshot 11], [100.0], [83.0],
    [26.1 Pre-Release 1], [101.0], [84.0],
    [26.1 Pre-Release 2], [101.0], [84.0],
    [26.1 Pre-Release 3], [101.1], [84.0],
    [26.1 Release Candidate 1], [101.0], [84.0],
    [26.1 Release Candidate 2], [101.0], [84.0],
    [26.1 Release Candidate 3], [101.1], [84.0],
    [26.1], [101.1], [84.0],
    [26.1.1 Release Candidate 1], [101.0], [84.0],
    [26.1.1], [101.1], [84.0],
    [26.1.2 Release Candidate 1], [101.0], [84.0],
    [26.1.2], [101.1], [84.0]
  )
)<tab:pack_format>
== 方块状态<sec:block_state>
== 方块实体数据<sec:block_entity_data>
== 实体数据<sec:entity_data>
== 数据组件类型<sec:data_components_type>
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
#set par(justify: false)
#columns(1)[
  #make-index(entry-casing: k => k, indexes: ("method",), use-page-counter: true)
]
#bibliography(
  "参考文献.bib",
  title: "参考文献",
  style: "gb-7714-2015-numeric"
)