# ?
## Developer
- Removed version logging
    - DMF does this natively now
    - The only purpose was to make sure users had this mod updated, and if the DMF logging is not in the log, I think it's safe to assume they just need to update everything
    - Makes it less tedious to maintain multiple version numbers

# 1.1.0 - 2026-07-06
### New
- Added support for SimpleAudio (SA)
- Added adjustable volume slider for custom audio
- Upon disabling the mod, sounds are reset to default
### Changed
- Reduced default volume of custom sounds to 75%. The toaster ding was too loud for me. It was previously at 100%.
- Refactored string match and table insert for performance
- Reduced delay before toaster ding
### Docs
- Adapted my typical versiom numbering system
- Renamed functions to snake_case

# 1.0 - 2025-03-19
_Initial release_