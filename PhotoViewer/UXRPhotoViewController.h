//
//  UXRPhotoViewController.h
//

#import <UIKit/UIKit.h>

@interface UXRPhotoViewController : UIViewController <UIGestureRecognizerDelegate, UIScrollViewDelegate>

// Pan and Zoom Scroll View.
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

// Navigation Buttons.
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

// Main image view.
@property (strong, nonatomic) UIImageView *photoImageView;

// Should the image pop or slide?
@property (nonatomic, assign) BOOL doSlideAnimation;

// List of photo URLS to download and display.
@property (copy, nonatomic) NSArray *photos;

// Index of the current Photo.
@property (assign, nonatomic,readonly) NSInteger currentPhotoIndex;

// Force-set the starting index to load for the image set.
- (void)setCurrentPhotoIndex:(NSInteger)currentPhotoIndex animated:(BOOL)animated;

// Button actions.
- (IBAction)doneButtonAction:(id)sender;
- (IBAction)leftPageArrowTouch:(id)sender;
- (IBAction)rightPageArrowTouch:(id)sender;

@end
