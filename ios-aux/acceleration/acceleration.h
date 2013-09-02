#import <Foundation/Foundation.h>

/*
 
 ASM-accelerated functions
 
 */


/*
 
 Copies bytes from src to dst with stride.
 i-th byte of src goes to i*stride -th byte of dst (i = 0 for first byte of src)
 
 */
void CopyBytesWithStride(UInt8 *src, UInt8 *dst, UInt32 srcSize, UInt32 stride);
