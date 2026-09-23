# Working on this cap table

This repository is an OCF 1.2.0 company snapshot. `minicap/` is the source of truth; `README.md` is a generated GitHub view of that snapshot. Keep the example fictional.

## Install and check

Build the current [MiniCap](https://github.com/1984vc/minicap) with Rust 1.88+ to regenerate this README (older release binaries may render a different report):

```bash
git clone git@github.com:1984vc/minicap.git ../minicap-src
cargo install --path ../minicap-src/crates/minicap-cli --locked
```

From this repository's root, run `minicap validate` after every change. Use `minicap report` to inspect current ownership and outstanding SAFEs. The checked-in `cap-table.xlsx` is the downloadable spreadsheet; keep it current, but do not commit other generated `.xlsx` files.

After changing the OCF snapshot, run `./scripts/update-exports.sh` from this repository's root. It validates the package, exports `cap-table.xlsx`, and pipes the Markdown report into `README.md` with a download link near the top. The attribution stays at the bottom. Commit both generated files with the OCF changes; do not hand-edit the generated README.

## Editing the snapshot

- Keep the manifest's `ocf_version` at `1.2.0` and preserve globally unique object and security IDs. Add new transactions instead of rewriting past transactions when recording later events.
- YC's example investment follows [its published standard deal](https://www.ycombinator.com/deal): **two separate SAFEs**, $125,000 for a fixed 7% on conversion and $375,000 uncapped with MFN. The other investor's $1,000,000 SAFE has a $15,000,000 post-money cap and no discount. Do not turn these into issued stock until a conversion is explicitly recorded.
- The example does not encode YC's separate agreement or pro-rata rights. Do not imply that `minicap report` or the spreadsheet includes future SAFE ownership before a financing is modeled.
- When changing any referenced `*.ocf.json` file, compute its MD5 (for example, `md5sum minicap/Transactions.ocf.json`) and replace that file's `md5` entry in `minicap/Manifest.ocf.json`. The checksum covers the exact bytes, including whitespace. Then run `minicap validate` and `minicap report`.
- Check the generated README's ownership and SAFE terms, and open the exported workbook, before committing them with OCF changes.
