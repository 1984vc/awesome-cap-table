# Working on this cap table

This repository is an OCF 1.2.0 company snapshot. `minicap/` is the source of truth. The root `README.md` is a hand-maintained guide to the generated `cap-table.md`, `cap-table.xlsx`, and reports under `scenarios/`. Keep the example fictional.

## Install and check

Build the current [MiniCap](https://github.com/1984vc/minicap) with Rust 1.88+ to regenerate these reports (older release binaries may render a different report):

```bash
git clone git@github.com:1984vc/minicap.git ../minicap-src
cargo install --path ../minicap-src/crates/minicap-cli --locked
```

From this repository's root, run `minicap validate` after every change. Use `minicap report` to inspect current ownership and outstanding SAFEs. The checked-in `cap-table.xlsx` is the downloadable **current snapshot**; it does not include outstanding SAFEs in its totals. Do not commit other generated `.xlsx` files.

After changing the OCF snapshot or a scenario, run `./scripts/update-exports.sh` from this repository's root. It validates the package, writes the current report to `cap-table.md`, exports `cap-table.xlsx`, and regenerates a modeled Markdown report as `README.md` in each scenario folder. Commit the generated files with the inputs; keep the root README's links and descriptions current.

## Editing the snapshot

- Keep the manifest's `ocf_version` at `1.2.0` and preserve globally unique object and security IDs. Add new transactions instead of rewriting past transactions when recording later events.
- YC's example investment follows [its published standard deal](https://www.ycombinator.com/deal): **two separate SAFEs**, $125,000 for a fixed 7% on conversion and $375,000 uncapped with MFN. The other investor's $1,000,000 SAFE has a $15,000,000 post-money cap and no discount. Do not turn these into issued stock until a conversion is explicitly recorded.
- The example does not encode YC's separate agreement or pro-rata rights. Do not imply that `minicap report` or the spreadsheet includes future SAFE ownership before a financing is modeled.
- When changing any referenced `*.ocf.json` file, compute its MD5 (for example, `md5sum minicap/Transactions.ocf.json`) and replace that file's `md5` entry in `minicap/Manifest.ocf.json`. The checksum covers the exact bytes, including whitespace. Then run `minicap validate` and `minicap report`.
- Model a hypothetical financing in `scenarios/<name>/request.json`. Set `valuation_basis` explicitly to `pre_money` or `post_money`; include `as_of`, `financing_date`, `currency`, `valuation`, `investments`, and any `target_option_pool`. Do not add hypothetical investors or round transactions to `minicap/`. For example, “$10m on $40m” must say which valuation basis it means.
- Check the generated `cap-table.md` and scenario reports for ownership and SAFE terms, and open the exported workbook, before committing them with the OCF or scenario inputs.
