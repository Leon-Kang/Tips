- (void)sendLogToBackend {
    NSString *urlStr = [NSString stringWithFormat:@"%@/api_integration.php/v2/system/collect_log.json", urlHost];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSDictionary *parameters = @{@"key": @"cVnL7OP67Tou1enfRxrXxSHl9cH2WJQAq5hPvrqbIyBz5IxjG9FStDNw45XIUM03",
                                 @"type": @"ios",
                                 @"log": [_logMessage getMessageDescription]
                                 };
    
    NSError *error;
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:[NSDictionary dictionaryWithDictionary:parameters]
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
//    NSString * myString = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(newStr);
    }];
    
    [task resume];
}