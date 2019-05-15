//
//  HtmlParser.h
//  HtmlParser
//
//  html源码解析类，输入html源代码，输出html中的文本、图像结构化数据
//
//  Created by jeffxie on 10/26/15.
//  Copyright (c) 2015 100edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HtmlParser : NSObject {
    
}

// html源码解析接口
// 注意：使用完NSMutableArray*需自行release
// @args                           html    html源码
// @return              NSMutableArray*    文本、图像结构化数据（结构化数据类型为HtmlElement）
+(NSMutableArray*) parse: (NSString*)html;

@end
