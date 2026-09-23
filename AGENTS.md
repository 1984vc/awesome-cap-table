# Working on this cap table

This repository is a forkable OCF 1.2.0 cap-table starter. `minicap/` is the source of truth. The root `README.md` introduces the template; `cap-table.md` and `cap-table.xlsx` are generated views. The checked-in company and investors are fictional and should be replaced when a founder sets up their own company.

## Get MiniCap

1. Create `.bin/` in this repository; Git ignores it. Check the OS and CPU architecture. On the [MiniCap releases page](https://github.com/1984vc/minicap/releases/latest), download the archive whose filename matches that target (for example, `x86_64-unknown-linux-gnu` or `aarch64-apple-darwin`) into `.bin/`. Download its matching `.sha256` file there too if you want to verify the archive. Do not assume every target is in every release.
2. Extract `minicap` (or `minicap.exe` on Windows) from the archive so the binary is at `.bin/minicap` (or `.bin/minicap.exe`). Run `.bin/minicap --help` on Linux/macOS or `.\.bin\minicap.exe --help` on Windows to check it works. The `scripts/update-exports.sh` script uses that local binary automatically; there is no need to edit `PATH`. Run the script with a POSIX shell (or Git Bash on Windows).

From this repository's root, run `.bin/minicap validate` after every change (use `.bin/minicap.exe` on Windows). Use `.bin/minicap report` to inspect current ownership and outstanding SAFEs. The checked-in `cap-table.xlsx` is the downloadable **current snapshot**; it does not include outstanding SAFEs in its totals. Do not commit other generated `.xlsx` files.

## Founder guidance

- [1984 VC Founders Handbook skill](https://1984.vc/founder-skills) (installable, maintained on the website)
- [Founders Handbook skill source on GitHub](https://github.com/1984vc/founder-skills/blob/main/skills/1984-founders-handbook/SKILL.md)
- Markdown references: [Cap Table 101](https://1984.vc/docs/founders-handbook/cap-table-101.md), [Introduction to SAFEs](https://1984.vc/docs/founders-handbook/intro-to-safes.md), [Pre-money vs Post-money Conversion](https://1984.vc/docs/founders-handbook/pre-money-vs-post-money-conversion.md), [Impact of Series A on Cap Table](https://1984.vc/docs/founders-handbook/raising-your-series-a.md).

Use the handbook for explanations and founder questions; use MiniCap and this repository's OCF package for the actual ownership numbers.

## Set up a new company

1. Ask the founder for their actual issuer name, formation and reporting dates, stakeholders, stock classes and authorized shares, issued shares, option plan reserves and grants, and each investment or SAFE with its amount and conversion terms. Ask for source records where available. Do not invent missing numbers.
2. Replace the fictional issuer in `minicap/Manifest.ocf.json`, the people and investors in `Stakeholders.ocf.json`, the classes and plans in `StockClasses.ocf.json` and `StockPlans.ocf.json`, and the example issuances and SAFEs in `Transactions.ocf.json`. Remove YC and the example angel unless they are real investors in this company. Keep IDs and references consistent. The sample history may be replaced during initial setup; after the real company record is established, add new transactions rather than rewriting its history.
3. Update the manifest MD5 for every changed referenced OCF file (for example, `md5sum minicap/Transactions.ocf.json` for `Transactions.ocf.json`). These checksums cover the exact file bytes. Run `./scripts/update-exports.sh` to validate the package and regenerate `cap-table.md` and `cap-table.xlsx`. Compare the outputs with the founder's records before committing them.
4. Change the root README's sample description and file captions to describe your company, while preserving its links to the generated report and workbook.

## Maintain the cap table

- Keep `ocf_version` at `1.2.0` and object and security IDs unique. Preserve real historical transactions; add new dated transactions for later events.
- For every later OCF edit, refresh the referenced file's manifest MD5 and run `./scripts/update-exports.sh`. Commit the OCF data and both generated outputs together.
- Outstanding SAFEs have no issued shares yet. The Markdown report lists them separately; the current OCX workbook does not include them in ownership totals.
