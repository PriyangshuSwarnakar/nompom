# Changelog

## v2.2 — 2026-07-08

### New Features
- **Bulk Dictionary Import** — Import custom dictionary entries from `.txt` or `.xlsx` files. Supports `TOKEN = expansion` and `TOKEN: expansion` formats. Preview and edit all entries before saving.
- **Partial Expansion Memory** — Custom token/expansion settings are now saved between sessions (`partial_expansion.json` in AppData).
- **QC Locale Check** — Added locale selector (India/US/UK) to the QC tab to flag number-locale inconsistencies against the expected standard.

### Improvements
- **New app icon** — Refreshed icon, HD multi-resolution (16px to 256px), transparent background. Desktop shortcut now uses the `.ico` file directly for reliable display across all Windows contexts.
- **First-launch popup** — The welcome/credits popup now only appears on the first launch after installation.
- **About tab** — Fixed alignment, now properly centered.
- **Custom Dictionary path** — Entries are stored in `%APPDATA%\Nompom\custom_dict.json`, surviving reinstalls.

### Bug Fixes
- Fixed custom dictionary not applying to tokens containing special characters (e.g. `G/DL`, `mg/dL`) due to the unit engine consuming them before the abbreviation lookup.

---

## v2.1

- Icon and name update (Chichingpoipoi → Nompom).
- Desktop icon fix — shortcut now points directly to `.ico` file.

---

## v2.0

- Initial public release as Chichingpoipoi.
