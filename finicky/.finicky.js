finicky.setDefaultBrowser('com.apple.Chrome')

// By supplying an array of bundle identifiers, finicky opens the url in the first one
// that's currently running. If none are running, the first app in the array is started.
finicky.onUrl(function(url, opts) {
    return {
        bundleIdentifier: ['com.apple.Safari', 'com.google.Chrome']
    }
});
