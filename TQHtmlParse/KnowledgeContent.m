//
//  KnowledgeContent.m
//  ieltsFighting
//
//  Created by litianqi on 15/12/22.
//  Copyright © 2015年 yy. All rights reserved.
//

#import "KnowledgeContent.h"
#define kLCUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation KnowledgeContentImage

@end

@interface KnowledgeContent ()

@property (nonatomic) NSMutableAttributedString* textStorage;
@property (nonatomic) KnowledgeContentImage* imageStorage;

@end

@implementation KnowledgeContent

- (instancetype)initWithGumboNode:(HtmlElement*)node{
    if (self = [super init]) {
        if ([[node getType] isEqualToString:@"image"]) {
            _type = KnowledgeContentTypeImg;
            _imageStorage = [[KnowledgeContentImage alloc] init];
            _imageStorage.imgUrl = [node getUrl];
            _imageStorage.size = CGSizeMake(640, 400);
            int width = [node getWidth];
            int height = [node getHeight];
            if (width * height != 0) {
                _imageStorage.size = CGSizeMake(width, height);
            }
        } else {
            _type = KnowledgeContentTypeText;
            _textStorage = [[NSMutableAttributedString alloc] initWithString:[node getValue]];
        }
    }
    
    return self;
}

- (UIColor *)colorFromHexString:(NSString*)hexStr
{
    NSString *str = [hexStr stringByReplacingOccurrencesOfString:@"#" withString:@"0x"];
    //先以16为参数告诉strtoul字符串参数表示16进制数字，然后使用0x%X转为数字类型
//    unsigned long color = strtoul([str UTF8String],0,16);
    //strtoul如果传入的字符开头是“0x”,那么第三个参数是0，也是会转为十六进制的,这样写也可以：
    unsigned long color = strtoul([str UTF8String],0,0);
    return kLCUIColorFromRGB(color);
}

- (void)appendWithNode:(HtmlElement*)node
{
    if ([@"\n" isEqualToString:[node getValue]] && [self.textStorage.string hasSuffix:@"\n\n"]) {
        return;
    }
    
    
    NSMutableDictionary* attr = @{}.mutableCopy;
    
    [attr setObject:[node getBold]?[UIFont boldSystemFontOfSize:textDefaultFontSize]:[UIFont systemFontOfSize:textDefaultFontSize] forKey:NSFontAttributeName];
    
    if ([node getColor] && [node getColor].length > 0) {
        [attr setObject:[self colorFromHexString:[node getColor]] forKey:NSForegroundColorAttributeName];
    }
    
    if ([node getUrl] && [node getUrl].length > 0) {
        [attr setObject:[NSURL URLWithString:[node getUrl]] forKey:NSLinkAttributeName];
    }
    
    NSMutableAttributedString* astr = [[NSMutableAttributedString alloc] initWithString:[node getValue] attributes:attr];
    [self.textStorage appendAttributedString:astr];
    
}

- (KnowledgeContentImage*)imageContent
{
    if (_type != KnowledgeContentTypeImg) {
        NSAssert(_type != KnowledgeContentTypeImg, @"no image in text content");
    }
    return self.imageStorage;
}

- (NSAttributedString*)textContent
{
    if (_type != KnowledgeContentTypeText) {
        NSAssert(_type != KnowledgeContentTypeText, @"no text in image content");
    }
    return self.textStorage;
}

@end
