# Working on this cap table

This repository is an OCF 1.2.0 company snapshot. `minicap/` is the source of truth; `README.md` is a generated GitHub view of that snapshot. Keep the example fictional.

## Install and check

Build the current [MiniCap](https://github.com/1984vc/minicap) with Rust 1.88+ to regenerate this README (older release binaries may render a different report):

```bash
git clone git@github.com:1984vc/minicap.git ../minicap-src
cargo install --path ../minicap-src/crates/minicap-cli --locked
```

From this repository's root, run `minicap validate` after every change. Use `minicap report` to inspect current ownership and outstanding SAFEs; use `minicap export ocx --output cap-table.xlsx` for a spreadsheet. Do not commit generated `.xlsx` files.

Regenerate the GitHub README with `minicap report --output README.md` after changing the OCF snapshot. `minicap report > README.md` produces the same file. Do not hand-edit the generated README; keep installation and editing instructions here in `AGENTS.md`.

## Editing the snapshot

- Keep the manifest's `ocf_version` at `1.2.0` and preserve globally unique object and security IDs. Add new transactions instead of rewriting past transactions when recording later events.
- YC's example investment follows [its published standard deal](https://www.ycombinator.com/deal): **two separate SAFEs**, $125,000 for a fixed 7% on conversion and $375,000 uncapped with MFN. The other investor's $1,000,000 SAFE has a $15,000,000 post-money cap and no discount. Do not turn these into issued stock until a conversion is explicitly recorded.
- The example does not encode YC's separate agreement or pro-rata rights. Do not imply that `minicap report` or the spreadsheet includes future SAFE ownership before a financing is modeled.
- When changing any referenced `*.ocf.json` file, compute its MD5 (for example, `md5sum minicap/Transactions.ocf.json`) and replace that file's `md5` entry in `minicap/Manifest.ocf.json`. The checksum covers the exact bytes, including whitespace. Then run `minicap validate` and `minicap report`.
- Check the generated README's ownership and SAFE terms before committing it with the OCF changes.
