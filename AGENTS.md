# Working on this cap table

This repository is an OCF 1.2.0 company snapshot. `minicap/` is the source of truth. The root `README.md` is a hand-maintained guide to the generated `cap-table.md`, `cap-table.xlsx`, and reports under `scenarios/`. Keep the example fictional.

## Get MiniCap

1. Create `.bin/` in this repository; Git ignores it. Check the OS and CPU architecture. On the [MiniCap releases page](https://github.com/1984vc/minicap/releases/latest), download the archive whose filename matches that target (for example, `x86_64-unknown-linux-gnu` or `aarch64-apple-darwin`) into `.bin/`. Download its matching `.sha256` file there too if you want to verify the archive. Do not assume every target is in every release.
2. Extract `minicap` (or `minicap.exe` on Windows) from the archive so the binary is at `.bin/minicap` (or `.bin/minicap.exe`). Run `.bin/minicap --help` on Linux/macOS or `.\.bin\minicap.exe --help` on Windows to check it works. The `scripts/update-exports.sh` script uses that local binary automatically; there is no need to edit `PATH`. Run the script with a POSIX shell (or Git Bash on Windows).
3. If your platform has no binary, build [MiniCap](https://github.com/1984vc/minicap) from source with Rust 1.88+ and put the resulting binary in `.bin/`. A release older than the current source may render Markdown differently from the checked-in reports; if regeneration changes reports without changed inputs, use a current source build before committing them.

From this repository's root, run `.bin/minicap validate` after every change (use `.bin/minicap.exe` on Windows). Use `.bin/minicap report` to inspect current ownership and outstanding SAFEs. The checked-in `cap-table.xlsx` is the downloadable **current snapshot**; it does not include outstanding SAFEs in its totals. Do not commit other generated `.xlsx` files.

## Founder guidance

- [1984 VC Founders Handbook skill](https://1984.vc/founder-skills) (installable, maintained on the website)
- [Founders Handbook skill source on GitHub](https://github.com/1984vc/founder-skills/blob/main/skills/1984-founders-handbook/SKILL.md)
- Markdown references: [Cap Table 101](https://1984.vc/docs/founders-handbook/cap-table-101.md), [Introduction to SAFEs](https://1984.vc/docs/founders-handbook/intro-to-safes.md), [Pre-money vs Post-money Conversion](https://1984.vc/docs/founders-handbook/pre-money-vs-post-money-conversion.md), [Impact of Series A on Cap Table](https://1984.vc/docs/founders-handbook/raising-your-series-a.md).

Use the handbook for explanations and founder questions; use MiniCap and this repository's OCF package for the actual ownership numbers.

## Refresh the generated files

After changing the OCF snapshot or a scenario, run `./scripts/update-exports.sh` from this repository's root. It validates the package, writes the current report to `cap-table.md`, exports `cap-table.xlsx`, and regenerates a modeled Markdown report as `README.md` in each scenario folder. Commit the generated files with the inputs; keep the root README's links and descriptions current.

## Editing the snapshot

- Keep the manifest's `ocf_version` at `1.2.0` and preserve globally unique object and security IDs. Add new transactions instead of rewriting past transactions when recording later events.
- YC's example investment follows [its published standard deal](https://www.ycombinator.com/deal): **two separate SAFEs**, $125,000 for a fixed 7% on conversion and $375,000 uncapped with MFN. The other investor's $1,000,000 SAFE has a $15,000,000 post-money cap and no discount. Do not turn these into issued stock until a conversion is explicitly recorded.
- The example does not encode YC's separate agreement or pro-rata rights. Do not imply that `minicap report` or the spreadsheet includes future SAFE ownership before a financing is modeled.
- When changing any referenced `*.ocf.json` file, compute its MD5 (for example, `md5sum minicap/Transactions.ocf.json`) and replace that file's `md5` entry in `minicap/Manifest.ocf.json`. The checksum covers the exact bytes, including whitespace. Then run `./scripts/update-exports.sh` to validate and refresh the reports.
- Model a hypothetical financing in `scenarios/<name>/request.json`. Set `valuation_basis` explicitly to `pre_money` or `post_money`; include `as_of`, `financing_date`, `currency`, `valuation`, `investments`, and any `target_option_pool`. Do not add hypothetical investors or round transactions to `minicap/`. For example, “$10m on $40m” must say which valuation basis it means.
- Check the generated `cap-table.md` and scenario reports for ownership and SAFE terms, and open the exported workbook, before committing them with the OCF or scenario inputs.
