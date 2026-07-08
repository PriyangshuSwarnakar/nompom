# Nompom

**Nompom** is a desktop text normalization and QC tool for linguists and NLP/TTS data teams. It converts raw text into speech-ready form — expanding numbers, abbreviations, symbols, currencies, chemical formulas, and more — and provides a quality control checker for normalized output. Built with Python and tkinter.

**Credits**
- [Shushanth P.](https://github.com/shushanth00000)
- [Yathaarth M.P](https://github.com/Yathaarth18)
- [Harika](https://github.com/harikavinod26)
- [Kiran Mukhiya](https://github.com/KiranMukhiya)
- [Joe Jacintha](https://github.com/joejacintha-a11y)
- [Liz Grace John](https://github.com/lizgracejohn20-hub)
- [Sandesh Koirala](https://github.com/Sandesh37-sys)

---

## Features

### Normalizer
Converts input text to TTS-ready normalized form with a configurable, multi-stage pipeline:

**Numbers**
- Cardinal and ordinal numbers (Indian and Western numbering systems)
- Decimals, fractions, ratios, percentages, ranges
- Years, times (12hr/24hr with AM/PM), dates
- IP addresses (digit-by-digit with "dot")
- Trailing zero handling (e.g. `14.7890` → "fourteen point seven eight nine zero")

**Symbols & Units**
- Symbols to words (`%` → "percent", `+` → "plus", `@` → "at", etc.)
- Unit expansion with locale-aware quantities (e.g. `5 kg` → "five kilograms", `1497368 km` → "fourteen lakh ninety seven thousand..." in India locale)
- Temperature, dimensions, rates, and compound units

**Abbreviations & Codes**
- Standard abbreviation and acronym expansion
- Currency code expansion (`INR` → "Indian Rupees", `$50` → "fifty dollars") with locale support
- Flight numbers, product codes, and passport codes spelled letter-by-digit
- PIN/OTP/code numbers spoken digit-by-digit
- Security code smart grouping — detects patterns and speaks them naturally (e.g. `181818` → "eighteen eighteen eighteen", `999999` → "triple nine triple nine")
- Chemical formula expansion (CO₂ → "carbon dioxide") with user-controlled decisions per formula

**Text Processing**
- Diacritics removal (`é` → `e`)
- Punctuation stripping and spacing normalisation
- Source grammar fixes

**Configuration**
- Locale selector: India / US / UK (affects number grouping, currency, unit spellings)
- Output case: UPPERCASE, lowercase, Sentence case, Title Case, As-is
- Partial expansion for common units (GB, KB, MB, Gbps, Mbps, Kbps, KG) — set the percentage of occurrences to expand vs keep as letters; settings persist between sessions
- Custom token expansion with configurable expand percentage; remembered across sessions
- Optional spell-check (requires `pyspellchecker`)

**Input / Output**
- Single file (`.txt` or `.xlsx`) and batch folder processing (mixed `.txt` and `.xlsx`)
- For Excel input: column picker with sheet selection and live preview; normalised output inserted as a new column directly next to the source column, preserving all other columns
- Batch output saved to a `normalized/` subfolder
- Detailed normalization report exported as `.xlsx` with three sheets: All Files, Needs Attention, and Changes (itemized per row/line with category and original → converted)

**Pre-load Detection**
Before normalization runs, the tool scans the input and shows a review dialog with detected items organized by category (Chemicals, Abbreviations, Units, Currency, Flight/Ref Codes, Code/PIN/OTP), each with row or line numbers for cross-verification.

---

### QC Tool
Quality control checker for normalized text. Accepts `.txt` and `.xlsx` input (single file or batch folder).

Checks include:
- Lingering numbers, symbols, and diacritics
- Spacing issues
- Unexpanded abbreviations
- Format errors (unbalanced brackets/quotes, malformed numbers, repeated punctuation, irregular capitalisation, control characters)
- Cross-row consistency (mixed abbreviation forms, mixed casing conventions, mixed number-locale wording)
- Locale check (India / US / UK) for number-locale consistency
- Casing consistency against expected output case
- Optional spell-check

Exports QC reports as `.xlsx` with two sheets: All Files (YES/NO Needs QC, colour-coded) and Issue Detail (per-row issue type, token, suggestion, and snippet).

---

### Custom Dictionary
User-managed expansion dictionary for domain-specific terms (e.g. `G/DL` → "grams per decilitre"). Features:
- Add, edit, and delete entries manually
- **Bulk import** from `.txt` (supports `TOKEN = expansion` and `TOKEN: expansion` formats) or `.xlsx` (two-column: token, expansion) — preview and edit all entries before saving
- Entries stored at `%APPDATA%\Nompom\custom_dict.json` and persist across reinstalls
- Tokens containing special characters (e.g. `G/DL`, `mg/dL`) are matched before the unit engine runs to prevent partial consumption

---

## Requirements
- Python 3.10 or higher
- `openpyxl` — Excel input/output
- `numpy`, `scipy` — used internally

Optional:
- `pyspellchecker` — for spell-check feature

Install dependencies:
```bash
pip install openpyxl numpy scipy pyspellchecker
```

---

## Installation

Download the latest installer from the [Releases](../../releases) page.

For running from source or building the installer yourself, refer to the setup files included in the repository (`Nompom.spec` and `Nompom.iss`).

---

## Usage

Launch the app and use the four tabs:

1. **Normalizer** — paste or load text (`.txt` or `.xlsx`), configure normalization rules, set locale and output case, and click Normalize. For Excel files, a column picker lets you choose the source column and sheet. Use Open Folder for batch processing. A normalization report is exported as `.xlsx` at the end of each run.

2. **QC Tool** — load a file or folder of normalized text (`.txt` or `.xlsx`), select locale and casing checks, run the checker, and export the issue report as `.xlsx`.

3. **Custom Dictionary** — add, edit, delete, or bulk-import custom abbreviation expansions. Entries apply automatically during normalization. Use "Import from File" to load a `.txt` or `.xlsx` list and review entries before saving.

4. **About** — app version, normalization pipeline overview, and credits.

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.

---

## License
All rights reserved. © Priyangshu Swarnakar
