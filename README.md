# Dragonpass Hybrid SDK for iOS

Dragonpass Hybrid SDK for iOS lets a host app launch and interact with Dragonpass DPApps.

This repository distributes `DPSDKKit` as a Swift Package Manager binary package. It does not include SDK source code, credentials, or demo projects.

## Requirements

- iOS 13 or later
- Swift 5.6 or later
- Xcode with Swift Package Manager support
- A registered `clientId`
- A DPApp `appId`
- A host-app auth-code flow

To request or confirm your `clientId`, DPApp `appId`, and auth-code setup, contact the Dragonpass DPSDK team through [Contact Us](https://github.com/bigBandFE/dpsdk-contact/).

## Installation

For manual installation with Swift Package Manager:

1. In Xcode, select `File -> Add Package Dependencies...`.
2. Enter the repository URL:
   ```text
   https://github.com/bigBandFE/dpsdk-ios-spm
   ```
3. Set the dependency rule to `Branch -> main`.
4. Add product `DPSDKKit` to your host app target.

You can also use the AI-assisted integration skill after reviewing the manual installation steps:

```bash
hermes skills install --category devops --yes \
  "https://raw.githubusercontent.com/bigBandFE/dpsdk-ai-skill/main/SKILL.md"
```

## Basic Usage

Import the SDK in every Swift file that uses DPSDK APIs:

```swift
import DPSDKKit
```

Initialize the SDK before setting the auth code or opening a DPApp:

```swift
DPSDK.start(clientId: "<client_id>") { success in
    if success {
        // Enable DPApp entry points after startup succeeds.
    } else {
        // Show a host-app controlled failure state.
    }
}
```

After your host app obtains a non-empty auth code from its backend/auth flow, pass it to the SDK:

```swift
DPSDK.shared.setAuthCode(token: "<auth_code>")
```

Open a DPApp from a visible `UIViewController`:

```swift
DPSDK.open(
    appId: "<app_id>",
    params: ["path": "home"],
    from: viewController
)
```

For SwiftUI apps, resolve the current visible `UIViewController` before calling `DPSDK.open(...)`, or create a DPApp view controller and present it through UIKit navigation:

```swift
DPSDK.createViewController(
    appId: "<app_id>",
    path: "home",
    params: [:]
) { viewController, error in
    guard let viewController else {
        // Handle creation failure.
        return
    }

    // Present or push viewController from the host app's current UIKit context.
}
```

## Preload

For frequently used DPApps, preload after SDK startup succeeds:

```swift
DPSDK.preOpen(appId: "<app_id>", keepWarmCount: 1)
```

## Troubleshooting

- `No such module 'DPSDKKit'`: confirm the package product is linked to the correct app target.
- Startup failure: confirm `clientId` is registered for your host app.
- Blank or unavailable DPApp: confirm the DPApp `appId` and auth-code flow with the Dragonpass DPSDK team.
- Auth errors: ensure the host app obtains a fresh non-empty auth code before opening DPApps.

For setup support, open a request through [Contact Us](https://github.com/bigBandFE/dpsdk-contact/).
