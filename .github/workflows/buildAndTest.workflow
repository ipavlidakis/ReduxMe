workflow "Build project" {
  on: push
  jobs:
    spm:
      name: "Build & Test"
      runs-on: macOS-latest
      strategy:
          matrix:
            destination: ['platform=iOS Simulator,OS=12.2,name=iPhone X', 'platform=tvOS Simulator,OS=12.2,name=Apple TV 4K']
      steps:
        - name: Checkout
          uses: actions/checkout@develop
        - name: "Step into the project folder"
          run: |
            cd ReduxMe
        - name: "Install SPM packages"
          run: |
            bash <(swift package update)>
        - name: Build and test
          run: |
            xcodebuild clean test -project ReduxMe.xcodeproj -scheme ReduxMe -destination "${destination}" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO ONLY_ACTIVE_ARCH=NO
          env:
           destination: ${{ matrix.destination }}
        - name: "Code coverage"
          run:
            bash <(curl -s https://codecov.io/bash)
}
