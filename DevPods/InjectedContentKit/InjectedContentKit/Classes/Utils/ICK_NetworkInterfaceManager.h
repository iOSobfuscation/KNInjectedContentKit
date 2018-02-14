//
//  ICK_NetworkInterfaceManager.h
//  Momoji
//
//  Created by yuan he on 2016/11/9.
//  Copyright © 2016年 yuan he. All rights reserved.
//

#import <Foundation/Foundation.h>

//服务端接口参数

#define kTimestamp      @"timestamp"
#define kModuleID       @"moduleId"
#define kModuleName     @"moduleName"
#define kTabs           @"modules"
#define kMenus          @"tabs"
#define kTabTitle       @"tabTitle"
#define kTabID          @"tabId"
#define kCacheVersion   @"cv"

#define kPageIndex      @"i"
#define kPageSize       @"s"
#define kCardType       @"style"
#define kLastPage       @"lastPage"
#define kList           @"list"
#define kImage          @"image"
#define kTitle          @"title"
#define kPostTime       @"postTime"
#define kDeadLine       @"deadLine"
#define kTags           @"tags"
#define kDetailURL      @"link"
#define kIntroduce      @"introduce"
#define kAuthorID       @"authorId"
#define kAuthorName     @"authorName"
#define kAuthorAvatar   @"authorHeader"
#define kAuthorLink     @"authorLink"
#define kAuthorIdentity @"idName"
#define kAuthorId       @"authorId"
#define kFollowers      @"fans"
#define kRemainKey      @"remainKey"
#define kQuestPrize     @"questPrize"
#define kQuestObjective @"questObjective"
#define kHasCover       @"hasCover"
#define kCoverString    @"coverString"
#define kQuestType      @"questType"
#define kReaction       @"reaction"
#define kShowReact      @"displayReaction"
#define kTitleColor     @"titleColor"

#define kNewsLink       @"lk"
#define kEmail          @"el"
#define kToken          @"tokentt"
#define kPassword       @"pd"
#define kAvatar         @"avatar"
#define kNickname       @"name"
#define kAutoLogin      @"fg"
#define kKey            @"key"
#define kHasUpdate      @"haveNew"
#define kHasAuthorUpdate    @"authorHaveNew"
#define kFirstItemPostTime  @"td"
#define kLastItemPostTime   @"tu"
#define kIsFirstLoad        @"ft"
#define kType           @"type"
#define kUID            @"uid"

#define kSearchPred     @"qs"
#define kSearchPubID    @"tid"
#define kPubSearchType  @"_PubSearchType"


typedef NS_ENUM(NSInteger, MMURLType) {
    MMURLTypeTabs,
    MMURLTypeMenus,
    MMURLTypeCardList,
    MMURLTypeAuthor,///<作者
    MMURLTypeNewsDetail,///<新闻详情页面
    MMURLTypeNewsReport,///<新闻详情页面Report
    MMURLTypeNewsPostMyOpinion,///<新闻详情页面发送我的观点
    MMURLTypeNewsCommentList,///<评论列表
    MMURLTypeNewsPopularCommentList,///<热门评论列表
    MMURLTypeNewsCommentZan,///<评论点赞
    MMURLTypeNewsCommentAdd,///<添加评论
    MMURLTypeGetSubComments,///<获取单条及其子评论
    MMURLTypeGameCommentList,///<游戏评论列表
    MMURLTypeGamePopularCommentList,///<游戏热门评论列表
    MMURLTypeGameCommentZan,///<游戏评论点赞
    MMURLTypeGameCommentAdd,///<游戏添加评论
    MMURLTypeGameGetSubComments,///<游戏获取单条及其子评论
    MMURLTypePubPostCommentList,///<论坛详情评论列表
    MMURLTypePubPostPopularCommentList,///<论坛详情热门评论列表
    MMURLTypePubPostCommentZan,///<论坛详情评论点赞
    MMURLTypePubPostCommentAdd,///<论坛详情添加评论
    MMURLTypePubPostGetSubComments,///<论坛详情添获取单条及其子评论
    MMURLTypeNotifications,///<消息中心
    MMURLTypeNotificationsDelete,///<删除消息
    MMURLTypeSignIn,
    MMURLTypeSignOut,
    MMURLTypeSignUp,
    MMURLTypeModifyNickname,
    MMURLTypeModifyAvatar,
    MMURLTypeModifyUserInfo,
    MMURLTypeForgetPassword,
    MMURLTypeSavekey,
    MMURLTypeFollowWriter,
    MMURLTypeUnfollowWriter,
    MMURLTypeFollowWriterList,
    MMURLTypeSavedKeyList,
    MMURLTypeDeleteSavedKey,
    MMURLTypeUpLevel,
    MMURLTypeEmailCheck,
    MMURLTypeThirdPartyLogin,
    MMURLTypeThirdPartyBind,
    MMURLTypePushRegister,
    MMURLTypeBindEmail,
    MMURLTypeGameDetail,
    MMURLTypeSavedGames,
    MMURLTypeSaveGame,
    MMURLTypeRemoveGame,
    MMURLTypeShareConfig,///<分享配置
    MMURLTypeFeedback,///<用户反馈
    MMURLTypePostImage,///<发送图片
    MMURLTypePostContent,///<发送帖子
    MMURLTypePostDelete,///<删除帖子
    MMURLTypeMyPost,///<我发布的帖子
    MMURLTypePubPostList,///<论坛帖子列表
    MMURLTypePubPostDetail,///<帖子详情
    MMURLTypePubDetail,///<论坛详情信息
    MMURLTypeFollowTopics,///<关注的论坛列表
    MMURLTypeTopicFollow,///<关注论坛
    MMURLTypeTopicUnfollow,///<取消关注论坛
    MMURLTypePubCollectItems,///<论坛Item
    MMURLTypeAccusation,///<用户举报
    MMURLTypePubPostFollow,///<关注帖子
    MMURLTypePubPostUnfollow,///<取消关注帖子
    MMURLTypePubPostFollowList,///<关注的帖子列表
    MMURLTypePubPostFollowIDList,///<关注的帖子列表(只有ID)
    MMURLTypePubPostLike,///<帖子点赞
    MMURLTypePubPostUnlike,///<帖子取消点赞
    MMURLTypeOnePubPostSearch,///<某个论坛的帖子搜索
    MMURLTypeAllPubPostSearch,///<所有论坛帖子搜索
    MMURLTypePubSearch,///<论坛搜索
    MMURLTypePubSearchSuggesion,///<搜索建议
    MMURLTypeAllPubs,///<所有论坛
};

typedef NS_ENUM(NSInteger, MMLoadType) {
    MMLoadTypeRefresh,
    MMLoadTypeMore,
};

@interface ICK_NetworkInterfaceManager : NSObject

+ (NSString *)URLStringWithType:(MMURLType)type;

@end
