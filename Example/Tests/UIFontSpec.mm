#import <Cedar/Cedar.h>
#import <UIKitPlus/UIFont+Allocation.h>

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(UIFontSpec)

describe(@"UIFont", ^{
    __block UIFont *subject;
    
    context(@"when creating a font with type 'bold' ", ^{
        
        beforeEach(^{
            
            subject = [UIFont fontWithType:FontTypeBold andSize:14.0f];
        });
        
        it(@"should have the font name HelveticaNeue-Bold", ^{
            
            subject.fontName should equal(@"HelveticaNeue-Bold");
            subject.pointSize should equal(14.0f);
        });
    });
});

SPEC_END
