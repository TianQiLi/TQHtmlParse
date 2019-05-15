//
//  HtmlElement.h
//  HtmlParser
//
//  html源码解析后的结构化数据
//
//  Created by jeffxie on 10/26/15.
//  Copyright (c) 2015 100edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HtmlElement : NSObject {
    
@private
    NSString *_type;     // html元素类型：值为text，表示文本；值为image，表示图片；值为link，表示超链接；
    NSString *_value;    // html元素值：type为text文本、link超链接时，value为文本内容；type为其它类型时，value为空；
    NSString *_url;      // html链接：type为image图片、link超链接时，url为html超链接；type为其它类型时，url为空；
    int      _width;     // html图片宽度，单位px：type为image图片时，width为图片宽度；type为其他类型时，width为0；
    int      _height;    // html图片高度，单位px：type为image图片时，height为图片高度；type为其他类型时，height为0；
    int      _bold;      // value文本的粗体标识，0为普通字体，1为粗体
    NSString *_color;    // value文本的字体颜色，格式："#ffffff"
}

// html元素初始化函数
-(HtmlElement*) initWithElement:(NSString*)type
                    setValue:(NSString*)value
                    setUrl:(NSString*)url
                    setWidth:(int)width
                    setHeight:(int)height
                    setBold:(int)bold
                    setColor:(NSString*)color;

// html元素数据设置函数
-(void) setElement:(NSString*)type
          setValue:(NSString*)value
            setUrl:(NSString*)url
          setWidth:(int)width
         setHeight:(int)height
           setBold:(int)bold
          setColor:(NSString*)color;

// 获取html元素类型
-(NSString*) getType;

// 获取html元素直
-(NSString*) getValue;

// 获取html元素超链接
-(NSString*) getUrl;

// 获取html元素宽度
-(int) getWidth;

// 获取html元素高度
-(int) getHeight;

// 获取文本粗体标识
-(int) getBold;

// 获取文本字体颜色
-(NSString*) getColor;

@end
