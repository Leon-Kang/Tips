NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
[center addObserverForName:nil
                    object:nil
                     queue:nil
                usingBlock:^(NSNotification *notification)
{
     NSLog(@"%@", notification.name);
}];