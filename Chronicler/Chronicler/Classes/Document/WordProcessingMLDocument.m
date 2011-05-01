//
//  WordProcessingMLDocument.m
//  Chronicler
//
//  Created by Rusty Zarse on 4/20/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "WordProcessingMLDocument.h"


@implementation WordProcessingMLDocument

NSString * const documentXmlTemplate = @"<?xml version=\"1.0\"?>\
<?mso-application progid=\"Word.Document\"?>\
<w:wordDocument xmlns:w=\"http://schemas.microsoft.com/office/word/2003/wordml\">\
    <w:body>\
        <w:p>\
            <w:r>\
              <w:t>%@</w:t>\
            </w:r>\
        </w:p>\
    </w:body>\
</w:wordDocument>\
";

- (NSString *)getXml{
    return [NSString stringWithFormat:documentXmlTemplate, @"Hello World!"]; 
}
@end
