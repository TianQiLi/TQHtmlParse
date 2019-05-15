//
//  HtmlParseManager.h
//  edu24app
//
//  Created by litianqi on 16/1/20.
//  Copyright © 2016年 edu24ol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HtmlParseManager : NSObject
/**
 html 源码解析成文本或图片
 文本 Key:content; 类型string
 图片 Key:urlStr ; 图片用";"分号连接 ; 类型string
 @param  htmlCode  源码
 */
+ (NSDictionary *)parseDetailExtension:(NSString *)htmlCode;

+ (NSArray *)parseDetailToImgArray:(NSString *)htmlCode;
@end
