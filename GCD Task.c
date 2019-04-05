            dispatch_group_t taskGroup = dispatch_group_create();
            
            dispatch_group_enter(taskGroup);
            [IWJSONObjectMapper mapJSONObjects:communityUsers class:IWCommunityUser.class saveWithCompletionBlock:^(NSArray *results) {
                communityUsers = [results copy];
                dispatch_group_leave(taskGroup);
            }];
            
            dispatch_group_enter(taskGroup);
            [IWJSONObjectMapper mapJSONObjects:toplistUsers class:IWTopListUser.class saveWithCompletionBlock:^(NSArray *results) {
                toplistUsers = [results copy];
                dispatch_group_leave(taskGroup);
            }];
            
            dispatch_group_notify(taskGroup, dispatch_get_main_queue(), ^{
                completionBlock(communityUsers, toplistUsers, nil);
            });