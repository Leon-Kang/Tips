// Setup download configuration
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        [manager setTaskDidReceiveAuthenticationChallengeBlock:^NSURLSessionAuthChallengeDisposition(NSURLSession * _Nonnull session, NSURLSessionTask * _Nonnull task, NSURLAuthenticationChallenge * _Nonnull challenge, NSURLCredential *__autoreleasing  _Nullable * _Nullable credential) {
            *credential = [NSURLCredential credentialWithUser:kRestoreUsername password:kRestorePassword persistence:NSURLCredentialPersistenceForSession];
            return NSURLSessionAuthChallengeUseCredential;
        }];
        
        NSURL *URL = [NSURL URLWithString:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        // Start download
        NSURLSessionDownloadTask *downloadTask =
        [manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            NSURL *documentsDirectoryURL = [[NSFileManager defaultManager]
                                            URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (!error && httpResponse.statusCode == 200) {
                NSLog(@"File downloaded to: %@", filePath);
                NSData *data = [NSData dataWithContentsOfURL:filePath];
                NSData *decompressedData = [data dataByGZipDecompressingDataWithError:&error];
                NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:decompressedData options:NSJSONReadingMutableContainers error:nil];
                [subscriber sendNext:jsonArray];
                [subscriber sendCompleted];
            } else {
                [[NSFileManager defaultManager] removeItemAtURL:filePath error:nil];
                [subscriber sendError:error];
            }
        }];
        [downloadTask resume];