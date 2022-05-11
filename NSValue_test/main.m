//
//  main.m
//  NSValue_test
//
//  Created by Gregory Casamento on 5/11/22.
//

#import <Foundation/Foundation.h>

struct _DoubleStruct {
    double val1;
    double val2;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Test NSValue");
        
        struct _DoubleStruct ds = { 0.1, 0.2 };
        
        NSValue *v1 = [NSValue valueWithPointer: &ds];
        struct _DoubleStruct *ds1 = [v1 pointerValue];
        NSLog(@"valueWithPointer: ds1 values %f %f", ds1->val1, ds1->val2);
        
        NSValue *v2 = [NSValue valueWithBytes:&ds objCType:@encode(struct _DoubleStruct)];
        struct _DoubleStruct ds2;
        [v2 getValue: &ds2];
        NSLog(@"valueWithBytes:objcType: ds1 values %f %f", ds2.val1, ds2.val2);
        
        NSValue *v3 = [NSValue value:&ds withObjCType:@encode(struct _DoubleStruct)];
        struct _DoubleStruct ds3;
        [v3 getValue: &ds3];
        NSLog(@"value:withObjCType: ds1 values %f %f", ds3.val1, ds3.val2);
    }
    
    return 0;
}
