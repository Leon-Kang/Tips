#import <UIKit/UIKit.h>
#import "MyClass.h"
int main(int argc, char *argv[])
{
NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

//添加我们的测试代码

NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"雨松MOMO",@"name",@"15810463139",@"number", nil];

//得到词典的数量
int count = [dictionary count];
NSLog(@"词典的数量为： %d",count);

//得到词典中所有KEY值
NSEnumerator * enumeratorKey = [dictionary keyEnumerator];

//快速枚举遍历所有KEY的值
for (NSObject *object in enumeratorKey) {
NSLog(@"遍历KEY的值: %@",object);
}

//得到词典中所有Value值
NSEnumerator * enumeratorValue = [dictionary objectEnumerator];

//快速枚举遍历所有Value的值
for (NSObject *object in enumeratorValue) {
NSLog(@"遍历Value的值: %@",object);
}

//通过KEY找到value
NSObject *object = [dictionary objectForKey:@"name"];

if (object != nil) {
NSLog(@"通过KEY找到的value是: %@",object);
}

int retVal = UIApplicationMain(argc, argv, nil, nil);
[pool release];
return retVal;
}
