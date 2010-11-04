//
// Copyright 2009-2010 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "Three20Network/TTModel.h"

// Core
#import "Three20Core/TTGlobalCore.h"
#import "Three20Core/TTCorePreprocessorMacros.h"
#import "Three20Core/NSArrayAdditions.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTModel


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  TT_RELEASE_SAFELY(_delegates);

  [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTModel


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSMutableArray*)delegates {
  if (!_delegates) {
    _delegates = TTCreateNonRetainingArray();
  }
  return _delegates;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isLoaded {
  return YES;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isLoading {
  return NO;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isLoadingMore {
  return NO;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isOutdated {
  return NO;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)cancel {
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)invalidate:(BOOL)erase {
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didStartLoad {
  [_delegates perform:@selector(modelDidStartLoad:) withObject:self];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didFinishLoad {
  [_delegates perform:@selector(modelDidFinishLoad:) withObject:self];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didFailLoadWithError:(NSError*)error {
  [_delegates perform:@selector(model:didFailLoadWithError:) withObject:self
    withObject:error];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didCancelLoad {
  [_delegates perform:@selector(modelDidCancelLoad:) withObject:self];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)beginUpdates {
  [_delegates perform:@selector(modelDidBeginUpdates:) withObject:self];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)endUpdates {
  [_delegates perform:@selector(modelDidEndUpdates:) withObject:self];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didUpdateObject:(id)object atIndexPath:(NSIndexPath*)indexPath {
  [_delegates perform: @selector(model:didUpdateObject:atIndexPath:)
           withObject: self
           withObject: object
           withObject: indexPath];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didInsertObject:(id)object atIndexPath:(NSIndexPath*)indexPath {
  [_delegates perform: @selector(model:didInsertObject:atIndexPath:)
           withObject: self
           withObject: object
           withObject: indexPath];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didDeleteObject:(id)object atIndexPath:(NSIndexPath*)indexPath {
  [_delegates perform: @selector(model:didDeleteObject:atIndexPath:)
           withObject: self
           withObject: object
           withObject: indexPath];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didChange {
  [_delegates perform:@selector(modelDidChange:) withObject:self];
}


@end
