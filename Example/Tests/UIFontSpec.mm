#import <Cedar/Cedar.h>
#import <UIKitPlus/UIFont+Allocation.h>

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(UIFontSpec)

#define DEFAULT_FONT_SIZE 14.0

describe(@"UIFont", ^{
    __block UIFont *subject;
    
    describe(@"when creating a HelveticaNeue font with type 'bold' ", ^{
        
        beforeEach(^{

            [UIFont setBaseFontFamilyName:@"HelveticaNeue"];
            subject = [UIFont fontWithType:FontTypeBold andSize:DEFAULT_FONT_SIZE];
        });
        
        it(@"should have the font name HelveticaNeue-Bold", ^{
            
            subject.fontName should equal(@"HelveticaNeue-Bold");
            subject.pointSize should equal(DEFAULT_FONT_SIZE);
        });
    });

    describe(@"When creating Avenir Next fonts by type", ^{

        beforeEach(^{

            [UIFont setBaseFontFamilyName:@"AvenirNext"];
        });

        it(@"Should create a regular font", ^{

            [UIFont fontWithType:FontTypeRegular andSize:DEFAULT_FONT_SIZE].fontName should equal(@"AvenirNext-Regular");
        });

        it(@"Should create a bold font", ^{

            [UIFont fontWithType:FontTypeBold andSize:DEFAULT_FONT_SIZE].fontName should equal(@"AvenirNext-Bold");
        });

        it(@"Should create a medium font", ^{

            [UIFont fontWithType:FontTypeMedium andSize:DEFAULT_FONT_SIZE].fontName should equal(@"AvenirNext-Medium");
        });

        it(@"Should create a demi bold font", ^{

            [UIFont fontWithType:FontTypeDemiBold andSize:DEFAULT_FONT_SIZE].fontName should equal(@"AvenirNext-DemiBold");
        });

        it(@"Should create a demi bold italic font", ^{

            [UIFont fontWithType:FontTypeDemiBold andSize:DEFAULT_FONT_SIZE].italicized.fontName should equal(@"AvenirNext-DemiBoldItalic");
        });

        it(@"Should create a ultra light italic font", ^{

            [UIFont fontWithType:FontTypeUltraLight andSize:DEFAULT_FONT_SIZE].italicized.fontName should equal(@"AvenirNext-UltraLightItalic");
        });
    });
});

SPEC_END
