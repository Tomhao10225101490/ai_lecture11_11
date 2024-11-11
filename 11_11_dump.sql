-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: AI_lecture
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment_likes`
--

DROP TABLE IF EXISTS `comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_comment_like` (`user_id`,`comment_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `comment_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comment_likes_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_likes`
--

LOCK TABLES `comment_likes` WRITE;
/*!40000 ALTER TABLE `comment_likes` DISABLE KEYS */;
INSERT INTO `comment_likes` VALUES (1,3,1,'2024-11-11 07:24:40'),(2,1,1,'2024-11-11 07:25:52'),(4,1,2,'2024-11-11 07:25:56');
/*!40000 ALTER TABLE `comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  `essay_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `essay_id` (`essay_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`essay_id`) REFERENCES `essay_history` (`id`),
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'我觉得非常好','2024-11-11 07:24:32',3,11,NULL),(2,'快来顶上去','2024-11-11 07:24:58',3,11,1),(3,'牛的','2024-11-11 07:25:47',1,11,1),(4,'?','2024-11-11 07:26:08',1,11,1),(5,'man','2024-11-11 07:28:29',3,11,1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essay_history`
--

DROP TABLE IF EXISTS `essay_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essay_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_score` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `review_result` json NOT NULL,
  `is_example` tinyint(1) DEFAULT NULL,
  `essay_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_essay_history_created_at` (`created_at`),
  KEY `idx_score_example` (`total_score`,`is_example`),
  KEY `idx_grade_created` (`grade`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essay_history`
--

LOCK TABLES `essay_history` WRITE;
/*!40000 ALTER TABLE `essay_history` DISABLE KEYS */;
INSERT INTO `essay_history` VALUES (2,'我的爷爷','我的爷爷是一位慈祥而智慧的老人，他的笑容总是那么温暖，他的故事总是那么引人入胜。他是我心中的英雄，一个经历了无数风雨，却依然坚强乐观的人。 爷爷出生在一个贫困的农村家庭，年轻时为了生计，他离开家乡到城市打拼。他做过许多辛苦的工作，但无论多累，他总是保持着积极向上的态度。他告诉我，无论遇到什么困难，都要勇敢面对，只有努力奋斗，才能改变命运。 爷爷热爱学习，尽管他没有机会接受高等教育，但他总是通过阅读书籍和报纸来丰富自己的知识。他喜欢历史和哲学，常常与我分享他的见解。他的言传身教，让我学会了如何独立思考和对待生活中的挑战。 爷爷也是一位充满爱心的人。他总是关心身边的人，乐于助人。我记得有一次，一位邻居生病了，爷爷主动帮忙照顾他的家庭，直到他康复。爷爷的行为让我明白了什么是真正的善良和同情心。 如今，爷爷虽然已经步入老年，但他的精神依然矍铄。他喜欢与家人共度的时光，他的笑声总是能感染身边的每一个人。他是我们家的精神支柱，他的智慧和经验是我们最宝贵的财富。 我的爷爷，一个平凡而伟大的人，他的爱和教诲将伴随我一生。我以他为荣，也希望能成为像他一样有爱心、有智慧的人。爷爷，谢谢您，我爱您。','小学',79,'2024-11-08 10:47:18','{\"dimensions\": [{\"name\": \"内容立意\", \"score\": 18, \"comment\": \"作文立意明确，表达了对爷爷的敬爱之情，并展现了爷爷的慈祥、智慧和坚强乐观。作者通过爷爷的故事，传达了积极向上的生活态度和面对困难的勇气，思想健康，有一定见解。\"}, {\"name\": \"结构布局\", \"score\": 16, \"comment\": \"作文结构完整，层次清晰，但部分段落之间的过渡略显生硬，需要在叙述和抒情之间增加一些连接词或句子，使文章更加流畅。\"}, {\"name\": \"语言表达\", \"score\": 22, \"comment\": \"语言表达较为生动，使用了一些恰当的修辞手法，句式较为丰富。但有个别词汇和句子的使用还可以更准确和恰当，以增强表达效果。\"}, {\"name\": \"书写规范\", \"score\": 23, \"comment\": \"标点正确，格式规范，仅有个别错别字，书写规范良好。\"}], \"highlights\": [{\"point\": \"作文情感真挚，能够引起读者的共鸣。\", \"detail\": \"作者通过对爷爷的描述和回忆，表达了对爷爷的深切爱戴和尊敬，这种情感的真实流露能够触动读者的心弦。\"}], \"suggestions\": [{\"issue\": \"部分段落之间的过渡不够自然。\", \"solution\": \"建议在段落之间增加一些过渡句，比如使用\'此外\'、\'同时\'、\'另一方面\'等连接词，或者通过提问的方式来引导读者进入下一个主题。例如，在描述爷爷的智慧后，可以问\'那么，他是如何保持这种智慧的呢？\'然后引出下一段关于爷爷学习习惯的内容。\"}], \"total_score\": 79, \"overall_review\": \"总体而言，这是一篇情感真挚、内容丰富的作文。作者通过对爷爷的描述，展现了一个慈祥、智慧、坚强乐观的长辈形象，同时也传达了积极向上的生活态度和面对困难的勇气。作文结构完整，语言表达生动，书写规范。然而，在段落过渡和个别词汇的使用上还有提升的空间。建议作者在今后的写作中更加注重细节的处理，使文章更加流畅和完美。\", \"excellent_sentences\": [{\"analysis\": \"这句话运用了对比的修辞手法，通过对比笑容的温暖和故事的引人入胜，生动地描绘了爷爷的形象，表达了作者对爷爷的深厚感情。\", \"sentence\": \"他的笑容总是那么温暖，他的故事总是那么引人入胜。\"}]}',0,'记叙文'),(3,'我的小狗','我的小狗是一只活泼好动、充满好奇心的小生命。它有着一身柔软的毛茸茸的身体，一双圆溜溜的眼睛总是闪烁着对世界的好奇。它的名字叫“豆豆”，因为它的体型小小的，圆滚滚的，像是一颗小豆子。\n\n豆豆是我家的开心果，它总是能用它那无尽的活力和热情感染我们全家。每当我们回家时，它总是第一个冲到门口，兴奋地摇着尾巴，用它那特有的方式欢迎我们。它的欢笑声，那是一种独特的狗叫声，充满了喜悦和期待，总是能让我们一天的疲惫瞬间消失。\n\n豆豆最喜欢的事情就是玩耍。无论是室内还是室外，它总能找到自己的乐趣。在室内，它会追逐自己的尾巴，或者把玩具咬得咯吱作响；在室外，它喜欢追逐蝴蝶，或者在草地上打滚。它的世界总是充满了乐趣和惊喜。\n\n虽然豆豆有时候会调皮捣蛋，比如会把家里弄得一团糟，或者在不应该的时候叫个不停，但它的天真和活泼总是让我们原谅它的过失。它是我们的家庭成员，我们爱它的一切，包括它的优点和缺点。\n\n豆豆的陪伴让我们的生活更加丰富多彩。它的爱是无条件的，它的忠诚是无需证明的。有它在身边，我们感到无比的幸福和温暖。它是我们的朋友，我们的家人，我们的快乐源泉。我们爱豆豆，就像它爱我们一样，毫无保留。','小学',87,'2024-11-08 10:54:02','{\"dimensions\": [{\"name\": \"内容立意\", \"score\": 18, \"comment\": \"文章立意明确，主题突出，表达了对小狗的喜爱之情。文章通过对小狗的外貌、性格和行为的描述，展现了一个充满活力和好奇心的宠物形象。作者通过小狗的行为和互动，传达了宠物给家庭带来的快乐和温暖。内容健康，情感真挚，但缺乏一定的深度和独到见解。\"}, {\"name\": \"结构布局\", \"score\": 17, \"comment\": \"文章结构完整，层次清晰，采用了总分总的布局方式。每个段落都有明确的主题句，过渡自然。但在内容展开上，有些段落显得略微松散，缺乏紧凑感。整体而言，结构合理，但可以进一步加强内容的连贯性和紧凑性。\"}, {\"name\": \"语言表达\", \"score\": 24, \"comment\": \"语言表达生动，使用了一些恰当的修辞手法，如比喻和拟人，增强了文章的趣味性和形象性。句式较为丰富，能够恰当使用不同的句式来表达不同的情感和内容。用词准确，基本无语法错误，但偶尔有个别用词可以更加精准。\"}, {\"name\": \"书写规范\", \"score\": 28, \"comment\": \"标点正确，格式规范，几乎没有错别字。书写清晰，易于阅读。体现了良好的书写习惯。\"}], \"highlights\": [{\"point\": \"文章的亮点在于对小狗性格和行为的细腻描写，以及通过小狗展现了家庭的温馨和快乐。\", \"detail\": \"作者通过丰富的细节和情感表达，让读者仿佛能够看到小狗豆豆在家里活蹦乱跳的情景，这种生动的描写增强了文章的感染力。\"}], \"suggestions\": [{\"issue\": \"文章在内容展开上有时显得略微松散，缺乏紧凑感。\", \"solution\": \"建议在描写小狗的行为和家庭生活时，可以更加聚焦，通过精选的细节来增强文章的紧凑性和连贯性。例如，在描述豆豆玩耍的场景时，可以更加具体地描写它的动作和表情，让读者有更加直观的感受。\"}], \"total_score\": 87, \"overall_review\": \"总体来看，这是一篇优秀的作文，作者通过对自己小狗的描写，传达了宠物与家庭之间的深厚情感。文章内容积极向上，语言表达流畅，书写规范。作者能够运用恰当的修辞手法和丰富的句式，增强了文章的表现力。但在内容展开和结构安排上，还有进一步提升的空间。建议作者在今后的写作中，继续保持对生活的细致观察，同时加强对文章结构和内容连贯性的训练，相信会有更加出色的表现。\", \"excellent_sentences\": [{\"analysis\": \"这句话运用了拟人的手法，将小狗的叫声形容为欢笑声，生动地描绘了小狗给家人带来的快乐和放松感。\", \"sentence\": \"它的欢笑声，那是一种独特的狗叫声，充满了喜悦和期待，总是能让我们一天的疲惫瞬间消失。\"}]}',0,'记叙文'),(4,'北国的雪','北国的雪，那是一场洁白无瑕的梦境，一场无声的舞会，一场自然界最纯粹的艺术表演。每年冬天，当寒风凛凛，万物沉睡之时，北国的大地便被一层层柔软的雪花所覆盖，仿佛披上了洁白的新衣。\n\n清晨，当第一缕阳光穿过云层，照射在雪地上，整个世界都沐浴在一片金色的光辉中。雪后的空气清新而寒冷，每一次呼吸都仿佛能净化心灵。树木在雪中静默，它们的枝条被雪花装饰成晶莹的珊瑚，每一朵雪花都是大自然的馈赠，轻盈而脆弱，却能在瞬间改变整个世界的面貌。\n\n漫步在雪中，脚下的雪发出“咯吱咯吱”的声响，仿佛是大自然在低语。雪地上的每一个脚印都是独一无二的，它们记录着行人的足迹，也记录着时光的流逝。在这片银白色的世界里，所有的喧嚣与烦恼都被沉淀，只剩下纯净与宁静。\n\n孩子们在雪中嬉戏，他们堆雪人、打雪仗，笑声在空中回荡。雪对于他们来说，是玩具，是乐趣，是冬天里最美好的礼物。他们的笑容如同雪一样纯净，让人感受到冬日的温暖。\n\n夜晚，当星星点点的灯光照亮雪地，雪的世界又呈现出另一种美。月光下的雪地，银光闪闪，如同撒满了钻石。在这静谧的夜晚，雪的洁白与月光的清冷交相辉映，给人一种超凡脱俗的感觉。\n\n北国的雪，不仅是大自然的杰作，也是人们情感的寄托。它覆盖了过去的痕迹，也为未来铺垫了新的开始。每一次雪的降临，都是一次洗礼，一次对心灵的净化。它提醒我们，无论世界如何变化，总有一些东西是永恒的，比如雪的洁白，比如自然的宁静，比如我们心中的那份纯真与美好。\n\n北国的雪，是一场梦，一场纯洁无瑕的梦，它落在地上，也落在人们的心里，让人在寒冷的冬天里，感受到一份特别的温馨与浪漫。','小学',89,'2024-11-08 11:16:06','{\"dimensions\": [{\"name\": \"内容立意\", \"score\": 18, \"comment\": \"作文立意明确，能够围绕北国的雪展开描述，表达了对自然美景的热爱和对纯真美好的向往。但主题深度略显不足，缺乏对雪的象征意义或对生活的深层次思考。\"}, {\"name\": \"结构布局\", \"score\": 17, \"comment\": \"结构较为完整，能够按照时间顺序和空间转换来组织内容。但部分段落之间的过渡略显生硬，缺乏流畅性。\"}, {\"name\": \"语言表达\", \"score\": 25, \"comment\": \"语言表达生动，运用了丰富的修辞手法和恰当的词汇，句式多样。但有个别用词可以更加精准，以增强表达效果。\"}, {\"name\": \"书写规范\", \"score\": 29, \"comment\": \"标点使用正确，格式规范，仅有个别错别字。书写较为工整，易于阅读。\"}], \"highlights\": [{\"point\": \"作文中对雪后世界的描绘非常细腻，展现了作者对自然美景的观察力和感受力。\", \"detail\": \"作者通过对雪后清晨、树木、雪地、孩子们的游戏以及夜晚的雪景的描写，生动地展现了雪带来的宁静、纯洁和欢乐，这些细节让读者仿佛身临其境。\"}], \"suggestions\": [{\"issue\": \"文章中缺乏对雪的深层次象征意义或个人感悟的探讨。\", \"solution\": \"建议作者在描写雪景的基础上，进一步挖掘雪的象征意义，比如雪的覆盖可以象征着净化、新生或者遗忘，这样可以使文章主题更加深刻。同时，也可以结合个人经历或情感，使文章更具情感共鸣。\"}], \"total_score\": 89, \"overall_review\": \"总体而言，这是一篇优秀的作文。作者以流畅的语言和细腻的笔触描绘了北国雪景的美丽与宁静，展现了作者对自然的热爱和对生活细节的观察。文章结构合理，语言表达生动，书写规范。然而，在内容立意方面，文章可以更进一步，通过对雪的更深层次的思考和个人感悟的融入，使主题更加丰富和深刻。此外，部分段落之间的过渡可以更加自然，以提升文章的整体流畅性。综上所述，这是一篇值得推荐的作文，但仍有提升的空间。\", \"excellent_sentences\": [{\"analysis\": \"这句话运用了比喻和排比的修辞手法，形象地描绘了北国雪景的美丽和纯净，增强了文章的文学性。\", \"sentence\": \"北国的雪，那是一场洁白无瑕的梦境，一场无声的舞会，一场自然界最纯粹的艺术表演。\"}]}',1,'记叙文'),(6,'我的小猫','我的小猫名叫Molly，是一只活泼好动、充满好奇心的小精灵。她有着柔软的毛皮和一双圆溜溜的绿色眼睛，总是闪烁着探索的光芒。Molly的毛色是经典的虎斑，黑色的条纹分布在柔软的黄色毛发上，让她看起来像是一位小小探险家。\n\nMolly的日常充满了乐趣。她喜欢追逐家里的每一个移动物体，无论是玩具球还是飞行的蝴蝶，她都要追个不停。她的好奇心驱使她去探索家里的每一个角落，无论是高高的书架还是狭窄的缝隙，她都要一探究竟。\n\nMolly也是一位天生的猎手。她喜欢用她的前爪捕捉光影，就像是在练习真正的狩猎技巧。每当她成功地“抓住”了一个光点，她都会骄傲地抬起头，好像在说：“看，我多厉害！”\n\n尽管Molly总是充满活力，但她也有温柔的一面。每当我在家工作或者看书时，她总会跳上我的大腿，蜷缩成一团，用她温暖的身体给我安慰。她的咕噜声像是一首催眠曲，让我不由自主地放松下来。\n\nMolly给我的生活带来了无尽的欢乐和陪伴。她是我的小宝贝，我的快乐源泉。每当我看到她那无忧无虑的笑容，所有的烦恼都会烟消云散。Molly，我的小猫，你是如此的特别，如此的可爱，我永远爱你。','小学',87,'2024-11-08 12:49:22','{\"dimensions\": [{\"name\": \"内容立意\", \"score\": 18, \"comment\": \"文章立意明确，围绕小猫Molly展开，主题突出，展现了小猫的活泼好动和好奇心，有一定的情感深度。\"}, {\"name\": \"结构布局\", \"score\": 17, \"comment\": \"文章结构合理，层次分明，段落之间过渡自然，能够清晰地表达小猫的日常行为和性格特点。\"}, {\"name\": \"语言表达\", \"score\": 25, \"comment\": \"语言表达生动，修辞恰当，句式丰富，能够准确地描绘小猫的外貌和行为，增强了文章的感染力。\"}, {\"name\": \"书写规范\", \"score\": 27, \"comment\": \"标点正确，无错别字，格式规范，体现了良好的书写习惯。\"}], \"highlights\": [{\"point\": \"文章对小猫Molly的日常行为的描写非常细腻，展现了作者的观察力和对小猫的深厚感情。\", \"detail\": \"作者详细描述了小猫追逐玩具球、捕捉光影以及蜷缩在作者大腿上的情景，这些细节让读者仿佛能够看到小猫的动作和表情，增强了文章的吸引力。\"}], \"suggestions\": [{\"issue\": \"文章在描写小猫性格特点时，可以进一步挖掘其背后的情感意义，使文章更加深刻。\", \"solution\": \"建议作者在描述小猫行为的同时，更多地思考和表达这些行为所反映的情感价值，比如小猫的独立性、依赖性或者与主人的互动关系等。通过深入挖掘这些情感层面，可以使文章更加感人，也更能体现作者对小猫的深厚感情。\"}], \"total_score\": 87, \"overall_review\": \"总体来看，这是一篇优秀的作文，作者通过对小猫Molly的描写，展现了一个充满活力和好奇心的小动物形象。文章结构合理，语言生动，书写规范，体现了作者良好的写作能力和对小猫的深切喜爱。建议作者在未来的写作中，继续保持这种观察入微的态度，同时加强对情感和主题深度的挖掘，使文章更加丰富多彩。\", \"excellent_sentences\": [{\"analysis\": \"这句话运用了排比的修辞手法，强调了小猫Molly的好奇心和探索欲望，生动地描绘了她的行为特点。\", \"sentence\": \"她的好奇心驱使她去探索家里的每一个角落，无论是高高的书架还是狭窄的缝隙，她都要一探究竟。\"}]}',0,'记叙文'),(7,'我的老师','我的老师，是一位充满智慧和热情的教育者。她不仅传授知识，更是我成长道路上的引路人。她的课堂总是充满活力，她用她的热情感染着我们，让我们对学习充满了兴趣。她不仅是一位老师，更像是一位朋友，总是耐心地解答我们的问题，鼓励我们追求自己的梦想。\n\n她的教学方法独特而有效，总是能够激发我们的学习潜能。她不仅注重我们的学习成绩，更关心我们的全面发展。她鼓励我们参加各种课外活动，培养我们的实践能力和创新精神。在她的引导下，我们学会了如何独立思考，如何团队合作，这些都为我们未来的发展打下了坚实的基础。\n\n她的人格魅力深深地影响着我们。她的乐观、她的坚持、她的爱心，都成为了我们学习的榜样。她总是能够看到我们的优点，鼓励我们发挥自己的特长。在她的眼中，我们每个人都是独一无二的存在，都有自己的闪光点。她让我们相信，只要努力，就没有什么是不可能的。\n\n我很幸运能够遇到这样一位老师，她不仅教给我知识，更教会了我如何做人。她的影响将伴随我一生，激励我在未来的道路上不断前行。我衷心感谢她，我的老师，一位真正的教育家。','小学',89,'2024-11-11 02:34:27','{\"dimensions\": [{\"name\": \"内容立意\", \"score\": 18, \"comment\": \"作文内容立意明确，主题突出，能够表达对老师的感激之情，并展现了老师的教育方式和人格魅力。作者通过具体事例和细节描绘，体现了老师不仅是知识的传授者，更是成长道路上的引路人。\"}, {\"name\": \"结构布局\", \"score\": 17, \"comment\": \"作文结构布局合理，层次分明，能够按照逻辑顺序展开叙述，并在每个部分清晰地表达了自己的观点。过渡自然，整体上呈现出良好的结构完整性。\"}, {\"name\": \"语言表达\", \"score\": 23, \"comment\": \"语言表达流畅，用词准确，能够恰当使用修辞手法和丰富的句式，增强了文章的表现力。作者能够通过生动的语言传达情感，使文章更具感染力。\"}, {\"name\": \"书写规范\", \"score\": 21, \"comment\": \"书写规范，标点正确，几乎没有错别字，格式规范。体现了作者良好的书写习惯和对文字的尊重。\"}], \"highlights\": [{\"point\": \"作文亮点在于作者能够结合具体事例和细节来展现老师的教育方式和人格魅力，使得文章内容更加丰富和感人。\", \"detail\": \"作者通过描述老师的教学方法和关心学生全面发展的例子，展示了老师的专业素养和人文关怀，这些细节使得文章更加真实和有说服力。\"}], \"suggestions\": [{\"issue\": \"在某些段落中，作者可以进一步展开论述，提供更多的例子来支持自己的观点，使文章更加充实。\", \"solution\": \"建议作者在描述老师的教学方法和人格魅力时，可以再提供一两个具体的例子，这样能够更充分地展示老师的特点，同时也能够增强文章的说服力。\"}], \"total_score\": 89, \"overall_review\": \"整体来看，这是一篇内容丰富、结构合理、语言流畅的作文。作者通过对老师的描写，表达了对老师的尊敬和感激之情。文章中的亮点在于作者能够结合具体事例和细节来展现老师的教育方式和人格魅力，使得文章内容更加丰富和感人。然而，在一些段落中，作者可以进一步展开论述，提供更多的例子来支持自己的观点，使文章更加充实。总体而言，这是一篇优秀的作文，反映了作者良好的写作能力和对老师的深刻理解。\", \"excellent_sentences\": [{\"analysis\": \"这句话运用了生动的语言和形象的表达，生动地描绘了老师充满活力的教学风格以及她对学生的积极影响。\", \"sentence\": \"她的课堂总是充满活力，她用她的热情感染着我们，让我们对学习充满了兴趣。\"}]}',1,'记叙文'),(11,'美丽的长白山','长白山，这座巍峨壮丽的自然奇观，坐落在中国东北的边陲，是中朝两国的界山，也是满族的发祥地之一。它以其雄伟的山势、丰富的自然资源和独特的文化底蕴，吸引着无数游客和探险家前来探秘。\n\n长白山的美丽，不仅仅在于它的高耸入云的山峰，更在于它那变幻莫测的天池。长白山天池，宛如一块碧玉镶嵌在群山之中，是火山喷发后形成的天然湖泊。湖水清澈见底，倒映着周围的雪山和蓝天白云，美得令人屏息。传说中，天池是仙女沐浴的地方，因此又被誉为“龙潭圣水”。每年夏季，当冰雪融化，天池便呈现出一片生机勃勃的景象，碧波荡漾，鸟语花香，让人仿佛置身于仙境。\n\n除了天池，长白山还有着丰富的森林资源和珍稀的野生动物。这里的原始森林覆盖率极高，树木郁郁葱葱，种类繁多，是许多珍稀动物的家园。走在森林中，你可以听到鸟儿的歌唱，感受到清新的空气，仿佛所有的烦恼都随着林间的微风飘散而去。\n\n长白山的四季景色各异，春日里，山花烂漫，生机盎然；夏日里，绿意盎然，清凉宜人；秋日里，层林尽染，五彩斑斓；冬日里，银装素裹，分外妖娆。每个季节都有它独特的魅力，让人流连忘返。\n\n长白山不仅是一座自然宝库，也是一座历史文化名山。在这里，你可以感受到满族文化的深厚底蕴，了解到长白山在清朝时期的特殊地位。长白山神庙、长白山碑林等历史遗迹，记录了这片土地的沧桑与变迁。\n\n长白山，这座美丽而神秘的山脉，以其独特的自然风光和丰富的文化内涵，成为了中国乃至世界的一张生态名片。无论是寻求自然美景的旅行者，还是探索历史文化的学者，长白山都是一个不容错过的地方。在这里，你可以感受到大自然的鬼斧神工，体验到文化的博大精深，让你的心灵得到一次真正的洗礼。','初中',90,'2024-11-11 07:19:27','{\"dimensions\": [{\"name\": \"内容立意\", \"score\": 18, \"comment\": \"文章立意明确，能够围绕长白山这一主题展开，并有一定的深度，展现了长白山的多重价值和吸引力。\"}, {\"name\": \"结构布局\", \"score\": 19, \"comment\": \"文章结构合理，层次清晰，能够自然地引导读者从长白山的地理位置到自然景观，再到文化历史，逻辑性强。\"}, {\"name\": \"语言表达\", \"score\": 27, \"comment\": \"语言表达流畅，修辞得当，能够使用丰富的词汇和句式，增强了文章的表现力。\"}, {\"name\": \"书写规范\", \"score\": 26, \"comment\": \"标点使用正确，几乎没有错别字，格式规范，体现了良好的书写习惯。\"}], \"highlights\": [{\"point\": \"文章详细介绍了长白山的自然风光和文化价值，内容丰富。\", \"detail\": \"文章不仅描述了长白山的地理位置和自然景观，还涉及了其历史文化和生态意义，展现了作者对长白山的全面了解。\"}], \"suggestions\": [{\"issue\": \"文章在某些部分的叙述上略显平淡，缺乏生动的细节。\", \"solution\": \"建议在描写长白山的自然景观和人文景观时，加入更多的具体细节，如野生动物的种类、历史遗迹的特色等，以增强文章的吸引力。\"}], \"total_score\": 90, \"overall_review\": \"总体来看，文章内容充实，结构合理，语言流畅，是一篇优秀的作文。但仍有提升空间，可以在细节描写和情感表达上进一步加强。\", \"excellent_sentences\": [{\"analysis\": \"这句话运用了比喻的修辞手法，形象地描绘了长白山天池的美丽和独特性，增强了文章的文学性。\", \"sentence\": \"长白山天池，宛如一块碧玉镶嵌在群山之中，是火山喷发后形成的天然湖泊。\"}]}',1,'记叙文');
/*!40000 ALTER TABLE `essay_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tom','2177686531@qq.com','scrypt:32768:8:1$2OJpn3dYHVO5esQZ$5ec53aef0af8a2b9f9656eeaf268ddba1968167115b34be5489cbe37babdaa501ac32dea01b431bfffd6d83018ea1b7cf881e5adf8afa5580806cb82c1dab154','2024-11-11 05:04:49'),(2,'韩丽牛仔','357171092@qq.com','scrypt:32768:8:1$XRyEs0X4lr9LQqrB$01f0af7f972b18c4fd0a671feb803468e44bb63bd4d253dcfcdf2629ba7c7b75f992580b07b8a4491d3fbc59c10e032dc584c801eb69cfe1153fd5a1d5f4e0c7','2024-11-11 05:28:28'),(3,'浩子鸽','88888888@qq.com','scrypt:32768:8:1$gGVNBr5uPNiw8hw4$b2b20288e08409460ddc26ffb161773b1b86d4887908fba6e53b8f48b8e9c5ca3fb7b18dea4d3e3feffa451d0b4b15a9bc0cb79368a8d98d3fb451fd98940679','2024-11-11 05:47:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 16:40:23
