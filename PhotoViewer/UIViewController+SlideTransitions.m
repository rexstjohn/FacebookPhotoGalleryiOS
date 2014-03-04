//
//  UIViewController+SlideTransitions.m

#import <QuartzCore/QuartzCore.h>
#import "UIViewController+SlideTransitions.h"
#import "UIView+ImageCapture.h"
#import "UIView+SimpleSizing.h"

@implementation UIViewController (SlideTransitions)

static const CGFloat kTransitionTime = 0.15;
static const double kDelayInSeconds = 0.1;
static const int kCenterOffset = 100;

+(void)stopScrollingInViewController:(UIViewController*)viewController{
    
    if([viewController isKindOfClass:[UITableViewController class]]){
        UITableViewController* tableViewController = (UITableViewController*)viewController;
        [tableViewController.tableView setContentOffset:tableViewController.tableView.contentOffset animated:NO];
    }
}

- (void) transitionFromView:(UIView*)fromView
                     toView:(UIView*)toView
         usingContainerView:(UIView*)container
              andTransition:(NSString*)transitionType{
    
    __block CGPoint targetOffset = fromView.center;
    __block BOOL transitionFromSameView = [toView isEqual:fromView];
    
    // In some cases, we want to perform the illusion of a transition when we are really just changing data in the same view.
    // In those cases, we don't need to perform this position modification.
    __block CGPoint centerOffset  = fromView.center;
    
    __block BOOL useAnimatedTransition = (transitionType != nil)?YES:NO;
    __block BOOL isLeftToRight = ([transitionType isEqualToString:kCATransitionFromRight])?YES:NO;
    
    if(transitionFromSameView == NO){
        CGFloat horizontalOffset = (isLeftToRight == YES)?[toView sizeWidth] + kCenterOffset : -([toView sizeWidth] + kCenterOffset);
        centerOffset = CGPointMake(fromView.center.x + horizontalOffset, fromView.center.y);
        [toView setCenter:centerOffset];
        [container insertSubview:toView belowSubview:fromView];
    }
    UIView *blockToView = toView;
    UIView *blockFromView = fromView;
    UIView *blockContainerView = container;
    
    if(useAnimatedTransition == NO){
        if(transitionFromSameView == NO){
            [blockToView setCenter:targetOffset];
            [blockFromView setCenter:centerOffset];
            [blockFromView removeFromSuperview];
        }  else {
            [blockToView setCenter:targetOffset];
            [blockFromView setCenter:centerOffset];
        }
    } else {
        
        [UIView animateWithDuration:kTransitionTime animations:^{
            
            CATransition *animation = [CATransition animation];
            [animation setDuration:kTransitionTime];
            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            [animation setType:kCATransitionMoveIn];
            [animation setSubtype:transitionType];
            [[blockContainerView layer] addAnimation:animation forKey:@"TransitionViews"];
            if(transitionFromSameView == NO){
                [blockToView setCenter:targetOffset];
                [blockFromView setCenter:centerOffset];
            }
        } completion:^(BOOL finished) {
            if(transitionFromSameView == NO){
                [blockFromView removeFromSuperview];
            }
        }];
    }
}

@end
