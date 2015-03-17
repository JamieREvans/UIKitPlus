//
//  ArrayTests.m
//  FoundationPlus
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import <UIKitPlus/UIFont+Allocation.h>

SPEC_BEGIN(UIFontTests)

describe(@"UIFont+Allocation: ", ^{
    
    __block UIFont *resultingFont = nil;
    
    context(@"when creating a font with type 'bold' ", ^{
        
        beforeEach(^{
            
            resultingFont = [UIFont fontWithType:FontTypeBold andSize:14.0f];
        });
        
        it(@"should have the font name HelveticaNeue-Bold", ^{
            
            [[resultingFont.fontName should] equal:@"HelveticaNeue-Bold"];
        });
    });
});

SPEC_END
