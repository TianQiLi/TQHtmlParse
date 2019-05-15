//
//  HtmlParseManager.m
//  edu24app
//
//  Created by litianqi on 16/1/20.
//  Copyright © 2016年 edu24ol. All rights reserved.
//

#import "HtmlParseManager.h"
#import "KnowledgeContent.h"
//#import "Question_HomeWorkModel.h"
#import "HtmlElement.h"
@implementation HtmlParseManager
+ (NSDictionary*)parseDetailExtension:(NSString*)htmlCode
{
    if (htmlCode==nil ||htmlCode.length==0) {
        return nil;
    }
    
    NSArray <HtmlElement*>* arr = [HtmlParser parse:htmlCode];
    NSMutableArray <KnowledgeContent *>* tempArr = @[].mutableCopy;
    NSString * strUrl=@"";
    for (HtmlElement* node in arr) {
        KnowledgeContent* tail = tempArr.lastObject;
        if (tail && tail.type == KnowledgeContentTypeText && ![[node getType] isEqualToString:@"image"]) {
            [tail appendWithNode:node];
        } else {
            KnowledgeContent* content = [[KnowledgeContent alloc] initWithGumboNode:node];
            if ([[node getType] isEqualToString:@"image"]) {
                strUrl=[NSString stringWithFormat:@"%@;%@",strUrl,content.imageContent.imgUrl];
            }
            [tempArr addObject:content];
        }
    }
    
    if (strUrl.length>0) {
        strUrl=[strUrl substringFromIndex:1];
    }
    NSString * strContent=@"";
    for (NSInteger i=0; tempArr&& i<tempArr.count; ++i) {
        KnowledgeContent * content=[tempArr objectAtIndex:i];
        if (content.type==KnowledgeContentTypeText) {
             NSString * nodeText=[content.textContent string];
             strContent=[NSString stringWithFormat:@"%@%@",strContent,nodeText];
        }
    }
    strContent = [strContent stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSDictionary * dicResults=@{@"content":strContent,@"urlStr":strUrl};
    return dicResults;
    
}

+ (NSArray *)parseDetailToImgArray:(NSString*)htmlCode{
//    NSString * test = @"<html><div>qq<img src=\"http://www.w3school.com.cn/i/eg_tulip.jpg\" /></div><li><img src=\"https://imgsa.baidu.com/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=ca5abb5b7bf0f736ccf344536b3cd87c/29381f30e924b899c83ff41c6d061d950a7bf697.jpg\" />qq</li><img src=\"http://img01.taopic.com/141128/240418-14112P9345826.jpg\" />11111111</html>";
    NSDictionary *dic = [self parseDetailExtension:htmlCode];
    if (dic) {
        NSString * imgText = dic[@"urlStr"] ? dic[@"urlStr"] : @"";
        NSArray * arrayImg = [imgText componentsSeparatedByString:@";"];
        return arrayImg;
    }
    return [NSArray new];
}

@end
