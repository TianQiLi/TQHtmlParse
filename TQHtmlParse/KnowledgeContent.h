//
//  KnowledgeContent.h
//  ieltsFighting
//
//  Created by litianqi on 15/12/22.
//  Copyright © 2015年 yy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HtmlElement.h"
#import "HtmlParser.h"

static const int textDefaultFontSize = 16;

typedef NS_ENUM(NSUInteger, KnowledgeContentType) {
    KnowledgeContentTypeText,
    KnowledgeContentTypeImg,
    
    KnowledgeContentTypeCnt,
};

@interface KnowledgeContentImage : NSObject

@property (nonatomic) NSString* imgUrl;
@property (nonatomic, assign) CGSize size;

@end

@interface KnowledgeContent : NSObject

@property (nonatomic, assign, readonly) KnowledgeContentType type;

- (instancetype)initWithGumboNode:(HtmlElement*)node;
- (void)appendWithNode:(HtmlElement*)node;

- (KnowledgeContentImage*)imageContent;
- (NSAttributedString*)textContent;

@end
