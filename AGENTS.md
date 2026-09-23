# Working on this company record

This is a forkable pre-seed company starter. `minicap/` is the authoritative equity record in OCF 1.2.0. `formation/`, `founders/`, `option-plan/`, and `safes/` hold the company's original documents. `cap-table.md` and `cap-table.xlsx` are generated views. Read [CHECKLIST.md](CHECKLIST.md) whenever you review the company's record. The checked-in company and investors are fictional.

## Get MiniCap

1. Create `.bin/` in this repository; Git ignores it. Check the OS and CPU architecture. On the [MiniCap releases page](https://github.com/1984vc/minicap/releases/latest), download the archive whose filename matches that target (for example, `x86_64-unknown-linux-gnu` or `aarch64-apple-darwin`) into `.bin/`. Download its matching `.sha256` file there too if you want to verify the archive. Do not assume every target is in every release.
2. Extract `minicap` (or `minicap.exe` on Windows) from the archive so the binary is at `.bin/minicap` (or `.bin/minicap.exe`). Run `.bin/minicap --help` on Linux/macOS or `.\.bin\minicap.exe --help` on Windows to check it works. The `scripts/update-exports.sh` script uses that local binary automatically; there is no need to edit `PATH`. Run the script with a POSIX shell (or Git Bash on Windows).

From this repository's root, run `.bin/minicap validate` after OCF changes (use `.bin/minicap.exe` on Windows). Use `.bin/minicap report` to inspect current ownership and outstanding SAFEs. MiniCap checks OCF, not the supporting document folders. The checked-in `cap-table.xlsx` is the downloadable **current snapshot**; it does not include outstanding SAFEs in its totals. Do not commit other generated `.xlsx` files.

## Founder guidance

- [1984 VC Founders Handbook skill](https://1984.vc/founder-skills) (installable, maintained on the website)
- [Founders Handbook skill source on GitHub](https://github.com/1984vc/founder-skills/blob/main/skills/1984-founders-handbook/SKILL.md)
- Markdown references: [Cap Table 101](https://1984.vc/docs/founders-handbook/cap-table-101.md), [Introduction to SAFEs](https://1984.vc/docs/founders-handbook/intro-to-safes.md), [Pre-money vs Post-money Conversion](https://1984.vc/docs/founders-handbook/pre-money-vs-post-money-conversion.md), [Impact of Series A on Cap Table](https://1984.vc/docs/founders-handbook/raising-your-series-a.md).

Use the handbook for explanations and founder questions; use MiniCap and this repository's OCF package for the actual ownership numbers.

## Set up a founder's company

1. Ask for the company's legal name and formation documents, founders and their stock paperwork, incorporation date, EIN confirmation, option plan, and signed SAFEs. Ask separately for share counts, grant dates, SAFE amounts, and conversion terms needed for OCF. Do not invent missing facts or claim that a document was signed or filed merely because a file exists.
2. Put original documents in the four directories above, using their READMEs for placement. Do not alter signed PDFs. Match founder folders to OCF stakeholder IDs and SAFE folders to OCF security IDs. Ask the founder about missing documents; use [CHECKLIST.md](CHECKLIST.md) for the review.
3. Replace the fictional issuer in `minicap/Manifest.ocf.json`, people and investors in `Stakeholders.ocf.json`, classes and plans in `StockClasses.ocf.json` and `StockPlans.ocf.json`, and example issuances and SAFEs in `Transactions.ocf.json`. Remove YC and the example angel unless they are real investors. Keep IDs and references consistent, and reconcile the recorded facts with the documents the founder supplies. Replacing sample history is appropriate during initial setup; preserve the real company's history thereafter.
4. Update each changed OCF file's manifest MD5 (for example, `md5sum minicap/Transactions.ocf.json` for `Transactions.ocf.json`). Checksums cover the exact file bytes. Run `./scripts/update-exports.sh` to validate OCF and refresh `cap-table.md` and `cap-table.xlsx`; compare them with the founder's records. Review the document checklist separately and report missing or unconfirmed evidence by name.
5. Update the root README's sample description and file captions to describe the company, keeping links to the generated report and workbook.

## Maintain the cap table

- Keep `ocf_version` at `1.2.0` and object and security IDs unique. Preserve real historical transactions; add new dated transactions for later events.
- For every later OCF edit, refresh the referenced file's manifest MD5 and run `./scripts/update-exports.sh`. Commit the OCF data and both generated outputs together.
- When a document is added or changed, rerun the checklist review and tell the founder what remains missing or uncertain. Do not overwrite a signed original.
- Outstanding SAFEs have no issued shares yet. The Markdown report lists them separately; the current OCX workbook does not include them in ownership totals.
