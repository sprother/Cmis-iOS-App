/*
  Licensed to the Apache Software Foundation (ASF) under one
  or more contributor license agreements.  See the NOTICE file
  distributed with this work for additional information
  regarding copyright ownership.  The ASF licenses this file
  to you under the Apache License, Version 2.0 (the
  "License"); you may not use this file except in compliance
  with the License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing,
  software distributed under the License is distributed on an
  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  KIND, either express or implied.  See the License for the
  specific language governing permissions and limitations
  under the License.
 */

#import "CMISHttpResponse.h"

@interface CMISHttpResponse ()

@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSString *responseString;

@end


@implementation CMISHttpResponse


+ (CMISHttpResponse *)responseUsingURLHTTPResponse:(NSHTTPURLResponse *)httpUrlResponse
                                              data:(NSData *)data
{
    CMISHttpResponse *httpResponse = [[CMISHttpResponse alloc] init];
    httpResponse.statusCode = httpUrlResponse.statusCode;
    httpResponse.data = data;
    httpResponse.statusCodeMessage = [NSHTTPURLResponse localizedStringForStatusCode:[httpUrlResponse statusCode]];
    return httpResponse;
}

+ (CMISHttpResponse *)responseWithStatusCode:(int)statusCode
                               statusMessage:(NSString *)message
                                     headers:(NSDictionary *)headers
                                responseData:(NSData *)data
{
    CMISHttpResponse *httpResponse = [[CMISHttpResponse alloc] init];
    httpResponse.statusCode = statusCode;
    httpResponse.statusCodeMessage = message;
    httpResponse.data = data;
    return httpResponse;
}


- (NSString*)responseString
{
    if (_responseString == nil) {
        _responseString = [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
    }
    return _responseString;
}


- (NSString*)exception
{
    NSString *responseString = self.responseString;
    if (responseString) {
        NSRange begin = [responseString rangeOfString:@"<!--exception-->"];
        NSRange end   = [responseString rangeOfString:@"<!--/exception-->"];
        
        if (begin.location != NSNotFound &&
            end.location != NSNotFound &&
            begin.location < end.location) {
            
            return [responseString substringWithRange:NSMakeRange(begin.location + begin.length,
                                                                  end.location - begin.location - begin.length)];
        }
    }
    return nil;
}


- (NSString*)errorMessage
{
    NSString *responseString = self.responseString;
    if (responseString) {
        NSRange begin = [responseString rangeOfString:@"<!--message-->"];
        NSRange end   = [responseString rangeOfString:@"<!--/message-->"];
        
        if (begin.location != NSNotFound &&
            end.location != NSNotFound &&
            begin.location < end.location) {
            
            return [responseString substringWithRange:NSMakeRange(begin.location + begin.length,
                                                                  end.location - begin.location - begin.length)];
        }
    }
    return nil;
}

@end
