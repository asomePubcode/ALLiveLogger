//
//  AppDelegate.m
//  Logger-iphone
//
//  Created by 廖亚雄 on 2019/7/26.
//  Copyright © 2019 廖亚雄. All rights reserved.
//

#import "AppDelegate.h"

#if __has_include("LiveLogging.h")
#import "LiveLogging.h"
#else
#import "Logging.h"
#endif



@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
#ifdef LiveLog
    [LiveLogging setLogLevel:DDLogLevelAll];
#else
    [Logging setLogLevel:DDLogLevelAll];
#endif
    
//    如果要上传服务端
//    [Logging setLogLevel:DDLogLevelAll rollCallback:^(NSString *filePath) {
//
//    }];
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(log)
                                   userInfo:nil
                                    repeats:YES];

    return YES;
}

- (void)log {
    NSDictionary *json = @{@"name":@"asml",@"age":@12,@"loc":@"hunan"};
    DDLogInfo(@"%@",json);
    DDLogError(@"Paper Jam!");
    DDLogWarn(@"Low toner");
    DDLogInfo(@"Printing SalesProjections.doc");
    DDLogVerbose(@"六国被秦国灭亡的教训，是许多文史家关注的话题。仅“三苏”就每人写了一篇《六国论》。苏轼的《六国论》，针对六国久存而秦速亡的对比分析，突出强调了“士”的作用。苏轼认为，六国诸侯卿相皆争养士，是久存的原因。只要把那些“士”养起来，老百姓想造反也找不到带头人了，国家就可以安定了。苏辙的《六国论》则是针对六国不免于灭亡的史实，指出他们相继灭亡的原因是不能团结一致，共同抗战，灭国是咎由自取。苏洵的《六国论》不同于以上两篇。苏洵不是就事论事，而是借题发挥。苏洵的写作目的不在于总结六国灭亡的教训，而在于警告宋朝统治者勿蹈六国灭亡的覆辙。借古喻今，以谈论历史供当今统治者借鉴，这是苏洵高出其二子的地方。从历史情况看，六国灭亡的原因并不是“赂秦”。六国的失败，主要是政治上保守，因循守旧，不重视改革，不能坚持“合纵”政策去对付秦国的“连横”政策，被秦国远交近攻的手段各个击破。另一方面，秦孝公任用商鞅变法，使秦国国力大增，具备了统一中国的实力。加上战国长期的战乱，民不聊生，由分裂到统一，符合人们的愿望。秦国统一中国，是历史发展的必然趋势。苏洵对此并非不知，他在文中也承认这一点：“以赂秦之地，封天下之谋臣；以事秦之心，礼天下之奇才，并力西向，则吾恐秦人食之不得下咽也。”然而作者用意不在此，他的意图是点明赂秦是六国灭亡的原因，以此警告宋朝统治者，不要用贿赂的方法对待契丹和西夏，要用武力，要抵抗。明代何仲默说过：“老泉论六国赂秦，其实借论宋赂契丹之事，而卒以此亡，可谓深谋先见之识矣。”宋朝建国后，宋太祖片面地接受唐朝藩镇割据，尾大不掉，以至灭亡的教训，采取了“虚外实内”的政策，削弱边关的实力，调集重兵驻守京城。结果造成了边关的空虚。辽国乘虚而入，屡犯边疆。宋太宗继位后，曾两次派兵击辽，均遭失败。后宋太宗两次进攻幽州，企图夺回幽云十六州，又遭败绩。真宗景德元年（1004年），辽大兵压境，直逼澶州城下（今河南濮阳），威胁汴京开封。于是，宋与辽签定了“澶渊之盟”，答应向辽输岁币银十万两，绢二十万匹。到了仁宗庆历二年（1042年），辽再次要挟，宋只得增加币银十万两，绢十万匹。第二年（1043年），西夏也来要，又是赐岁币银十万两，绢十万匹，茶三万斤。人民的血汗就在这种纳赐之中，付之东流。苏洵对此痛心疾首，他借古喻今，纵横恣肆，痛陈利弊，对当权者进行规劝，希望其改弦易辙，增强国力，与敌斗争。苏洵的议论虽不无可商榷处，但总的立论是正确的，并且不幸为苏洵所言中：就在苏洵死后六十年，终于发生了“靖康之变”（1126年），北宋重蹈了六国的覆辙，为后起的金所灭，徽、钦二帝被俘，客死异国他乡。《六国论》除去在立论上具有借题发挥、借古喻今的写作特点外，在论证的严密性、语言的生动性上也堪称典范。第一段的逻辑性是非常严密的。作者开篇亮出观点：“六国破灭，非兵不利，战不善，弊在赂秦。”开宗明义，直截了当，使读者一眼就抓住了论者的中心。然后，作者解释论点：“赂秦而力亏，破灭之道也。”这就指出了贿赂的危害，言简意赅，要言不烦。再后，作者设问：“六国互丧，率赂秦耶?”答曰：“不赂者以赂者丧。盖失强援，不能独完。”这就使得文章逻辑严密，无懈可击。最后一句总结全段：“故曰弊在赂秦也。”这一段起到了“纲”的作用，后面的二、三两段实际上是围绕第一段展开的。本文的语言生动有力。议论性的句子简捷有力，叙述性的句子生动感人。比如：“思厥先祖父，暴霜露，斩荆棘，以有尺寸之地。子孙视之不甚惜，举以予人，如弃草芥。今日割五城，明日割十城，然后得一夕安寝。起视四境，而秦兵又至矣。”这些叙述语言本身带有主观感情，还有描述的特点。作者还运用引用、对比、比喻等手法，使语言灵活多样，增强了表达效果。本文的句式也整饬有度，特别是四字句占了一定比例，读起来铿锵有力，掷地有声，富有节奏感。文章史实论据典型、充分，分析、对比、比喻等论证具有很强的逻辑性和说服力，句式多变，感情激切，富有感染力。本文虽是史论，但作者本意不在于论证六国灭亡的原因，而在于引出历史教训，讽谏北宋王朝放弃妥协苟安的政策，警惕重蹈六国灭亡的覆辙。欧阳修评价苏洵的文章说：“吾阅文士多矣，独喜尹师鲁、石守道，然意犹有所未足，今见子（苏洵）之文，吾意足矣。”的确如此，苏洵此文，奔腾上下，纵横出入，气势犹如江河决口。他见识深远，眼光犀利，议论精辟透彻，足警世人。无怪乎本文近千年来盛传不衰！");
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}



- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
