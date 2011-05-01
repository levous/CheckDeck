//
//  PngImageTransformer.m
//  Chronicler
//
//  Created by Rusty Zarse on 4/30/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "PngImageTransformer.h"


@implementation PngImageTransformer


// Enable reverse transformations
+ (BOOL)allowsReverseTransformation {
	return YES;
}

// This method is called automatically during the transform
+ (Class)transformedValueClass {
	return [UIImage class];
}

// Transform the value into the type that can be stored (i.e. NSData)
// This method is called automatically during the transform
- (id)transformedValue:(id)value {
	NSData *data = UIImagePNGRepresentation(value);
	return data;
}

// Transform the stored value into the type that we want/need
// This method is called automatically during the transform
- (id)reverseTransformedValue:(id)value {
	UIImage *uiImage = [[UIImage alloc] initWithData:value];
	return [uiImage autorelease];
}


@end
