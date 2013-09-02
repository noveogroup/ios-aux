#import "acceleration.h"

void CopyBytesWithStride(UInt8 *src, UInt8 *dst, UInt32 srcSize, UInt32 stride)
{
    NSCAssert(src != NULL && dst != NULL && srcSize != 0, @"Bad arguments");
   
#if TARGET_CPU_ARM
    
    __asm__(
            "mov r5, %[src]\n\t"
            "mov r6, %[dst]\n\t"
            "1:\n\t"
            "ldrb r4, [r5], #1\n\t"
            "strb r4, [r6]\n\t"
            "add r6, r6, %[stride]\n\t"
            "cmp r5, %[lastAddr]\n\t"
            "bne 1b\n\t"
            ::[src]"r"(src), [dst]"r"(dst), [lastAddr]"r"(src+srcSize), [stride]"r"(stride):"r4", "r5", "r6"
            );
    
#else
    
    UInt8 *srcEnd = src + srcSize;
    UInt8 *dstP = dst;
    
    for (UInt8 *srcP = src; srcP < srcEnd; srcP++) {
        *dstP = *srcP;
        dstP += stride;
    }

#endif
}