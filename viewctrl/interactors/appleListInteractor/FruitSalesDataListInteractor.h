#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FruitSalesDataListInteractor : NSObject

+(FruitSalesDataListInteractor *) shareInstance;

+(void) requestSalesList2;
+(void) requestSalesList3;

@end

NS_ASSUME_NONNULL_END
