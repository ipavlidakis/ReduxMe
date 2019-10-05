workflow "CI/CD" {
  on: pull_request
  name: Test
  jobs:
    test:
      name: Test
      runs-on: macOS-latest
      strategy:
          matrix:
            destination: ['platform=iOS Simulator,OS=12.2,name=iPhone X', 'platform=tvOS Simulator,OS=12.2,name=Apple TV 4K']
      steps:
        - name: Checkout
          uses: actions/checkout@develop
        - name: Build and test
          run: |
            cd ReduxMe
            xcodebuild clean test -project ReduxMe.xcodeproj -scheme ReduxMe -destination "${destination}" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO ONLY_ACTIVE_ARCH=NO
            bash <(curl -s https://codecov.io/bash)
          env: 
           destination: ${{ matrix.destination }}
}
