NSString *urlStr = [NSString stringWithFormat:cityIDRequestURLStr, [self getCityStyle:style]];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    __block NSString *cityID = [NSString new];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", data);
        if (!error) {
            NSDictionary *cityList = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            cityID = [[cityList valueForKeyPath:cityName] stringValue];
        } else {
            // NSLog(@"%@", error);
        }
        
    }];
    
    [task resume];