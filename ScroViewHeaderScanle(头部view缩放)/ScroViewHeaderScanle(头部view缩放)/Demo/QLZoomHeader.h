//
//  QLZoomHeader.h
//  ScroViewHeaderScanle(头部view缩放)
//
//  Created by 公智能 on 2021/5/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QLZoomHeader : UIView
///background image insets
@property (nonatomic, assign) UIEdgeInsets backgroundImageInsets;

///background image
@property (nonatomic, strong) UIImage *backgroundImage;
@end


@interface UIScrollView (XLHeaderExtension)

//scrollview's extension
@property (nonatomic, strong) QLZoomHeader *xl_zoomHeader;

@end


NS_ASSUME_NONNULL_END
