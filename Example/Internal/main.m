#import <Foundation/Foundation.h>
#import "acceleration.h"


void runAccelerationTest()
{
    const UInt32 stride = 3;
    const UInt32 srcBufferSize = 3000000;
    const UInt32 dstBufferSize = stride * srcBufferSize;
    
    UInt8 *srcBuffer = calloc(1, srcBufferSize);
    UInt8 *dstBuffer = calloc(1, dstBufferSize);
    
    srand48(time(NULL));
    for (UInt32 i = 0; i < srcBufferSize; i++) {
        srcBuffer[i] = rand() % UINT8_MAX;
    }
    
    CopyBytesWithStride(srcBuffer, dstBuffer, srcBufferSize, stride);
    
    BOOL testPassed = YES;
    for (UInt32 i = 0; i < srcBufferSize; i++) {
        if (srcBuffer[i] != dstBuffer[i * stride]) {
            testPassed = NO;
            break;
        }
    }
    
    NSLog(@"CopyBytesWithStride test... %@", testPassed ? @"Passed" : @"Not passed");
}


int main(int argc, char *argv[])
{
    runAccelerationTest();
}
