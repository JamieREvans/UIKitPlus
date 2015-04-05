#import <Cedar/Cedar.h>
#import <UIKitPlus/UIImageView+Allocation.h>
#import <UIKitPlus/UIImageView+Framing.h>
#import <UIKitPlus/UIView+Framing.h>

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

#define IMAGE_NAME @"UIKitPlus-sample"

SPEC_BEGIN(UIImageViewSpec)

describe(@"UIImageView", ^{
    
    __block UIImageView *subject;

    describe(@"when creating an imageview with a frame and image", ^{
        
        beforeEach(^{
            
            subject = [UIImageView imageViewWithFrame:CGRectMake(0.0f, 0.0f, 300.0f, 300.0f)
                                             andImage:[UIImage imageNamed:IMAGE_NAME]];
        });
        
        it(@"should have respected the frame", ^{
            
            subject.width should equal(300.0f);
            subject.height should equal(300.0f);
        });
        
        it(@"should have set the image", ^{
            
            subject.image should_not be_nil;
        });
        
        it(@"should be maintaining the image aspect ratio", ^{
            
            subject.contentMode should equal(UIViewContentModeScaleAspectFill);
        });
        
        describe(@"and adjusting it's width to the image's full size", ^{
            
            beforeEach(^{
                
                [subject setWidthAndMaintainAspectRatio:subject.image.size.width];
            });
            
            it(@"should have set the height to match the image's height", ^{
                
                subject.height should equal(subject.image.size.height);
            });
        });
    });
});

SPEC_END
